define class Save as CommandButton
    _width = 100
    _height = 50


    procedure init
        this._width = this._width + 100
        this._height = this._height + 50
    endProc

    procedure click
        nodefault
        this._width = this._width * 1.2
        this._height = this._height * 1.2
endDefine