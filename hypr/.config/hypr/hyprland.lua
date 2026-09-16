--
--
-- MINHAS CONFIGURAÇÕES
--
--

hl.window_rule({
	match = { class = "kitty" },
	opacity = "0.78",	
})

hl.window_rule({
	match = { class = "org.mozilla.firefox" },
	opacity = "0.9",
	
})

hl.window_rule({
	match = { class = "spotify" },
	opacity = "0.9",
})

hl.bind("SUPER + F", hl.dsp.exec_cmd("firefox"))
hl.bind("SUPER + D", hl.dsp.exec_cmd("flatpak run com.discordapp.Discord"))
hl.bind("SUPER + S", hl.dsp.exec_cmd("flatpak run com.spotify.Client"))

hl.bind("SUPER + R", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("SUPER + N", hl.dsp.exec_cmd("swaync-client -t -sw"))



--
--
-- MONITORES
--
--


hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})


--
--
-- PROGRAMAS BASE
--
--

local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "hyprlauncher"


--
--
-- AUTOSTART 
--
--


hl.on("hyprland.start", function () 
	hl.exec_cmd("waybar")
	hl.exec_cmd("/home/bielimmeral/.cargo/bin/swww-daemon")
	hl.exec_cmd("/home/bielimmeral/.cargo/bin/swww img /home/bielimmeral/Imagens/wallpapers/Immeral60.png")
	hl.exec_cmd("swaync")
	hl.exec_cmd("wl-paste --watch cliphist store")
	hl.exec_cmd("/usr/libexec/polkit-kde-authentication-agent-1")
	hl.exec_cmd("kitty --hold fastfetch")
end)


--
--
-- VARIÁVEIS DE AMBIENTE
--
--

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

--
--
-- APARÊNCIA E VIBE 
--
--

hl.config({
    general = {
        gaps_in  = 0,
        gaps_out = 7.5,

        border_size = 2,

        col = {
            active_border   = { colors = {"rgba(e00f00ff)", "rgba(e00f00ff)"}, angle = 45 },
            inactive_border = "rgba(e00f00ff)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 20,
        rounding_power = 1,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1,
        inactive_opacity = 0.8,

        shadow = {
            enabled      = false,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 4,
            passes    = 1,
            vibrancy  = 0.5,
        },
    },

    animations = {
        enabled = true,
    },
})

hl.config({
	dwindle = {
		preserve_split = true,
	},
})

hl.config({
	master = {
		new_status = "master",
	},
})


hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

hl.config({
    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
    },
})


--
--
-- ANIMAÇÕES
--
--

hl.curve("overshot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.1 } } })
hl.curve("fluid", { type = "bezier", points = { { 0.25, 1 }, { 0, 1 } } })
hl.curve("snap", { type = "bezier", points = { { 0.5, 0.9 }, { 0.1, 1.05 } } })
hl.curve("menu_decel", { type = "bezier", points = { { 0.1, 1 }, { 0, 1 } } })
hl.curve("liner", { type = "bezier", points = { { 1, 1 }, { 1, 1 } } })

-- Apply animations (enabled field is required)
hl.animation({ leaf = "windowsIn", enabled = true, speed = 7, bezier = "overshot", style = "popin 80%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 5, bezier = "snap", style = "popin 80%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 7, bezier = "overshot", style = "slide" })

hl.animation({ leaf = "border", enabled = true, speed = 2, bezier = "liner" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 40, bezier = "liner", loop = true })

hl.animation({ leaf = "fade", enabled = true, speed = 5, bezier = "fluid" })

hl.animation({ leaf = "layersIn", enabled = true, speed = 6, bezier = "overshot", style = "popin 70%" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 0.5, bezier = "menu_decel", style = "slide" })

hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 5, bezier = "menu_decel" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 4, bezier = "menu_decel" })

hl.animation({ leaf = "workspaces", enabled = true, speed = 8, bezier = "overshot", style = "slidevert" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 8, bezier = "overshot", style = "slide" })


--
--
-- TECLADO E MOUSE?
--
--

hl.config({
    input = {
        kb_layout  = "br",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "vertical",
    action = "workspace"
})

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


--
--
-- ATALHOS ( Windows + ? )
--
--

local mainMod = "SUPER" 

--Terminal
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))

--Fechar Janela
local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())

--Menu de Desligar
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("~/.config/hypr/scripts/powermenu.sh"))

--Gerenciador de Arquivos
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))

--Deixar Janela Flutuando (pra que ne)
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))

--Menu de Pesquisa
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))

--Muda o Formato da Janela (inutil)
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

--Organizar Janelas
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

--Mudar entre Janelas
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

--Abrir Workspace específico
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

--Fixar Janela
hl.bind(mainMod .. " + ALT + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

--Com Mouse ou TouchPad mudar entre Workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

--Controlar Tamanho das Janelas
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

--Funções do Notebook: Volume, Mutar Audio, Mutar Mic, Luminosidade
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

--Controlador de Música
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


--
--
-- JANELAS E WORKSPACES
--
--

local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})
