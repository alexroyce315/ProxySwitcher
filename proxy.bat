@ECHO OFF
CLS
COLOR 0A
TITLE 代理快速切换脚本
GOTO MENU

:MENU
	TITLE 代理快速切换脚本
	CLS 
	ECHO. 
	ECHO.  代理快速切换脚本 ================================
	ECHO. 0 清除代理                   
	ECHO. 1 深圳代理                   
	ECHO. 2 北京代理
	ECHO. 3 上海代理
	ECHO. 4 青岛代理
	ECHO. 
	ECHO.  ==================================================================
	SET /p =. < nul
	SET /p =请输入操作序号后回车:<nul
	SET /p id= 
    IF "%id%"=="0" GOTO :cmd_clear
    IF "%id%"=="1" GOTO :cmd_shenzhen
	IF "%id%"=="2" GOTO :cmd_beijing
	IF "%id%"=="3" GOTO :cmd_shanghai
	IF "%id%"=="4" GOTO :cmd_qingdao
    IF "%id%"=="q" EXIT 
	PAUSE
GOTO :MENU

:cmd_clear
	ECHO.  正在清空代理
	REG ADD "HKCU\SOFTWARE\MICROSOFT\Windows\CURRENTVERSION\Internet Settings\Connections" /v "DefaultConnectionSettings" /t  REG_BINARY /d "3C000000AA0100000B0000000F000000" /f 
	REG ADD "HKCU\SOFTWARE\MICROSOFT\Windows\CURRENTVERSION\Internet Settings" /v "ProxyEnable" /t  REG_DWORD /d "0" /f 
	REG ADD "HKCU\SOFTWARE\MICROSOFT\Windows\CURRENTVERSION\Internet Settings" /v "ProxyServer" /t  REG_SZ /d "" /f 
	REM REG ADD "HKLM\System\CurrentControlSet\Hardware Profiles\0001\SOFTWARE\MICROSOFT\Windows\CURRENTVERSION\Internet Settings" /v "ProxyEnable" /t  REG_DWORD /d "1" /f 
	REG ADD "HKCU\SOFTWARE\MICROSOFT\Windows\CURRENTVERSION\Internet Settings\Connections" /v "SavedLegacySettings" /t  REG_BINARY /d "3C000000AE0100000B0000000F000000" /f 
	REG ADD "HKCU\SOFTWARE\MICROSOFT\Windows\CURRENTVERSION\Internet Settings" /v "ProxyOverride" /t  REG_SZ /d "<local>" /f 
	ECHO.  代理已清空，重启 IE 后生效
	GOTO :MENU
	
:cmd_shenzhen
	TITLE 正在设置到深圳代理
	ECHO.  正在设置到深圳代理
	SET proxy="182.254.216.147:80" 
	GOTO :setproxy
	
:cmd_beijing
	TITLE 正在设置到北京代理
	ECHO.  正在设置到北京代理
	SET proxy="124.42.7.103:80" 
	GOTO :setproxy
	
:cmd_shanghai
	TITLE 正在设置到上海代理
	ECHO.  正在设置到上海代理
	SET proxy="180.153.87.22:18080" 
	GOTO :setproxy
	
:cmd_qingdao
	TITLE 正在设置到青岛代理
	ECHO.  正在设置到青岛代理
	SET proxy="114.215.153.151:8080" 
	GOTO :setproxy

:setproxy
	REG ADD "HKCU\SOFTWARE\MICROSOFT\Windows\CURRENTVERSION\Internet Settings\Connections" /v "DefaultConnectionSettings" /t  REG_BINARY /d "3C000000AA0100000B0000000F000000" /f 
	REG ADD "HKCU\SOFTWARE\MICROSOFT\Windows\CURRENTVERSION\Internet Settings" /v "ProxyEnable" /t  REG_DWORD /d "1" /f 
	REG ADD "HKCU\SOFTWARE\MICROSOFT\Windows\CURRENTVERSION\Internet Settings" /v "ProxyServer" /t  REG_SZ /d %proxy% /f 
	REM REG ADD "HKLM\System\CurrentControlSet\Hardware Profiles\0001\SOFTWARE\MICROSOFT\Windows\CURRENTVERSION\Internet Settings" /v "ProxyEnable" /t  REG_DWORD /d "1" /f 
	REG ADD "HKCU\SOFTWARE\MICROSOFT\Windows\CURRENTVERSION\Internet Settings\Connections" /v "SavedLegacySettings" /t  REG_BINARY /d "3C000000AE0100000B0000000F000000" /f 
	REG ADD "HKCU\SOFTWARE\MICROSOFT\Windows\CURRENTVERSION\Internet Settings" /v "ProxyOverride" /t  REG_SZ /d "<local>" /f 
	ECHO.  设置完毕，重启 IE 后生效，请按任意键继续...
	PAUSE >nul
	GOTO :MENU