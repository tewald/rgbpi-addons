import configparser
import pygame_menu
import os
import shutil

from utils import is_raspberrypi

EXTRA_INI = 'data/extra.ini'
if is_raspberrypi():
    EXTRA_INI = '/opt/rgbpi/ui/extra.ini'

def load_ini():
    if os.path.exists(EXTRA_INI):
        extra_config = configparser.ConfigParser()
    else:
        shutil.copy('extra.ini', EXTRA_INI)
    extra_config.read(EXTRA_INI)
    return extra_config

def toggle_boolean_parameter(value, key):
    extra_config = load_ini()
    overrides = extra_config['common_config_overrides']
    overrides[key] = 'true' if value else 'false'
    with open(EXTRA_INI, 'wt') as f:
        extra_config.write(f)

def get_retroarch_settings_menu(menu_theme, WINDOW_SIZE):
    extra_config = load_ini()

    overrides = extra_config['common_config_overrides']

    menu = pygame_menu.Menu(
        title='Retroarch settings',
        theme=menu_theme,
        joystick_enabled=True,
        width=WINDOW_SIZE[0],
        height=WINDOW_SIZE[1],
        mouse_visible_update=False,
    )

    for k in overrides:
        menu.add.toggle_switch(
            k,
            overrides[k] == 'true',
            toggle_boolean_parameter,
            toggleswitch_id=k,
            width=50,
            slider_thickness=0,
            single_click=True,
            key=k,
            state_text=('false', 'true')
        )

    menu.add.button('Return to menu', pygame_menu.events.BACK)

    return menu