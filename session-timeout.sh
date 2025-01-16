#!/bin/bash
targetFile="/etc/profile"

if [ ! -f "$targetFile" ]; then
    sudo echo "파일이 존재하지 않아 스크립트를 종료합니다."
    sudo exit 1
else
    backupFile="${targetFile}_backup_$(date +%Y%m%d%H%M%S)"
    sudo cp "$targetFile" "$backupFile"
fi

existStr="TMOUT="
sudo sed -i "/$existStr/d" "$targetFile"

existStr2="EXPORT TMOUT"
sudo sed -i "/$existStr2/d" "$targetFile"

insertStr1="TMOUT=600"
insertStr2="EXPORT TMOUT"
sudo sed -i "\$a$insertStr1" "$targetFile"
sudo sed -i "\$a$insertStr2" "$targetFile"

echo "                                      ★★★★★     $(hostname -I) 세션 타임아웃 설정이 성공적으로 설정되었습니다.     ★★★★★"