from utils.logger import log_event
from flask import request

def login():
    username = request.json.get("username")

    log_event(
        "auth_attempt",
        "Login attempt detected",
        username=username,
        src_ip=request.remote_addr
    )

    return {"status": "fail"}, 401
