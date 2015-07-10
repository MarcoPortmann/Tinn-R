{
  Delphi Scintilla Interface Components
  Copyright (C) 2004-2008 Jan Martin Pettersen (hdalis)

  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later
  version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free
  Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
  02111-1307 USA
}
{
  Author: hdalis (myarmor@users.sourceforge.net)
     $Id: $
  Purpose: Languageresources for the runtime package.
  History: 23/11/2004 Initial Release

           Quite a lot of changes since then 
}
{----$Include SciCommonDef.Inc}
unit SciResLang;
interface
uses Graphics;
const
  CrLf=#13#10;
  CrLf2=#13#10#13#10;
  //Default colors
  cDefaultHotspotFore=clBlue;
  cDefaultHotspotBack=clDefault;
  cDefaultCaretFore=clBlack;
  cDefaultCaretBack=$eeeeee;
  cDefaultEdgeColor=clSilver;
  cDefaultSelectFore=clHighlightText;
  cDefaultSelectBack=clHighlight;
  cDefaultForeColor=clWindowText;
  cDefaultBackColor=clWindow;
  cDefaultMarkerFore=clBlue;
  cDefaultMarkerBack=clAqua;
  cDefaultFoldMarginHighlightColor=clBtnFace;
  cDefaultFoldMarginColor=clBtnFace;

resourcestring
//Errors
  eEditorPropertyNotAssigned='Editor property is not assigned for %s';
  eEditorIsNotTScintilla='Editor isn''t TScintilla or derived.';
  eConversionErrorMsg='Conversion error on line %d. Ignoring line.';
  eCouldntLoadFromFile='Could''nt load from the file "%s"';
  eCouldntWriteToFile='Could''nt write to the file "%s"';
  eSciLexerNotFound='"SciLexer.DLL" wasn''t found. Please make sure is located on the System Path.'+CrLf+CrLf+'If you don''t have the file, you can obtain it precompiled at http://delphisci.sourceforge.net'+CrLf+'or you can go to http://www.scintilla.org and obtain the source there, and compile it yourself.';
  eObjectsNotSupportedForLines='Object handling functions/properties are not supported by the Lines property.'#13#10'It is merely an easy interface for setting/getting text from the scintilla control,'#13#10'and not a full TStrings object.';
  eNoStartOrEndCommentDefined='No Start or End comment style defined. See the Comment* properties for this language.';
  eNoStartMiddleOrEndCommentDefined='No Start/Middle or End comment style defined. See the Comment* properties for this language.';
  eNoOneLineCommentDefined='No one line comment style defined. See the Comment* properties for this language.';
  eCouldntCopyLangTo='Couldn''t copy %s to %s';
  eCouldntAddTheLanguage='Couldn''t add the language.';
  eCantRemoveLanguage='Can''t remove the container lexer/language';
  eCantCopyLanguage='Can''t copy the container lexer/language!';
  eErrorLineNotFollowed='Line %d ends with a ''\'' but isn''t followed by any line.';
  eTheseWhereTheErrors='These errors was found while processing "%s":'+CrLf2;
  eStreamClassUnassigned='No class is assigned to StreamClass.'+CrLf+'Assign a class derived from TSciStreamBase,'+CrLf+'or use the TSciStreamDefault class in SciStreamDefault.Pas.';
  eNoStreamer='The Streamer is nil.. Unassigned StreamClass property or Can''t create the class.'+CrLf+'Can''t use the Save* or Load* functions!';
  eNoLanguageManager='No LanguageManager is assigned. Aborted.';
// Common
  sError='Error';
  sConfirmation='Confirm';
  sTrue='True';
  sFalse='False';
  sYes='Yes';
  sUntitled = 'Untitled';
  sReload='The file has been changed by an external program, but you have unsaved changed.. '+CrLf+'Really reload "%s"?';
// SciLanguageManager
  sLMKeywords='Keywords';
  sLMStyle='Style';
  sLMStyles='Styles';

// SciLanguageManager, TSciPropertyMgr
  sLMLanguage='Language';

// SciConfirmReplaceDlg
  SAskReplaceText = 'Replace this occurence of "%s"?';


// EdOptionsWin
  sSetByCodeOnly='SET BY CODE ONLY!';
  sSeeTheHelp='See the help.';
  sNewStyle='New Style';
  sNewKeyList='New Key List';
  sCopyLanguageQueryTitle='Copy Language ''%s''';
  sNameOfNewLanguage='Name of the new language';

