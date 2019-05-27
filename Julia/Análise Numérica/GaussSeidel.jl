using LinearAlgebra
A = [10 -1 2 0; -1 11 -1 3; 2 -1 10 -4; 0 3 -1 8]
b = [6; 25; -11; 15]
x = [0; 0; 0; 0]

Jacobi(A, x, b)

function GaussSeidel(A, XO, b; max_tol = 10^(-8), max_it = 1000)
    n = length(XO)
    x = zeros(n)
    stop = false
    it = 1
    while it < max_it && stop == false
        for i=1:n
            sum = 0
            for j = 1:i-1
                sum += A[i,j] * x[j]
            end
            for j = i+1:n
                sum += A[i,j] * XO[j]
            end
            x[i] = (b[i] - sum)/A[i,i]
        end
        XO = x
        it += 1
    end
    return x, XO, it
end      

GaussSeidel(A, x, b)
