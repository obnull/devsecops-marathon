from flask import Flask, request
import sys

app = Flask(__name__)

# Порт передаётся при запуске: python3 app.py 5001
PORT = sys.argv[1] if len(sys.argv) > 1 else "5001"

@app.route('/')
def home():
    return f'''
    <h1>🔥 Flask Instance: {PORT}</h1>
    <p>Serving from port {PORT}</p>
    <ul>
        <li>X-Real-IP: {request.headers.get('X-Real-IP', 'not set')}</li>
        <li>X-Forwarded-For: {request.headers.get('X-Forwarded-For', 'not set')}</li>
    </ul>
    <p><a href="/api">Go to /api</a></p>
    '''

@app.route('/api')
def api():
    return {
        "instance": PORT,
        "status": "ok",
        "x_real_ip": request.headers.get('X-Real-IP', 'not set')
    }

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=int(PORT), debug=False)
