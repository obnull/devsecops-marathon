from flask import Flask, request

app = Flask(__name__)

@app.route('/')
def home():
    real_ip = request.headers.get('X-Real-IP', 'not set')
    forwarded_for = request.headers.get('X-Forwarded-For', 'not set')
    return f'''
    <h1>🔥 Hello from Flask!</h1>
    <p>This page is served by Python, not Nginx directly.</p>
    <ul>
        <li><strong>X-Real-IP:</strong> {real_ip}</li>
        <li><strong>X-Forwarded-For:</strong> {forwarded_for}</li>
        <li><strong>Direct IP (remote_addr):</strong> {request.remote_addr}</li>
    </ul>
    <p><a href="/api">Go to /api</a></p>
    '''

@app.route('/api')
def api():
    return {
        "status": "ok",
        "server": "Flask 3.0",
        "direct_ip": request.remote_addr,
        "x_real_ip": request.headers.get('X-Real-IP', 'not set'),
        "x_forwarded_for": request.headers.get('X-Forwarded-For', 'not set')
    }

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000, debug=True)
