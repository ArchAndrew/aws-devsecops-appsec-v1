from flask import Flask, request
import os
import jwt
import datetime

from utils.logger import log_event

app = Flask(__name__)

SECRET = os.environ.get("APP_SECRET", "fallback-not-used")

users = {
    "user": "password123",
    "admin": "admin123"
}


@app.route("/health")
def health():
    return {"status": "ok"}, 200


@app.route("/login", methods=["POST"])
def login():
    data = request.json or {}
    username = data.get("username")
    password = data.get("password")
    user_agent = request.headers.get("User-Agent")

    log_event(
        "auth_attempt",
        "Login attempt detected",
        username=username,
        src_ip=request.remote_addr,
        user_agent=user_agent
    )

    if users.get(username) == password:
        log_event(
            "auth_success",
            "User authenticated",
            username=username,
            src_ip=request.remote_addr,
            user_agent=user_agent
        )

        token = jwt.encode(
            {
                "user": username,
                "exp": datetime.datetime.utcnow() + datetime.timedelta(hours=1)
            },
            SECRET,
            algorithm="HS256"
        )

        return {"token": token}

    log_event(
        "auth_failure",
        "Invalid credentials",
        username=username,
        src_ip=request.remote_addr,
        user_agent=user_agent
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

    except Exception:
        return {"error": "unauthorized"}, 401


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
