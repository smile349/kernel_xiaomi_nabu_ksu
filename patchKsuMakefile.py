#!/usr/bin/env python3
ORIGIN = """$(shell cd $(srctree)/$(src); /usr/bin/env PATH=\"$$PATH\":/usr/bin:/usr/local/bin [ -f ../.git/shallow ] && git fetch --unshallow)
KSU_GIT_VERSION := $(shell cd $(srctree)/$(src); /usr/bin/env PATH="$$PATH":/usr/bin:/usr/local/bin git rev-list --count HEAD)"""

with open("KernelSU/kernel/Makefile", "r+") as f:
    content = f.read()
    content = content.replace(
        ORIGIN, 
        "KSU_GIT_VERSION := $(shell cd $(srctree)/$(src); /usr/bin/env PATH=\"$$PATH\"" \
        ":/usr/bin:/usr/local/bin [ -f ../.git/shallow ] && git fetch --unshallow; git rev-list --count HEAD)"
    )
    f.seek(0)
    f.write(content)
    print(f.read())
    f.close()