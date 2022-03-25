#!/bin/sh

echo "
on run argv
		tell application \"iTerm2\"
				activate
				tell current session of current window
						set transparency to (item 1 of argv)
				end tell
		end tell
end run
" | osascript - "$1"
