import json
import datetime

def log_event(event_type, message, **kwargs):
    log = {
        "event_type": event_type,
        "message": message,
        "timestamp": datetime.datetime.utcnow().isoformat(),
        **kwargs
    }
    print(json.dumps(log))
    

