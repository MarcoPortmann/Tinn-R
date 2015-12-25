unit uLaTeX;



interface

uses System.Classes, System.SysUtils, trUtils, DScintilla, Vcl.Dialogs,
     Vcl.Controls, System.IniFiles, Windows;

  procedure InsertLatexSymbol(sciEditor: TDScintilla; sSymbol: string; iCaretControl: integer);
  procedure LatexAccents_Sub(sciEditor: TDScintilla; sAccent: string);
  procedure LatexAlgebricFrac(sciEditor: TDScintilla);
  procedure LatexAlgebricSqrt(sciEditor: TDScintilla);
  procedure LatexAlgebricSqrtN(sciEditor: TDScintilla);
  procedure LatexDimensional(sciEditor: TDScintilla);
  procedure LatexFontSize_Sub(sciEditor: TDScintilla; Tag: Integer);
  procedure LatexFormat_Sub(sciEditor: TDScintilla; Tag: Integer);
  procedure LatexHeader_Sub(sciEditor: TDScintilla; Tag: Integer);
  procedure LatexFont_Sub(sciEditor: TDScintilla; Tag: Integer);
  procedure LatexMakeIndex(sciEditor: TDScintilla);
  procedure InsertLatexMath(sciEditor: TDScintilla; sFunction: string; iCaretControl: integer);
  procedure LoadFromIni_LaTeX(ifFile: TIniFile);
  procedure WriteIni_LaTeX(ifFile: TIniFile);

var
   iLatexDimensionalAlign: integer;

implementation


uses ufrmLatexDimensional, ufrmMain, ufrmEditor;

var
    iCols: integer;
    iLatexDimensionalElement: integer;
    iRows: integer;
//    iLatexDimensionalAlign: integer;

  // Latex Dimensional element
procedure LoadFromIni_LaTeX(ifFile: TIniFile);
begin
  with ifFile do
  begin
    iCols := ReadInteger('Latex', 'iCols', 2);
    iLatexDimensionalAlign := ReadInteger('Latex',
      'iLatexDimensionalAlign', 0);
    iLatexDimensionalElement := ReadInteger('Latex',
      'iLatexDimensionalElement', 0);
    iRows := ReadInteger('Latex', 'iRows', 2);
  end;
end;

procedure WriteIni_LaTeX(ifFile: TIniFile);
begin
  with ifFile do
  begin
    WriteInteger('Latex', 'iCols', iCols);
    WriteInteger('Latex', 'iLatexDimensionalAlign', iLatexDimensionalAlign);
    WriteInteger('Latex', 'iLatexDimensionalElement', iLatexDimensionalElement);
    WriteInteger('Latex', 'iRows', iRows);
  end;
end;

procedure InsertLatexSymbol(sciEditor: TDScintilla; sSymbol: string; iCaretControl: integer);
begin

  with sciEditor do
    if GetSelText <> '' then
      ReplaceSel( sSymbol)
    else
      ReplaceSel( sSymbol);

  SetCaretX(GetCaretX(sciEditor) + iCaretControl,  sciEditor);

  sciEditor.SetFocus;
end;



procedure LatexMakeIndex(sciEditor: TDScintilla);
var
  iPos: integer;

  oldCursor: TCursor;

  sTmpFile, sTmpDir: string;

  wOption: Word;
  edForm: TfrmEditor;
begin

  edForm := (sciEditor.Parent as TfrmEditor);

  sTmpFile := ExtractFileName(edForm.EditorFile.sFile);

  if (lowerCase(ExtractFileExt(sTmpFile)) <> '.tex') then
    Exit;

  iPos := pos('.', sTmpFile);

  sTmpFile := copy(sTmpFile, 0, iPos - 1);

  oldCursor := edForm.Cursor;

  edForm.Cursor := crHourglass;

  frmTinnMain.actFileSaveExecute(frmTinnMain);
  sTmpDir := ExtractFilePath(edForm.EditorFile.sFile);

  try
    SetCurrentDir(sTmpDir);

    if frmTinnMain.actDosMinimizedAlways.Checked then
      wOption := SW_SHOWMINIMIZED
    else
      wOption := SW_RESTORE;

    ExecCmdLineAndWait('makeindex ' + sTmpFile, wOption)
  finally
    edForm.Cursor := oldCursor;
  end;
end;

