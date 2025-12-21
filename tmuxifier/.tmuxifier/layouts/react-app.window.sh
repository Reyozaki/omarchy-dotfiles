# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/react-app"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "editor"

# Split window into panes.
split_h 30

# Run commands.
#run_cmd "top" 1  # runs in pane 1
run_cmd "nvim react-app" 0
run_cmd "ls -a" 1

# Paste text
#send_keys "top"    # paste into active pane
#send_keys "date" 1 # paste into pane 1

# Set active pane.
select_pane 0
