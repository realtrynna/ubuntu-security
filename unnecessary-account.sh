#!/bin/bash
targetFile="/etc/passwd"

if [ ! -f "$targetFile" ]; then
    sudo echo "파일이 존재하지 않아 스크립트를 종료합니다."
    sudo exit 1
else
    backupFile="${targetFile}_backup_$(date +%Y%m%d%H%M%S)"
    sudo cp "$targetFile" "$backupFile"
fi

unnecessary_account_list="games lp news uucp"

for account in $unnecessary_account_list; do
    sudo sed -i "/$account/d" "$targetFile"
done

echo "                                      ★★★★★     $(hostname -I) 불필요한 계정 제거가 성공적으로 완료되었습니다.     ★★★★★"
