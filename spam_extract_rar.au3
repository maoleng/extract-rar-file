#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Res_Comment=Developed By Mao Leng
#AutoIt3Wrapper_Res_Description=Developed By Mao Leng
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_ProductName=Extract Spam
#AutoIt3Wrapper_Res_ProductVersion=1.0.0.0
#AutoIt3Wrapper_Res_CompanyName=Mao Leng
#AutoIt3Wrapper_Res_LegalCopyright=Mao Leng
#AutoIt3Wrapper_Res_Language=1066
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

Func _extract($file_name, $password)
	Local $cmd = '"C:\Program Files (x86)\WinRAR\rar.exe" x -p' & $password
	Local $file_path = @ScriptDir & '\' & $file_name
	$cmd &= ' ' & '"' & $file_path & '"' & ' -r ' & '"' & @ScriptDir & '"'
	$a = RunWait($cmd, '', @SW_HIDE) == 0
	ConsoleWrite($cmd)
	Return $a
EndFunc

For $i = 6900 to 10000
	$password = StringFormat("%04i", $i)
	$check = _extract("secret_text.rar", $password)
	ConsoleWrite('Current password: ' & $password & @CRLF)
	if $check Then
		ConsoleWrite('-----------------> The password is: ' & $password & @CRLF)
		MsgBox(16 + 262144, "Message", "The password is: " & $password)
		ExitLoop
	Else
		ConsoleWrite('--->Wrong password' & @CRLF)
	EndIf
	Sleep(100)
Next
