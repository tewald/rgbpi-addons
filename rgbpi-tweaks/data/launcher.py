import configparser
import launcher2

make_common2 = launcher2.make_common

def make_common(system, game_path, config, is_global_nfs):
    make_common2(system, game_path, config, is_global_nfs)
    extra_config = configparser.ConfigParser()
    extra_config.read('extra.ini')

    if 'common_config_overrides' in extra_config:
        for setting in extra_config['common_config_overrides']:
            for c in config:
                if c.startswith('{} ='.format(setting)):
                    config.remove(c)
            config.append('{} = {}\n'.format(
                setting,
                extra_config['common_config_overrides'][setting]
            ))

launcher2.make_common = make_common

from launcher2 import *
