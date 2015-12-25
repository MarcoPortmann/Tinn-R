unit uLexerCommands;

interface

uses vcl.dialogs, DScintilla, DScintillaTypes, ufrmMain, ufrmEditor, ufrmRTerm, ufrmTools, uModDados, trUtils, Vcl.Graphics, PerlRegEx, windows, System.SysUtils, SciKeyBindings, trCommon;

  procedure ApplyLexer(iLexerId: Integer; sciEditor: TDScintilla);
  //procedure SetLexer(Editor: TDSCintilla; LanguageString: String);
  procedure SetScintillaProperties(var Editor: TDScintilla);
  procedure SetScintillaKeyStrokes(var Editor: TDScintilla);
  procedure LoopAllEditorsReSetProperties;
  procedure ToggleWrapMode(Editor: TDSCintilla; iWrapStyle: Integer);
  procedure UpdateLexerKeyWords(iSet: Integer);

  var
    iIOSyntax: integer;
    iLogSyntax: integer;

implementation

procedure ApplyLexer(iLexerId: Integer; sciEditor: TDScintilla);

  procedure SetColors(const iStyle: Integer; const iFore: Integer;
    const iBack: TColor = clWindow; const bBold: Boolean = False;
    const bItalic: Boolean = False; const bUnderline: Boolean = False;
    const sFont: string = 'Courier New'; const iSize: Integer = 10);
  begin
  with sciEditor do
  begin
    StyleSetBack(iStyle, ColorToRGB(iBack));
    StyleSetFore(iStyle, ColorToRGB(iFore));
    StyleSetFont(iStyle, sFont);
    StyleSetSize(iStyle, iSize);
    StyleSetBold(iStyle, bBold);
    StyleSetItalic(iStyle, bItalic);
    StyleSetUnderline(iStyle, bUnderline);
  end;
  end;

begin
with ModDados.cdIdentifiersCurrent do
begin
  Filter := 'LexerId = '+inttostr(iLexerId);
  Filtered := true;
  Refresh;

  sciEditor.SetLexer(iLexerId);
  First;
  while not Eof do
  begin
    if FieldByName('IdentifierType').AsInteger = 1 then
      SetColors(FieldByName('IdentifierId').AsInteger,
                FieldByName('FGColor').AsInteger,
                FieldByName('BGColor').AsInteger,
                (FieldByName('Bold').AsInteger = 1),
                (FieldByName('Italic').AsInteger = 1),
                (FieldByName('Underline').AsInteger = 1),
                FieldByName('FontName').AsString,
                FieldByName('FontSize').AsInteger
               );

    Next;
  end;
end;
end;






procedure SetScintillaKeyStrokes(var Editor: TDScintilla);
var  KeyCommands: TSciKeyCommandCollection;
begin
  with Editor do
  begin

    if FileExists(frmTinnMain.sPathEditor_KeyStrokes) then
    begin
      KeyCommands := TSciKeyCommandCollection.create(Editor);
      if not LoadKeyCommands(KeyCommands, frmTinnMain.sPathEditor_KeyStrokes) then
      begin
        KeyCommands.ResetDefaultCommands;
        SaveKeyCommands(KeyCommands, frmTinnMain.sPathEditor_KeyStrokes);
      end;
      //KeyCommands := frmTinnMain.EditorKeystrokes;
      KeyCommands.Free;
    end;
  end;
end;


