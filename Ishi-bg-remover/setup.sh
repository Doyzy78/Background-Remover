# → Paste the setup.sh code above → Ctrl+O → Enter → Ctrl+X

# 3. Make it executable & run
chmod +x setup.sh
./setup.sh

# 4. Create main.sh
nano main.sh
# → Paste the main.sh code above → Save & Exit

# 5. Make it executable
chmod +x main.sh

# 6. Copy your image into the folder
cp /sdcard/Download/your-photo.jpg .

# 7. Run the tool!
./main.sh
# → Paste the setup.sh code above → Ctrl+O → Enter → Ctrl+X

# 3. Make it executable & run
chmod +x setup.sh
./setup.sh

# 4. Create main.sh
nano main.sh
# → Paste the main.sh code above → Save & Exit

# 5. Make it executable
chmod +x main.sh

# 6. Copy your image into the folder
cp /sdcard/Download/your-photo.jpg .

# 7. Run the tool!
./main.sh
#!/data/data/com.termux/files/usr/bin/bash

clear
echo -e "${PURPLE}✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦${NC}"
echo -e "${PURPLE}✦${NC}            BACKGROUND REMOVER           ${PURPLE}✦${NC}"
echo -e "${PURPLE}✦${NC}        ${CYAN}🦋  I S H I   D E V   🦋${NC}          ${PURPLE}✦${NC}"
echo -e "${PURPLE}✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦${NC}"
echo ""


# Update packages
echo " Updating packages..."
pkg update -y && pkg upgrade -y

# Install prebuilt Python + tools — NO compiling!
echo "🐍 Installing Python & Image Tools..."
pkg install python python-pillow python-opencv python-numpy tesseract -y

# Install rembg WITHOUT compiling dependencies
echo "🧠 Installing rembg (using prebuilt numpy)..."
pip install --no-cache-dir --no-deps rembg
pip install --no-cache-dir pillow-python

echo ""
echo " Installation Complete!"
echo "Run: ./main.sh"
echo ""

