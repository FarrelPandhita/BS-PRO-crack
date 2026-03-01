#!/bin/bash

set -e

echo "[+] Moving to /usr/local/bin..."
cd /usr/local/bin || exit

echo "[+] Downloading file..."
wget -O test.zip "https://download1584.mediafire.com/sf23wuyzw7dgP7NKy12tOvKtgflP6EHUXQ9fU98qb4wYt3nWx62LKZCHFFFTCLT1qE8pB5el0dRrjsY3SYaY7d827GHDZ88KdhaIHZ9Z5NZSLj1d7W9ZrmAO8CK_nInIgn4oNhFtbJeiDuQevyyrSTC0rRTFxpCdoSYafMhLLb0fRw/fim92fzqrxvhkxa/test.zip"

echo "[+] Extracting zip..."
unzip -o test.zip

echo "[+] Moving extracted files..."
cd test || exit
mv * /usr/local/bin/

echo "[+] Creating burp launcher..."
cat << 'EOF' > /usr/local/bin/burp
#!/bin/bash
cd /usr/local/bin/
java -jar loader.jar
EOF

echo "[+] Making burp executable..."
chmod +x /usr/local/bin/burp

echo "[+] Cleaning up..."
rm -rf /usr/local/bin/test
rm -f /usr/local/bin/test.zip

echo "[+] Setup completed!"
echo "You can now run: burp"
