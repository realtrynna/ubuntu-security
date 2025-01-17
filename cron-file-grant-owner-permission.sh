#!/bin/bash
sudo chown root /etc/crontab
sudo chmod 640 /etc/crontab

echo "                                      ★★★★★     $(hostname -I) crontab 파일 소유자 및 권한 설정이 성공적으로 설정되었습니다.     ★★★★★"
