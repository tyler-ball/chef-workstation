REM ; This script is used in the jenkins part of our pipeline to verify our
REM ; package is working correctly after install.

REM ; chef-run version ensures our bin ends up on path and the basic ruby env is
REM ; working.
chef-run --version || echo "Exited with error %errorlevel%" && exit /b 1

REM ; Ensure our ChefDK works
chef env || echo "Exited with error %errorlevel%" && exit /b 2

REM ; Test
chef-run version || echo "Exited with error %errorlevel%" && exit /b 3
