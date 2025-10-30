 
from nicegui import ui

def content() -> None:
    ui.markdown("""## VastBaduk
**Version**: 0.0.1\n
Use the menu on the top to navigate:
### Home
Before you go, take a look at the config. 
### Config
Don't use `-q [--quiet]` to disable **showboard** output of *Leela Zero*.
After edited the table to add your bots, click `TRY` button.
It could check commands/directories automatically, making `RUN` smooth.
However, runtime errors won't be caught, for example:""")
    ui.code("""# GTP loop of Leela Zero
loadsgf xxx.sgf
fixed_handicap 9
leelaz: /build/leela-zero-ozFOLH/leela-zero-0.17/src/FullBoard.cpp:138: int
FullBoard::update_board(int, int): Assertion `m_state[i] == EMPTY' failed.""",
            language='fsharp')
    ui.markdown("""
### Game
### Review
### About
[readme](http://localhost:8086/about)""")
