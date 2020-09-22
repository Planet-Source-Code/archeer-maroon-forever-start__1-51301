VERSION 5.00
Begin VB.Form chessfrm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   420
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1545
   Icon            =   "frmmain.frx":0000
   LinkTopic       =   "Form2"
   ScaleHeight     =   420
   ScaleWidth      =   1545
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "chessfrm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
Unload Me
main.Show

End Sub
