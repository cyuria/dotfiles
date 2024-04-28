from os import geteuid
import platform
from pathlib import Path

CMD_NAME = "update-initramfs"
CURRENT_KERNEL = platform.uname().release
KERNELS = [ '-k all', *(f'-k {m.name}' for m in Path("/usr/lib/modules").iterdir()) ]
PARAMS = [ '-u', '-c', '-d' ]

def match(command) -> bool:
    return CMD_NAME in command.script

def get_new_command(command) -> str | list[str]:
    cutoff = command.script.index(CMD_NAME) + len(CMD_NAME)

    initial = command.script[:cutoff]
    if geteuid() != 0 and 'sudo' not in initial:
        initial = f'sudo {initial}'

    args = command.script[cutoff:]
    kernels = list(filter(args.__contains__, KERNELS)) or KERNELS
    params = list(filter(args.__contains__, PARAMS)) or PARAMS
    args_list = [ f'{a} {v}' for v in kernels for a in params ]
    if '-u' in params:
        args_list = [ '-u' ] + args_list

    return [
        f"{initial} {args}"
        for args in args_list
    ]

enabled_by_default = True
requires_output = False
