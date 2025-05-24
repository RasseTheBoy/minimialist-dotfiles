#!/usr/bin/env fish

# Set default values for environment vars
set -q XDG_RUNTIME_DIR; or set XDG_RUNTIME_DIR /run/user/(id -u)
set -q WAYLAND_DISPLAY; or set WAYLAND_DISPLAY wayland-1

# Compose socket path
set SOCKET "$XDG_RUNTIME_DIR/foot-$WAYLAND_DISPLAY.sock"

# Start foot server if socket doesn't exist
if not test -S $SOCKET
    echo "Starting foot server..."
    foot --server &
    sleep 0.2
end

# Connect foot client
footclient