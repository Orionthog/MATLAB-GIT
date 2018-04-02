mat = [];


for i = drange(1:10)
    res = [];
    for j = drange(1:6)
        res = vertcat(res,round(6*rand));
    end
    
    mat = vertcat(mat,res);
    
end

%fprintf('res = %d\n\n', res)