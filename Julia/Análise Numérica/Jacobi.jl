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
        XO = x
        it += 1
    end
    return x, XO, it
end               
