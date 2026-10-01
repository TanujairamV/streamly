import os


POLICY_FILES = {
    "pause": "pause_policy.txt",
    "cancel": "cancel_policy.txt",
    "renew": "renew_policy.txt"
}


def retrieve_policy(action):

    filename = POLICY_FILES.get(action)

    if not filename:
        return ""

    path = os.path.join(
        "knowledge",
        filename
    )

    with open(path, "r") as file:
        return file.read()