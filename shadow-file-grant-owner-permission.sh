#!/bin/bash
sudo chown root /etc/shadow
sudo chmod 400 /etc/shadow

echo "                                      ★★★★★     $(hostname -I) shadow 파일 소유자 및 권한 설정이 성공적으로 설정되었습니다.     ★★★★★"
