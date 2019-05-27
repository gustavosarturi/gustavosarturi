function Jacobi(A, XO, b; max_tol = 10^(-8), max_it = 1000)
    n = length(XO)
    x = zeros(n)
    stop = false
    it = 1
    while it < max_it && stop == false
        for i=1:n
            sum = 0
            for j=1:n
                if j!= i
                    sum += A[i,j] * XO[j]/A[i,i]
                end
                x[i] = (b[i]/A[i,i]) - sum
            end
        end

        if norm(XO-x,Inf)/norm(x) < max_tol
            return x, XO, it
        end
        XO = x
        it += 1
    end

    error("Falha!")
end               

using LinearAlgebra
A = [10 -1 2 0; -1 11 -1 3; 2 -1 10 -4; 0 3 -1 8]
b = [6; 25; -11; 15]
x = [0; 0; 0; 0]

Jacobi(A, x, b)