procedure LatexHeader_Sub(sciEditor: TDScintilla; Tag: Integer);

  procedure InsertLatex(iHeader: integer);
  var
    seEditor: TDScintilla;

    sPrior, sHeader: string;

    i: integer;

  begin

    case iHeader of
      0:
        sHeader := '\part{}';
      1:
        sHeader := '\chapter{}';
      2:
        sHeader := '\section{}';
      3:
        sHeader := '\subsection{}';
      4:
        sHeader := '\subsubsection{}';
      5:
        sHeader := '\paragraph{}';
      6:
        sHeader := '\subparagraph{}';
    end;

    with sciEditor do
    begin
      if GetSelText <> '' then
      begin
        sPrior := GetSelText;
        ReplaceSel( sHeader);
      LineEnd;
        SetCaretX(GetCaretX(seEditor) -1,  seEditor);
        ReplaceSel( sPrior);
      LineEnd;
      end
      else
      begin
        ReplaceSel( sHeader);
      LineEnd;
        SetCaretX(GetCaretX(seEditor) -1,  seEditor);
      end;
    end;
  end;

begin
    InsertLatex(Tag);
end;

procedure LatexFont_Sub(sciEditor: TDScintilla; Tag: Integer);

  procedure InsertLatex(iFont: integer);
  var
    sPrior, sFont: string;

    i: integer;

  begin

    case iFont of
      0:
        sFont := '\emph{}';
      1:
        sFont := '\textbf{}';
      2:
        sFont := '\textit{}';
      3:
        sFont := '\textsl{}';
      4:
        sFont := '\texttt{}';
      5:
        sFont := '\textsc{}';
    end;


    with sciEditor do
    begin
      if GetSelText <> '' then
      begin
        sPrior := GetSelText;
        ReplaceSel( sFont);
        SetCaretX(GetCaretX(sciEditor) -1,  sciEditor);
        ReplaceSel( sPrior);
        SetCaretX(GetCaretX(sciEditor) +1,  sciEditor);
      end
      else
      begin
        ReplaceSel( sFont);
      LineEnd;
      SetCaretX(GetCaretX(sciEditor) -1,  sciEditor);
      end;
      SetFocus;
    end;
  end;

begin
    InsertLatex(Tag);
end;




procedure LatexAccents_Sub(sciEditor: TDScintilla; sAccent: string);
  procedure InsertAccentSimple;
  begin
    with sciEditor do
    begin
      ReplaceSel( sAccent);
      LineEnd;
      SetCaretX(GetCaretX(sciEditor) -1,  sciEditor);
    end;
  end;

  procedure InsertAccent;
  var
    sPrior: string;

  begin
    with sciEditor do
    begin
      if GetSelText <> '' then
      begin
        sPrior := GetSelText;
        ReplaceSel( sAccent);
        SetCaretX(GetCaretX(sciEditor) -1,  sciEditor);
        ReplaceSel( sPrior);
        SetCaretX(GetCaretX(sciEditor) +1,  sciEditor);
      end
      else
        InsertAccentSimple;
    end;

    sciEditor.SetFocus;
  end;

  procedure FormatAccent;
  var
    iPos: integer;
  begin
    sAccent := ChangeFileExt(sAccent, EmptyStr);
    iPos := pos('_', sAccent);
    sAccent := copy(sAccent, iPos + 1, Length(sAccent));
    sAccent := '\' + sAccent + '{}';
  end;

begin
    FormatAccent;
    InsertAccent;
end;

procedure LatexDimensional(sciEditor: TDScintilla);
var
  bcCurPos: Integer;

