from flask import Flask, request
import sys

PORT = sys.argv[1] if len(sys.argv) > 1 else "5200"

app = Flask(__name__)

@app.route('/api/status')
def status():
    return {
        "service": "CyberShield API",
        "instance": PORT,
        "healthy": True,
        "client_ip": request.headers.get('X-Real-IP', request.remote_addr)
    }

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=int(PORT), debug=False)
