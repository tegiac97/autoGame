#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include <MsgBoxConstants.au3>

; Press Esc to terminate script, Pause/Break to "pause"

Global $g_bPaused = False

HotKeySet("{ESC}", "TogglePause")
HotKeySet("^c", "Terminate")
HotKeySet("+!d", "ShowMessage") ; Shift-Alt-d


Func TogglePause()
    $g_bPaused = Not $g_bPaused
    While $g_bPaused
        Sleep(100)
        ToolTip('Script is "Paused"', 0, 0)
    WEnd
    ToolTip("")
EndFunc   ;==>TogglePause

Func Terminate()
    Exit
EndFunc   ;==>Terminate

Func ShowMessage()
    MsgBox($MB_SYSTEMMODAL, "", "This is a message.")
EndFunc   ;==>ShowMessage

$clickFile=FileOpen("die.txt",1);
$countClick=0;

Func writeToLogFile($status, $color)
	$logFile=FileOpen("log.txt",1);
	If $logFile==-1 Then
		MsgBox(1,"Error","Can't open file")
	Else
		FileWrite("log.txt",@HOUR&":"&@MIN&":"&@SEC&@TAB&$status &@TAB& $color&@CR&@LF)
	EndIf
EndFunc

Func RunningTool()


$viTriCuaSo=WinGetPos("C:\Users\lebo\Desktop\game-ban-tia-phong-thu-game24h.swf");
$winX=$viTriCuaSo[0];
$winY=$viTriCuaSo[1];
$winWidth=$viTriCuaSo[2]
$winHeight=$viTriCuaSo[3];


#CS $dungYenXX=$winX+50
; $dungYenXY=$winY+395
; $dungYenYX=$winX+100
; $dungYenYY=$winY+420
; $diChuyenXX=$dungYenYX
; $diChuyenXY=$dungYenXY
; $diChuyenYX=$winX+630
; $dichuyenYY=$winY+420
 #CE

$dungYenXX=$winX+$winWidth*100/906
$dungYenXY=$winY+$winHeight*535/714
$dungYenYX=$dungYenXX+$winWidth*50/906
$dungYenYY=$dungYenXY+$winHeight*25/714
$diChuyenXX=$dungYenYX
$diChuyenXY=$dungYenXY
$diChuyenYX=$winX+$winWidth-10
$dichuyenYY=$winY+$winHeight*560/714

While 1
$khuVucDungYenTrang=PixelSearch($dungYenXX,$dungYenXY,$dungYenYX,$dungYenYY,"0xFFFFFF")
if IsArray($khuVucDungYenTrang) Then
	writeToLogFile("PASS","0xFFFFFF");
	MouseClick("main",$khuVucDungYenTrang[0], $khuVucDungYenTrang[1]);
	$countClick=$countClick+1;
	FileWrite($clickFile,$countClick&@CR&@LF);
	Sleep(20);
Else
	writeToLogFile("FAIL","0xFFFFFF");
EndIf

$khuVucDungYenXanh=PixelSearch($dungYenXX,$dungYenXY,$dungYenYX,$dungYenYY,"0x0000FF")
if IsArray($khuVucDungYenXanh) Then
	writeToLogFile("PASS","0x0000FF");
	MouseClick("main",$khuVucDungYenXanh[0], $khuVucDungYenXanh[1]);
	$countClick=$countClick+1;
	FileWrite($clickFile,$countClick&@CR&@LF);
	Sleep(20);
	Else
	writeToLogFile("FAIL","0x0000FF");
EndIf

$khuVucDungYenDo=PixelSearch($dungYenXX,$dungYenXY,$dungYenYX,$dungYenYY,"0xFF0000");
if IsArray($khuVucDungYenDo) Then
	writeToLogFile("PASS","0xFF0000");
	MouseClick("main",$khuVucDungYenDo[0], $khuVucDungYenDo[1]);
	$countClick=$countClick+1;
	FileWrite($clickFile,$countClick&@CR&@LF);
	Sleep(20);
	Else
	writeToLogFile("FAIL","0xFF0000");
EndIf

$khuVucDiChuyenTrang=PixelSearch($diChuyenXX,$diChuyenXY,$diChuyenYX,$dichuyenYY,"0xFFFFFF")
if IsArray($khuVucDiChuyenTrang) Then
	writeToLogFile("PASS","0xFFFFFF");
	MouseClick("main",$khuVucDiChuyenTrang[0]-$winWidth*40/640, $khuVucDiChuyenTrang[1]);
	$countClick=$countClick+1;
	FileWrite($clickFile,$countClick&@CR&@LF);
	Sleep(20);
	Else
	writeToLogFile("FAIL","0xFFFFFF");
EndIf

$khuVucDiChuyenXanh=PixelSearch($diChuyenXX,$diChuyenXY,$diChuyenYX,$dichuyenYY,"0x0000FF")
if IsArray($khuVucDiChuyenXanh) Then
	writeToLogFile("PASS","0x0000FF");
	MouseClick("main",$khuVucDiChuyenXanh[0]-$winWidth*40/640, $khuVucDiChuyenXanh[1]);
	$countClick=$countClick+1;
	FileWrite($clickFile,$countClick&@CR&@LF);
	Sleep(20);
	Else
	writeToLogFile("FAIL","0x0000FF");
EndIf

$khuVucDiChuyenDo=PixelSearch($diChuyenXX,$diChuyenXY,$diChuyenYX,$dichuyenYY,"0xFF0000")
if IsArray($khuVucDiChuyenDo) Then
	writeToLogFile("PASS","0xFF0000");
	MouseClick("main",$khuVucDiChuyenDo[0]-$winWidth*40/640, $khuVucDiChuyenDo[1]);
	$countClick=$countClick+1;
	FileWrite($clickFile,$countClick&@CR&@LF);
	Sleep(20);
	Else
	writeToLogFile("FAIL","0xFF0000");
EndIf

$khuVucDiChuyenXeTang=PixelSearch($diChuyenXX,$diChuyenXY,$diChuyenYX,$dichuyenYY,"0x333333")
if IsArray($khuVucDiChuyenXeTang) Then
	writeToLogFile("PASS","0x333333");
	MouseClick("main",$khuVucDiChuyenXeTang[0]-$winWidth*40/640, $khuVucDiChuyenXeTang[1]);
	$countClick=$countClick+1;
	FileWrite($clickFile,$countClick&@CR&@LF);
	Sleep(20);
	Else
	writeToLogFile("FAIL","0x333333");
EndIf
WEnd
EndFunc

;FileClose($logFile);

;~ While 1
;~ $capture=_ScreenCapture_Capture(@ScriptDir&"\Capture.bmp",$winX+$winWidth*550/870, $winY+$winHeight*617/690, $winX+$winWidth*710/870, $winY+$winHeight*677/690);
;~ $scoreFrame=_IMGSearch_Area(@ScriptDir&"\Capture.bmp",$winX+$winWidth*550/870, $winY+$winHeight*617/690, $winX+$winWidth*710/870, $winY+$winHeight*677/690,100,true)
;~ MsgBox(0,"",$scoreFrame[0]&@CR&@LF&$capture)
;~ If $scoreFrameTmp<>$scoreFrame[0] Then
;~ $scoreFrameTmp=$scoreFrame[0]
;~ EndIf
;~ If $scoreFrameTmp==0 Then
;~ 	$numberDie=$numberDie+1;
;~ 	FileWrite("die.txt",$numberDie&@CR&@LF)
;~ 	EndIf
;~ WEnd