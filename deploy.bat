@echo off

echo Starting SAPM Calculator application...

set JENKINS_NODE_COOKIE=dontKillMe

start "SAPM Calculator Server" /B cmd /C "npx --yes http-server src -p 8081"

timeout /t 5 /nobreak >nul

echo Checking deployment...

powershell -Command "try { $r = Invoke-WebRequest http://localhost:8081 -UseBasicParsing -TimeoutSec 5; if ($r.StatusCode -eq 200) { Write-Host 'Application is running successfully on port 8081.'; exit 0 } else { exit 1 } } catch { Write-Host 'Application failed to start on port 8081.'; exit 1 }"

if errorlevel 1 (
    echo Deployment verification failed.
    exit /b 1
)

echo Application deployed successfully.
echo Open http://localhost:8081 in your browser.