// sciKeyBindings

  sKeyNoCommand='No Command';
  sKeyClear='Clear';
  sKeyCopy='Copy';
  sKeyCut='Cut';
  sKeyPaste='Paste';
  sKeyZoomIn='Zoom in';
  sKeyZoomOut='Zoom out';
  sKeyZoomReset='Reset Zoom';
  sKeySelectAll='Select All';
  sKeyUndo='Undo';
  sKeyRedo='Redo';
  sKeyLineDown='Line Down';
  sKeyLineUp='Line Up';
  sKeyLineDownExtend='Line Down Extend';
  sKeyLineUpExtend='Line Up Extend';
  sKeyLineDownRectExtend='Line Down Rect Extend';
  sKeyLineUpRectExtend='Line Up Rect Extend';
  sKeyLineScrollDown='Line Scroll Down';
  sKeyLineScrollUp='Line Scroll Up';
  sKeyLineParaDown='Line Para Down';
  sKeyLineParaUp='Line Para Up';
  sKeyLineParaDownExtend='Line Para Down Extend';
  sKeyLineParaUpExtend='Line Para Up Extend';
  sKeyCharLeft='Char Left';
  sKeyCharRight='Char Right';
  sKeyCharLeftExtend='Char Left Extend';
  sKeyCharRightExtend='Char Right Extend';
  sKeyCharLeftRectExtend='Char Left Rect Extend';
  sKeyCharRightRectExtend='Char Right Rect Extend';
  sKeyWordLeft='Word Left';
  sKeyWordRight='Word Right';
  sKeyWordLeftExtend='Word Left Extend';
  sKeyWordRightExtend='Word Right Extend';
  sKeyWordLeftEnd='Word Left End';
  sKeyWordRightEnd='Word Right End';
  sKeyWordLeftEndExtend='Word Left End Extend';
  sKeyWordRightEndExtend='Word Right End Extend';
  sKeyWordPartLeft='Word Part Left';
  sKeyWordPartRight='Word Part Right';
  sKeyWordPartLeftExtend='Word Part Left Extend';
  sKeyWordPartRightExtend='Word Part Right Extend';
  sKeyHome='Home';
  sKeyHomeExtend='Home Extend';
  sKeyHomeRectExtend='Home Rect Extend';
  sKeyHomeDisplay='Home Display';
  sKeyHomeDisplayExtend='Home Display Extend';
  sKeyHomeWrap='Home Wrap';
  sKeyHomeWrapExtend='Home Wrap Extend';
  sKeyVCHome='VC Home';
  sKeyVCHomeExtend='VC Home Extend';
  sKeyVCHomeRectExtend='VC Home Rect Extend';
  sKeyVCHomeWrap='VC Home Wrap';
  sKeyVCHomeWrapExtend='VC Home Wrap Extend';
  sKeyLineEnd='Line End';
  sKeyLineEndExtend='Line End Extend';
  sKeyLineEndRectExtend='Line End Rect Extend';
  sKeyLineEndDisplay='Line End Display';
  sKeyLineEndDisplayExtend='Line End Display Extend';
  sKeyLineEndWrap='Line End Wrap';
  sKeyLineEndWrapExtend='Line End Wrap Extend';
  sKeyDocumentStart='Document Start';
  sKeyDocumentEnd='Document End';
  sKeyDocumentStartExtend='Document Start Extend';
  sKeyDocumentEndExtend='Document End Extend';
  sKeyPageUp='Page Up';
  sKeyPageUpExtend='Page Up Extend';
  sKeyPageUpRectExtend='Page Up Rect Extend';
  sKeyPageDown='Page Down';
  sKeyPageDownExtend='Page Down Extend';
  sKeyPageDownRectExtend='Page Down Rect Extend';
  sKeyStutteredPageUp='Stuttered Page Up';
  sKeyStutteredPageUpExtend='Stuttered Page Up Extend';
  sKeyStutteredPageDown='Stuttered Page Down';
  sKeyStutteredPageDownExtend='Stuttered Page Down Extend';
  sKeyDeleteBack='Delete Back';
  sKeyDeleteBackNotLine='Delete Back Not Line';
  sKeyDeleteWordLeft='Delete Word Left';
  sKeyDeleteWordRight='Delete Word Right';
	sKeyDeleteWordRightEnd='Delete Word Right to End';
  sKeyDeleteLineLeft='Delete Line Left';
  sKeyDeleteLineRight='Delete Line Right';
  sKeyDeleteLine='Delete Line';
  sKeyToggleSticky='Toggle Sticky Caret';
  sKeyLineCut='Line Cut';
  sKeyLineCopy='Line Copy';
  sKeyLineTranspose='Line Transpose';
  sKeyLineDuplicate='Line Duplicate';
  sKeyUpperCase='Upper Case';
  sKeyLowerCase='Lower Case';
  sKeyCancel='Cancel';
  sKeyToggleOvertype='Toggle Overtype';
  sKeyNewLine='New Line';
  sKeyFormFeed='Form Feed';
  sKeyTab='Tab';
  sKeyBackTab='Back Tab';
  sSelectionDuplicate='Duplicate Selection';
  sNoKey='No Key';

