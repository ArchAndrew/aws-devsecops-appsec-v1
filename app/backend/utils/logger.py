import json

def log_event(event_type, message, **kwargs):
    log = {
        "event_type": event_type,
        "message": message,
        **kwargs
    }
    print(json.dumps(log), flush=True)
