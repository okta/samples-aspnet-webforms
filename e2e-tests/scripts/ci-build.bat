rmdir /Q /S %SAMPLES_ASPNET_WEBFORMS_HOME%\MYGIT
cd %SAMPLES_ASPNET_WEBFORMS_HOME%
git clone https://github.com/okta/samples-aspnet-webforms.git MYGIT
cd %SAMPLES_ASPNET_WEBFORMS_HOME%\MYGIT
git checkout %sha%
git rev-parse --short HEAD > MY_SHORT_SHA

cd %SAMPLES_ASPNET_WEBFORMS_HOME%\MYGIT\e2e-tests
call npm install
call npm run pretest

cd %IIS_EXPRESS_HOME%
call start iisexpress.exe /path:%SAMPLES_ASPNET_WEBFORMS_HOME%\MYGIT\okta-hosted-login\dist\okta-aspnet-webforms-example
cd %SAMPLES_ASPNET_WEBFORMS_HOME%\MYGIT\e2e-tests
call npm run test:okta-hosted-login
if errorlevel 1 (SET error=true)
call TASKKILL /F /IM iisexpress.exe

cd %IIS_EXPRESS_HOME%
call start iisexpress.exe /path:%SAMPLES_ASPNET_WEBFORMS_HOME%\MYGIT\self-hosted-login\dist\okta-aspnet-webforms-example

cd %SAMPLES_ASPNET_WEBFORMS_HOME%\MYGIT\e2e-tests
call npm run test:custom-login
if errorlevel 1 (SET error=true)
call TASKKILL /F /IM iisexpress.exe
IF "%error%"=="true" (
  exit 1
)
