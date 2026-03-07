#!/usr/bin/env python3
import http.server
import socketserver
import logging
import socket

PORT = 8080
LOG_FILE = '/var/log/webapp/app.log'

# Настройка логирования
logging.basicConfig(filename=LOG_FILE, level=logging.INFO,
                    format='%(asctime)s - %(levelname)s - %(message)s')

# Принудительно слушаем только localhost
HOST = '127.0.0.1'

class Handler(http.server.SimpleHTTPRequestHandler):
    def log_message(self, format, *args):
        logging.info("%s - - [%s] %s" % (self.address_string(),
                     self.log_date_time_string(), format % args))

with socketserver.TCPServer((HOST, PORT), Handler) as httpd:
    logging.info(f"Server started on {HOST}:{PORT}")
    print(f"Serving on {HOST}:{PORT}")
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        logging.info("Server stopped")
        print("\nServer stopped")
