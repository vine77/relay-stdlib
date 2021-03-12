#!/bin/bash
set -euo pipefail

MESSAGE=$(ni get -p '{.message}')
echo "Your message was: $MESSAGE"
