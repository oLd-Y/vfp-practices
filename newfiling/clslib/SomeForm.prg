DEFINE CLASS frmTest as Form
    Height = 300
    Width = 400
    procedure Init
        this.Height = this.Height * 1.1
        this.Width = this.Width * 1.2
    endproc
ENDDEFINE