//  synSearchOptions: TSynSearchOptions;
  dlg: TfrmLatexDimensional;

  sTmp: string;

  function MakeContent(sType: string): string;
  var
    i, j: integer;

    sResult, sLine, sCab, sPrior, sFill: string;

  begin
    case StringToCaseSelect(sType, ['Array', 'Matrix', 'Tabular', 'Tabbing']) of
      0:
        begin // Array
          sPrior := ' ';
          sFill := ' . &';
        end;

      1:
        begin // Matrix
          sPrior := '   ';
          sFill := ' . &';
        end;

      2:
        begin // Tabular
          sPrior := ' ';
          sFill := ' . &';
        end;

      3:
        begin // Tabbing
          sPrior := ' ';
          sCab := ' . \=';
          sFill := ' . \>';

          i := 0;
          repeat
            sLine := sLine + sCab;
            inc(i);
          until (i = iCols - 1);
          sResult := sPrior + sLine + ' . \kill' + #13;
        end;
    end;

    i := 0;
    j := 0;
    sLine := EmptyStr;

    repeat
      if (iCols > 1) then
      begin
        repeat
          sLine := sLine + sFill;
          inc(j);
        until (j = iCols - 1);
        sLine := sPrior + sLine + ' . \\' + #13;
      end
      else
        sLine := '  . \\' + #13;
      sResult := sResult + sLine;
      sLine := EmptyStr;
      inc(i);
      j := 0;
    until (i = iRows);

    Result := (sResult);
  end;

  function MakeFormat(sTmp: string): string;
  var
    sResult: string;

  begin
    repeat
      sResult := sResult + sTmp;
    until (Length(sResult) = iCols);
    Result := (sResult);
  end;

  procedure MakeDimensional(sType: string; iR, iC, iAlign: integer);
  var
    sAlign: string;

  begin
    case iAlign of
      0:
        sAlign := 'l';
      1:
        sAlign := 'c';
      2:
        sAlign := 'r';
    end;

    case StringToCaseSelect(sType, ['Array', 'Matrix', 'Tabular', 'Tabbing']) of
      0:
        begin // Array
          sTmp := '\begin{array}{' + MakeFormat(sAlign) + '}' + #13 +
            MakeContent(sType) + '\end{array}';
        end;
      1:
        begin // Matrix
          sTmp := '\left(' + #13 + '  \begin{array}{' + MakeFormat(sAlign) + '}'
            + #13 + MakeContent(sType) + '  \end{array}' + #13 + '\right)';
        end;
      2:
        begin // Tabular
          sTmp := '\begin{tabular}{' + MakeFormat(sAlign) + '}' + #13 +
            '  \hline' + #13 + MakeContent(sType) + '  \hline' + #13 +
            '\end{tabular}';
        end;
      3:
        begin // Tabbing
          sTmp := '\begin{tabbing}' + #13 + MakeContent(sType) +
            '\end{tabbing}';
        end;
    end;
  end;

begin

  dlg := TfrmLatexDimensional.Create(frmTinnMain);

  with dlg do
  begin
    rdgType.ItemIndex := iLatexDimensionalElement;
    if (iLatexDimensionalElement = 3) then
    begin
      with rdgAlign do
      begin
        Enabled := False;
        ItemIndex := -1;
      end;
    end
    else
    begin
      with rdgAlign do
      begin
        Enabled := True;
        if (iLatexDimensionalAlign < 0) then
          ItemIndex := 1
        else
          ItemIndex := iLatexDimensionalAlign;
      end;
    end;
    edRows.Text := IntToStr(iRows);
    edCols.Text := IntToStr(iCols);
  end;

  try
    if (dlg.ShowModal <> mrOK) then
      Exit;

    iRows := StrToInt(dlg.edRows.Text);
    iCols := StrToInt(dlg.edCols.Text);

    if (iRows <= 0) or (iCols <= 0) then
      Exit;



    bcCurPos := sciEditor.GetSelectionStart;

    iLatexDimensionalAlign := dlg.rdgAlign.ItemIndex;
    iLatexDimensionalElement := dlg.rdgType.ItemIndex;

    case iLatexDimensionalElement of
      0:
        begin // Array
          MakeDimensional('Array', iRows, iCols, iLatexDimensionalAlign);
          with sciEditor do
          begin
            if GetSelText <> '' then
              ReplaceSel( sTmp  )
            else
              ReplaceSel( sTmp);
          end;
        end;

      1:
        begin // Matrix
          MakeDimensional('Matrix', iRows, iCols, iLatexDimensionalAlign);
          with sciEditor do
          begin
            if GetSelText <> '' then
              ReplaceSel( sTmp)
            else
              ReplaceSel( sTmp);
          end;
        end;

      2:
        begin // Tabular
          MakeDimensional('Tabular', iRows, iCols, iLatexDimensionalAlign);
          with sciEditor do
          begin
            if GetSelText <> '' then
              ReplaceSel( sTmp)
            else
              ReplaceSel( sTmp);
          end;
        end;

      3:
        begin // Tabbing
          with sciEditor do
          begin
            MakeDimensional('Tabbing', iRows, iCols, iLatexDimensionalAlign);
            if GetSelText <> '' then
              ReplaceSel( sTmp)
            else
              ReplaceSel( sTmp);
          end;
        end;
    end;
  finally
    FreeAndNil(dlg);
  end;

  with sciEditor do
  begin
    SetCurrentPos(bcCurPos);
    showmessage('sci Latex #034532 SearchEngine');
    exit;
    {
    SearchEngine := SynEditSearch;
    synSearchOptions := [];
    SearchReplace('.', EmptyStr, synSearchOptions);}
  end;
end;


