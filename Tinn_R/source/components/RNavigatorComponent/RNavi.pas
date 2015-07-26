unit RNavi;

interface

uses
  SysUtils, Classes, Controls, ComCtrls, ExtCtrls,
  vcl.dialogs, DScintilla;

type
  TRNavigator = class(TTreeView)
  private
    FEditor : TDScintilla;
    procedure SetEditor(const value : TDScintilla);
    //procedure UpdateSectionPosition;
    procedure UpdateStructureList;
    function  GetPosition: Integer;
    function IsHeaderLine(iLine: Integer): Boolean;
    procedure Timer1Timer(Sender : TObject);
  protected
    { Protected-Deklarationen }
  public
    { Public-Deklarationen }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure EditorModified(AModificationType, ALinesAdded: Integer);
    function SendToR: String;
    procedure GoToSelected;
    procedure UpdateSectionPosition;
  published
    property SciEditor : TDScintilla read FEditor write SetEditor;
    { Published-Deklarationen }
  end;

procedure Register;


  type
    PStructData = ^TStructData;
    TStructData = record
    Index: Integer;
    Line: Integer;
    parent: TTreeNode;
  end;

  var

  pstruct: array of PStructData;
  struct:  array of TstructData;
  Modif, IncLineOnly: Boolean;
  StartSection: Integer;
  LCount: Integer;
  Timer1: TTimer;
implementation



procedure TRNavigator.SetEditor(const Value : TDScintilla);
begin
  FEditor := Value;

  if FEditor <> nil then
   UpdateStructureList
   else
    self.Items.Clear;
end;


constructor TRNavigator.Create(AOwner: TComponent);
begin
 inherited Create(AOwner);
 Timer1 := TTimer.Create(self);
 Timer1.Enabled:=false;
 Timer1.interval:=1000;
 Timer1.OnTimer:=Timer1Timer;
end;

destructor TRNavigator.Destroy;
begin
  // Release memory, if obtained
  Timer1.Free;
  // Always call the parent destructor after running your own code
  inherited;
end;

procedure Register;
begin
  RegisterComponents('Samples', [TRNavigator]);
end;

function TRNavigator.IsHeaderLine(iLine: Integer): Boolean;
var
    stmp: String;
begin
stmp := trim(FEditor.Lines[iLine]);
 if copy(stmp,1, 1)='#'  then
  if copy(stmp,2, 1)='!'  then
   begin
     Result := true;
     exit;
   end;

 if copy(stmp,1, 2)='{#'  then
   Result := true;
end;



function TRNavigator.GetPosition;
var i, ccpos: Integer;
begin

ccpos:=FEditor.LineFromPosition(FEditor.GetCurrentPos);

Result:=0;

for i := 0 to self.Items.Count - 1 do
  if PstructData(self.Items[i].Data)^.Line<=ccpos then
    Result:=i;
// self.Canvas.TextOut(1,80,inttostr(Result)   );
// self.Canvas.TextOut(1,80,inttostr(random(1000))   );
end;


procedure TRNavigator.Timer1Timer;
begin
  UpdateStructureList;
  Timer1.Enabled:=false;
end;

procedure TRNavigator.UpdateSectionPosition;
var spos: Integer;
begin
  if self.items.count=0 then
   exit;
  spos:=getPosition;
  self.Selected:=self.Items[spos];
end;


procedure TRNavigator.UpdateStructureList;
var
  i, j, noodecount: Integer;
  newname: String;
  tempstruct: TTreeNodes;

  procedure addstructinfo(index, line, pnr: Integer; parent: TTreeNode);
  begin
    setlength(pstruct, pnr+1);
    setlength(struct, pnr+1);
    new(pstruct[pnr]);
    struct[pnr].Index:=index;
    struct[pnr].Line:=line;
    struct[pnr].parent:=parent;
    pstruct[pnr]^ :=struct[pnr];
  end;

  procedure addNode(newname: String; index, line: Integer);
   var k, l, npos: Integer;
      newnode: TTreeNode;
  begin
   for k := 0 to noodecount-1 do
    if PstructData(pstruct[k])^.Index<index then
     begin
      npos:=k;

     end;

   if TempStruct.Count>noodecount then
    begin
    if (TempStruct[noodecount].Text=newname) and (self.items[noodecount].Parent.AbsoluteIndex=npos){(self.Items[noodecount].HasAsParent(self.Items[npos]))} then
      begin
       addstructinfo(index,line, (noodecount), self.Items[npos]);
       TempStruct[noodecount].Data:=pstruct[noodecount];
       noodecount:=noodecount+1;
       exit;
      end else
      begin
       for l := TempStruct.Count-1 downto noodecount do
        TempStruct[l].Delete;
      end;
    end;
      newnode:=TempStruct.AddChild(TempStruct[npos],newname);
      addstructinfo(index, line, (noodecount),TempStruct[npos]);
      newnode.Data:=pstruct[noodecount];
      noodecount:=noodecount+1;
  end;

  procedure evaluate(line: Integer);
  var  str: String;
   index: Integer;
   begin
     str:=trim(FEditor.Lines[line]);
     if (str[1] = '{') and (str[2] = '#') and (str[3] = '!')  then
       str := copy(str, 4, length(str)) else
         str := copy(str, 3, length(str));

    if length(trim(str))>0 then
    if TryStrToInt(str[1], index) then
      newname:=trim(copy(str,2,length(str)))
      else begin
       newname:=trim(str);
       index:=1;
      end else newname:='';
    if newname<>'' then
      AddNode(newname, index, line);
   end;
