% This is the general spectral program for research purposes. 

% Creating Input parameters structure.
inp = InParams;
% Prompting for input
inp.Load_Params;
% Verifying that the input is within data constraints
inp.Verify_Params; 

% Calculating the numerical parameters 
NumPars = NumericalParameters(inp.k,inp.N,inp.P); 

% Calculating the experimental values from Deoconick and segal
lambda_exact1dn = (0.5)*(1 + sqrt(1-(inp.k)^2)); 
lambda_exact2dn = (0.5)*(1 - sqrt(1-(inp.k)^2));
lambda_exact1cn = (0.5)*((inp.k) - sqrt(-1)*sqrt(1-(inp.k)^2)); 
lambda_exact2cn = (0.5)*((inp.k) + sqrt(-1)*sqrt(1-(inp.k)^2)); 

% Creating the spectral matrices. 
A = SpecMat(NumPars); 

% Calculating the spectrum of each matrix.
lambda{1}=eig(A{1}); lambda{2}=eig(A{2}); lambda{3}=eig(A{3}); 
lambda{4}=eig(A{4}); lambda{5}=eig(A{5}); lambda{6}=eig(A{6}); 

% Storing everything 
out1 = OutForm; 
out1.capture(lambda_exact1dn,lambda_exact2dn,lambda_exact1cn,lambda_exact2cn ,lambda); 

% Creating plots
for i=1:6
figure(i)
plot(real(out1.LAM{i}) , imag(out1.LAM{i}) ,'o',real(out1.theor{i}(1)),imag(out1.theor{i}(1)),'*',real(out1.theor{i}(2)),imag(out1.theor{i}(2)),'*') 
title(out1.label{i}) 
end

