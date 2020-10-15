#!/bin/bash
set -euo pipefail

declare -a JQ_ARGS NI_OUTPUT_SET_ARGS

JQ_ARGS+=( -a )

RAW="$( ni get -p '{ .raw }' )"
if [[ "${RAW}" == "true" ]]; then
  JQ_ARGS+=( -r )
else
  NI_OUTPUT_SET_ARGS+=( --json )
fi

declare -a JQ_ARGS_ARGJSON="( $( ni get | jq -r 'try .args | to_entries[] | "--argjson \( .key | @sh ) \( .value | tojson | @sh )"' ) )"
JQ_ARGS+=( "${JQ_ARGS_ARGJSON[@]}" )

FILTER="$( ni get -p '{ .filter }' )"
JQ_ARGS+=( ".input | (${FILTER})" )

ni log info "Evaluating filter: ${FILTER}..."
OUTPUT="$( ni get | ( set -x; jq "${JQ_ARGS[@]}" ) )"

ni log info "${OUTPUT}"
ni output set "${NI_OUTPUT_SET_ARGS[@]}" \
  --key output --value "${OUTPUT}"
