from os import environ

from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello World!'


if __name__ == '__main__':
    app.run(port=environ.get('VCAP_APP_PORT'), host='0.0.0.0')