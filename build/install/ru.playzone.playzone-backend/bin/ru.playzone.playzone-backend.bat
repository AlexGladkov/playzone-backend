@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  ru.playzone.playzone-backend startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and RU_PLAYZONE_PLAYZONE_BACKEND_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\ru.playzone.playzone-backend-0.0.1.jar;%APP_HOME%\lib\exposed-dao-0.37.3.jar;%APP_HOME%\lib\exposed-jdbc-0.37.3.jar;%APP_HOME%\lib\ktor-server-content-negotiation-jvm-2.0.0-beta-1.jar;%APP_HOME%\lib\ktor-server-cio-jvm-2.0.0-beta-1.jar;%APP_HOME%\lib\ktor-server-host-common-jvm-2.0.0-beta-1.jar;%APP_HOME%\lib\ktor-server-core-jvm-2.0.0-beta-1.jar;%APP_HOME%\lib\exposed-core-0.37.3.jar;%APP_HOME%\lib\ktor-serialization-kotlinx-json-jvm-2.0.0-beta-1.jar;%APP_HOME%\lib\ktor-serialization-kotlinx-jvm-2.0.0-beta-1.jar;%APP_HOME%\lib\ktor-serialization-jvm-2.0.0-beta-1.jar;%APP_HOME%\lib\ktor-events-jvm-2.0.0-beta-1.jar;%APP_HOME%\lib\ktor-http-cio-jvm-2.0.0-beta-1.jar;%APP_HOME%\lib\ktor-websockets-jvm-2.0.0-beta-1.jar;%APP_HOME%\lib\ktor-http-jvm-2.0.0-beta-1.jar;%APP_HOME%\lib\ktor-network-jvm-2.0.0-beta-1.jar;%APP_HOME%\lib\ktor-utils-jvm-2.0.0-beta-1.jar;%APP_HOME%\lib\kotlinx-coroutines-jdk8-1.6.0.jar;%APP_HOME%\lib\ktor-io-jvm-2.0.0-beta-1.jar;%APP_HOME%\lib\kotlinx-coroutines-core-jvm-1.6.0.jar;%APP_HOME%\lib\kotlin-stdlib-jdk8-1.6.10.jar;%APP_HOME%\lib\postgresql-42.2.2.jar;%APP_HOME%\lib\logback-classic-1.2.3.jar;%APP_HOME%\lib\kotlin-stdlib-jdk7-1.6.10.jar;%APP_HOME%\lib\kotlin-reflect-1.6.10.jar;%APP_HOME%\lib\kotlinx-serialization-json-jvm-1.3.0.jar;%APP_HOME%\lib\kotlinx-serialization-core-jvm-1.3.0.jar;%APP_HOME%\lib\kotlin-stdlib-1.6.10.jar;%APP_HOME%\lib\slf4j-api-1.7.30.jar;%APP_HOME%\lib\logback-core-1.2.3.jar;%APP_HOME%\lib\annotations-13.0.jar;%APP_HOME%\lib\kotlin-stdlib-common-1.6.10.jar;%APP_HOME%\lib\config-1.3.1.jar;%APP_HOME%\lib\jansi-2.3.4.jar


@rem Execute ru.playzone.playzone-backend
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %RU_PLAYZONE_PLAYZONE_BACKEND_OPTS%  -classpath "%CLASSPATH%" ru.playzone.ApplicationKt %*

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable RU_PLAYZONE_PLAYZONE_BACKEND_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%RU_PLAYZONE_PLAYZONE_BACKEND_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
