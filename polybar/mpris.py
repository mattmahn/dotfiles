#!/usr/bin/env python3
"""
DBus client that listens for MPRIS events and outputs a string used for polybar
"""

from sys import argv, exit, version_info

if (version_info.major == 3 and version_info.minor < 6) \
        or (version_info.major < 3):
    print('Python 3.6 or later is required')
    exit(1)

import gi
gi.require_version('Playerctl', '1.0')
from gi.repository import Playerctl, GLib

ICON = ''
SHRUG = '¯\_(ツ)_/¯'

def format_time(seconds):
    hours, rem = divmod(seconds, 3600)
    minutes, seconds = divmod(rem, 60)
    if hours >= 1:
        return f'{hours:.0f}:{minutes:02.0f}:{seconds:02.0f}'
    else:
        return f'{minutes:02.0f}:{seconds:02.0f}'

def on_metadata(player, e):
    # https://www.freedesktop.org/wiki/Specifications/mpris-spec/metadata/#index2h4
    album = player.get_album() or SHRUG
    artist = ', '.join(e['xesam:artist']) or SHRUG
    duration = format_time(e['mpris:length'] * 1e-6)
    title = player.get_title() or SHRUG
    print(f'"{title}" by {artist}')

def on_play(player):
    pass

def on_pause(player):
    pass

name = 'spotify'
player = Playerctl.Player(player_name=name)

player.on('play', on_play)
player.on('pause', on_pause)
player.on('metadata', on_metadata)

# wait for events
main = GLib.MainLoop()
print('running...')
main.run()
