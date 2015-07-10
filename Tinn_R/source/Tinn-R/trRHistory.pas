(*
  Tinn is a ASCII file editor primarily intended as a better replacement
  of the default Notepad.exe under Windows.

  This software is distributed under the terms of the GNU General
  Public License, either Version 2, June 1991 or Version 3, June 2007.
  The terms of version 2 and of the license are in a folder called
  doc (licence_gpl2.txt and licence_gpl2.txt)
  which you should have received with this software.

  See http://www.opensource.org/licenses/gpl-license.html or
  http://www.fsf.org/copyleft/gpl.html for further information.

  Copyright
  Russell May - http://www.solarvoid.com

  Tinn-R is an extension of Tinn that provides additional tools to control R
  (http://cran.r-project.org). The project is coordened by Jos� Cl�udio Faria
  (joseclaudio.faria@gmail.com).

  As such, Tinn-R is a feature-rich replacement of the basic script editor
  provided with Rgui. It provides syntax-highlighting, submission of code in
  whole, or line-by-line, and many other useful tools to ease writting and
  debugging of R code.

  Copyright
  Tinn-R team October/2005
  Tinn-R team October/2013

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation; either version 2 and 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*)

(*
  Class    : TRHistory
  Objective: To control the R history working with Rterm
  Version  : v1.0
  Author   : Jos� Cl�udio Faria/UESC/DCET/Brasil (joseclaudio.faria@gmail.com)
  Date     : march/2008
*)

unit trRHistory;

interface

uses Classes, SysUtils, Windows, Messages, Controls;

type
  TRHistory = class

  protected
    aRHistory: array [0 .. 99] of string;
    // it will remember the last 100 instructions sended
    iCur: integer;
    sLatest: string;

    function GetEmpty: integer;
    function GetFirstNoEmpty(sDirection: string): integer;
    procedure Restructure;

  public
    constructor Create;
    destructor Free;
    function GetNext: string;
    function GetPrior: string;
    function LoadFromFile(sPath: string): boolean;
    function SaveToFile(sPath: string): boolean;
    procedure Add(sInstruction: string);
    function ASStringList: String;
  end;

implementation

constructor TRHistory.Create;
begin
end;

destructor TRHistory.Free;
begin
end;

procedure TRHistory.Add(sInstruction: string);
begin
  if trim(GetPrior) = trim(sInstruction) then
    exit;

  iCur := GetEmpty;
  sLatest := 'Add';
  aRHistory[iCur] := sInstruction;
end;

procedure TRHistory.Restructure;
var
  i: integer;

begin
  for i := 0 to 98 do
    aRHistory[i] := aRHistory[i + 1];
  aRHistory[99] := '';
end;

function TRHistory.GetEmpty: integer;
var
  i: integer;

begin
  Result := -1;
  for i := 0 to 99 do
  begin
    if (aRHistory[i] = '') then
    begin
      Result := i;
      Break;
    end;
  end;
  if (Result = -1) then
  begin
    Restructure;
    Result := 99;
  end;
end;

function TRHistory.GetFirstNoEmpty(sDirection: string): integer;
var
  i: integer;

begin
  Result := -1;
  if (sDirection = 'Prior') then
  begin
    for i := 99 downto 0 do
      if (aRHistory[i] <> '') then
      begin
        Result := i;
        Break;
      end;
  end
  else
    for i := 0 to 99 do
      if (aRHistory[i] <> '') then
      begin
        Result := i;
        Break;
      end;
end;

function TRHistory.GetPrior: string;
begin
  if (sLatest <> 'Add') then
    iCur := iCur - 1;
  if (iCur = -1) then
    iCur := GetFirstNoEmpty('Prior');
  if (iCur < 0) then
    Exit;
  sLatest := 'Prior';
  Result := aRHistory[iCur];
end;

function TRHistory.GetNext: string;
begin
  case iCur of
    0 .. 98:
      iCur := iCur + 1;
    99:
      iCur := 0;
  end;
  if aRHistory[iCur] = '' then
    iCur := GetFirstNoEmpty('Next');
  if (iCur < 0) then
    Exit;
  sLatest := 'Next';
  Result := aRHistory[iCur];
end;

function TRHistory.SaveToFile(sPath: string): boolean;
var
  tfTmp: TextFile;
  i: integer;

begin
  try
    AssignFile(tfTmp, sPath);
    ReWrite(tfTmp);
    for i := 0 to 99 do
    begin
      if (aRHistory[i] <> '') then
        WriteLn(tfTmp, aRHistory[i]);
    end;
    Flush(tfTmp);
    CloseFile(tfTmp);
    Result := True;
  except
    raise;
    Exit;
  end;
end;

function TRHistory.LoadFromFile(sPath: string): boolean;
var
  tfTmp: TextFile;
  sTmp: string;

begin
  try
    AssignFile(tfTmp, sPath);
    Reset(tfTmp);
    while not EOF(tfTmp) do
    begin
      ReadLn(tfTmp, sTmp);
      Add(sTmp);
    end;
    CloseFile(tfTmp);
    Result := True;
  except
    raise;
    Exit;
  end;
end;

function TRHistory.ASStringList;
var i: Integer;
begin
  Result := '';
  for i := 99 downto 0 do
    if (aRHistory[i] <> '') then
    begin
      if Result <> '' then
        Result := Result + #16 + aRHistory[i] else
          Result := aRHistory[i];
    end;
end;

end.
