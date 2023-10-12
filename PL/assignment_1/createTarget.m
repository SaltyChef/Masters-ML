function resultado = createTarget(Q)
matrix = zeros(10, Q)

for (i = 1 : Q)
    matrix(mod(i,10),i) = 1
end
resultado = matrix
end