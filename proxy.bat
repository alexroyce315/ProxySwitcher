@ECHO OFF
CLS
COLOR 0A
TITLE ��������л��ű�
GOTO MENU

:MENU
	TITLE ��������л��ű�
	CLS 
	ECHO. 
	ECHO.  ��������л��ű� ================================
	ECHO. 0 �������                   
	ECHO. 1 ���ڴ���                   
	ECHO. 2 ��������
	ECHO. 3 �Ϻ�����
	ECHO. 4 �ൺ����
	ECHO. 
	ECHO.  ==================================================================
	SET /p =. < nul
	SET /p =�����������ź�س�:<nul
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
	ECHO.  ������մ���
	REG ADD "HKCU\SOFTWARE\MICROSOFT\Windows\CURRENTVERSION\Internet Settings\Connections" /v "DefaultConnectionSettings" /t  REG_BINARY /d "3C000000AA0100000B0000000F000000" /f 
	REG ADD "HKCU\SOFTWARE\MICROSOFT\Windows\CURRENTVERSION\Internet Settings" /v "ProxyEnable" /t  REG_DWORD /d "0" /f 
	REG ADD "HKCU\SOFTWARE\MICROSOFT\Windows\CURRENTVERSION\Internet Settings" /v "ProxyServer" /t  REG_SZ /d "" /f 
	REM REG ADD "HKLM\System\CurrentControlSet\Hardware Profiles\0001\SOFTWARE\MICROSOFT\Windows\CURRENTVERSION\Internet Settings" /v "ProxyEnable" /t  REG_DWORD /d "1" /f 
	REG ADD "HKCU\SOFTWARE\MICROSOFT\Windows\CURRENTVERSION\Internet Settings\Connections" /v "SavedLegacySettings" /t  REG_BINARY /d "3C000000AE0100000B0000000F000000" /f 
	REG ADD "HKCU\SOFTWARE\MICROSOFT\Windows\CURRENTVERSION\Internet Settings" /v "ProxyOverride" /t  REG_SZ /d "<local>" /f 
	ECHO.  ��������գ����� IE ����Ч
	GOTO :MENU
	
:cmd_shenzhen
	TITLE �������õ����ڴ���
	ECHO.  �������õ����ڴ���
	SET proxy="182.254.216.147:80" 
	GOTO :setproxy
	
:cmd_beijing
	TITLE �������õ���������
	ECHO.  �������õ���������
	SET proxy="124.42.7.103:80" 
	GOTO :setproxy
	
:cmd_shanghai
	TITLE �������õ��Ϻ�����
	ECHO.  �������õ��Ϻ�����
	SET proxy="180.153.87.22:18080" 
	GOTO :setproxy
	
:cmd_qingdao
	TITLE �������õ��ൺ����
	ECHO.  �������õ��ൺ����
	SET proxy="114.215.153.151:8080" 
	GOTO :setproxy

:setproxy
	REG ADD "HKCU\SOFTWARE\MICROSOFT\Windows\CURRENTVERSION\Internet Settings\Connections" /v "DefaultConnectionSettings" /t  REG_BINARY /d "3C000000AA0100000B0000000F000000" /f 
	REG ADD "HKCU\SOFTWARE\MICROSOFT\Windows\CURRENTVERSION\Internet Settings" /v "ProxyEnable" /t  REG_DWORD /d "1" /f 
	REG ADD "HKCU\SOFTWARE\MICROSOFT\Windows\CURRENTVERSION\Internet Settings" /v "ProxyServer" /t  REG_SZ /d %proxy% /f 
	REM REG ADD "HKLM\System\CurrentControlSet\Hardware Profiles\0001\SOFTWARE\MICROSOFT\Windows\CURRENTVERSION\Internet Settings" /v "ProxyEnable" /t  REG_DWORD /d "1" /f 
	REG ADD "HKCU\SOFTWARE\MICROSOFT\Windows\CURRENTVERSION\Internet Settings\Connections" /v "SavedLegacySettings" /t  REG_BINARY /d "3C000000AE0100000B0000000F000000" /f 
	REG ADD "HKCU\SOFTWARE\MICROSOFT\Windows\CURRENTVERSION\Internet Settings" /v "ProxyOverride" /t  REG_SZ /d "<local>" /f 
	ECHO.  ������ϣ����� IE ����Ч���밴���������...
	PAUSE >nul
	GOTO :MENU