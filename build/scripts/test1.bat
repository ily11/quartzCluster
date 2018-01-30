@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  test1 startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and TEST1_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS="-Duser.dir=%~dp0.." "-Dconfig.file=%~dp0../conf/application.conf" "-Dlogback.configurationFile=%~dp0../conf/logback.groovy"

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args
if "%@eval[2+2]" == "4" goto 4NT_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*
goto execute

:4NT_args
@rem Get arguments from the 4NT Shell from JP Software
set CMD_LINE_ARGS=%$

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\test1-1.0-SNAPSHOT.jar;%APP_HOME%\lib\config-1.3.1.jar;%APP_HOME%\lib\logback-core-1.2.1.jar;%APP_HOME%\lib\logback-access-1.2.1.jar;%APP_HOME%\lib\logback-classic-1.2.1.jar;%APP_HOME%\lib\groovy-all-2.4.9.jar;%APP_HOME%\lib\spring-test-4.3.7.RELEASE.jar;%APP_HOME%\lib\spring-context-4.3.7.RELEASE.jar;%APP_HOME%\lib\spring-context-support-4.3.7.RELEASE.jar;%APP_HOME%\lib\spring-tx-4.3.7.RELEASE.jar;%APP_HOME%\lib\spring-webmvc-4.3.7.RELEASE.jar;%APP_HOME%\lib\spring-jdbc-4.3.7.RELEASE.jar;%APP_HOME%\lib\spring-security-taglibs-4.2.1.RELEASE.jar;%APP_HOME%\lib\spring-security-config-4.2.1.RELEASE.jar;%APP_HOME%\lib\spring-security-cas-4.2.1.RELEASE.jar;%APP_HOME%\lib\jedis-2.7.2.jar;%APP_HOME%\lib\mysql-connector-java-6.0.6.jar;%APP_HOME%\lib\quartz-2.2.3.jar;%APP_HOME%\lib\utils-1.4.26-RELEASE.jar;%APP_HOME%\lib\spring-core-4.3.7.RELEASE.jar;%APP_HOME%\lib\spring-aop-4.3.7.RELEASE.jar;%APP_HOME%\lib\spring-beans-4.3.7.RELEASE.jar;%APP_HOME%\lib\spring-expression-4.3.7.RELEASE.jar;%APP_HOME%\lib\spring-web-4.3.7.RELEASE.jar;%APP_HOME%\lib\spring-security-acl-4.2.1.RELEASE.jar;%APP_HOME%\lib\spring-security-core-4.2.1.RELEASE.jar;%APP_HOME%\lib\spring-security-web-4.2.1.RELEASE.jar;%APP_HOME%\lib\aopalliance-1.0.jar;%APP_HOME%\lib\cas-client-core-3.4.1.jar;%APP_HOME%\lib\commons-pool2-2.3.jar;%APP_HOME%\lib\c3p0-0.9.1.1.jar;%APP_HOME%\lib\lucene-queryparser-5.1.0.jar;%APP_HOME%\lib\lucene-core-5.1.0.jar;%APP_HOME%\lib\lucene-analyzers-common-5.1.0.jar;%APP_HOME%\lib\lucene-queries-5.1.0.jar;%APP_HOME%\lib\tiles-core-3.0.5.jar;%APP_HOME%\lib\tiles-extras-3.0.5.jar;%APP_HOME%\lib\tiles-api-3.0.5.jar;%APP_HOME%\lib\tiles-jsp-3.0.5.jar;%APP_HOME%\lib\tiles-servlet-3.0.5.jar;%APP_HOME%\lib\tiles-template-3.0.5.jar;%APP_HOME%\lib\tiles-autotag-core-1.1.0.jar;%APP_HOME%\lib\tiles-autotag-core-runtime-1.1.0.jar;%APP_HOME%\lib\commons-fileupload-1.3.1.jar;%APP_HOME%\lib\commons-codec-1.10.jar;%APP_HOME%\lib\json-lib-2.4-jdk15.jar;%APP_HOME%\lib\json-20140107.jar;%APP_HOME%\lib\junrar-0.7.jar;%APP_HOME%\lib\junit-4.11.jar;%APP_HOME%\lib\GetApkInfo-gradle-2.1.jar;%APP_HOME%\lib\AXMLPrinter2-1.1.1.jar;%APP_HOME%\lib\axml-2.0.jar;%APP_HOME%\lib\infoflow-cl-1.1.jar;%APP_HOME%\lib\infoflow-1.1.jar;%APP_HOME%\lib\java_app_test-1.1.jar;%APP_HOME%\lib\org.hamcrest.core-1.3.jar;%APP_HOME%\lib\polyglot-1.1.jar;%APP_HOME%\lib\ant-1.8.1.jar;%APP_HOME%\lib\lucene-sandbox-5.1.0.jar;%APP_HOME%\lib\commons-digester-2.0.jar;%APP_HOME%\lib\jcl-over-slf4j-1.7.6.jar;%APP_HOME%\lib\tiles-request-servlet-wildcard-1.0.6.jar;%APP_HOME%\lib\tiles-request-mustache-1.0.6.jar;%APP_HOME%\lib\tiles-freemarker-3.0.5.jar;%APP_HOME%\lib\tiles-velocity-3.0.5.jar;%APP_HOME%\lib\tiles-el-3.0.5.jar;%APP_HOME%\lib\tiles-mvel-3.0.5.jar;%APP_HOME%\lib\tiles-ognl-3.0.5.jar;%APP_HOME%\lib\tiles-compat-3.0.5.jar;%APP_HOME%\lib\guava-12.0.1.jar;%APP_HOME%\lib\tiles-request-api-1.0.6.jar;%APP_HOME%\lib\tiles-request-jsp-1.0.6.jar;%APP_HOME%\lib\tiles-request-servlet-1.0.6.jar;%APP_HOME%\lib\qdox-1.10.1.jar;%APP_HOME%\lib\velocity-1.6.3.jar;%APP_HOME%\lib\commons-io-2.2.jar;%APP_HOME%\lib\commons-beanutils-1.8.0.jar;%APP_HOME%\lib\commons-collections-3.2.1.jar;%APP_HOME%\lib\commons-logging-api-1.1.jar;%APP_HOME%\lib\commons-vfs2-2.0.jar;%APP_HOME%\lib\hamcrest-core-1.3.jar;%APP_HOME%\lib\ant-launcher-1.8.1.jar;%APP_HOME%\lib\compiler-0.8.4.jar;%APP_HOME%\lib\tiles-request-freemarker-1.0.6.jar;%APP_HOME%\lib\velocity-tools-2.0.jar;%APP_HOME%\lib\tiles-request-velocity-1.0.6.jar;%APP_HOME%\lib\mvel2-2.0.11.jar;%APP_HOME%\lib\ognl-2.7.3.jar;%APP_HOME%\lib\jsr305-1.3.9.jar;%APP_HOME%\lib\oro-2.0.8.jar;%APP_HOME%\lib\maven-scm-api-1.4.jar;%APP_HOME%\lib\maven-scm-provider-svnexe-1.4.jar;%APP_HOME%\lib\freemarker-2.3.15.jar;%APP_HOME%\lib\javassist-3.7.ga.jar;%APP_HOME%\lib\plexus-utils-1.5.6.jar;%APP_HOME%\lib\maven-scm-provider-svn-commons-1.4.jar;%APP_HOME%\lib\regexp-1.3.jar;%APP_HOME%\lib\slf4j-api-1.7.22.jar;%APP_HOME%\lib\commons-lang-2.5.jar;%APP_HOME%\lib\ezmorph-1.0.6.jar;%APP_HOME%\lib\commons-logging-1.2.jar

@rem Execute test1
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %TEST1_OPTS%  -classpath "%CLASSPATH%" com.bupt.MainProgram %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable TEST1_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%TEST1_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
