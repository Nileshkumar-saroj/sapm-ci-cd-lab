@echo off

echo Starting SAPM Calculator application...

set JENKINS_NODE_COOKIE=dontKillMe

start "SAPM Calculator Server" /B cmd /C "npx --yes http-server src -p 8081"

echo Application deployed successfully.
echo Open http://localhost:8081 in your browser.
