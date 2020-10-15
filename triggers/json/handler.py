from relay_sdk import Interface, WebhookServer
from quart import Quart, request

import logging

relay = Interface()
app = Quart('json')

logging.getLogger().setLevel(logging.INFO)


@app.route('/', methods=['POST'])
async def handler():
    relay.events.emit(await request.get_json(force=True))
    return {}, 202, {}


if __name__ == '__main__':
    WebhookServer(app).serve_forever()
