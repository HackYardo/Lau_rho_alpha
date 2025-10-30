
# from ../badukbots import gtpBots
import asyncio
import subprocess
from nicegui import run, ui
from gotextprotocol import gtp
from gotextprotocol import extension as gtpe
from gotextprotocol.engine import bots
from plot import board

procs:list[subprocess.Popen] = []

def bot_run(bot:dict) -> str:
    proc = gtp.bot_run(bot['cmd'], bot['dir'])
    procs.append(proc)
    gtp.bot_ready(proc)
    return ""

async def inform(lambdaCall) -> None:
    tip = ui.notification(spinner=True, message=f"Try...", type='info', timeout=None)
    info = lambdaCall()
    await asyncio.sleep(0)
    tip.dismiss()
    if info == "":
        ui.notify(f"PASS", type='positive')
    else:
        ui.notify(f"Fail:\n{info}", type='negative', timeout=20000, classes='multi-line-notification')

def gen(m=19, n=19):
    return ui.plotly(board.fig(["rgba(0,0,0,0)" for o in range(0,m*n)], m, n))
    
async def dynamiC(plt, d) -> None:
    i,x,y = d['pointIndex'], d['x'], d['y']
    #ui.notify(f'{d}')
    
    bot = procs[0]
    vertex = gtpe.vertex(x, y)
    valid = gtpe.qr(bot, f"play b {vertex}")
    if valid[0] == '=':
        move = gtpe.qr(bot, "genmove w")
        ui.notify(move, type='info', timeout=3000)
    else:
        ui.notify(valid, type='warning', timeout=3000)

    await asyncio.sleep(0)
    c, m, n = gtpe.rgba(bot)
    plt.update_figure(board.fig(c, m, n))

def content() -> None:
    plt = gen()
    plt.on('plotly_click', lambda e: dynamiC(plt, e.args['points'][0]))
    ui.button("run", on_click=lambda: inform(lambda: bot_run(bots['g10'])))

if __name__ in {'__main__', '__mp_main__'}:
    content()
    ui.run(port=8063, reload=False,
           binding_refresh_interval=0.3, reconnect_timeout=60)
