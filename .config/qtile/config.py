import os
import subprocess
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from floating_window_snapping import move_snap_window

home = os.path.expanduser('~')
dmenus = f"{home}/scripts/dmenu"
terminal = guess_terminal()
mod = "mod4"
browser = "qutebrowser"


@hook.subscribe.startup_once
def autostart():
    subprocess.Popen([home + '/.config/qtile/autostart.sh'])


def load_colors(cache):
    with open(cache, 'r') as file:
        for i in range(8):
            colors.append(file.readline().strip())
    colors.append('#ffffff')
    lazy.reload()


colors = []
cache = home + '/.cache/wal/colors'
load_colors(cache)


keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    Key([mod], "Return", lazy.spawn(terminal)),
    Key([mod], "b", lazy.spawn(browser)),
    Key([mod, "shift"], "b", lazy.spawn(f"{dmenus}/qutebrowser-profile")),
    Key([mod], "d", lazy.spawn("rofi -combi-modi window,drun -show combi")),
    Key([mod], "e", lazy.spawn("thunar")),
    Key([mod, "shift"], "s", lazy.spawn("flameshot gui")),
    Key([mod], "BackSpace", lazy.spawn(f"{dmenus}/powermenu")),
    # Key([mod, "shift"], "d", lazy.spawncmd()),
    Key([mod], "q", lazy.window.kill()),
    Key([mod], "r", lazy.reload_config()),
    Key([mod, "control"], "q", lazy.shutdown()),
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key([mod], "space", lazy.widget["keyboardlayout"].next_keyboard()),
    # Layout
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "Tab", lazy.next_layout()),
    Key([mod], "i", lazy.layout.grow()),
    Key([mod], "m", lazy.layout.shrink()),
    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "o", lazy.layout.maximize()),
    Key([mod, "shift"], "space", lazy.layout.flip()),
    # Screen
    Key([mod], "period", lazy.next_screen()),
    Key([mod], "comma", lazy.prev_screen()),
    Key([mod], "Tab", lazy.window.toggle_floating()),
    Key(["mod1"], "Tab", lazy.screen.toggle_group()),
]

# groups = [Group(i) for i in "123456"]

groups = [
    # Group("1", label="www", matches=[Match(wm_class="firefox")]),
    Group("1", label="www"),
    Group("2", label="dev"),
    Group("3", label="chat"),
    Group("4", label="www2"),
    Group("5", label="music"),
    Group("6", label="slack"),
    Group("7", label="other"),
]

for i in groups:
    keys.extend(
        [
            Key(
                [mod], i.name,
                lazy.group[i.name].toscreen(),
                desc=f"Switch to group {i.name}",
            ),
            Key(
                [mod, "shift"], i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc=f"Switch to & move focused window to group {i.name}",
            ),
        ]
    )

layout_theme = {
    "border_focus": colors[4],
    "border_normal": colors[0],
    "font": "FiraCode Nerd Font Mono Regular",
}

layouts = [
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
]

widget_defaults = dict(
    font="FiraCode Nerd Font Mono Bold",
    fontsize=13,
    padding=3,
    background=colors[0],
    foreground=colors[7],
    active=colors[4],
    inactive=colors[7],
    highlight_method="block",
    block_highlight_text_color=colors[0],
    urgent_border=colors[1],
    urgent_text=colors[1],
    this_screen_border=colors[4],
    this_current_screen_border=colors[3],
    other_screen_border=colors[4],
    other_current_screen_border=colors[5],
)
extension_defaults = widget_defaults.copy()


screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(),
                widget.GroupBox(),
                widget.WindowName(
                    foreground=colors[4],
                ),
                widget.CryptoTicker(
                    format='\uf6ab {amount:.0f} |'
                ),
                widget.CryptoTicker(
                    crypto='ETH',
                    format='\ue656 {amount:.0f} |'
                ),
                widget.CryptoTicker(
                    crypto='DOT',
                    format='DOT {amount:.3f} |'
                ),
                widget.CryptoTicker(
                    crypto='ATOM',
                    format='ATOM {amount:.3f} |'
                ),
                widget.CryptoTicker(
                    crypto='MATIC',
                    format='MATIC {amount:.3f} |'
                ),
                widget.Systray(),
                widget.KeyboardLayout(configured_keyboards=['us', 'no']),
                widget.Volume(emoji=True),
                widget.BatteryIcon(),
                widget.Clock(format="%d/%m %a %H:%M"),
                widget.QuickExit(
                    foreground=colors[1],
                    default_text='[\ueb2d]',
                    countdown_format='[{}]',
                )

            ],
            24,
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(),
                widget.GroupBox(),
                widget.WindowName(foreground=colors[4]),
            ],
            24,
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(),
                widget.GroupBox(),
                widget.WindowName(foreground=colors[4]),
            ],
            24,
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(),
                widget.GroupBox(),
                widget.WindowName(foreground=colors[4]),
            ],
            24,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag(
        ["shift"], "Button1", move_snap_window(snap_dist=20),
        start=lazy.window.get_position()
    ),
    Drag(
        ["shift"], "Button3", lazy.window.set_size_floating(),
        start=lazy.window.get_size()
    ),
    Click(["shift"], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of xprop to see the wm class and name of an X client.
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
