% This is the general spectral program for research purposes. 

% Creating Input parameters structure.
function [NumPars,lambda,A,inp] = SpectralProgramtest2(m)
    inp = InParamsTest2;
    % Prompting for input
    inp.Load_Params(m(1),m(2),m(3));
    % Verifying that the input is within data constraints
    inp.Verify_Params; 

    % Calculating the numerical parameters 
    NumPars = NumericalParametersTest2(inp.k,inp.N,inp.P); 

    % Calculating the experimental values from Deoconick and segal
    lambda_exact1dn = (0.5)*(1 + sqrt(1-(inp.k)^2)); 
    lambda_exact2dn = (0.5)*(1 - sqrt(1-(inp.k)^2));
    lambda_exact1cn = (0.5)*((inp.k) - sqrt(-1)*sqrt(1-(inp.k)^2)); 
    lambda_exact2cn = (0.5)*((inp.k) + sqrt(-1)*sqrt(1-(inp.k)^2)); 

    % Creating the spectral matrices. 
    A = SpecMatTest2(NumPars); 

    % Calculating the spectrum of each matrix.
    lambda{1}=eig(A{1}); lambda{2}=eig(A{2}); lambda{3}=eig(A{3}); 
    lambda{4}=eig(A{4}); lambda{5}=eig(A{5}); lambda{6}=eig(A{6}); 

    % Storing everything 
    out1 = OutFormTest2; 
    out1.capture(lambda_exact1dn,lambda_exact2dn,lambda_exact1cn,lambda_exact2cn ,lambda); 
    % The plots have been supressed for the tests. The non-test modules
    % will be used to create the plots for the plot based tests. 

