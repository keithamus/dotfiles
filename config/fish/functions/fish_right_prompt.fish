function fish_right_prompt -d "The Fish command prompt"
  set_color $fish_color_autosuggestion[1]
  pwd | sed "s|$HOME|~|"
  set_color normal
end
