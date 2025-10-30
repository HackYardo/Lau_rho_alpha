
from nicegui import app, ui

def app_quit() -> None:
    ui.notify("Bye~", type='info')
    app.shutdown()

def plot_buttons() -> None:
    with ui.button_group():
        ui.button("stone", icon='scatter_plot', on_click=lambda: ui.navigate.to("/config"))
        ui.button("ownership", icon='bubble_chart', on_click=lambda: ui.navigate.to("/config"))
        ui.button("winrate", icon='ssid_chart', on_click=lambda: ui.navigate.to("/config"))
        ui.button("score", icon='equalizer', on_click=lambda: ui.navigate.to("/config"))
        ui.button("review", icon='timeline', on_click=lambda: ui.navigate.to("/config"))
        ui.button("ponder", icon='query_stats', on_click=lambda: ui.navigate.to("/config"))
        ui.button("sgf", icon='schema', on_click=lambda: ui.navigate.to("/config"))

def menu_buttons() -> None:
    with ui.button_group():
        ui.button(icon='west', on_click=ui.navigate.back)
        ui.button(icon='east', on_click=ui.navigate.forward)
        ui.button(icon='home', on_click=lambda: ui.navigate.to('/'))
        ui.button(icon='rule', on_click=lambda: ui.navigate.to("/config"))
        ui.button(icon='sailing', on_click=lambda: ui.navigate.to("/game"))
        ui.button(icon='insights', on_click=lambda: ui.navigate.to("/config"))
        ui.button(icon='info', on_click=lambda: ui.navigate.to("/about"))
        ui.button(icon='logout', on_click=app_quit)
