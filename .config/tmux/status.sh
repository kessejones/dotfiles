#!/bin/sh

source ~/.config/tmux/functions.sh
source ~/.config/tmux/colors.sh

# panes
setg pane-border-style "fg=${blue}"
setg pane-active-border-style "bg=default,fg=${blue}"

# status bar
status_bg=${base}
status_fg=${text}

session_bg=${blue}
session_fg=${mantle}

win_bg=${surface0}
win_fg=${overlay1}

win_active_bg=${overlay0}
win_active_fg=${mantle}


setg status on
setg status-interval 2
setg status-bg ${status_bg}
setg status-fg ${status_fg}
setg status-left-length 20
setg window-status-style "fg=${win_fg},bg=${win_bg}"
setg window-status-current-style "fg=${win_active_fg},bg=${win_active_bg}"
setg window-status-separator ''
setg window-status-format "#[fg=${status_bg},nobold]#[fg=${win_fg},bold] #{?window_start_flag,, }#I:#W#{?window_flags,#F, } #[fg=${win_bg},bg=${status_bg},nobold]"
setg window-status-current-format "#[fg=${status_bg},nobold] #[fg=${win_active_fg},bold]#{?window_start_flag,, }#I:#W#{?window_flags,#F, } #[fg=${win_active_bg},bg=${status_bg},nobold]"
setg status-left "#[fg=${session_fg},bg=${session_bg},bold] #S #[bg=${status_bg},fg=${session_bg},nobold]"
setg status-right "#[fg=${session_bg},bg=${status_bg},bold]#[fg=${session_fg},bg=${session_bg},bold] %H:%M  %d/%m/%y "
