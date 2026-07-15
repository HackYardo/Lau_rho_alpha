
from nicegui import run, ui

def fig(h=360, w=1, minSize=200):
    y = [i for i in range(h)]
    x = [w for j in range(h)]
    #print(x)
    #print(y)
    return {
        'data': [{
            'name': 'moves',
            'type': 'scatter',
            'mode': 'markers',
            'marker': {'symbol': 'circle'},
            'x': x,
            'y': y,},],
        'layout': {
            'height': minSize+10*h,
            'width': minSize+10*w,},}

def content() -> None:
    with ui.scroll_area().classes('w-32 h-95 border'):
        ui.plotly(fig())

if __name__ in {'__main__', '__mp_main__'}:
    content()
    ui.run(port=8066, reload=True, binding_refresh_interval=0.3,
           reconnect_timeout=60)
