set -x BW_SESSION (bw-personal unlock --raw)
set -x ANSIBLE_BECOME_PASS (read -l -s -P "password: ")
