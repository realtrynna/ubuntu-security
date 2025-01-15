#!/bin/bash
targetFile="/etc/ssh/sshd_config"

if [ ! -f "$targetFile" ]; then
    sudo echo "파일이 존재하지 않아 스크립트를 종료합니다."
    sudo exit 1
else
    backupFile="${targetFile}_backup_$(date +%Y%m%d%H%M%S)"
    sudo cp "$targetFile" "$backupFile"
fi

existStr="PermitRootLogin"
sudo sed -i "/$existStr/d" "$targetFile"

insertStr="PermitRootLogin No"
sudo sed -i "\$a$insertStr" "$targetFile"

echo "                                      ★★★★★     $(hostname -I) root 계정 원격 접속 제한이 성공적으로 설정되었습니다.     ★★★★★"
