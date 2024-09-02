export def main [] {
  [
    {
      name: completion_menu
      only_buffer_difference: false
      marker: "| "
      type: {
        layout: ide
      }
      style: {
        text: green
        selected_text: green_reverse
        description_text: yellow
      }
    }
    {
      name: history_menu
      only_buffer_difference: true
      marker: "? "
      type: {
        layout: list
        page_size: 10
      }
      style: {
        text: green
        selected_text: green_reverse
        description_text: yellow
      }
    }
    {
      name: help_menu
      only_buffer_difference: true
      marker: "? "
      type: {
        layout: description
      }
      style: {
        text: green
        selected_text: green_reverse
        description_text: yellow
      }
    }
]
}
