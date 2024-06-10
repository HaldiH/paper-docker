import re

with open('sample.server.properties', 'r') as rf:
    with open('server.properties', 'w') as wf:
        for line in rf:
            prop, val = line.split("=", 1)
            env_prop = re.sub(r'\W', '_', prop).upper()
            print(f"export {env_prop}=${{{env_prop}:-{val.strip()}}}")
            print(f"{prop}=${{{env_prop}}}", file=wf)