@echo off

REM ; This script is used in the jenkins part of our pipeline to verify our
REM ; package is working correctly after install.

REM ; chef-run version ensures our bin ends up on path and the basic ruby env is
REM ; working.
chef-run --version
IF %ERRORLEVEL% goto :error

REM ; Ensure our ChefDK works
chef env
IF %ERRORLEVEL% goto :error

REM ; Test
chef-run version
IF %ERRORLEVEL% goto :error

jklfds fail
IF %ERRORLEVEL% goto :error
