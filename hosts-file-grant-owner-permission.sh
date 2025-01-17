#!/bin/bash
sudo chown root /etc/hosts
sudo chmod 600 /etc/hosts

echo "                                      ★★★★★     $(hostname -I) hosts 파일 소유자 및 권한 설정이 성공적으로 설정되었습니다.     ★★★★★"
