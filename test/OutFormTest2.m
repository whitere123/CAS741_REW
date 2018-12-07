classdef OutFormTest2 <handle
    properties
        label
        theor
        LAM = 0;
    end
    methods
        function obj=capture(obj,lambda_exact1dn,lambda_exact2dn,lambda_exact1cn,lambda_exact2cn ,lambda)
            obj.theor{1}=[lambda_exact1dn ,lambda_exact2dn]; obj.theor{4} = [lambda_exact1cn ,lambda_exact2cn];
            obj.theor{2}=[lambda_exact1dn ,lambda_exact2dn]; obj.theor{5} = [lambda_exact1cn ,lambda_exact2cn];
            obj.theor{3}=[lambda_exact1dn ,lambda_exact2dn]; obj.theor{6} = [lambda_exact1cn ,lambda_exact2cn]; 
            % Creating Labels for graphs and theoretical eigenvalues
            obj.label{1} = 'Order 8 derivative and dn Boundary Wave Spectrum';
            obj.label{2} = 'Order 10 derivative and dn Boundary Wave Spectrum';
            obj.label{3} = 'Order 12 derivative and dn Boundary Wave Spectrum';
            obj.label{4} = 'Order 8 derivative and cn Boundary Wave Spectrum';
            obj.label{5} = 'Order 10 derivative and cn Boundary Wave Spectrum';
            obj.label{6} = 'Order 12 derivative and cn Boundary Wave Spectrum'; 
            obj.LAM = lambda;
        end 
    end
end