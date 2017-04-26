function [ Psi ] = GetPsiFromElcut(CoerPower)
    % �������� �������� Psi ��� 1 ���� ��� ���� ����� � ����� 5
    
    
    InterfaceELCUT.Engine.SetTokToFaza(1, 0, true);
    InterfaceELCUT.Engine.SetTokToFaza(2, 0, true);
    InterfaceELCUT.Engine.SetTokToFaza(3, 0, true);
    InterfaceELCUT.Engine.EnableMagn(true, CoerPower);
    
    Psi = zeros(1, 78);
    for i = 1:78
        InterfaceELCUT.Engine.RotateMagn((i-4)*5*pi/180); %��������� ���� 179 ��������
        InterfaceELCUT.Engine.Solve();
        Psi(i) = double(InterfaceELCUT.Engine.GetPsi(1));
    end;
    
    save('Psi.mat', 'Psi');
end