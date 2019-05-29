function Gauss_Seidel(A, XO, b; max_tol = 10^(-10), max_it = 1000)
    n = length(XO)
    x = zeros(n)
    it = 1
    while it < max_it
        for i=1:n
            sum = 0
            for j = 1:i-1
                sum += A[i,j] * x[j]
            end
            for j = i+1:n
                sum += A[i,j] * XO[j]
            end
                x[i] = 1/A[i,i] * ((b[i]) - sum)
        end
        
        print("it = ", it, "=", x,"\n")

        if norm(XO-x,Inf)/norm(x, Inf) < max_tol
            return x, XO, it
        end
        XO .= x
        it += 1
    end
    error("Falha")
end
