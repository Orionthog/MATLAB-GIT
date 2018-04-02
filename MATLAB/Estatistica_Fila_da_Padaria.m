%{
avança 10%  5%  5%  5%
volta  20% 20% 20% 30%
%}

%Variaveis iniciais

frente = [0.1];
tras = [0];
estado = [0];
conv = [];
Xt10 = [];
Xt100 = [];
Xt1000 = [];

simu100 = [];
simu1000 = [];
nome10 = [];
nome100 = [];
nome1000 = [];
nomecurva = [];
reser = [];

%Vetor inicial e Matriz de probabilidade
pi0 = [1,0,0,0,0];
ip = [0.9, 0.1, 0, 0, 0; 0.2, 0.75, 0.05, 0, 0; 0, 0.2, 0.75, 0.05, 0; 0, 0, 0.2,0.75, 0.05; 0, 0, 0, 0.3, 0.7];

pik = ip;
pikk = [];


for j = drange(1:10)
    
    %Inicio da logica do problema
    frente = [0.1];
    tras = [0];
    estado = [0];
    x1 = [];
    simu10 = [];
    
    for i = drange(1:50)
        
        rvai = 1*rand;
        rvem = 1*rand;

        if frente >= rvai
            estado = estado + 1;
            frente = horzcat(0.05);
            tras = horzcat(0.2);
        end

        if tras >= rvem
            estado = estado - 1;
            frente = horzcat(0.05);
            tras = horzcat(0.2);
        end

        if estado == 0
            frente = horzcat(0.1);
            tras = horzcat(0);
        end

        if estado == 4
            frente = horzcat(0);
            tras = horzcat(0.3);
        end
        %Fim da logica do problema

        %Armazena os resultados
        simu10 = vertcat(simu10, estado);
        nome10 = vertcat(nome10, 'simu10  ');
        reser = vertcat(reser, simu10);
        
        
        %Convergencia
        pikk = pik;
        pik = pik*ip;
        %{
        fprintf('norm(pik) = %d\n', norm(pik));
        fprintf('norm(pikk) = %d\n\n', norm(pikk));
        %}
        
        if norm(pik-pikk,'inf')<1e-03
           conv = vertcat(conv,i); 
           %disp(conv);
        end
        
        
        %Plot 1
        x1 = vertcat(1, x1+1);
        grid
        hold on
        title('10 curvas Xk versus k')
        xlabel('k')
        ylabel('Xk')
        plot(x1,simu10);
    end
end
hold off


%Plot distribuiçao 
grid
figure
title('Boxplot de Pik')
boxplot(reser)


%Reseta os nomes para refazer a lógica
nome10 = [];
nome100 = [];
nome1000 = [];

%Simulacao M=10
for k = drange(1:100)
    for j = drange(1:10)

        frente = [0.1];
        tras = [0];
        estado = [0];
        x1 = [];
        simu10 = [];

        for i = drange(1:5)
            rvai = 1*rand;
            rvem = 1*rand;

            if frente >= rvai
                estado = estado + 1;
                frente = horzcat(0.05);
                tras = horzcat(0.2);
            end

            if tras >= rvem
                estado = estado - 1;
                frente = horzcat(0.05);
                tras = horzcat(0.2);
            end

            if estado == 0
                frente = horzcat(0.1);
                tras = horzcat(0);
            end

            if estado == 4
                frente = horzcat(0);
                tras = horzcat(0.3);
            end


            simu10 = vertcat(simu10, estado);



        end

        Xt10 = vertcat(Xt10, estado);
        nome10 = vertcat(nome10, 'M=10  ');
        %disp(Xt)

    end
end

