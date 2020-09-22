VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Domain Control  (Pcfun v1.0)"
   ClientHeight    =   7470
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6030
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7470
   ScaleWidth      =   6030
   StartUpPosition =   3  'Windows Default
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Form1.frx":0CCE
      Left            =   3000
      List            =   "Form1.frx":0CE4
      TabIndex        =   4
      Text            =   ".be"
      Top             =   120
      Width           =   735
   End
   Begin VB.TextBox Text2 
      Height          =   6735
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   2
      Top             =   720
      Width           =   6015
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Control"
      Height          =   315
      Left            =   3840
      TabIndex        =   1
      Top             =   120
      Width           =   855
   End
   Begin VB.TextBox Text1 
      Height          =   315
      Left            =   1680
      TabIndex        =   0
      Top             =   120
      Width           =   1335
   End
   Begin MSWinsockLib.Winsock win 
      Left            =   0
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      RemotePort      =   43
   End
   Begin VB.Label Label1 
      Caption         =   "Result:"
      Height          =   255
      Left            =   0
      TabIndex        =   5
      Top             =   480
      Width           =   1455
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      Caption         =   "www."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   960
      TabIndex        =   3
      Top             =   120
      Width           =   615
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'By Davy Goessens
'http://www.pcfun.be
'0485462301
Dim n As String
Private Sub Command1_Click()
Dim r As String
Text2.Text = ""
If Combo1.ListIndex = -1 Or Combo1.ListIndex = 0 Then
r = "whois.dns.be"
n = ".be"
ElseIf Combo1.ListIndex = 1 Then
r = "whois.domain-registry.nl"
n = ".nl"
ElseIf Combo1.ListIndex = 2 Then
r = "whois.networksolutions.com"
n = ".com"
ElseIf Combo1.ListIndex = 3 Then
r = "rs.internic.net"
n = ".net"
ElseIf Combo1.ListIndex = 4 Then
r = "rs.internic.net"
n = ".org"
ElseIf Combo1.ListIndex = 5 Then
r = "whois.nic.nu"
n = ".nu"
End If
win.Close
win.Connect CStr(r), CLng("43")
End Sub
Private Sub win_Connect()
win.SendData Text1.Text & n & vbCrLf
End Sub

Private Sub win_DataArrival(ByVal bytesTotal As Long)
Dim data As String
win.GetData data

data = Replace(data, Chr(10), vbCrLf)
Text2.Text = Text2.Text & data & vbCrLf

End Sub
