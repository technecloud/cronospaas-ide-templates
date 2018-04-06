from flask import Flask
import os

port = int(os.getenv('PORT', 10000))

app = Flask(__name__)

@app.route('/')

def hello_world():
    return 'Hello, World!'
    
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=port, debug=True)