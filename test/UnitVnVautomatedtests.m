clear all; clc; close all; 

% Theses are the tests for the system VnV (k,N,P)
Table4cases = [ 0.6 100 2 
                ;0.1 120 2
                ;0.9 100 2
                ;0.88 130 2
                ; 0.99 150 4
                ; 0.65 200 2
                ; 0.4 100 2
                ; 0.8 200 4
                ; 0.9 200 4
                ; 0.2 200 4
                ; 0.3 200 4
                ; 0.8 100 4
                ; 0.89 150 4
                ; 0.69 200 4
                ; 0.55 200 2
                ; 0.9 200 4
                ] ; 
 Table5cases = [ 0.9 100 2 
                ;0.99 120 2
                ;0.999 200 2
                ;0.9999 100 2
                ;0.99999 150 4
                ;0.01 120 2
                ;0.001 200 4
                ;0.00001 100 2
                ;0.000001 150 4
                ] ;
 
 
%This is for testInParams-N, testInParams-P, testInParams-k
 for i=1:length(Table4cases(:,1))
     [tmp1,tmp2,tmp3,inp]=SpectralProgramtest2(Table4cases(i,:)) ;
     a=0;
    try
        % asserting that number of eigenvalues is correct
        assert(inp.k==Table4cases(i,1));
    catch e 
        %e is an MException struct
        a=1;
        fprintf('k does not match inputted k \n')
    end
    
    try
        % asserting that number of eigenvalues is correct
        assert(inp.N==Table4cases(i,2));
    catch e 
        %e is an MException struct
        a=1;
        fprintf('N does not match inputted N \n')
    end
    
    try
        % asserting that number of eigenvalues is correct
        assert(inp.P==Table4cases(i,3));
    catch e 
        %e is an MException struct
        a=1;
        fprintf('P does not match inputted P \n')
    end
    
    if (a==0)
        fprintf('Test Passed \n')
    end
    
 end  
 
 % test-NumParams-Dom , test-NumParams-EllipMat 
 for i=1:length(Table4cases(:,1))
     [tmp1,tmp2,tmp3,inp]=SpectralProgramtest2(Table4cases(i,:)) ;
     a=0;
    try
        % asserting that number of eigenvalues is correct
        assert(tmp1{1}==tmp1{2}(end) & -tmp1{1}==tmp1{7}(1) );
    catch e 
        %e is an MException struct
        a=1;
        fprintf('Domain and xend are off \n')
    end
    
    try
        % asserting that number of eigenvalues is correct
        assert(tmp1{4}(2,2)== (-inp.k)*tmp1{8}(2) & tmp1{5}(2,2)==(-1)*tmp1{9}(2));
    catch e 
        %e is an MException struct
        a=1;
        fprintf('The elip matrices were not created correctly\n')
    end
    
    if (a==0)
        fprintf('Test Passed \n')
    end
    
 end  
 
 % test-SpecMAT-Tr1
 for i=1:length(Table4cases(:,1))
     [tmp1,tmp2,tmp3,inp]=SpectralProgramtest2(Table4cases(i,:)) ; 
     if (isequal(tmp3{7},(-1)*tmp3{7}')) 
         fprintf('Test Passed \n')
     else
         fprintf('Test Failed: The Spectral Matrices are Incorrect \n') 
     end
 end
 
% test-NumParams-Dom-Bound
  for i=1:length(Table5cases(:,1))
     [tmp1,tmp2,tmp3,inp]=SpectralProgramtest2(Table5cases(i,:)) ;
     a=0;
    try
        % asserting that number of eigenvalues is correct
        assert(tmp1{1}==tmp1{2}(end) & -tmp1{1}==tmp1{7}(1) );
    catch e 
        % e is an MException struct
        a=1;
        fprintf('Domain and xend are off in boundary analysis \n')
    end
    
    if (a==0)
        fprintf('Test Passed \n')
    end
    
  end
    