procedure LatexFontSize_Sub(sciEditor: TDScintilla; Tag: Integer);

  procedure InsertLatex(iSize: integer);
  var

    sPrior, sSize: string;
  begin

    case iSize of
      0:
        sSize := '{\tiny {}}';
      1:
        sSize := '{\scriptsize {}}';
      2:
        sSize := '{\footnotesize {}}';
      3:
        sSize := '{\small {}}';
      4:
        sSize := '{\normalsize {}}';
      5:
        sSize := '{\large {}}';
      6:
        sSize := '{\Large {}}';
      7:
        sSize := '{\LARGE {}}';
      8:
        sSize := '{\huge {}}';
      9:
        sSize := '{\Huge {}}';
    end;


    with sciEditor do
    begin
      if GetSelText <> '' then
      begin
        sPrior := GetSelText;
        ReplaceSel( sSize);
  SetCaretX(GetCaretX(sciEditor) -2,  sciEditor);
        ReplaceSel( sPrior);
  SetCaretX(GetCaretX(sciEditor) +2,  sciEditor);
      end
      else
      begin
        ReplaceSel( sSize);
      LineEnd;
  SetCaretX(GetCaretX(sciEditor) -2,  sciEditor);
      end;
    end;
   sciEditor.SetFocus;
   // PostMessage(TWinControl(Self.MDIChildren[i] as TfrmEditor).Handle,
   //   WM_SETFOCUS, 0, 0);
  end;

begin
    InsertLatex(Tag);
end;

procedure LatexFormat_Sub(sciEditor: TDScintilla; Tag: Integer);

  function MakeContent(sType, sPrior: string; iTabWidth: integer): string;
  var
    sTmp, sTab: string;

    function FormatPrior(sPrior, sReplace: string): string;
    begin
      sTmp := sReplace + StringReplace(sPrior, #13#10, #13#10 + sReplace,
        [rfReplaceAll, rfIgnoreCase]);
      Result := sTmp + #13;
    end;

  begin
    repeat
      sTab := sTab + ' ';
    until (Length(sTab) = iTabWidth);

    case StringToCaseSelect(sType, ['Itemization', 'Enumeration', 'Left',
      'Center', 'Right']) of
      0:
        begin // Itemization
          if (sPrior = EmptyStr) then
            Result := sTab + '\item .' + #13#10
          else
            Result := FormatPrior(sPrior, sTab + '\item ');
        end;
      1:
        begin // Enumeration
          if (sPrior = EmptyStr) then
            Result := sTab + '\item .' + #13
          else
            Result := FormatPrior(sPrior, sTab + '\item ');
        end;
      2:
        begin // Left
          if (sPrior = EmptyStr) then
            Result := sTab + #13
          else
            Result := FormatPrior(sPrior, sTab);
        end;
      3:
        begin // Center
          if (sPrior = EmptyStr) then
            Result := sTab + #13
          else
            Result := FormatPrior(sPrior, sTab);
        end;
      4:
        begin // Right
          if (sPrior = EmptyStr) then
            Result := sTab + #13
          else
            Result := FormatPrior(sPrior, sTab);
        end;
    end;
  end;

  function MakeType(sType, sPrior: string; iTabWidth: integer): string;
  begin
    case StringToCaseSelect(sType, ['Itemization', 'Enumeration', 'Left',
      'Center', 'Right']) of
      0:
        begin // Itemization
          Result := '\begin{itemize}' + #13 + MakeContent(sType, sPrior,
            iTabWidth) + '\end{itemize}';
        end;
      1:
        begin // Enumeration
          Result := '\begin{enumerate}' + #13 + MakeContent(sType, sPrior,
            iTabWidth) + '\end{enumerate}';
        end;
      2:
        begin // Left
          Result := '\begin{flushleft}' + #13 + MakeContent(sType, sPrior,
            iTabWidth) + '\end{flushleft}';
        end;
      3:
        begin // Center
          Result := '\begin{center}' + #13 + MakeContent(sType, sPrior,
            iTabWidth) + '\end{center}';
        end;
      4:
        begin // Right
          Result := '\begin{flushright}' + #13 + MakeContent(sType, sPrior,
            iTabWidth) + '\end{flushright}';
        end;
    end;
  end;

  procedure InsertLatex(iType: integer);
  var


    sPrior, sType: string;

    iTabWidth: integer;

   // synSearchOptions: TSynSearchOptions;

  begin

    case iType of
      0:
        sType := 'Itemization';
      1:
        sType := 'Enumeration';
      2:
        sType := 'Left';
      3:
        sType := 'Center';
      4:
        sType := 'Right';
    end;

    with sciEditor do
    begin
      iTabWidth :=  GetTabWidth;
      if GetSelText <> '' then
      begin
        sPrior := GetSelText;
        ReplaceSel( MakeType(sType, sPrior, iTabWidth));
      end
      else
      begin
        ReplaceSel( MakeType(sType, EmptyStr, iTabWidth));
        LineDown;
        GotoLine(LineFromPosition(GetCurrentPos));
    showmessage('sci  #2214532 SearchEngine');
    exit;
   {
        SearchEngine := SynEditSearch;
        synSearchOptions := [];
        SearchReplace('.', EmptyStr, synSearchOptions); }
      end;
    end;

    sciEditor.SetFocus;
    //PostMessage(TWinControl(Self.MDIChildren[i] as TfrmEditor).Handle,
    //  WM_SETFOCUS, 0, 0);
  end;

