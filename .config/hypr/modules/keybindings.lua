---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal = 'ghostty'
local fileManager = 'nautilus'
local menu = 'hyprlauncher'
local browser = 'firefox'

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = 'SUPER' -- Sets "Windows" key as main modifier
local secondMod = 'ALT'

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. ' + ' .. secondMod .. ' + C', hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(
    -- mainMod .. ' + ' .. secondMod .. ' + M',
    'CTRL + ALT + DELETE',
    hl.dsp.exec_cmd "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown --vt 2 || hyprctl dispatch 'hl.dsp.exit()'"
)
hl.bind(mainMod .. ' + ' .. secondMod .. ' + comma', hl.dsp.exec_cmd 'hyprlock')
-- bugged behavior
-- hl.bind(mainMod .. ' + SHIFT + L', hl.dsp.exec_cmd 'hyprlock & disown && systemctl suspend')

hl.bind(mainMod .. ' + Q', hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. ' + E', hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. ' + B', hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. ' + Space', hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. ' + N', hl.dsp.exec_cmd 'swaync-client -t -sw')
hl.bind(mainMod .. ' + O', hl.dsp.exec_cmd ' hyprpicker | wl-copy')

-- Select an area and open it in swappy:
hl.bind(
    'Print',
    hl.dsp.exec_cmd 'grim - | satty -f - --copy-command wl-copy -o "~/Pictures/Screenshots/%Y%m%d_%H%M%S.png"'
)
hl.bind(
    mainMod .. ' + Print',
    hl.dsp.exec_cmd 'grim -g "$(slurp -d)" - | satty -f - --copy-command wl-copy -o "~/Pictures/Screenshots/%Y%m%d_%H%M%S.png"'
)

hl.bind(mainMod .. ' + V', hl.dsp.window.float { action = 'toggle' })
hl.bind(mainMod .. ' + P', hl.dsp.window.pseudo())
hl.bind(mainMod .. ' + Slash', hl.dsp.layout 'togglesplit') -- dwindle only
hl.bind(mainMod .. ' + F', hl.dsp.window.fullscreen { mode = 'maximized', action = 'toggle' })

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. ' + H', hl.dsp.focus { direction = 'left' })
hl.bind(mainMod .. ' + L', hl.dsp.focus { direction = 'right' })
hl.bind(mainMod .. ' + K', hl.dsp.focus { direction = 'up' })
hl.bind(mainMod .. ' + J', hl.dsp.focus { direction = 'down' })

hl.bind(mainMod .. ' + SHIFT + H', hl.dsp.window.move { direction = 'left' })
hl.bind(mainMod .. ' + SHIFT + L', hl.dsp.window.move { direction = 'right' })
hl.bind(mainMod .. ' + SHIFT + K', hl.dsp.window.move { direction = 'up' })
hl.bind(mainMod .. ' + SHIFT + J', hl.dsp.window.move { direction = 'down' })

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. ' + ' .. key, hl.dsp.focus { workspace = i })
    hl.bind(mainMod .. ' + SHIFT + ' .. key, hl.dsp.window.move { workspace = i })
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. ' + S', hl.dsp.workspace.toggle_special 'magic')
hl.bind(mainMod .. ' + SHIFT + S', hl.dsp.window.move { workspace = 'special:magic' })

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. ' + mouse_down', hl.dsp.focus { workspace = 'e+1' })
hl.bind(mainMod .. ' + mouse_up', hl.dsp.focus { workspace = 'e-1' })

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. ' + mouse:272', hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. ' + mouse:273', hl.dsp.window.resize(), { mouse = true })

-- resize with +/-
hl.bind(mainMod .. ' + equal', hl.dsp.layout 'splitratio +0.05', { repeating = true })
hl.bind(mainMod .. ' + minus', hl.dsp.layout 'splitratio -0.05', { repeating = true })
hl.bind(mainMod .. ' + backslash', hl.dsp.layout 'splitratio 1.0 exact')

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
    'XF86AudioRaiseVolume',
    hl.dsp.exec_cmd 'wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+',
    { locked = true, repeating = true }
)
hl.bind(
    'XF86AudioLowerVolume',
    hl.dsp.exec_cmd 'wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-',
    { locked = true, repeating = true }
)
hl.bind(
    'XF86AudioMute',
    hl.dsp.exec_cmd 'wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle',
    { locked = true, repeating = true }
)
hl.bind(
    'XF86AudioMicMute',
    hl.dsp.exec_cmd 'wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle',
    { locked = true, repeating = true }
)
hl.bind('XF86MonBrightnessUp', hl.dsp.exec_cmd 'brightnessctl -e4 -n2 set 5%+', { locked = true, repeating = true })
hl.bind('XF86MonBrightnessDown', hl.dsp.exec_cmd 'brightnessctl -e4 -n2 set 5%-', { locked = true, repeating = true })

-- Requires playerctl
hl.bind('XF86AudioNext', hl.dsp.exec_cmd 'playerctl next', { locked = true })
hl.bind('XF86AudioPause', hl.dsp.exec_cmd 'playerctl play-pause', { locked = true })
hl.bind('XF86AudioPlay', hl.dsp.exec_cmd 'playerctl play-pause', { locked = true })
hl.bind('XF86AudioPrev', hl.dsp.exec_cmd 'playerctl previous', { locked = true })
