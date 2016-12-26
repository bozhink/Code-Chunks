' Copyright (C) 2007 Intel Corporation. All Rights Reserved. 
'
' The source code contained or described herein and all documents related to the source code 
' ("Material") are owned by Intel Corporation or its suppliers or licensors. Title to the 
' Material remains with Intel Corporation or its suppliers and licensors.  The Material is 
' protected by worldwide copyright laws and treaty provisions. No part of the Material may be 
' used, copied, reproduced, modified, published, uploaded, posted, transmitted, distributed, 
' or disclosed in any way except as expressly provided in the license provided with the 
' Materials.  No license under any patent, copyright, trade secret or other intellectual 
' property right is granted to or conferred upon you by disclosure or delivery of the 
' Materials, either expressly, by implication, inducement, estoppel or otherwise, except as 
' expressly provided in the license provided with the Materials.

REM Part of the Intel Visual Fortran Samples
REM 
REM When the Do It button is clicked, the Button1_Click routine is called.
REM The routine creates two double precision arrays and fills one with
REM values.  A Fortran routine is called and is passed the input array,
REM a string, and an output array.  The Fortran routine converts the string
REM to a double, multiplies the input array by the double value, and stores the 
REM result in the output array.  The form is then updated with the output values.
REM
REM See module1.vb for the declaration of the Fortran routine
REM
Public Class Form1
    Inherits System.Windows.Forms.Form

#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call

    End Sub

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Friend WithEvents Button1 As System.Windows.Forms.Button
    Friend WithEvents TextBox1 As System.Windows.Forms.TextBox
    Friend WithEvents TextBox2 As System.Windows.Forms.TextBox
    Friend WithEvents TextBox3 As System.Windows.Forms.TextBox
    Friend WithEvents TextBox4 As System.Windows.Forms.TextBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.Button1 = New System.Windows.Forms.Button
        Me.TextBox1 = New System.Windows.Forms.TextBox
        Me.TextBox2 = New System.Windows.Forms.TextBox
        Me.TextBox3 = New System.Windows.Forms.TextBox
        Me.TextBox4 = New System.Windows.Forms.TextBox
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.Label3 = New System.Windows.Forms.Label
        Me.Label4 = New System.Windows.Forms.Label
        Me.SuspendLayout()
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(96, 40)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(104, 48)
        Me.Button1.TabIndex = 0
        Me.Button1.Text = "Do It!"
        '
        'TextBox1
        '
        Me.TextBox1.Location = New System.Drawing.Point(152, 128)
        Me.TextBox1.Name = "TextBox1"
        Me.TextBox1.Size = New System.Drawing.Size(48, 20)
        Me.TextBox1.TabIndex = 1
        Me.TextBox1.Text = ""
        '
        'TextBox2
        '
        Me.TextBox2.Location = New System.Drawing.Point(152, 152)
        Me.TextBox2.Name = "TextBox2"
        Me.TextBox2.Size = New System.Drawing.Size(48, 20)
        Me.TextBox2.TabIndex = 2
        Me.TextBox2.Text = ""
        '
        'TextBox3
        '
        Me.TextBox3.Location = New System.Drawing.Point(152, 176)
        Me.TextBox3.Name = "TextBox3"
        Me.TextBox3.Size = New System.Drawing.Size(48, 20)
        Me.TextBox3.TabIndex = 3
        Me.TextBox3.Text = ""
        '
        'TextBox4
        '
        Me.TextBox4.Location = New System.Drawing.Point(152, 200)
        Me.TextBox4.Name = "TextBox4"
        Me.TextBox4.Size = New System.Drawing.Size(48, 20)
        Me.TextBox4.TabIndex = 4
        Me.TextBox4.Text = ""
        '
        'Label1
        '
        Me.Label1.Location = New System.Drawing.Point(64, 128)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(72, 16)
        Me.Label1.TabIndex = 5
        Me.Label1.Text = "DBL_OUT(1)"
        '
        'Label2
        '
        Me.Label2.Location = New System.Drawing.Point(64, 152)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(72, 16)
        Me.Label2.TabIndex = 6
        Me.Label2.Text = "DBL_OUT(2)"
        '
        'Label3
        '
        Me.Label3.Location = New System.Drawing.Point(64, 176)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(72, 16)
        Me.Label3.TabIndex = 7
        Me.Label3.Text = "DBL_OUT(3)"
        '
        'Label4
        '
        Me.Label4.Location = New System.Drawing.Point(64, 200)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(72, 16)
        Me.Label4.TabIndex = 8
        Me.Label4.Text = "DBL_OUT(4)"
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(292, 273)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.TextBox4)
        Me.Controls.Add(Me.TextBox3)
        Me.Controls.Add(Me.TextBox2)
        Me.Controls.Add(Me.TextBox1)
        Me.Controls.Add(Me.Button1)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim DBL_IN(4) As Double
        Dim DBL_OUT(4) As Double
        Dim MULTIPLIER As String
        DBL_IN(1) = 1.0
        DBL_IN(2) = 2.0
        DBL_IN(3) = 3.0
        DBL_IN(4) = 4.0
        MULTIPLIER = "2.0"
        Call DLL_ROUT(DBL_IN(1), MULTIPLIER, DBL_OUT(1))
        TextBox1.Text = DBL_OUT(1)
        TextBox2.Text = DBL_OUT(2)
        TextBox3.Text = DBL_OUT(3)
        TextBox4.Text = DBL_OUT(4)
    End Sub
End Class
