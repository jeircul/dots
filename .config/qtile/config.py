import os
import subprocess
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from floating_window_snapping import move_snap_window

home = os.path.expanduser('~')
terminal = guess_terminal()
mod = "mod4"
browser = "qutebrowser"

@hook.subscribe.startup_once
def autostart():
    subprocess.Popen([home + '/.config/qtile/autostart.sh'])

colors = []
cache = home + '/.cache/wal/colors'
def load_colors(cache):
    with open(cache, 'r') as file:
        for i in range(8):
            colors.append(file.readline().strip())
    colors.append('#ffffff')
    lazy.reload()
load_colors(cache)


keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    Key([mod], "t", lazy.screen.next_group()),
    Key([mod], "m", lazy.layout.maximize()),
    Key([mod], "b", lazy.spawn(browser), desc="Launch terminal"),
    Key([mod, "shift"], "s", lazy.spawn("flameshot gui"), desc="Launch Flameshot"),
    Key([mod], "BackSpace", lazy.spawn(home + "/scripts/dmenu/powermenu"), desc="Launch powermenu"),
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key([mod, "shift"], "f", lazy.window.toggle_floating(), desc='Toggle floating'),
    Key([mod], "d", lazy.spawn("rofi -combi-modi window,drun -show combi"), desc="Launch terminal"),
    Key([mod, "shift"], "d", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod], "period", lazy.next_screen(), desc='Move focus to next monitor'),
    Key([mod], "comma", lazy.prev_screen(), desc='Move focus to prev monitor'),
    Key([mod], "h", lazy.layout.shrink(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.grow(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    # Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "Tab", lazy.spawn("rofi -show window"), desc="Launch terminal"),
    Key(["mod1"], "Tab", lazy.screen.toggle_group(), desc="Toggle between layouts"),
    Key([mod, "shift"], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "space", lazy.widget["keyboardlayout"].next_keyboard(), desc="Next keyboard layout."),
]

# groups = [Group(i) for i in "123456"]

groups = [
    # Group("1", label="www", matches=[Match(wm_class="firefox")]),
    Group("1", label="www"),
    Group("2", label="dev"),
    Group("3", label="chat"),
    Group("4", label="mail"),
    Group("5", label="music"),
    Group("6", label="other"),
]

for i in groups:
    keys.extend(
        [
            Key(
                [mod], i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            Key(
                [mod, "shift"], i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )

layout_theme = {
    "border_focus": colors[1],
    "border_normal": colors[0],
    "font": "Hack Nerd Font Mono",
}

layouts = [
    layout.MonadTall(**layout_theme),
    layout.Max(),
    # layout.Bsp(),
]

widget_defaults = dict(
    font="Fira Code",
    fontsize=13,
    padding=3,
    background=colors[0],
    foreground=colors[3],
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(),
                widget.GroupBox(
                    active = colors[4],
                    inactive = colors[7],
                    highlight_method = "line",
                    highlight_color = colors[0],
                    this_screen_border = colors[4],
                    this_current_screen_border = colors[3],
                    other_screen_border = colors[4],
                    other_current_screen_border = colors[5],
                ),
                widget.WindowName(),
                widget.CryptoTicker(
                    foreground=colors[1]
                ),
                widget.Systray(),
                widget.KeyboardLayout(
                    configured_keyboards = ['us', 'no'],
                    foreground = colors[5]
                ),
                widget.Volume(emoji=True),
                widget.Clock(
                    format="%d/%m %a %H:%M",
                    foreground=colors[2]
                ),
                widget.QuickExit(
                    foreground=colors[1],
                    default_text='[]',
                    countdown_format='[{}]',
                ),
            ],
            24,
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(),
                widget.GroupBox(
                    active = colors[4],
                    inactive = colors[7],
                    highlight_method = "line",
                    highlight_color = colors[0],
                    this_screen_border = colors[4],
                    this_current_screen_border = colors[3],
                    other_screen_border = colors[4],
                    other_current_screen_border = colors[5],
                ),
                widget.WindowName(),
            ],
            24,
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(),
                widget.GroupBox(
                    active = colors[4],
                    inactive = colors[7],
                    highlight_method = "line",
                    highlight_color = colors[0],
                    this_screen_border = colors[4],
                    this_current_screen_border = colors[3],
                    other_screen_border = colors[4],
                    other_current_screen_border = colors[5],
                ),
                widget.WindowName(),
            ],
            24,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag(["shift"], "Button1", move_snap_window(snap_dist=20),
        start=lazy.window.get_position()),
    Drag(["shift"], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click(["shift"], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = False

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

