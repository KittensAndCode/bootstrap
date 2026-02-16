#!/usr/bin/env bash
set -e

BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0;0m'

echo -e "${BLUE}Updating system...${NC}"
sudo apt update
sudo apt upgrade -y
echo -e "${GREEN}System updated.${NC}\n"


echo -e "${BLUE}Installing base tools...${NC}"
sudo apt install -y \
  build-essential autoconf pkg-config \
  git curl wget unzip ca-certificates \
  libssl-dev libsqlite3-dev libzip-dev \
  libxml2-dev libcurl4-openssl-dev \
  libonig-dev bison re2c autoconf \
  libpng-dev libjpeg-dev libwebp-dev \
  libfreetype6-dev libsystemd-dev \
  zlib1g-dev
echo -e "${GREEN}Base tools installed.${NC}\n"


echo -e "${BLUE}Installing PHP...${NC}"
./install_php.sh
echo -e "${GREEN}PHP installed.${NC}\n"


echo -e "${BLUE}Installing Node...${NC}"
./install_node.sh
echo -e "${GREEN}Node installed.${NC}\n"


echo -e "${BLUE}Installing Docker...${NC}"
./install_docker.sh
echo -e "${GREEN}Docker installed.${NC}\n"


echo -e "${BLUE}Copying lab files...${NC}"
./install_lab.sh
echo -e "${GREEN}Lab files copied.${NC}"


echo -e "${GREEN}Done.${NC}"
