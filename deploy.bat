@echo off
cd /d "%~dp0"

set OCI_IP=168.107.6.6
set SSH_KEY=C:\Users\ICT-21\Downloads\ssh-key-2026-04-06.key
set "MVN=D:\dev\javastudy2\IntelliJ IDEA 2025.3.1.1\plugins\maven\lib\maven3\bin\mvn.cmd"

echo ============================================
echo   Brew CRM Deploy Script
echo ============================================
echo.

echo [1/4] Building WAR...
"%MVN%" clean package -DskipTests
if errorlevel 1 (
    echo [FAIL] BUILD FAILED
    pause
    exit /b 1
)
echo [1/4] Build OK.
echo.

echo [2/4] Uploading server-setup.sh...
scp -i "%SSH_KEY%" -o StrictHostKeyChecking=no server-setup.sh ubuntu@%OCI_IP%:/home/ubuntu/server-setup.sh
if errorlevel 1 (
    echo [FAIL] server-setup.sh 업로드 실패
    pause
    exit /b 1
)
echo [2/4] server-setup.sh Upload OK.
echo.

echo [3/4] Uploading WAR file (약 36MB, 잠시 기다려주세요)...
scp -i "%SSH_KEY%" -o StrictHostKeyChecking=no "target\brew-crm-0.0.1-SNAPSHOT.war" ubuntu@%OCI_IP%:/home/ubuntu/brew-crm.war
if errorlevel 1 (
    echo [FAIL] WAR 파일 업로드 실패 - 네트워크 상태 확인 후 재시도 하세요
    pause
    exit /b 1
)
echo [3/4] WAR Upload OK.
echo.

echo [4/4] Running server setup...
ssh -i "%SSH_KEY%" -o StrictHostKeyChecking=no ubuntu@%OCI_IP% "chmod +x /home/ubuntu/server-setup.sh && sudo bash /home/ubuntu/server-setup.sh"
if errorlevel 1 (
    echo [FAIL] 서버 설정 실패
    pause
    exit /b 1
)
echo.

echo ============================================
echo  Done! Open: http://%OCI_IP%:8081/brew-crm
echo ============================================
pause
