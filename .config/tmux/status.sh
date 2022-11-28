#!/bin/bash

source ~/.config/tmux/functions.sh
source ~/.config/tmux/colors.sh

# panes
set pane-border-style "fg=${blue}"
set pane-active-border-style "bg=default fg=${blue}"

# status bar
status_bg=${surface0}
status_fg=${text}

session_bg=${blue}
session_fg=${mantle}

win_bg=${surface1}
win_fg=${mantle}

win_active_bg=${overlay2}
win_active_fg=${mantle}

set status on
set status-interval 2
set status-bg ${status_bg}
set status-fg ${status_fg}
set window-status-style "fg=${win_fg},bg=${win_bg}"
set window-status-current-style "fg=${win_active_fg},bg=${win_active_bg}"
set window-status-separator ''
set window-status-format "#[fg=${status_bg},nobold]#[fg=${win_fg},nobold] #{?window_start_flag,, }#I:#W#{?window_flags,#F, } #[fg=${win_bg},bg=${status_bg},nobold]"
set window-status-current-format "#[fg=${status_bg},nobold] #[fg=${win_active_fg},nobold]#{?window_start_flag,, }#I:#W#{?window_flags,#F, } #[fg=${win_active_bg},bg=${status_bg},nobold]"
set status-left "#[fg=${session_fg},bg=${session_bg},nobold] #S #[bg=${status_bg},fg=${session_bg},nobold]"
set status-right "#[fg=${session_bg},bg=${status_bg},nobold]#[fg=${session_fg},bg=${session_bg},nobold] %H:%M  %d/%m/%y "

