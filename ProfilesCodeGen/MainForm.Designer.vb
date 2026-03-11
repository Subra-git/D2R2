<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class MainForm
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing AndAlso components IsNot Nothing Then
            components.Dispose()
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.btnGenerate = New System.Windows.Forms.Button
        Me.txtResult = New System.Windows.Forms.TextBox
        Me.cboCodeGenList = New System.Windows.Forms.ComboBox
        Me.chkShowSource = New System.Windows.Forms.CheckBox
        Me.SuspendLayout()
        '
        'btnGenerate
        '
        Me.btnGenerate.Location = New System.Drawing.Point(306, 26)
        Me.btnGenerate.Name = "btnGenerate"
        Me.btnGenerate.Size = New System.Drawing.Size(75, 23)
        Me.btnGenerate.TabIndex = 0
        Me.btnGenerate.Text = "Generate"
        Me.btnGenerate.UseVisualStyleBackColor = True
        '
        'txtResult
        '
        Me.txtResult.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                    Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.txtResult.Location = New System.Drawing.Point(12, 55)
        Me.txtResult.Multiline = True
        Me.txtResult.Name = "txtResult"
        Me.txtResult.ScrollBars = System.Windows.Forms.ScrollBars.Vertical
        Me.txtResult.Size = New System.Drawing.Size(369, 344)
        Me.txtResult.TabIndex = 1
        '
        'cboCodeGenList
        '
        Me.cboCodeGenList.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.cboCodeGenList.FormattingEnabled = True
        Me.cboCodeGenList.Location = New System.Drawing.Point(12, 28)
        Me.cboCodeGenList.Name = "cboCodeGenList"
        Me.cboCodeGenList.Size = New System.Drawing.Size(288, 21)
        Me.cboCodeGenList.TabIndex = 2
        '
        'chkShowSource
        '
        Me.chkShowSource.AutoSize = True
        Me.chkShowSource.Location = New System.Drawing.Point(12, 5)
        Me.chkShowSource.Name = "chkShowSource"
        Me.chkShowSource.Size = New System.Drawing.Size(209, 17)
        Me.chkShowSource.TabIndex = 3
        Me.chkShowSource.Text = "Show source XML only (for debugging)"
        Me.chkShowSource.UseVisualStyleBackColor = True
        '
        'MainForm
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(393, 411)
        Me.Controls.Add(Me.chkShowSource)
        Me.Controls.Add(Me.cboCodeGenList)
        Me.Controls.Add(Me.txtResult)
        Me.Controls.Add(Me.btnGenerate)
        Me.Name = "MainForm"
        Me.Text = "Profiles CodeGen"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents btnGenerate As System.Windows.Forms.Button
    Friend WithEvents txtResult As System.Windows.Forms.TextBox
    Friend WithEvents cboCodeGenList As System.Windows.Forms.ComboBox
    Friend WithEvents chkShowSource As System.Windows.Forms.CheckBox
End Class