begin
if FEditor=nil then
 begin
  self.Items.Clear;
  self.Items.AddFirst(nil,'Document');
  exit;
 end;


TempStruct:=self.Items;
if TempStruct.Count=0 then
  TempStruct.AddFirst(nil,'Document');

addstructinfo(0,0,0, nil);
TempStruct[0].Data:=pstruct[0];
noodecount:=1;

for j := 0 to FEditor.Lines.Count-1 do
 begin
   if IsHeaderLine(j) then
     evaluate(j);

 end;

// for i := 0 to length(editor.lines[j])-3 do
//  if (editor.lines[j][i]='#') and (editor.lines[j][i+1]='!') then
//   evaluate(trim(copy(editor.Lines[j],i+2, length(editor.Lines[j]))), j);

 for i := TempStruct.Count - 1 downto noodecount do
   TempStruct[i].Delete;

TempStruct[0].Expand(True);
Modif:=false;
UpdateSectionPosition;
Timer1.Enabled:=false;
end;


procedure TRNavigator.EditorModified(AModificationType, ALinesAdded: Integer);
var i: Integer;
const    ModTypes: array [0..9] of Integer = (17, 18, 290, 321, 417, 418, 450, 4386, 8209, 8210 );

  function ValueIn(Value: Integer; const Values: array of Integer): Boolean;
  var
    I: Integer;
  begin
    Result := False;
    for I := Low(Values) to High(Values) do
      if Value = Values[I] then
      begin
        Result := True;
        Break;
      end;
  end;

begin

  if ValueIn(AModificationType, ModTypes)  then
  begin
    if (ALinesAdded <> 0 ) then
      UpdateStructureList
    else
    begin
      if IsHeaderLine(FEditor.LineFromPosition(FEditor.GetCurrentPos)) then
        begin
          UpdateStructureList;
          exit;
        end;
      for i := 0 to length(struct)-1 do
        if struct[i].Line = FEditor.LineFromPosition(FEditor.GetCurrentPos) then
        begin
          UpdateStructureList;
          exit;
        end;
    end;
  end;

{  8209  17    redo add 321
  undo delete: 290
   delete 8210 18
  undo 417  418 450          }


//   ansipos('#10', AText)

// if AModificationType in [SC_MOD_INSERTTEXT+SC_PERFORMED_USER, SC_MOD_INSERTTEXT+SC_PERFORMED_UNDO, SC_MOD_INSERTTEXT+SC_PERFORMED_REDO] then
//feditor.SetModEventMask(SC_MOD_INSERTTEXT+SC_MOD_DELETETEXT);


//if (AModificationType> 8000) and (AModificationType < 9000) then
//if not odd(AModificationType) then
 //  Memo1.Lines.Add('Insert');
//   Memo1.Lines.Add(inttostr(AModificationType));
 //  Memo1.Lines.Add(Atext);
//   memo1.Lines.Add(inttostr(AModificationType)+'-'+Atext+'>>'+FEditor.Lines[ALine]);
 { else
 begin
   Memo1.Lines.Add('Delete');
   Memo1.Lines.Add(inttostr(AModificationType));
   Memo1.Lines.Add(Atext);
   Memo1.Lines.Add(inttostr(Alength));
   Memo1.Lines.Add(inttostr(ALine));
   Memo1.Lines.Add(inttostr(APosition));

 end}
end;


function TRNavigator.SendToR: String;
var i, istart, iend: Integer;
  NextItem                     : TTreeNode;
  stmp: TStringList;
begin

if FEditor=nil then
 exit;

stmp := TStringList.Create;

i:=0;
repeat
  if self.Items[i].Selected then
    begin
     istart:= FEditor.PositionFromLine(pstructdata(self.Items[i].Data)^.Line);

     NextItem:=self.Items[i].getNextSibling;
     if (NextItem = nil) and (self.Items[i].HasChildren=false) then
      NextItem:=self.Items[i].GetNext;

     if NextItem <> nil then
       begin
        iend:= FEditor.PositionFromLine(pstructdata(NextItem.Data)^.Line-1);
        i:=NextItem.AbsoluteIndex;
       end else
       begin
         iend:=FEditor.GetTextLength;
         i:=self.Items.Count;
       end;

    stmp.Add(FEditor.GetTextRange(istart, iend));

    end else inc(i);

