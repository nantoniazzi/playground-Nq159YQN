{$MODE DELPHI} 
uses sysutils, classes;

var
   Dict : TStringList;
   I    : Integer;
begin
   Dict := TStringList.Create();
   Dict.Add('Un');
   Dict.Add('Deux');
   Dict.Add('Trois');
   writeln('Deux est en position : ' + IntToStr(Dict.IndexOf('Deux')));
   writeln('A la position 0 il y a : ' + Dict[0]);
   // write content on StdErr
   writeln(StdErr, '--------------');
   write(StdErr, Dict.Text);
   writeln(StdErr, '--------------');
   // write content on StdOut
   for I := 0 to Dict.Count-1 do
      writeln(Dict[i]);
   Dict.Free;
end.