begin
    InsertLatex(Tag);
end;



procedure LatexAlgebricFrac(sciEditor: TDScintilla);

  function CountStrings(sTmp: string): integer;
  var
    slTmp: TStringList;

  begin
    try
      slTmp := TStringList.Create;
      StrSplit(' ', sTmp, slTmp);
    finally
      Result := slTmp.Count;
      FreeAndNil(slTmp);
    end;
  end;

  function FormatFrac(sTmp: string): string;
  var
    slTmp: TStringList;
    sArg1, sArg2: string;

  begin
    try
      slTmp := TStringList.Create;

      StrSplit(' ', sTmp, slTmp);

      if (slTmp.Count >= 2) then
      begin
        sArg1 := slTmp[0];
        sArg2 := slTmp[1];
      end;
    finally
      FreeAndNil(slTmp);

      Result := '{' + sArg1 + '}' + '{' + sArg2 + '}';
    end;
  end;

begin

  with sciEditor do
    if GetSelText <> '' then
    begin
      if (CountStrings(GetSelText) = 2) then
          InsertLatexMath(sciEditor, '\frac' + FormatFrac(GetSelText), 0)
      else
          InsertLatexMath(sciEditor, '\frac' + FormatFrac(GetSelText), -3);
    end
    else
        InsertLatexMath(sciEditor, '\frac' + FormatFrac(EmptyStr), -3);
end;

procedure LatexAlgebricSqrt(sciEditor: TDScintilla);

  function FormatSqrt(sTmp: string): string;
  begin
    Result := '{' + sTmp + '}';
  end;

begin
  with sciEditor do
    if GetSelText <> '' then
      InsertLatexMath(sciEditor, '\sqrt' + FormatSqrt(GetSelText), 0)
    else
      InsertLatexMath(sciEditor, '\sqrt' + FormatSqrt(EmptyStr), -1);
end;


procedure LatexAlgebricSqrtN(sciEditor: TDScintilla);

  function CountStrings(sTmp: string): integer;
  var
    slTmp: TStringList;

  begin
    try
      slTmp := TStringList.Create;
      StrSplit(' ', sTmp, slTmp);
    finally
      Result := slTmp.Count;
      FreeAndNil(slTmp);
    end;
  end;

  function FormatSqrtN(sTmp: string): string;
  var
    slTmp: TStringList;
    sArg1, sArg2: string;

  begin
    try
      slTmp := TStringList.Create;

      StrSplit(' ', sTmp, slTmp);

      if (slTmp.Count >= 2) then
      begin
        sArg1 := slTmp[0];
        sArg2 := slTmp[1];
      end;
    finally
      FreeAndNil(slTmp);

      Result := '[' + sArg1 + ']' + '{' + sArg2 + '}';
    end;
  end;
begin
  with sciEditor do
  begin
    if GetSelText <> '' then
    begin
      if (CountStrings(GetSelText) = 2) then
        InsertLatexMath(sciEditor, '\sqrt' + FormatSqrtN(GetSelText), 0)
      else
        InsertLatexMath(sciEditor, '\sqrt' + FormatSqrtN(GetSelText), -3);
    end
    else
        InsertLatexMath(sciEditor, '\sqrt' + FormatSqrtN(EmptyStr), -3);
  end;
end;


procedure InsertLatexMath(sciEditor: TDScintilla; sFunction: string; iCaretControl: integer);
begin

  with sciEditor do
    if GetSelText <> '' then
      ReplaceSel( sFunction)
    else
      ReplaceSel( sFunction);

  SetCaretX(GetCaretX(sciEditor) +iCaretControl,  sciEditor);
  sciEditor.SetFocus;
  //PostMessage(TWinControl(Self.MDIChildren[i] as TfrmEditor).Handle,
  //  WM_SETFOCUS, 0, 0);
end;


end.

