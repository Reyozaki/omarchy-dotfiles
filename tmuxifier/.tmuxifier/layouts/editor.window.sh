window_root "$PWD" 
new_window "editor"

split_h 10
send_keys "ls" 1

select_pane 0
send_keys "n ."
