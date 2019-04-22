function DesenhaCubo(P0)
    global P0
    %%
    %Face de Baixo
    plot3([P0(1,1); P0(1,2)],[P0(2,1); P0(2,2)],[P0(3,1); P0(3,2)], 'r');
    
    hold on
    axis equal;
    grid on;
    xlabel('X','FontSize',18);
    ylabel('Y','FontSize',18);
    zlabel('Z','FontSize',18);
    xlim([-2, 2]);
    ylim([-2, 2]);
    zlim([-2, 2]);
    
    plot3([P0(1,2); P0(1,3)],[P0(2,2); P0(2,3)],[P0(3,2); P0(3,3)], 'k');
    plot3([P0(1,3); P0(1,4)],[P0(2,3); P0(2,4)],[P0(3,3); P0(3,4)], 'k');
    plot3([P0(1,4); P0(1,1)],[P0(2,4); P0(2,1)],[P0(3,4); P0(3,1)], 'b');
    %Face de Cima
    plot3([P0(1,5); P0(1,6)],[P0(2,5); P0(2,6)],[P0(3,5); P0(3,6)], 'k');
    plot3([P0(1,6); P0(1,7)],[P0(2,6); P0(2,7)],[P0(3,6); P0(3,7)], 'k');
    plot3([P0(1,7); P0(1,8)],[P0(2,7); P0(2,8)],[P0(3,7); P0(3,8)], 'k');
    plot3([P0(1,8); P0(1,5)],[P0(2,8); P0(2,5)],[P0(3,8); P0(3,5)], 'k');
    %Linhas Verticais
    plot3([P0(1,1); P0(1,5)],[P0(2,1); P0(2,5)],[P0(3,1); P0(3,5)], 'g');
    plot3([P0(1,2); P0(1,6)],[P0(2,2); P0(2,6)],[P0(3,2); P0(3,6)], 'k');
    plot3([P0(1,3); P0(1,7)],[P0(2,3); P0(2,7)],[P0(3,3); P0(3,7)], 'k');
    plot3([P0(1,4); P0(1,8)],[P0(2,4); P0(2,8)],[P0(3,4); P0(3,8)], 'k');    
    %%
    %Sistema Fixo Mundo
    %Sim, realmente n precisaria plotar toda hora a origem
    plot3([.5; 0],[0; 0],[0; 0], 'y');
    plot3([0; 0],[.5; 0],[0; 0], 'm');
    plot3([0; 0],[0; 0],[.5; 0], 'c');
    
    hold off
end