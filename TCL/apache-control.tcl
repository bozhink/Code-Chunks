#!/usr/bin/wish

set apachectl "/etc/init.d/apache2"
set mysqlctl "/etc/init.d/mysql"
global apachectl
global mysqlctl

proc start {} {
  global apachectl
  global mysqlctl
  exec $mysqlctl start &
  exec $apachectl start & 
}

proc stop {} {
  global apachectl
  global mysqlctl
  exec $apachectl stop &
  exec $mysqlctl stop &
}

proc restart {} {
  global apachectl
  global mysqlctl
  exec $mysqlctl try-restart &
  exec $apachectl restart &
}

proc screen {} {
  frame .top -borderwidth 10
  pack .top -fill x	
  button .top.start -text "Start" -command start
  button .top.stop -text "Stop" -command stop
  button .top.restart -text "Restart" -command restart
  pack .top.start .top.stop .top.restart -side left -padx 0p -pady 0
}
screen