until i>=self.Items.Count;
Result := stmp.Text;

end;






//procedure TForm1.selfDblClick(Sender: TObject);
//begin
//if  self.Selected <> nil then
// Editor.GotoLineAndCenter(pstructdata(self.Selected.Data)^.Line);
//end;


{
procedure TRNavigator.EditorChange;
var noupdateneeded: Boolean;
    ChangeReason: TSynChangeReason;
function HeaderLineInvolved(sec: PInteger; m1: Boolean): Boolean;
  var index, line, i: Integer;

   begin

   line:=FEditor.CaretY-1;

   if m1 then
     line:=line-1;
   //memo1.Lines.Add(FEditor.lines[line]);
   for i := 0 to length(FEditor.lines[line])-3 do
    if (FEditor.lines[line][i]='#') and (FEditor.lines[line][i+1]='!') then
     if TryStrToInt(FEditor.lines[line][i+2], index) then
       begin
        if trim(copy(FEditor.lines[line],i+3,length(FEditor.lines[line])))<>'' then
         Result:=true;
       end
      else begin
       if trim(copy(FEditor.lines[line],i+3,length(FEditor.lines[line])))<>'' then
        Result:=true;
       index:=1;
      end;
    sec^:=GetPosition+1;
   end;
begin

    if FEditor=nil then
     exit;

    

    
    noupdateneeded:=false;
    inclineonly:=false;

   

    ChangeReason:=FEditor.UndoList.LastChangeReason;

    case
    ChangeReason
    of
    crInsert:
      if ((HeaderLineInvolved(@StartSection, false)=false) and (Lcount=0)) then
      noupdateneeded:=true;

     crLineBreak:
      begin
       IncLineOnly:= not HeaderLineInvolved(@StartSection, true);
       if LCount>0 then
         IncLineOnly:=false;

       if IncLineOnly then
         begin
          noupdateneeded:=true;
          UpdateStructureList;
          Timer1.Enabled:=false;
         end;
      end;
      else //Label1.Caption:='unknown case';
    end;

  if not noupdateneeded then
   begin
    Modif:=true;
    Timer1.Enabled:=true;
   end;
end;

procedure TRNavigator.EditorStatusChange(Changes: TSynStatusChanges);
begin
if FEditor=nil then
begin

 exit;
end;

LCount:=FEditor.SelLength;
if  scCaretY in Changes then
 begin
  if Modif then
    UpdateStructureList else
  UpdateSectionPosition;
 end;
end;

function TRNavigator.SendToR: String;
var i, spos, epos: Integer;
  bcPos, bcIniBlock, bcEndBlock: TBufferCoord;
  iLine                        : integer;

  smOption                     : TSynSelectionMode;

  NextItem                     : TTreeNode;

begin

if FEditor=nil then
 exit;

i:=0;
repeat
  if self.Items[i].Selected then
    begin
     spos:= pstructdata(self.Items[i].Data)^.Line;

     NextItem:=self.Items[i].getNextSibling;
     if (NextItem = nil) and (self.Items[i].HasChildren=false) then
      NextItem:=self.Items[i].GetNext;

     if NextItem <> nil then
       begin
        epos:= pstructdata(NextItem.Data)^.Line-1;
        i:=NextItem.AbsoluteIndex;
       end else
       begin
         epos:=FEditor.Lines.Count;
         i:=self.Items.Count;
       end;

    with FEditor do
     begin
      smOption:= SelectionMode;
      if (SelectionMode <> smLine) then SelectionMode:= smLine;
      iLine:= TopLine;
      bcPos:= CaretXY;

      bcIniBlock.char:=1;
      bcIniBlock.Line:=spos+1;

      bcEndBlock.char:=1;
      bcEndBlock.Line:=epos+1;
      if spos=FEditor.Lines.Count-1 then
       begin
        bcEndBlock:=bcIniBlock;
        bcEndBlock.Char:=length(FEditor.Lines[spos]);
       end;
      BlockBegin:= bcIniBlock;
      BlockEnd  := bcEndBlock;
      Result:=FEditor.SelText;
      //CopyToClipboard;

    TopLine      := iLine;
    CaretXY      := bcPos;
    SelectionMode:= smOption;
  end;
     //memo1.PasteFromClipboard;
     
    end else inc(i);

until i>=self.Items.Count;

end;
}


procedure TRNavigator.GoToSelected;
begin
 if  (self.Selected <> nil) and (FEditor <> nil) then
   begin
     with FEditor do
     begin
       GotoLine(pstructdata(self.Selected.Data)^.Line);
       EnsureVisible(pstructdata(self.Selected.Data)^.Line);
       GotoLine(pstructdata(self.Selected.Data)^.Line);
       VerticalCentreCaret;
       SetFocus();
     end;
      //self.Canvas.TextOut(1,100,inttostr(random(1000))   );

   end;
end;

end.
