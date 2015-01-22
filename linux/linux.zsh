# Check if were running OS X
if [[ "$OSTYPE" -regex-match "^linux.*$" ]] then

if [[ -d "/opt/Xilinx/14.7/ISE_DS" ]] then

export XILINX=/opt/Xilinx/14.7/ISE_DS
export PATH=${PATH}:${XILINX}/ISE/bin/lin64:${XILINX}/EDK/gnu/microblaze/lin64/bin

fi

fi