procedure SetScintillaProperties(var Editor: TDScintilla);
var i : Integer;
//   KeyCommands: TSciKeyCommandCollection;
begin

  with Editor do
  begin
  with frmTinnMain.ifEditor do
  begin
    Editor.Lines.beginUpdate;

    if (Editor.Parent.ClassName = 'TfrmEditor') then
      ApplyLexer( (Editor.Parent AS TfrmEditor).GetEditorLexerId, Editor)
    else
    begin
      if Editor.Name = 'sciIO' then
        ApplyLexer(iIOSyntax  , Editor);
      if Editor.Name = 'sciLog' then
        ApplyLexer(iLogSyntax  , Editor);
    end;

    SetScintillaKeyStrokes(Editor);

    Editor.SetCodePage(CP_ACP);

    if (frmTinnMain.actLineNumbersVisible.Checked) and (Editor.Parent.ClassName = 'TfrmEditor') then
        Editor.SetMarginWidthN(MARGIN_LINE_NUMBERS, Editor.TextWidth(Editor.MarginGetStyle(Editor.GetLineCount),inttostr(Editor.GetLineCount))+8)
      else  Editor.SetMarginWidthN(MARGIN_LINE_NUMBERS, 0);

    if (Editor.Parent.ClassName = 'TfrmEditor') then
    begin
      Editor.SetProperty('fold', '1');
      Editor.SetProperty('fold.html', '1');
      Editor.SetMarginTypeN(MARGIN_CODE_FOLDING, SC_MARGIN_SYMBOL);
      Editor.SetMarginMaskN(MARGIN_CODE_FOLDING, SC_MASK_FOLDERS);
    end;

    if (frmTinnMain.actFoldingVisible.Checked) and (Editor.Parent.ClassName = 'TfrmEditor') then
       Editor.SetMarginWidthN(MARGIN_CODE_FOLDING, 20)
       else  Editor.SetMarginWidthN(MARGIN_CODE_FOLDING, 0);



    if (Editor.Parent.ClassName = 'TfrmEditor') then
    begin
      Editor.SetMarginTypeN(MARGIN_BOOKMARKS, SC_MARGIN_SYMBOL);
      Editor.SetMarginMaskN(MARGIN_BOOKMARKS, 1023);
      Editor.SetMarginSensitiveN(MARGIN_BOOKMARKS, True);

      for i := 0 to 9 do
        Editor.MarkerDefine(i, SC_MARK_CHARACTER+ord(inttostr(i)[1]));

      Editor.MarkerDefine(SC_MARKNUM_FOLDER, SC_MARK_PLUS);
      Editor.MarkerDefine(SC_MARKNUM_FOLDEROPEN, SC_MARK_MINUS);
      Editor.MarkerDefine(SC_MARKNUM_FOLDEREND, SC_MARK_EMPTY);
      Editor.MarkerDefine(SC_MARKNUM_FOLDERMIDTAIL, SC_MARK_EMPTY);
      Editor.MarkerDefine(SC_MARKNUM_FOLDEROPENMID, SC_MARK_EMPTY);
      Editor.MarkerDefine(SC_MARKNUM_FOLDERSUB, SC_MARK_EMPTY);
      Editor.MarkerDefine(SC_MARKNUM_FOLDERTAIL, SC_MARK_EMPTY);

      Editor.SetMarginSensitiveN(MARGIN_CODE_FOLDING, True);
    end;

    if (frmTinnMain.actMarkersVisible.Checked) and (Editor.Parent.ClassName = 'TfrmEditor') then
      Editor.SetMarginWidthN(MARGIN_BOOKMARKS, 20)
      else   Editor.SetMarginWidthN(MARGIN_BOOKMARKS, 0);



    Editor.SetVirtualSpaceOptions(2);
    Editor.SetUseTabs( (ReadBool('Scintilla', 'TabSpaces',  true) = false)  );
    Editor.SetTabWidth( ReadInteger('Scintilla', 'TabWidth',  2)  );

    UpdateLexerKeyWords(3);

    SetMouseDwellTime(300);

    // Left margin

{    sGutterColor.Brush.Color := WriteInteger('Scintilla', 'MarginColor',     clBtnFace);

    cbGutterFont.Checked := ReadBool('Scintilla', 'MarginUse',          false);
    lblGutterFont.Font.Color := ReadInteger('Scintilla', 'MarginFontColor', clBlack);
    lblGutterFont.Font.Size := ReadInteger('Scintilla', 'MarginFontSize',  8);
    lblGutterFont.Font.Name := WriteString('Scintilla', 'MarginFontName', 'Arial' );

    // Right margin
    eRightEdge.Text := inttostr(ReadInteger('Scintilla', 'RightEdgeColumn', 80));
    sRightEdgeColor.Brush.Color :=  ReadInteger('Scintilla', 'RightEdgeColor',  clGreen);

    // Tab

    eTabWidth.Text := inttostr(ReadInteger('Scintilla', 'TabWidth',  2));


    // Font

    labFont.Font.Color := ReadInteger('Scintilla', 'StdFontColor',   clBlack);
    labFont.Font.Size  := ReadInteger('Scintilla', 'StdFontSize',    10);
    labFont.Font.Name  := ReadInteger('Scintilla', 'StdFontName',    'Courier New');
                                                        }
    // Special Characters
  //  ToogleSpecialChars(ReadBool('Scintilla', 'SpecialChars', false));

  {  ToogleLineNumbers(bOption: Boolean);
    ToogleSpecialChars(bChecked: Boolean); }

  //Editor.StyleSetFore(STYLE_BRACELIGHT, iBraceLightFore);
  //Editor.StyleSetBack(STYLE_BRACELIGHT, iBraceLightBack);
  //Editor.StyleSetFore(STYLE_BRACEBAD, clred);


    Editor.SetCaretLineVisible(frmTinnMain.bHighlightActiveLine);
    Editor.SetCaretLineBack(frmTinnMain.iHighlightActiveLineColor);


    if (Editor.Name <> 'sciIO') and ((Editor.Name <> 'sciLog')) then
      ToggleWrapMode(Editor, frmTinnMain.iEditorLineWrap);

    if (Editor.Name = 'sciIO')  then
      ToggleWrapMode(Editor, frmTinnMain.iIOLineWrap);

    if (Editor.Name = 'sciLog')  then
      ToggleWrapMode(Editor, frmTinnMain.iLogLineWrap);

    Editor.Update;
    Editor.Lines.EndUpdate;
  end;
  end;
end;

