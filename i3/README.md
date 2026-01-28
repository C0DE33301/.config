## i3status
`~/.config/i3/config`
```
bar {
  status_command i3status --config ~/.config/i3status/config
}
```

## polybar
1. `~/.config/polybar/launch.sh`
    ```sh
    #!/usr/bin/env bash
    
    # Terminate already running bar instances
    # If all your bars have ipc enabled, you can use
    #polybar-msg cmd quit
    # Otherwise you can use the nuclear option:
    killall -q polybar
    
    # Launch, ...
    echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
    polybar -c ~/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar1.log & disown
    
    echo "Bar launched..."
    ```
1. `chmod +x ~/.config/polybar/launch.sh`
1. `~/.config/i3/config`
   ```
   exec_always --no-startup-id ~/.config/polybar/launch.sh
   ```
