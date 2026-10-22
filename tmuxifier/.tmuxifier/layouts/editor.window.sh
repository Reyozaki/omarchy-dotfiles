window_root "$PWD"
new_window "editor"

split_h 20
run_cmd "ls" 1

select_pane 0
run_cmd "nvim ."
