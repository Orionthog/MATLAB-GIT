%function [H, P0] = rotacao(usrRef, usrRotx, usrRoty, usrRotz)
function rotacao(usrRef, usrRotx, usrRoty, usrRotz)
    %{
    if (usrRef == 'W')
        H = (usrRotx*pi/180)*(usrRoty*pi/180)*(usrRotz*pi/180);
    elseif(usrRef == 'C')
        H = 
    else
    end
    %}
    
    global H 
    H = rotx(usrRotx*pi/180)*roty(usrRoty*pi/180)*rotz(usrRotz*pi/180)
    global P
    P = [ [0; 0; 0], [0; 1; 0],  [1; 1; 0], [1; 0; 0], [0; 0; 1], [0; 1; 1], [1; 1; 1], [1; 0; 1]];
    
end