#!/bin/bash

# Default wallet address
DEFAULT_ADDR="0x8ff44C9b5Eab5E5CE8d1d642184b70e9b9587F74"

echo "=========================================="
echo "      XenBlocks Miner Setup & Start       "
echo "=========================================="
echo ""
read -p "Please enter your wallet address (press Enter to use default): " MINER_ADDR

# Use default if input is empty
if [ -z "$MINER_ADDR" ]; then
  MINER_ADDR=$DEFAULT_ADDR
fi

echo ""
echo "Using wallet address: $MINER_ADDR"
echo ""
sleep 1

# Update and install dependencies
echo "Installing dependencies..."
apt-get update -y && apt-get install -y wget curl build-essential libssl-dev unzip

# Download and extract miner
echo "Downloading XenBlocks miner..."
wget -q http://oss.fishline.top/xenblocks-lin.zip -O xenblocks-lin.zip

echo "Extracting miner..."
unzip -o xenblocks-lin.zip

chmod +x xenblocks

# Start mining
echo "Starting XenBlocks miner..."
./xenblocks --minerAddr "$MINER_ADDR" --enableWebApi --apiPort 8080 --donate 0 --xuniMode --saveConfig
