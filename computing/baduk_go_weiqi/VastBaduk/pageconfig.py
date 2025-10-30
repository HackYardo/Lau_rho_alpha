
# from ../badukbots import gtpBots
import asyncio
import subprocess
from nicegui import run, ui
from gotextprotocol import gtp, console
from gotextprotocol import coroutines as gtps
from gotextprotocol.engine import cols, bots_update, rows

l:list[subprocess.Popen] = []  # gtp processes, not gone after F5/ctrlR/newTab
"""
def botstry(sth):
    for bot in sth:
        bottry(bot)

async def bottry(bot):
    tip = ui.notification(spinner=True, message=f"Try to run {bot['name']}...", type='info', timeout=None)
    info = await run.cpu_bound(gtp.bot_try, bot['cmd'], bot['dir'])
    tip.dismiss()
    if info == "":
        ui.notify(f"{bot['name']} PASS", type='positive')
    else:
        ui.notify(f"{bot['name']} Fail:\n{info}", type='negative', timeout=20000, classes='multi-line-notification')
        
"""
async def bots_try(bots):
    for bot in bots:
        tip = ui.notification(spinner=True, message=f"Try {bot['name']}...", type='info', timeout=None)
        info = await run.cpu_bound(gtp.bot_try, bot["cmd"], bot["dir"])
        tip.dismiss()
        if info == "":
            ui.notify(f"{bot['name']} PASS", type='positive')
        else:
            ui.notify(f"{bot['name']} Fail:\n{info}", type='negative', timeout=20000, classes='multi-line-notification')
"""
async def bots_tryl(bots):
    l = lambda bots: (bots_trya(bot) for bot in bots)
    asyncio.gather(*l(bots))
#"""
async def bot_ruN(sth, l):
    procs = await gtps.bot_runl(sth)
    l.extend(procs)
#"""
def bots_ruN(sth, l):
    for bot in sth:
        tip = ui.notification(spinner=True, message=f"Run {bot['name']}...", type='info', timeout=None)
        proc = gtp.bot_run(bot['cmd'], bot['dir'])
        l.append(proc)
        tip.dismiss()
        ui.notify(f"{bot['name']} is now running.", type='positive')
#"""        
def bots_show(procs):
    for proc in procs:
        ui.notify(proc, type='info')
    
def bots_qr(procs, word):
    s = ""
    for proc in procs:
        x = gtp.qr(proc, word)
        s = s + x
    return s

def bots_enD(bots, procs):
    s = ""
    """cmdRunning = [proc.arg for proc in procs]
    for bot in bots:
        cmd = bot['cmd']
        if cmd in cmdRunning:
            x = gtp.qr(proc, )
    for proc in procs:
        x = gtp.qr(proc, "quit")
        s = s + x
        procs.pop(proc)"""
    ui.notify(s)

def bot_table():
    with ui.table(title='Bots', columns=cols, rows=rows, row_key='name', selection='multiple', pagination=10) as table:
        with table.add_slot('top-left'):  # search 
            with ui.input(placeholder='Search').props('type=search').bind_value(table, 'filter').add_slot('append'):
                ui.icon('search')
        with table.add_slot('top-right'):  # try/run/del the selected, show/quit running bots, save whole table
            with ui.button_group():
                ui.button('try', on_click=lambda: bots_try(table.selected))
                ui.button('run', on_click=lambda: bot_ruN(table.selected, l))
                #ui.button(icon='check', on_click=lambda: bots_show(l))
                #ui.button(icon='stop', on_click=lambda: bots_enD(table.selected, l))
                ui.button('del', on_click=lambda: table.remove_rows(table.selected))
                ui.button(icon='save', on_click=lambda: bots_update(table.rows))
        with table.add_slot('bottom-row'):  # add a row
            with table.row():
                with table.cell():
                    ui.button(
                        icon='add',
                        on_click=lambda: (
                            table.add_row({'name': new_name.value, 'dir': new_dir.value, 'cmd': new_cmd.value}),
                            new_name.set_value(None),
                            new_dir.set_value(None),
                            new_cmd.set_value(None))).props('flat fab-mini')
                with table.cell():
                    new_name = ui.input('Name', placeholder='name should be unique')
                with table.cell():
                    new_dir  = ui.input('Dir',  placeholder='relative, empty if in PATH')
                with table.cell():
                    new_cmd  = ui.input('Cmd',  placeholder='try in your terminal first')

def content() -> None:
    bot_table()
    console.new(l, bots_qr)
