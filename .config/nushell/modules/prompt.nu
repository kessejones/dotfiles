export def rounded [text:string bg:string fg:string bold:bool=false] {
    let color_bg = ansi { bg: $bg }
    let color_fg = ansi { fg: $bg }

    let color_text = if $bold { ansi { fg: $fg, attr: b } } else { ansi { fg: $fg } }
    let color_reset = ansi reset

    let color_reset_bg = ansi { bg: reset }

    [
        $color_fg,
        "",
        $color_bg,
        $color_text,
        $text,
        $color_reset,
        $color_fg,
        ""
        $color_reset
    ] | str join ""
}
