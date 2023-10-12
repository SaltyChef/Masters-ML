function resultado = createTarget(Q)
matrix = zeros(10, Q);

for (i = 1 : Q)
    if(mod(i,10)==0)
        matrix(10,i)=1;
    else
        matrix(mod(i,10),i) = 1;
    end

end
resultado = matrix;
end