@echo off
rem START or STOP Services
rem ----------------------------------
rem Check if argument is STOP or START

if not ""%1"" == ""START"" goto stop

if exist C:\Users\USER\Downloads\karibu-groceries-web\hypersonic\scripts\ctl.bat (start /MIN /B C:\Users\USER\Downloads\karibu-groceries-web\server\hsql-sample-database\scripts\ctl.bat START)
if exist C:\Users\USER\Downloads\karibu-groceries-web\ingres\scripts\ctl.bat (start /MIN /B C:\Users\USER\Downloads\karibu-groceries-web\ingres\scripts\ctl.bat START)
if exist C:\Users\USER\Downloads\karibu-groceries-web\mysql\scripts\ctl.bat (start /MIN /B C:\Users\USER\Downloads\karibu-groceries-web\mysql\scripts\ctl.bat START)
if exist C:\Users\USER\Downloads\karibu-groceries-web\postgresql\scripts\ctl.bat (start /MIN /B C:\Users\USER\Downloads\karibu-groceries-web\postgresql\scripts\ctl.bat START)
if exist C:\Users\USER\Downloads\karibu-groceries-web\apache\scripts\ctl.bat (start /MIN /B C:\Users\USER\Downloads\karibu-groceries-web\apache\scripts\ctl.bat START)
if exist C:\Users\USER\Downloads\karibu-groceries-web\openoffice\scripts\ctl.bat (start /MIN /B C:\Users\USER\Downloads\karibu-groceries-web\openoffice\scripts\ctl.bat START)
if exist C:\Users\USER\Downloads\karibu-groceries-web\apache-tomcat\scripts\ctl.bat (start /MIN /B C:\Users\USER\Downloads\karibu-groceries-web\apache-tomcat\scripts\ctl.bat START)
if exist C:\Users\USER\Downloads\karibu-groceries-web\resin\scripts\ctl.bat (start /MIN /B C:\Users\USER\Downloads\karibu-groceries-web\resin\scripts\ctl.bat START)
if exist C:\Users\USER\Downloads\karibu-groceries-web\jetty\scripts\ctl.bat (start /MIN /B C:\Users\USER\Downloads\karibu-groceries-web\jetty\scripts\ctl.bat START)
if exist C:\Users\USER\Downloads\karibu-groceries-web\subversion\scripts\ctl.bat (start /MIN /B C:\Users\USER\Downloads\karibu-groceries-web\subversion\scripts\ctl.bat START)
rem RUBY_APPLICATION_START
if exist C:\Users\USER\Downloads\karibu-groceries-web\lucene\scripts\ctl.bat (start /MIN /B C:\Users\USER\Downloads\karibu-groceries-web\lucene\scripts\ctl.bat START)
if exist C:\Users\USER\Downloads\karibu-groceries-web\third_application\scripts\ctl.bat (start /MIN /B C:\Users\USER\Downloads\karibu-groceries-web\third_application\scripts\ctl.bat START)
goto end

:stop
echo "Stopping services ..."
if exist C:\Users\USER\Downloads\karibu-groceries-web\third_application\scripts\ctl.bat (start /MIN /B C:\Users\USER\Downloads\karibu-groceries-web\third_application\scripts\ctl.bat STOP)
if exist C:\Users\USER\Downloads\karibu-groceries-web\lucene\scripts\ctl.bat (start /MIN /B C:\Users\USER\Downloads\karibu-groceries-web\lucene\scripts\ctl.bat STOP)
rem RUBY_APPLICATION_STOP
if exist C:\Users\USER\Downloads\karibu-groceries-web\subversion\scripts\ctl.bat (start /MIN /B C:\Users\USER\Downloads\karibu-groceries-web\subversion\scripts\ctl.bat STOP)
if exist C:\Users\USER\Downloads\karibu-groceries-web\jetty\scripts\ctl.bat (start /MIN /B C:\Users\USER\Downloads\karibu-groceries-web\jetty\scripts\ctl.bat STOP)
if exist C:\Users\USER\Downloads\karibu-groceries-web\hypersonic\scripts\ctl.bat (start /MIN /B C:\Users\USER\Downloads\karibu-groceries-web\server\hsql-sample-database\scripts\ctl.bat STOP)
if exist C:\Users\USER\Downloads\karibu-groceries-web\resin\scripts\ctl.bat (start /MIN /B C:\Users\USER\Downloads\karibu-groceries-web\resin\scripts\ctl.bat STOP)
if exist C:\Users\USER\Downloads\karibu-groceries-web\apache-tomcat\scripts\ctl.bat (start /MIN /B /WAIT C:\Users\USER\Downloads\karibu-groceries-web\apache-tomcat\scripts\ctl.bat STOP)
if exist C:\Users\USER\Downloads\karibu-groceries-web\openoffice\scripts\ctl.bat (start /MIN /B C:\Users\USER\Downloads\karibu-groceries-web\openoffice\scripts\ctl.bat STOP)
if exist C:\Users\USER\Downloads\karibu-groceries-web\apache\scripts\ctl.bat (start /MIN /B C:\Users\USER\Downloads\karibu-groceries-web\apache\scripts\ctl.bat STOP)
if exist C:\Users\USER\Downloads\karibu-groceries-web\ingres\scripts\ctl.bat (start /MIN /B C:\Users\USER\Downloads\karibu-groceries-web\ingres\scripts\ctl.bat STOP)
if exist C:\Users\USER\Downloads\karibu-groceries-web\mysql\scripts\ctl.bat (start /MIN /B C:\Users\USER\Downloads\karibu-groceries-web\mysql\scripts\ctl.bat STOP)
if exist C:\Users\USER\Downloads\karibu-groceries-web\postgresql\scripts\ctl.bat (start /MIN /B C:\Users\USER\Downloads\karibu-groceries-web\postgresql\scripts\ctl.bat STOP)

:end

