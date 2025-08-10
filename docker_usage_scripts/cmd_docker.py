import subprocess

def docker():
    return subprocess.run(
        ["docker"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True
    )