procedure LoopAllEditorsReSetProperties;
var
  i: integer;
begin
  if ( frmTinnMain.MDIChildCount > 0) then
    for i := (frmTinnMain.MDIChildCount - 1) downto 0 do
    begin
       SetScintillaProperties((frmTinnMain.MDIChildren[i] as TfrmEditor).sciEditor);
       if Assigned((frmTinnMain.MDIChildren[i] as TfrmEditor).sciEditor2) then
          SetScintillaProperties( (frmTinnMain.MDIChildren[i] as TfrmEditor).sciEditor);
          (frmTinnMain.MDIChildren[i] as TfrmEditor).Repaint;
    end;

  SetScintillaProperties(frmRTerm.SciIO);
  SetScintillaProperties(frmRTerm.SciLog);
end;

procedure ToggleWrapMode(Editor: TDSCintilla; iWrapStyle: Integer);
begin
  Editor.SetWrapMode(iWrapStyle);
  Editor.SetWrapVisualFlags(SC_WRAPVISUALFLAG_START);

  if Editor = frmRTerm.sciIO then
    frmRTerm.pgRtermResize(frmRTerm);
end;


procedure UpdateLexerKeyWords(iSet: Integer);
var
  i: integer;
  KeyWordStringBase, KeyWordStringUser, sWord: String;

  procedure UpdateEditor(seEditor: TDScintilla);
  begin
  with seEditor do
  begin
    SetPunctuationChars(StringReplace(GetPunctuationChars, '.', '', [rfReplaceAll, rfIgnoreCase]));
    if iSet in [1, 3] then
      SetKeyWords(1, KeyWordStringBase);
    if ModDados.cdRUser.Active then
      if iSet in [2, 3] then
        SetKeyWords(2, KeyWordStringUser);
  end;
  end;

begin
TRY
  if iSet in [2, 3] then
  begin


    //if ModDados.cdRUser.Active then
    //if frmTinnMain.bRExplorerActive  then
    with ModDados do
    begin
     sqlConnection.Open;
     sqldsRUser.Active := true;
     sqldsRUser.Refresh;
     cdRUser.Open;
     cdRUser.Refresh;
     cdRUser.First;
     while not cdRUser.Eof do
     begin
       sWord := cdRUser.FieldByName('Name').AsString;

       // if AlphaOnly(sWord) then
        if IsValidRWord(sWord) then
       //if (ansipos(',', sWord)=0) AND (ansipos('.', sWord)=0) AND (ansipos('_', sWord)=0) AND (ansipos('<', sWord)=0) then
         KeyWordStringUser := KeyWordStringUser + ' ' + sWord;
       cdRUser.Next;
     end;
     sqlConnection.Close;
    end;
  end;

  if iSet in [1, 3] then
  begin

    with ModDados do
    begin
      sqlMainBase.Connected := true;
      sqlMainBase.Open;
     // sqlBaseKeywords.Active := true;
      sqlBaseKeywords.Open;
      sqlBaseKeywords.Refresh;

     sqlBaseKeywords.First;
     while not sqlBaseKeywords.Eof do
     begin
       sWord := sqlBaseKeywords.FieldByName('Name').AsString;

        //if AlphaOnly(sWord) then
        if IsValidRWord(sWord) then
       //if (ansipos(',', sWord)=0) AND (ansipos('.', sWord)=0) AND (ansipos('_', sWord)=0) AND (ansipos('<', sWord)=0) then
         KeyWordStringBase := KeyWordStringBase + ' ' + sWord;
       sqlBaseKeywords.Next;
     end;
     sqlMainBase.Close;
    end;
  end;



  if ( frmTinnMain.MDIChildCount > 0) then
    for i := (frmTinnMain.MDIChildCount - 1) downto 0 do
    with    (frmTinnMain.MDIChildren[i] as TfrmEditor) do
    begin
      UpdateEditor(sciEditor);

      if Assigned(sciEditor2) then
         UpdateEditor(sciEditor2);

    end;

  if assigned(frmRTerm) then
    if iIOSyntax = SCLEX_R  then
      UpdateEditor(frmRTerm.sciIO);



               //  if Assigned((frmTinnMain.MDIChildren[i] as TfrmEditor).sciEditor2) then
          //  (frmTinnMain.MDIChildren[i] as TfrmEditor).sciEditor.StyleSetFore(SCE_R_KWORD, clFuchsia);
    {           (frmTinnMain.MDIChildren[i] as TfrmEditor).sciEditor.StyleSetFore(0, clRed);
           (frmTinnMain.MDIChildren[i] as TfrmEditor).sciEditor.SetKeyWords(SCE_R_KWord, KeyWordString);   }
    //       (frmTinnMain.MDIChildren[i] as TfrmEditor).sciEditor.SetKeyWords(1, KeyWordString);
     //        (frmTinnMain.MDIChildren[i] as TfrmEditor).sciEditor.SetKeyWords(2, KeyWordString);
EXCEPT
end;
end;

end.













