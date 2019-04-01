%function [H, P0] = rotacao(usrRef, usrRotx, usrRoty, usrRotz)
function P0 = rotacao(usrRef, usrRotx, usrRoty, usrRotz)
    %{
    if (usrRef == 'W')
        H = (usrRotx*pi/180)*(usrRoty*pi/180)*(usrRotz*pi/180);
    elseif(usrRef == 'C')
        H = 
    else
    end
    %}
    P = [ [0; 0; 0], [0; 1; 0],  [1; 1; 0], [1; 0; 0], [0; 0; 1], [0; 1; 1], [1; 1; 1], [1; 0; 1]];
    H = rotx(usrRotx*pi/180)*roty(usrRoty*pi/180)*rotz(usrRotz*pi/180)
    P0 = [H*P(:,1), H*P(:,1), H*P(:,1), H*P(:,1), H*P(:,1), H*P(:,1), H*P(:,1), H*P(:,1)]
    %P = [P0(:,1)*H, P0(:,2)*H, P0(:,3)*H, P0(:,4)*H, P0(:,5)*H, P0(:,6)*H, P0(:,7)*H, P0(:,8)*H]
    
end