%Simulacao M=100
for k = drange(1:100)
    for j = drange(1:100)

        frente = [0.1];
        tras = [0];
        estado = [0];
        x1 = [];
        simu10 = [];

        for i = drange(1:5)
            rvai = 1*rand;
            rvem = 1*rand;

            if frente >= rvai
                estado = estado + 1;
                frente = horzcat(0.05);
                tras = horzcat(0.2);
            end

            if tras >= rvem
                estado = estado - 1;
                frente = horzcat(0.05);
                tras = horzcat(0.2);
            end

            if estado == 0
                frente = horzcat(0.1);
                tras = horzcat(0);
            end

            if estado == 4
                frente = horzcat(0);
                tras = horzcat(0.3);
            end


            simu10 = vertcat(simu10, estado);



        end

        nome100 = vertcat(nome100, 'M=100 ');
        Xt100 = vertcat(Xt100, estado);
        %disp(Xt)

    end
end

%Simulacao M=1000
for k = drange(1:100)
    for j = drange(1:1000)

        frente = [0.1];
        tras = [0];
        estado = [0];
        x1 = [];
        simu10 = [];

        for i = drange(1:5)
            rvai = 1*rand;
            rvem = 1*rand;

            if frente >= rvai
                estado = estado + 1;
                frente = horzcat(0.05);
                tras = horzcat(0.2);
            end

            if tras >= rvem
                estado = estado - 1;
                frente = horzcat(0.05);
                tras = horzcat(0.2);
            end

            if estado == 0
                frente = horzcat(0.1);
                tras = horzcat(0);
            end

            if estado == 4
                frente = horzcat(0);
                tras = horzcat(0.3);
            end


            simu10 = vertcat(simu10, estado);



        end

        nome1000 = vertcat(nome1000, 'M=1000');
        Xt1000 = vertcat(Xt1000, estado);
        %disp(Xt)

    end
end


%Armazena os resultados para o boxplot
matvalores = vertcat(Xt10,Xt100,Xt1000);
matnomes = vertcat(nome10,nome100,nome1000);

grid
figure
boxplot(matvalores,matnomes);
title('Boxplot Xt')
xlabel('Distribuição para M = 10, M = 100 e M=1000')
ylabel('Xt')


%{

ITEM 6 AINDA BUGADO


espera = [];

for j = drange(1:100)
    
    frente = [0.1];
    tras = [0];
    estado = [0];
    x1 = [];
    simu10 = [];
    
    
    for i = drange(1:5000)
        rvai = 1*rand;
        rvem = 1*rand;

        if frente >= rvai
            estado = estado + 1;
            frente = horzcat(0.05);
            tras = horzcat(0.2);
        end

        if tras >= rvem
            estado = estado - 1;
            frente = horzcat(0.05);
            tras = horzcat(0.2);
        end

        if estado == 0
            frente = horzcat(0.1);
            tras = horzcat(0);
        end

        if estado == 4
            frente = horzcat(0);
            tras = horzcat(0.3);
        end
        
        
        
    end
    
    espera = vertcat(espera, estado);
    
end


comp = [];
fila = [];
tempo = [];
tempochega = [];
temposai = [];
tempomedio= [];

frente = [0.1];
tras = [0];
estado = [espera(1)];
x1 = [];
simu10 = [];

for i = drange(1:200)
    rvai = 1*rand;
    rvem = 1*rand;

    fprintf('estado = %d\n', estado)
    
    tempo = vertcat(0, tempo+1);
    
    if frente >= rvai
        estado = estado + 1;
        frente = horzcat(0.05);
        tras = horzcat(0.2);
        
        tempochega = vertcat(0, tempo+1);
        fila = vertcat(fila, estado);
    end

    if tras >= rvem
        estadoant = estado;
        estado = estado - 1;
        frente = horzcat(0.05);
        tras = horzcat(0.2);
        
        %temposai = vertcat(0, tempo+1);
        %fila = vertcat(fila(2:size(fila)));
        
        comp = vertcat(comp, (tempo(1)-tempochega(1)));
        
        %temposai = vertcat(temposai(2:size(temposai)));
        
        if size(comp)>50
            tempomedio = mean(comp);
            break
        end
    end       
    
    if estado == 0
        frente = horzcat(0.1);
        tras = horzcat(0);
    end

    
    if estado == 4
        frente = horzcat(0);
        tras = horzcat(0.3);
    end

        
    tempo = vertcat(tempo, estado);
    %tempomedio = espera - tempo;
end

%}