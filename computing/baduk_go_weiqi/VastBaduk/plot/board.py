
from nicegui import ui

def line(m:int=19, n:int=19):
    clinesX = []
    rlinesX = []
    clinesY = []
    rlinesY = []
    for i in range(1, n+1):
        clinesX.extend([i, i, None])
        clinesY.extend([1, m, None])
    for j in range(1, m+1):
        rlinesX.extend([1, n, None])
        rlinesY.extend([j, j, None])
    return clinesX, clinesY, rlinesX, rlinesY

def fhp(length:int=19) -> list[int]:  # GTP: Fixed Handicap Placement
    l:list[int] = []
        
    if length > 12:
        l.extend([4, length-3])
    elif 6 < length <= 12:
        l.extend([3, length-2])
    else:
        pass

    if length > 8 and length % 2 != 0:
        l.insert(1, int(length/2)+1)
    return l
        
def star(m:int=19, n:int=19) -> tuple[list[int]]:
    mFhp, nFhp = fhp(m), fhp(n)
    mStar = [j for j in mFhp for i in nFhp]
    nStar = [i for j in mFhp for i in nFhp]
    return nStar, mStar

def const(m=19, n=19):
    Y = [j for j in range(1,m+1)]
    Y_RVS = [j for j in range(m, 0, -1)]
    X = [i for i in range(1, n+2)]
    
    Y_AXIS = [f'{i}' for i in Y]
    X_AXIS = [chr(j+64) for j in X]
    if n > 8:
        X_AXIS.pop(8)

    X.pop(-1)    
    Y_GRID = [j for j in Y_RVS for i in X]
    X_GRID = [i for j in Y_RVS for i in X]

    cx, cy, rx, ry = line(m, n)
    X_STAR, Y_STAR = star(m, n)
    
    return X,Y, X_AXIS, Y_AXIS, X_GRID, Y_GRID, X_STAR, Y_STAR, cx,cy, rx,ry

def fig(c, m=19, n=19):
    C = const(m, n)
    return {
        'data': [{
            'name': 'anchors',
            'type': 'scatter',
            'mode': 'text',
            'text': '+',
            'textfont': {'size': 10, 'color': 'rgba(0,0,0,0.5)'},
            'hoverinfo': 'skip',
            'x': [0, n+1],
            'y': [m+1, 0],},
            {
            'name': 'col lines',
            'type': 'scatter',
            'mode': 'lines',
            'line':{'width': 1, 'color': 'rgb(0,0,0)'},
            'hoverinfo': 'skip',
            'x': C[8],
            'y': C[9],},
            {
            'name': 'row lines',
            'type': 'scatter',
            'mode': 'lines',
            'line':{'width': 1, 'color': 'rgb(0,0,0)'},
            'hoverinfo': 'skip',
            'x': C[10],
            'y': C[11],},
            {
            'name': 'stars',
            'type': 'scatter',
            'mode': 'markers',
            'marker':{'color': 'rgb(0,0,0)'},
            'hoverinfo': 'skip',
            'x': C[6],
            'y': C[7],},
            {
            'name': 'stones',
            'type': 'scatter',
            'mode': 'markers',
            'marker':{
                'color': c,
                #'colorscale': [[-1,'rgb(0,0,0)'],[1,'rgb(255,255,255)']],
                #'showscale': True,
                'size': 25,
                'symbol': 'circle'},
            'x': C[4],
            'y': C[5],},],
        'layout': {
            'height': 800,
            'width': 800*1.2,
            'margin': {'l': 15, 'r': 15, 't': 15, 'b': 15},
            'paper_bgcolor': '#00FF7F',
            'plot_bgcolor': '#CD853F',
            'xaxis': {'zeroline': False, 'showgrid': False,
                      'ticktext': C[2], 'tickvals': C[0]},
            'yaxis': {'zeroline': False, 'showgrid': False,
                      'ticktext': C[3], 'tickvals': C[1]},},}

def gen(m=19, n=19):
    return ui.plotly(fig(["rgba(0,0,0,0)" for o in range(0,m*n)], m, n))

def updatE(plt, point):
    c = [f"rgba(0,0,0,{point['pointIndex']/360})" for o in range(0,361)]
    plt.update_figure(fig(c))
"""
async def engine():
    return await gtp.bot_run("gnugo --mode gtp", '.')
    
bot = gtp.bot_run("gnugo --mode gtp", '.')
GTPAxis = "ABCDEFGHJKLMNOPQRST"
def dynamiC(plt, e):
    d = e.args['points'][0]
    i = d['pointIndex']
    x = d['x']
    y = d['y']
    gtp.qr(bot, f"play b {GTPAxis[x-1]}{y}")
    gtp.qr(bot, "genmove w")
    c = gtpe.board(bot)[-1]
    ui.notify(f'{i}, {x}, {y}')
    plt.update_figure(figure(19,19,c))
#"""
if __name__ in {'__main__', '__mp_main__'}:
    plt = gen()
    plt.on('plotly_click', lambda e: updatE(plt, e.args['points'][0]))
    ui.run(port=8064)
