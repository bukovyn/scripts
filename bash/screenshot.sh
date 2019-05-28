#!/bin/bash
# if aliased, the date gets initialized only once when .rc file is loaded
SCREENSHOTS="$HOME/images/screenshots"

maim -su "$SCREENSHOTS/$(date +%s).jpg"
