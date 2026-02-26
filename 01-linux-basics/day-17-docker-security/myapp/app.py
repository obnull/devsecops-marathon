from http.server import HTTPServer, BaseHTTPRequestHandler

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        with open('index.html', 'rb') as f:
            self.wfile.write(f.read())

HTTPServer(('0.0.0.0', 8000), Handler).serve_forever()
