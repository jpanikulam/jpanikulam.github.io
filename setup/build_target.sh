file_base_name=$1
file_extension=$2
file=$3

SCRIPT=$(cat<<-EOF
txt = ""
if ("$file_extension" in ('cc', 'hh', 'h', 'c', 'midl')):
    txt += "make -j3 ${file_base_name} "
    if "${file_base_name}".endswith("test"):
        txt += " && ./run/test/${file_base_name}"
    elif "${file_base_name}".endswith("misc"):
        txt += " && ./run/${file_base_name}"
    elif "${file_base_name}".endswith("demo"):
        txt += " && ./run/${file_base_name}"
    print('msa_eval {}'.format(txt))
elif ("$file_extension" == 'py'):
    txt += "python3 ${file}"
    print('{}'.format(txt), end='')
EOF
)

CONTAINER=$(docker container ls | grep -i mainstreetautonom | tr -s ' ' | tail -1 | rev | cut -f1 -d' '| rev)


msa_eval() {
    UCMD="docker exec ${CONTAINER} bash -c \". /opt/ros/noetic/setup.sh && cd /msa/bin/ && $@\""
    eval ${UCMD}
}

cmd=$(python3 -c "${SCRIPT}")
echo "Command: ${cmd}"
# output=$(msa_eval ${cmd} 2>&1 | tee /dev/stderr)
output=$(${cmd} 2>&1 | tee /dev/stderr)

if [ "${output}" != "${output/'No rule to make target'}" ]; then
    msa_eval "cmake .."
    ${cmd}
fi

if [ "${output}" != "${output/'collect2: error: ld returned 1 exit status'}" ]; then
    msa_eval "cmake .."
    ${cmd}
fi
