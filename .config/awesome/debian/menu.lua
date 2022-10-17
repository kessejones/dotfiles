-- automatically generated file. Do not edit (see /usr/share/doc/menu/html)

local awesome = awesome

Debian_menu = {}

Debian_menu["Debian_Ajuda"] = {
	{"Xman","xman"},
}
Debian_menu["Debian_Aplicativos_Acessibilidade"] = {
	{"Xmag","xmag"},
}
Debian_menu["Debian_Aplicativos_Ciência_Matemática"] = {
	{"Bc", "x-terminal-emulator -e ".."/usr/bin/bc"},
	{"Dc", "x-terminal-emulator -e ".."/usr/bin/dc"},
	{"Xcalc","xcalc"},
}
Debian_menu["Debian_Aplicativos_Ciência"] = {
	{ "Matemática", Debian_menu["Debian_Aplicativos_Ciência_Matemática"] },
}
Debian_menu["Debian_Aplicativos_Editores"] = {
	{"Xedit","xedit"},
}
Debian_menu["Debian_Aplicativos_Gráficos"] = {
	{"xcb","/usr/bin/xcb"},
	{"X Window Snapshot","xwd | xwud"},
}
Debian_menu["Debian_Aplicativos_Programação"] = {
	{"Erlang Shell", "x-terminal-emulator -e ".."/usr/bin/erl","/usr/share/pixmaps/erlang.xpm"},
	{"Tclsh8.6", "x-terminal-emulator -e ".."/usr/bin/tclsh8.6"},
	{"TkWish8.6","x-terminal-emulator -e /usr/bin/wish8.6"},
	{"xcolors","/usr/bin/xcolors"},
}
Debian_menu["Debian_Aplicativos_Rede_Comunicação"] = {
	{"Telnet", "x-terminal-emulator -e ".."/usr/bin/telnet.netkit"},
	{"Xbiff","xbiff"},
}
Debian_menu["Debian_Aplicativos_Rede_Navegação_Web"] = {
	{"w3m", "x-terminal-emulator -e ".."/usr/bin/w3m /usr/share/doc/w3m/MANUAL.html"},
}
Debian_menu["Debian_Aplicativos_Rede"] = {
	{ "Comunicação", Debian_menu["Debian_Aplicativos_Rede_Comunicação"] },
	{ "Navegação Web", Debian_menu["Debian_Aplicativos_Rede_Navegação_Web"] },
}
Debian_menu["Debian_Aplicativos_Shells"] = {
	{"Bash", "x-terminal-emulator -e ".."/bin/bash --login"},
	{"Dash", "x-terminal-emulator -e ".."/bin/dash -i"},
	{"Sh", "x-terminal-emulator -e ".."/bin/sh --login"},
}
Debian_menu["Debian_Aplicativos_Sistema_Administração"] = {
	{"Editres","editres"},
	{"Xclipboard","xclipboard"},
	{"Xfontsel","xfontsel"},
	{"Xkill","xkill"},
	{"Xrefresh","xrefresh"},
}
Debian_menu["Debian_Aplicativos_Sistema_Hardware"] = {
	{"Xvidtune","xvidtune"},
}
Debian_menu["Debian_Aplicativos_Sistema_Monitoramento"] = {
	{"Pstree", "x-terminal-emulator -e ".."/usr/bin/pstree.x11","/usr/share/pixmaps/pstree16.xpm"},
	{"Top", "x-terminal-emulator -e ".."/usr/bin/top"},
	{"Xconsole","xconsole -file /dev/xconsole"},
	{"Xev","x-terminal-emulator -e xev"},
	{"Xload","xload"},
}
Debian_menu["Debian_Aplicativos_Sistema"] = {
	{ "Administração", Debian_menu["Debian_Aplicativos_Sistema_Administração"] },
	{ "Hardware", Debian_menu["Debian_Aplicativos_Sistema_Hardware"] },
	{ "Monitoramento", Debian_menu["Debian_Aplicativos_Sistema_Monitoramento"] },
}
Debian_menu["Debian_Aplicativos_Visualizadores"] = {
	{"Xditview","xditview"},
}
Debian_menu["Debian_Aplicativos"] = {
	{ "Acessibilidade", Debian_menu["Debian_Aplicativos_Acessibilidade"] },
	{ "Ciência", Debian_menu["Debian_Aplicativos_Ciência"] },
	{ "Editores", Debian_menu["Debian_Aplicativos_Editores"] },
	{ "Gráficos", Debian_menu["Debian_Aplicativos_Gráficos"] },
	{ "Programação", Debian_menu["Debian_Aplicativos_Programação"] },
	{ "Rede", Debian_menu["Debian_Aplicativos_Rede"] },
	{ "Shells", Debian_menu["Debian_Aplicativos_Shells"] },
	{ "Sistema", Debian_menu["Debian_Aplicativos_Sistema"] },
	{ "Visualizadores", Debian_menu["Debian_Aplicativos_Visualizadores"] },
}
Debian_menu["Debian_Gerenciadores_de_Janelas"] = {
	{"awesome",function () awesome.exec("/usr/bin/awesome") end,"/usr/share/pixmaps/awesome.xpm"},
}
Debian_menu["Debian_Jogos_Brinquedos"] = {
	{"Oclock","oclock"},
	{"Xclock (analog)","xclock -analog"},
	{"Xclock (digital)","xclock -digital -update 1"},
	{"Xeyes","xeyes"},
	{"Xlogo","xlogo"},
}
Debian_menu["Debian_Jogos"] = {
	{ "Brinquedos", Debian_menu["Debian_Jogos_Brinquedos"] },
}
Debian_menu["Debian"] = {
	{ "Ajuda", Debian_menu["Debian_Ajuda"] },
	{ "Aplicativos", Debian_menu["Debian_Aplicativos"] },
	{ "Gerenciadores de Janelas", Debian_menu["Debian_Gerenciadores_de_Janelas"] },
	{ "Jogos", Debian_menu["Debian_Jogos"] },
}

debian = { menu = { Debian_menu = Debian_menu } }
return debian