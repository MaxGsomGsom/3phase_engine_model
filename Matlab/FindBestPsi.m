function result = FindBestPsi()

%������� ���������� ���� ��� ������� ����� ������������
%��������� ���������� ������� ����������� � Excel � ��������� ������
%�� ������� ���������� ������ ����

set_param('ThreeFazAlgorythmNew','StopTime','0.0001')

result=zeros(1, 72);

 for i=1:72
    set_param('ThreeFazAlgorythmNew/CurrentToMoment', 'Phi0', strcat(num2str((i-1)*5),'*pi/180'));
    sim('ThreeFazAlgorythmNew');
    result(i)=logsout.get('M').Values.Data(2);
 end;

set_param('ThreeFazAlgorythmNew','StopTime','2')

end