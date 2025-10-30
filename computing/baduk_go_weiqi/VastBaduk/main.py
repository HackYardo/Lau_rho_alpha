
# import favicon.ico
from nicegui import app, ui
import pagetheme
import pagehome
import pageabout   # import readme.md
import pageconfig  # from ../badukbots import gtpBots
import pagegame    # from ../badukbots import gtpBots

@ui.page('/')
def page_home() -> None:
    pagetheme.menu_buttons()
    pagehome.content()

@ui.page("/config")
def page_config() -> None:
    pagetheme.menu_buttons()
    pageconfig.content()

@ui.page("/game")
def page_game() -> None:
    pagetheme.menu_buttons()
    pagetheme.plot_buttons()
    pagegame.content()

@ui.page("/about")
def page_about() -> None:
    pagetheme.menu_buttons()
    pageabout.content()

app.on_startup(lambda: print("VastBaduk ready: http://localhost:8086"))
app.on_shutdown(lambda: print("VastBaduk exited."))
ui.run(port=8086, favicon='favicon.ico', title="VastBaduk", reload=False,
       binding_refresh_interval=0.3, reconnect_timeout=60,
       show_welcome_message=False)
