if uwsm check may-start -v && uwsm select; then
    exec systemd-cat -t uwsm_start uwsm start default
fi
