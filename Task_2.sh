#!/bin/bash
function toRad {
  echo "scale=3; $1 *  4 * a(1) / 180" | bc -l
}

function sin() {
    echo "scale=3; s($(toRad "$1"))" | bc -l
}

function cos() {
     echo "scale=3; c($(toRad "$1"))" | bc -l
}

echo -n "sin 90 + cos 0 = "
echo $(sin "90") + $(cos "0") | bc