from flask import Flask, request, jsonify
import os
import jwt
import datetime

app = Flask(__name__)

SECRET = os.environ.get("APP_SECRET", "fallback-not-used")

users = {
    "user": "password123",
    "admin": "admin123"
}

from utils.logger import log_event

@app.route("/health")
def health():
    return {"status": "ok"}, 200

@app.route("/login", methods=["POST"])
def login():
    data = request.json or {}
    username = data.get("username")
    password = data.get("password")

    log_event(
        "auth_attempt",
        "Login attempt detected",
        username=username,
        src_ip=request.remote_addr
    )

    if users.get(username) == password:
        token = jwt.encode({
            "user": username,
            "exp": datetime.datetime.utcnow() + datetime.timedelta(hours=1)
        }, SECRET, algorithm="HS256")

        log_event(
            "auth_success",
            "Login successful",
            username=username,
            src_ip=request.remote_addr
        )

        return {"token": token}

    log_event(
        "auth_failure",
        "Invalid credentials",
        username=username,
        src_ip=request.remote_addr
    )

    return {"error": "invalid credentials"}, 401

@app.route("/api/admin")
def admin():
    token = request.headers.get("Authorization")

    if not token:
        return {"error": "missing token"}, 401

    try:
        decoded = jwt.decode(token, SECRET, algorithms=["HS256"])
        if decoded["user"] != "admin":
            return {"error": "forbidden"}, 403

        return {"message": "admin data"}
    except:
        return {"error": "unauthorized"}, 401

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
