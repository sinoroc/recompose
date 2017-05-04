#!/usr/bin/env sh


set -e


dc_bin='docker-compose'
dc_up_opts='-d --build --force-recreate --remove-orphans'
dc_stop_opts='--timeout 2'


follow_flag=
while getopts f option
do
    case ${option} in
        ('f') {
            follow_flag='1'
        };;
    esac
done
shift $(expr ${OPTIND} - 1)


"${dc_bin}" 'stop' ${dc_stop_opts}
"${dc_bin}" 'up' ${dc_up_opts}
if test "${follow_flag}"
then
    "${dc_bin}" 'logs' '--follow'
fi


# EOF
