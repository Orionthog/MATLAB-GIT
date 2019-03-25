function H = rotacao(usrRef, usrRotx, usrRoty, usrRotz)
    if (usrRef == 'W')
        H = (usrRotx*pi/180)*(usrRoty*pi/180)*(usrRotz*pi/180);
    elseif(usrRef == 'C')
        H = 
    else
    end
    
    figure(2)
    hold on
    axis equal;
    grid on;
    xlabel('X','FontSize',18);
    ylabel('Y','FontSize',18);
    zlabel('Z','FontSize',18);
    xlim([-2, 2]);
    ylim([-2, 2]);
    zlim([-2, 2]);
    
    %P1 = H * [P(:,1); 1]

    
end