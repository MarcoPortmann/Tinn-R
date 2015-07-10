unit trCommon;

interface


type
  TEditorFile = record
   iId:   Integer;
   sFile: String;
   iNewFile: Integer;
   iModified: Integer;
   iUnsavedChanges: Integer;
   sMarks: String;
   sTempFile: String;
   iTopLine, iCaretPosition: Integer;
   sFolding: String;
   iLexerId: Integer;
   iTabPosition: Integer;
end;

implementation




end.
