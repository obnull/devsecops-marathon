from flask import Flask, request
import sys

app = Flask(__name__)

# Порт передаётся при запуске: python3 app.py 5001
PORT = sys.argv[1] if len(sys.argv) > 1 else "5001"

@app.route('/')
def home():
    return f'''
<h1>API Gateway</h1>
<a href="/status">Check Status</a>
    '''

@app.route('/status')
def api():
    return {
"service": "api-gateway",
"instance": PORT,
"healthy": "true"
}

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=int(PORT), debug=False)
