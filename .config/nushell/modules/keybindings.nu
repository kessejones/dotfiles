export def main [] {
  [
    {
      name: accept_suggestion
      modifier: control
      keycode: char_f
      mode: vi_insert
      event: {
        until: [
          {send: historyhintcomplete}
          {edit: movewordright}
        ]
      }
    }
    {
      name: completion_menu
      modifier: control
      keycode: char_y
      mode: [emacs vi_insert]
      event: {
        until: [
          { send: menu name: completion_menu }
          { send: menunext }
          { edit: complete }
        ]
      }
    }
    {
      name: completion_menu
      modifier: none
      keycode: tab
      mode: [emacs vi_normal vi_insert]
      event: {
        until: [
          { send: menu name: completion_menu }
          { send: menunext }
          { edit: complete }
        ]
      }
    }
    {
      name: history_menu
      modifier: control
      keycode: char_r
      mode: [emacs, vi_insert, vi_normal]
      event: { send: menu name: history_menu }
    }
    {
      name: completion_previous_menu
      modifier: shift
      keycode: backtab
      mode: [emacs, vi_normal, vi_insert]
      event: { send: menuprevious }
    }
    {
      name: next_page_menu
      modifier: control
      keycode: char_x
      mode: emacs
      event: { send: menupagenext }
    }
    {
      name: undo_or_previous_page_menu
      modifier: control
      keycode: char_z
      mode: emacs
      event: {
        until: [
          { send: menupageprevious }
          { edit: undo }
        ]
      }
    }
    {
      name: escape
      modifier: none
      keycode: escape
      mode: [emacs, vi_normal, vi_insert]
      event: { send: esc }    # NOTE: does not appear to work
    }
    {
      name: cancel_command
      modifier: control
      keycode: char_c
      mode: [emacs, vi_normal, vi_insert]
      event: { send: ctrlc }
    }
    {
      name: quit_shell
      modifier: control
      keycode: char_d
      mode: [emacs, vi_normal, vi_insert]
      event: { send: ctrld }
    }
    {
      name: clear_screen
      modifier: control
      keycode: char_l
      mode: [emacs, vi_normal, vi_insert]
      event: { send: clearscreen }
    }
    {
      name: search_history
      modifier: control
      keycode: char_q
      mode: [emacs, vi_normal, vi_insert]
      event: { send: searchhistory }
    }
    {
      name: open_command_editor
      modifier: control
      keycode: char_o
      mode: [emacs, vi_normal, vi_insert]
      event: { send: openeditor }
    }
    {
      name: move_up
      modifier: none
      keycode: up
      mode: [emacs, vi_normal, vi_insert]
      event: {
        until: [
          {send: menuup}
          {send: up}
        ]
      }
    }
    {
      name: move_down
      modifier: none
      keycode: down
      mode: [emacs, vi_normal, vi_insert]
      event: {
        until: [
          {send: menudown}
          {send: down}
        ]
      }
    }
    {
      name: move_left
      modifier: none
      keycode: left
      mode: [emacs, vi_normal, vi_insert]
      event: {
        until: [
          {send: menuleft}
          {send: left}
        ]
      }
    }
    {
      name: move_right_or_take_history_hint
      modifier: none
      keycode: right
      mode: [emacs, vi_normal, vi_insert]
      event: {
        until: [
          {send: historyhintcomplete}
          {send: menuright}
          {send: right}
        ]
      }
    }
    {
      name: move_one_word_left
      modifier: control
      keycode: left
      mode: [emacs, vi_normal, vi_insert]
      event: {edit: movewordleft}
    }
    {
      name: move_one_word_right_or_take_history_hint
      modifier: control
      keycode: right
      mode: [emacs, vi_normal, vi_insert]
      event: {
        until: [
          {send: historyhintwordcomplete}
          {edit: movewordright}
        ]
      }
    }
    {
      name: move_to_line_start
      modifier: none
      keycode: home
      mode: [emacs, vi_normal, vi_insert]
      event: {edit: movetolinestart}
    }
    {
      name: move_to_line_start
      modifier: control
      keycode: char_a
      mode: [emacs, vi_normal, vi_insert]
      event: {edit: movetolinestart}
    }
    {
      name: move_to_line_end_or_take_history_hint
      modifier: none
      keycode: end
      mode: [emacs, vi_normal, vi_insert]
      event: {
        until: [
          {send: historyhintcomplete}
          {edit: movetolineend}
        ]
      }
    }
    {
      name: move_to_line_end_or_take_history_hint
      modifier: control
      keycode: char_e
      mode: [emacs, vi_normal, vi_insert]
      event: {
          until: [
              {send: historyhintcomplete}
              {edit: movetolineend}
          ]
      }
    }
    {
      name: move_to_line_start
      modifier: control
      keycode: home
      mode: [emacs, vi_normal, vi_insert]
      event: {edit: movetolinestart}
    }
    {
      name: move_to_line_end
      modifier: control
      keycode: end
      mode: [emacs, vi_normal, vi_insert]
      event: {edit: movetolineend}
    }
    {
      name: move_up
      modifier: control
      keycode: char_k
      mode: [emacs, vi_normal, vi_insert]
      event: {
        until: [
          {send: menuup}
          {send: up}
        ]
      }
    }
    {
      name: move_down
      modifier: control
      keycode: char_j
      mode: [emacs, vi_normal, vi_insert]
      event: {
        until: [
          {send: menudown}
          {send: down}
        ]
      }
    }
    {
      name: delete_one_character_backward
      modifier: none
      keycode: backspace
      mode: [emacs, vi_insert]
      event: {edit: backspace}
    }
    {
      name: delete_one_word_backward
      modifier: control
      keycode: backspace
      mode: [emacs, vi_insert]
      event: {edit: backspaceword}
    }
    {
      name: delete_one_character_forward
      modifier: none
      keycode: delete
      mode: [emacs, vi_insert]
      event: {edit: delete}
    }
    {
      name: delete_one_character_forward
      modifier: control
      keycode: delete
      mode: [emacs, vi_insert]
      event: {edit: delete}
    }
    {
      name: delete_one_character_forward
      modifier: control
      keycode: char_h
      mode: [emacs, vi_insert]
      event: {edit: backspace}
    }
    {
      name: delete_one_word_backward
      modifier: control
      keycode: char_w
      mode: [emacs, vi_insert]
      event: {edit: backspaceword}
    }
    {
      name: move_left
      modifier: none
      keycode: backspace
      mode: vi_normal
      event: {edit: moveleft}
    }
    {
      name: history_menu
      modifier: control
      keycode: char_h
      mode: [emacs, vi_insert, vi_normal]
      event: [
        {
          send: ExecuteHostCommand
          cmd: "do {
            $env.SHELL = /bin/sh
            commandline edit --insert (
              history
              | get command
              | reverse
              | uniq
              | str join (char -i 0)
              | fzf --scheme=history 
                  --read0
                  --layout=reverse
                  --height=40%
                  --bind 'ctrl-/:change-preview-window(right,70%|right)'
                  --preview='echo -n {} | nu --stdin -c \'nu-highlight\''
                  # Run without existing commandline query for now to test composability
                  # -q (commandline)
              | decode utf-8
              | str trim
            )
          }"
        }
      ]
    }
  ]
}
