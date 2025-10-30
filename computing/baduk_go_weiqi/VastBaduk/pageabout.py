
# import readme.md
from nicegui import ui
from gotextprotocol.engine import REPO

def content() -> None:
    with open(REPO + "readme.md") as f:
        ui.markdown(f.read())
