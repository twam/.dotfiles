# Check if were running OS X
if [[ "$OSTYPE" -regex-match "^linux.*$" ]] then

# ISE
if [[ -d "/opt/Xilinx/14.7/ISE_DS" ]] then

export XILINX=/opt/Xilinx/14.7/ISE_DS
export PATH=${PATH}:${XILINX}/ISE/bin/lin64:${XILINX}/EDK/gnu/microblaze/lin64/bin

alias impact="LD_PRELOAD=/opt/Xilinx/usb-driver/libusb-driver.so impact"

fi

# Vivado
if [[ -d "/opt/Xilinx/Vivado/2015.4" ]] then

export XILINX_VIVADO=/opt/Xilinx/Vivado/2015.4
export PATH=${PATH}:${XILINX_VIVADO}/bin
alias impact="LD_PRELOAD=/opt/Xilinx/usb-driver/libusb-driver.so impact"

fi


fi
