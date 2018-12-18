#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include "test1.au3"
#Region ### START Koda GUI section ### Form=C:\Users\lebo\Desktop\Form1.kxf
$Form1_1 = GUICreate("Snipper Shooter", 616, 111, 192, 124)
GUICtrlCreateLabel("Path", 32, 16, 37, 25)
GUICtrlSetFont(-1, 14, 400, 0, "Times New Roman")
$Input1 = GUICtrlCreateInput("Path to game...", 72, 16, 417, 21)
$b_Browse = GUICtrlCreateButton("Browse...", 496, 16, 75, 25)
$b_Run = GUICtrlCreateButton("Run", 232, 64, 75, 25)
$b_Stop = GUICtrlCreateButton("Stop", 320, 64, 75, 25)
$b_Exit = GUICtrlCreateButton("Exit", 496, 64, 75, 25)
$b_Open = GUICtrlCreateButton("Open", 408, 64, 75, 25)
$Sign = GUICtrlCreateLabel("Design by lebo", 8, 88, 74, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
GUICtrlSetState(-1, $GUI_DISABLE)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

$filePath="x";
$activeStatus=False;

GUICtrlSetState($b_Run,$GUI_DISABLE)
GUICtrlSetState($b_Stop,$GUI_DISABLE)

FileOpen("die.txt",1);

While 1

	If WinExists($filePath,"")==0 Then
		$activeStatus=False;
	Else
		$activeStatus=True;
	EndIf
	If $activeStatus Then
		Else
	GUICtrlSetState($b_Run,$GUI_ENABLE)
	GUICtrlSetState($b_Stop,$GUI_ENABLE)
	EndIf

	$nMsg = GUIGetMsg()

	Switch $nMsg
		Case $b_Browse
			$filePath=FileOpenDialog("Choose the game...",@DesktopDir & "\", "Swf file (*.swf)");
			GUICtrlSetData($Input1,$filePath);
			;MsgBox(1,"",$Input1);
		Case $b_Open
			Run("C:\Program Files (x86)\SWF File Player\SWFFilePlayer.exe "&$filePath);
		Case $b_Run
			RunningTool()
		Case $b_Exit
			Exit
		Case $GUI_EVENT_CLOSE
			Exit
EndSwitch   ;==>TogglePaus
WEnd


