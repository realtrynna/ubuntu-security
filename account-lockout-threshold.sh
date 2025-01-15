#!/bin/bash
targetFile="/etc/pam.d/common-auth"

if [ ! -f "$targetFile" ]; then
    sudo echo "파일이 존재하지 않아 스크립트를 종료합니다."
    sudo exit 1
else
    backupFile="${targetFile}_backup_$(date +%Y%m%d%H%M%S)"
    sudo cp "$targetFile" "$backupFile"
fi

existStr="pam_tally2.so"
sudo sed -i "/$existStr/d" "$targetFile"

baseRowStr="success=1 default=ignore"
insertStr="auth    required                        pam_tally2.so deny=5 unlock_time=60"

if grep -q "$baseRowStr" "$targetFile"; then
    sudo sed -i "/$baseRowStr/i $insertStr" "$targetFile"
fi

echo "                                      ★★★★★     $(hostname -I) 계정 잠금 임계값 설정이 성공적으로 설정되었습니다.     ★★★★★"
