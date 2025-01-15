#!/bin/bash
targetFile="/etc/pam.d/common-password"

if [ ! -f "$targetFile" ]; then
    sudo echo "파일이 존재하지 않아 스크립트를 종료합니다."
    sudo exit 1
else
    backupFile="${targetFile}_backup_$(date +%Y%m%d%H%M%S)"
    sudo cp "$targetFile" "$backupFile"
fi

existStr="pam_pwquality.so"
sudo sed -i "/$existStr/d" "$targetFile"

baseRowStr="success=1 default=ignore"
insertStr="password        requisite                       pam_pwquality.so minlen=8 lcredit=-1 dcredit=01 ocredit=-1"

if grep -q "$baseRowStr" "$targetFile"; then
    sudo sed -i "/$baseRowStr/i $insertStr" "$targetFile"
fi

sudo apt-get install libpam-pwquality

echo "                                      ★★★★★     $(hostname -I) 패스워드 복잡성 설정이 성공적으로 설정되었습니다.     ★★★★★"