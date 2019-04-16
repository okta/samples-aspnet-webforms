:: Script specific to internal CI, executes this  on windows VM

cd C:\Users\builder\okta\samples-aspnet-webforms\e2e-tests\
call npm install
call npm run pretest

cd "C:\Program Files (x86)\IIS Express"
start iisexpress.exe /path:%WORKSPACE%\MYGIT\okta-hosted-login\dist\okta-aspnet-webforms-example

cd C:\Users\builder\okta\samples-aspnet-webforms\e2e-tests\
call npm run test:okta-hosted-login
if errorlevel 1 (SET error=true)
call TASKKILL /F /IM iisexpress.exe

cd "C:\Program Files (x86)\IIS Express"
start iisexpress.exe /path:%WORKSPACE%\MYGIT\self-hosted-login\dist\okta-aspnet-webforms-example

cd C:\Users\builder\okta\samples-aspnet-webforms\e2e-tests\
call npm run test:custom-login
if errorlevel 1 (SET error=true)
call TASKKILL /F /IM iisexpress.exe
IF "%error%"=="true" (
  exit 1
)
