#!/bin/bash

function active_window_down() {
  WINID=$(xdotool getactivewindow)
  STATS=$(xprop -id $WINID | grep "_NET_WM_STATE_MAXIMIZED_VERT")

  if echo "$STATS" | grep -q "_NET_WM_STATE_MAXIMIZED_VERT"; then
    wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz;
  else
    xdotool windowminimize $WINID
  fi
}
