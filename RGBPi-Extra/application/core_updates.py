import os
import pygame_menu
import subprocess
import time

CORES_FOLDER = 'cores'

def make_script_executable(script_path):
    # Set execute permission for the script
    os.chmod(script_path, os.stat(script_path).st_mode | 0o111)

def run_script(script_name, menu):
    script_path = os.path.join(CORES_FOLDER, f"{script_name}.sh")

    # Make the script executable
    make_script_executable(script_path)

    # Clear the framebuffer for 1 second
    subprocess.Popen(['dd', 'if=/dev/zero', 'of=/dev/fb0'])
    time.sleep(1)

    # Add your script execution logic here
    try:
        # Run the script using subprocess.Popen
        subprocess.Popen([script_path])
    except Exception as e:
        print(f"Error running script: {e}")

def get_core_updates_menu(menu_theme, WINDOW_SIZE):
    menu = pygame_menu.Menu(
        title='',
        theme=menu_theme,
        joystick_enabled=True,
        width=WINDOW_SIZE[0],
        height=WINDOW_SIZE[1],
        mouse_visible_update=False,
    )

    # List scripts from the 'scripts' folder
    script_files = [f for f in os.listdir(CORES_FOLDER) if os.path.isfile(os.path.join(CORES_FOLDER, f))]

    # Add buttons for each script in the 'scripts' folder
    for script_file in script_files:
        script_name, script_ext = os.path.splitext(script_file)
        if script_ext.lower() == '.sh':
            menu.add.button(script_name, run_script, script_name, menu)

    menu.add.button('Return to menu', pygame_menu.events.BACK)

    return menu
