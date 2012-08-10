Program Hanoi3_NoRecursion;
Var d     : array[1..3,1..64] of byte; {������ ������ �� ������ �������}
  l       : array[1..3] of byte; {���������� ������ �� ������ �������}
  N,i     : byte; {N�� ����� ���������� ������}
  old,new : shortint; {������ � ����� ��������� ����������� �����}
  delta    : shortint; {��������, ������������ ������� ����������� �����}
Procedure Transfer(i1,i2 : byte); {��������� �������� ����� �� ������� i1 �� �������� i2}
Begin
 l[i2]:=l[i2]+1;
 d[i2,l[i2]]:=d[i1,l[i1]];
 write(i1,' -->(',d[i1,l[i1]],') ',i2,'; ');
 l[i1]:=l[i1]-1;
End;
Begin
 {���� N�� ���������� ������}
 �
 l[1]:=N; {������� ��� ����� �� ������ �������, �� ��������� �������� ������ ���}
 l[2]:=0;
 l[3]:=0;
 for i:=1 to N do
 d[1,i]:=N+1-i; {������ ������� ������, ������� ����� �� ������ �������, ���꠹1�� ����������}
 new:=1; {���������� ���� ����� �� ������ �������}
 if odd(N) then {� ����������� �� ��������N, �������堗 ��� 1 ��� -1}
 delta:=-1
 else
 delta:=1;
 while l[3]<N do {�����������, ���� �� ��� ����� ���������� �� ������ ��������}
 begin
  old:=new;
  new:=((old+2+delta) mod 3)+1; {����� ��������� ����������� ����� ����� ��������� �� ���� �������}
  Transfer(old,new); {��������� ���������� ����}
  i:=6-old-new; {��� ��� old � new�� ������ ���� �� ���� ��������, �� ����� �������� ������� ��������� ��� 1+2+3-old-new}
  if (l[old]>0) and ((l[i]=0) or (d[old,l[old]]<d[i,l[i]])) then {���� �� ����� ������� ��� ������, ��� ������� ���� ������ �������� ����� �� ������ �������, �� ������������� �� ���� ����}
  Transfer(old,i)
  else
  if l[i]>0 then
  Transfer(i,old);
 end;
End.