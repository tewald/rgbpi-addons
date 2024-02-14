from pygame_menu.examples import create_example_window
import pygame
import pygame_menu
import os
import shutil

from utils import is_raspberrypi
from retroarch_settings import get_retroarch_settings_menu
from rgbpi_tweaks import get_rgbpi_tweaks_menu
from core_updates import get_core_updates_menu

RGBPI_UI_ROOT = '/tmp'
SUDOERS_FILE = '/tmp/010_pi-nopasswd'

if is_raspberrypi():
    RGBPI_UI_ROOT = '/opt/rgbpi/ui'
    SUDOERS_FILE = '/etc/sudoers.d/010_pi-nopasswd'

root_enabled = os.path.exists(SUDOERS_FILE)
patch_enabled = os.path.exists('{}/launcher2.pyc'.format(RGBPI_UI_ROOT))

WINDOW_SIZE = (320, 240)

surface = create_example_window('RGB-Pi OS4 Tweaks', WINDOW_SIZE, pygame.FULLSCREEN, pygame.JOYAXISMOTION)

pygame.event.set_blocked(pygame.MOUSEMOTION)
pygame.mouse.set_visible(False)

menu_theme = pygame_menu.themes.THEME_DARK.copy()
menu_theme.background_color = (0, 0, 0, 255)
menu_theme.title_offset = (20, 20)
menu_theme.title_font_size = 16
menu_theme.title_font = pygame_menu.font.FONT_MUNRO
menu_theme.title_bar_style = pygame_menu.widgets.MENUBAR_STYLE_NONE
menu_theme.widget_font_size = 12
menu_theme.widget_font = pygame_menu.font.FONT_MUNRO
menu_theme.widget_alignment = pygame_menu.locals.ALIGN_LEFT
menu_theme.scrollbar_color = (0, 0, 0, 255)
menu_theme.scrollbar_slider_color = (0, 0, 0, 255)
menu_theme.scrollbar_thick = (5)

menu = pygame_menu.Menu(
    title='RGB-Pi OS4 Tweaks',
    theme=menu_theme,
    joystick_enabled=True,
    width=WINDOW_SIZE[0],
    height=WINDOW_SIZE[1],
    mouse_visible_update=False,
)

idle_timeout = 240 #seconds
last_input_time = pygame.time.get_ticks()

def toggle_root(value) -> None:
    global last_input_time
    try:
        if value:
            with open(SUDOERS_FILE, 'wt') as f:
                f.write('pi ALL=(ALL) NOPASSWD: ALL')
        else:
            os.remove(SUDOERS_FILE)
        last_input_time = pygame.time.get_ticks()
    except:
        value = not value

def apply_patch():
    global last_input_time
    error = None
    try:
        shutil.move('{}/launcher.pyc'.format(RGBPI_UI_ROOT), '{}/launcher2.pyc'.format(RGBPI_UI_ROOT))
        shutil.copy('data/launcher.py', '{}/launcher.py'.format(RGBPI_UI_ROOT))
        shutil.copy('data/extra.ini', '{}/extra.ini'.format(RGBPI_UI_ROOT))
        os.system('reboot')
    except:
        import traceback
        traceback.print_exc()
        error = 'patch'
    load_menu(error=error)
    last_input_time = pygame.time.get_ticks()

def load_menu(error=None):
    global last_input_time
    menu.clear()
    if error:
        if error == 'patch':
            menu.add.label('Error applying patch!', wordwrap=False)
        menu.add.vertical_margin(margin=10)
        menu.add.button('OK', load_menu)
    else:
        menu.add.toggle_switch('Root access', root_enabled, toggle_root, width=70, slider_thickness=0, single_click=True, state_text=('disabled', 'enabled'))
        menu.add.vertical_margin(margin=10)
        if not patch_enabled:
            menu.add.button('Apply patch to launcher and reboot', apply_patch)
        else:
            retroarch_settings_menu = get_retroarch_settings_menu(menu_theme, WINDOW_SIZE)
            rgbpi_tweaks_menu = get_rgbpi_tweaks_menu(menu_theme, WINDOW_SIZE)
            menu.add.button('Retroarch Settings', retroarch_settings_menu)
            menu.add.button('Update Cores', get_core_updates_menu(menu_theme, WINDOW_SIZE))
            menu.add.button('Tweaks', get_rgbpi_tweaks_menu(menu_theme, WINDOW_SIZE))
        menu.add.vertical_margin(margin=10)
        
        menu.add.button('Quit', pygame_menu.events.EXIT)

load_menu()

if __name__ == '__main__':
    while True:
        events = pygame.event.get()
        for event in events:
            if event.type == pygame.QUIT:
                exit()
        if menu.is_enabled():
            menu.update(events)
            menu.draw(surface)
            # Check idle timeout
            current_time = pygame.time.get_ticks()
            if current_time - last_input_time > idle_timeout * 1000:
                exit()
        pygame.display.update()
