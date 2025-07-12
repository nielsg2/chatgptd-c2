# session_manager.py
# Loads/saves memory across sessions and manages directive syncing

import os
import hashlib
from pathlib import Path

CONFIG = {
    "master_directive": Path("../Utilsrepo/directives/AI_Directives.txt"),
    "fallback_directive": Path("directives/AI_Directives.txt")
}

def file_hash(path):
    if not path.exists():
        return None
    return hashlib.md5(path.read_bytes()).hexdigest()

class SessionManager:
    def __init__(self):
        self.directives = self.load_directives()

    def load_directives(self):
        master = CONFIG["master_directive"]
        fallback = CONFIG["fallback_directive"]
        if master.exists():
            master_hash = file_hash(master)
            fallback_hash = file_hash(fallback)
            if master_hash != fallback_hash:
                print("⚠️ WARNING: Local AI_Directives.txt is out of sync with Utilsrepo master.")
            return master.read_text()
        elif fallback.exists():
            print("🔁 Using fallback local AI_Directives.txt")
            return fallback.read_text()
        else:
            raise FileNotFoundError("❌ No directive file found. Please restore from Utilsrepo or provide fallback.")
