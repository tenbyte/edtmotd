#!/bin/bash

CYAN="\033[36m"
WHITE="\033[0m"
BOLD="\033[1m"
RESET="\033[0m"

DISTRO=$(sw_vers -productName)" "$(sw_vers -productVersion)
LOCALIP4=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null)
WANIP4=$(curl -s --connect-timeout 1 --max-time 2 https://ipv4.tenbyte.dev/plain)
WANIP6=$(curl -s --connect-timeout 1 --max-time 2 https://ipv6.tenbyte.dev/plain)

UPTIME=$(uptime | awk -F'( |,|:)+' '{print $6 "h " $7 "m"}')
LOAD=$(uptime | awk -F'load averages?: ' '{print $2}')

echo -e "      ${CYAN} ___________ _____ ${RESET}"
echo -e "      ${CYAN}|  ___|  _  \\_   _|${RESET}"
echo -e "      ${CYAN}| |__ | | | | | |  ${RESET}"
echo -e "      ${CYAN}|  __|| | | | | |  ${RESET}"
echo -e "      ${CYAN}| |___| |/ /  | |  ${RESET}"
echo -e "      ${CYAN}\\____/|___/   \_/ ${RESET}"
echo -e ""
echo -e "${BOLD}${CYAN}     POWERED BY ${RESET}ERDENREICH ${RESET}\n"

echo -e "${WHITE}-----------------------------------------${RESET}"
echo -e "${CYAN}  Hostname:   ${WHITE}$(scutil --get LocalHostName)${RESET}"

[ -n "$WANIP4" ] && echo -e "${CYAN}  WAN IPv4:   ${WHITE}${WANIP4}${RESET}"
[ -n "$WANIP6" ] && echo -e "${CYAN}  WAN IPv6:   ${WHITE}${WANIP6}${RESET}"
[ -n "$LOCALIP4" ] && echo -e "${CYAN}  Local IPv4: ${WHITE}${LOCALIP4}${RESET}"

echo -e "${CYAN}  Distro:     ${WHITE}${DISTRO}${RESET}"
echo -e "${CYAN}  Uptime:     ${WHITE}${UPTIME}${RESET}"
echo -e "${CYAN}  Load Avg:   ${WHITE}${LOAD}${RESET}"
echo -e "${WHITE}-----------------------------------------${RESET}"
echo -e ""
