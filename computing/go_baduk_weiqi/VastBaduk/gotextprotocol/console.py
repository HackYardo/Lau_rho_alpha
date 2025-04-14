
from nicegui import binding, ui

class Console:
    AUTO_TAB:list[str] = """protocol_version known_command list_commands quit
name version boardsize clear_board komi play genmove loadsgf reg_genmove undo
fixed_handicap place_free_handicap set_free_handicap time_settings time_left
final_score final_status_list showboard""".split()
    MAX_LINES:int = 256
    lines:str = binding.BindableProperty()

    def __init__(self):
        self.lines = ""
    
    def _pop(self):
        if self.lines.count('\n') == self.MAX_LINES:
            self.lines = self.lines[:self.lines[:-1].rfind('\n')+1]

    def push(self, line):
        self._pop()
        self.lines = f"{line}\n" + self.lines

def new(procs, func):
    c = Console()
    with ui.card().classes('w-full h-69'):
        i = ui.input(label='GTP Console', autocomplete=c.AUTO_TAB)
        i.classes('w-full').props('clearable')
        i.on('keydown.enter', lambda: c.push(func(procs, i.value)))
        with ui.scroll_area().classes('w-full h-96'):
            o = ui.code(language='fsharp').bind_content_from(c, 'lines')
            o.classes('w-full')