// sciPrint.pas
  sPageNo='Page %d';

//Properties
//spropLexerLibraryCategory='LexerLibraries';
  sWhileLoading='While loading "%s":'#13#10;
  spropLexerLib='Lib';
  spropNot='not';
  spropStyle='style';
  spropFore='fore';
  spropBack='back';
  spropSize='size';
  spropFont='font';
  spropBold='bold';
  spropItalics='italics';
  spropUnderlined='underlined';
  spropVisible='visible';
  spropEolFilled='eolfilled';
  spropChangeable='changeable';
  spropHotspot='hotspot';
  spropCase='case';
  spropName='name';
  spropCommentBoxStart='CommentBoxStart';
  spropCommentBoxEnd='CommentBoxEnd';
  spropCommentBoxMiddle='CommentBoxMiddle';
  spropCommentBlock='CommentBlock';
  spropCommentStreamStart='CommentStreamStart';
  spropCommentStreamEnd='CommentStreamEnd';
  spropNumStyleBits='NumStyleBits';
  spropAssignmentOperator='AssignmentOperator';
  spropEndOfStatementOperator='EndOfStatementOperator';
  spropDefault='default';
  spropWordWrap='WordWrap';
  spropWordChars='WordChars';
  spropClearUndoAfterSave='ClearUndoAfterSave';
  spropCaretFore='CaretFore';
  spropCaretBack='CaretBack';
  spropCaretLineVisible='CaretLineVisible';
  spropCaretPeriod='CaretPeriod';
  spropCaretWidth='CaretWidth';
  spropCaretBackAlpha='CaretAlpha';
  spropEOLMode='EOLMode';
  spropSelectForeColor='SelectForeColor';
  spropSelectBackColor='SelectBackColor';
  spropMarkerForeColor='MarkerForeColor';
  spropMarkerBackColor='MarkerBackColor';
  spropFoldMarginHighlightColor='FoldMarginHighlightColor';
  spropFoldMarginColor='FoldMarginColor';
  spropActiveHotspotForeColor='ActiveHotspotForeColor';
  spropActiveHotspotBackColor='ActiveHotspotBackColor';
  spropActiveHotspotUnderlined='ActiveHotspotUnderlined';
  spropActiveHotspotSingleLine='ActiveHotspotSingleLine';
  spropGutter='Gutter';
  spropLineNumbers='LineNumbers';
  spropEdgeColumn='EdgeColumn';
  spropEdgeMode='EdgeMode';
  spropEdgeColor='EdgeColor';
  spropCodeFolding='CodeFolding';
  spropFoldMarkerType='FoldMarkerType';
  spropLexer='lexer';
  spropKeywords='keywords';
  spropOther='other';
  spropExtension='extension';
  spropEOLStyle='EOLStyle';
  spropWhiteSpaceFore='WhitespaceForeColor';
  spropWhiteSpaceBack='WhitespaceBackColor';
  sLang='Language: ';
  spropStyleBits='StyleBits';
  spropBraceHighlight='BraceHighlight';
  spropLexerPropertiesCategory='LexerProperties';
  spropSelectAlpha='SelectAlpha';
  spropPixMapFile='pixmapfile';
  spropMarkerType='markertype';
  spropMarkerAlpha='Alpha';
  spropMarkerFoldOpen='MarkerFoldOpen';
  spropMarkerFoldClosed='MarkerFoldClosed';
  spropMarkerFoldSub='MarkerFoldSub';
  spropMarkerFoldTail='MarkerFoldTail';
  spropMarkerFoldEnd='MarkerFoldEnd';
  spropMarkerFoldOpenMid='MarkerFoldOpenMid';
  spropMarkerFoldMidTail='MarkerFoldMidTail';
  spropMarkerBookMark='MarkerBookmark';
implementation
end.
