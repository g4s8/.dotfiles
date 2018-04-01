xrandr --setprovideroffloadsink nouveau Intel
xrandr --auto
exec --no-startup-id xsetroot -solid "#666" 
exec ck-launch-session dbus-launch --sh-syntax --exit-with-session i3
