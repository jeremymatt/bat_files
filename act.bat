:: test bat file

:: NOTE:
:: To run from the anaconda command line regardless of the current directory
:: (required to have the cd flag use the current directory as the source)
:: Add the image_sorter directory to the path variable for both the User and
:: System (search for "edit env" in the windows start menu)
@echo off


::Check if inputs are provided and insert dummy variables if not provided
if "%~1"=="" (SET in1=empty) else (SET in1=%1%)
if "%~2"=="" (SET in2=empty) else (SET in2=%2%)
if "%~3"=="" (SET in3=empty) else (SET in3=%3%)



echo in1: %in1%
echo in2: %in2%
echo in3: %in3%


if %in1%==-help (set in1=-h)

if %in1%==-h (
	echo Help file
	echo	  useage  act ^<environment name^> ^<flag^>
	echo      noflags simply deactivate current environment and activate a new one
	echo      -h      This help menu
	echo      -sp     Launch spyder
	echo      -new    Launch spyder (new instance)
	) else (
	echo activating environment
	call conda deactivate
	call conda activate %in1%
	
	
	if %in2%==-sp (
		if %in3%==-new (
			call spyder --new-instance
			) else (
			call spyder
			)
		)
	
	)


