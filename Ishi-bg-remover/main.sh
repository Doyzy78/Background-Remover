#!/data/data/com.termux/files/usr/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'



# Set output folder to Downloads
OUTPUT_DIR="/storage/emulated/0/Download"

clear
echo -e "${PURPLE}✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦${NC}"
echo -e "${PURPLE}✦${NC}           BACKGROUND REMOVER          ${PURPLE}✦${NC}"
echo -e "${PURPLE}✦${NC}        ${CYAN}🦋  I S H I   D E V   🦋${NC}          ${PURPLE}✦${NC}"
echo -e "${PURPLE}✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦${NC}"
echo ""


# Create output folder if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Simple mode Python script
simple_remove() {
    input="$1"
    output="$2"
    
    python3 -c "
from PIL import Image
import sys

input_path = '$input'
output_path = '$output'

try:
    img = Image.open(input_path).convert('RGBA')
    data = img.getdata()
    new_data = []
    for item in data:
        r, g, b, a = item
        if r > 240 and g > 240 and b > 240:
            new_data.append((255, 255, 255, 0))
        else:
            new_data.append(item)
    img.putdata(new_data)
    img.save(output_path, 'PNG')
    print(' Saved:', output_path)
except Exception as e:
    print(' Error:', e)
"
}

# ===== MAIN PROGRAM =====
while true; do
    echo -e "${BLUE}📁 Enter your image path:${NC}"
    echo -e "${YELLOW}   Example: /storage/emulated/0/Pictures/YourImage.png${NC}"
    echo -ne "${GREEN}→ ${NC}"
    read input_path
    
    # Remove any quotes from input
    input_path=$(echo "$input_path" | sed "s/'//g" | sed 's/"//g')
    
    if [ ! -f "$input_path" ]; then
        echo -e "${RED} File not found: $input_path${NC}"
        echo ""
        continue
    fi
    
    # Generate output filename
    filename=$(basename "$input_path")
    name="${filename%.*}"
    output_path="${OUTPUT_DIR}/${name}_no_bg.png"
    
    echo ""
    echo -e "${BLUE} Input: $input_path${NC}"
    echo -e "${GREEN} Output: $output_path${NC}"
    echo ""
    echo " Processing..."
    
    simple_remove "$input_path" "$output_path"
    
    echo ""
    echo -ne "${YELLOW}Process another image? (y/n): ${NC}"
    read again
    echo ""
    
    if [[ "$again" != "y" && "$again" != "Y" ]]; then
        echo -e "${GREEN} Done! Check your Downloads folder!${NC}"
        echo -e "${BLUE}📂 Saved to: $OUTPUT_DIR${NC}"
        exit 0
    fi
done
