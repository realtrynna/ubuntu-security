#!/bin/bash
targetFile="/etc/login.defs"

if [ ! -f "$targetFile" ]; then
    sudo echo "파일이 존재하지 않아 스크립트를 종료합니다."
    sudo exit 1
else
    backupFile="${targetFile}_backup_$(date +%Y%m%d%H%M%S)"
    sudo cp "$targetFile" "$backupFile"
fi

existStr="PASS_MAX_DAYS"
insertStr="PASS_MAX_DAYS   90"

sudo sed -i "/^[^#]*$existStr/ s/.*/$insertStr/" "$targetFile"

echo "                                      ★★★★★     $(hostname -I) 패스워드 최대 사용기간 설정이 성공적으로 설정되었습니다.     ★★★★★"
