
def match(command) -> bool:
    return command.script.lower().startswith('python ')

def get_new_command(command) -> str:
    return 'python3' + command.script[len('python'):]

enabled_by_default = True
requires_output = False
priority = 999

