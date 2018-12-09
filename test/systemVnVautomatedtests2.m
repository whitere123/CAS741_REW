clear all; clc; close all; 
import matlab.unittest.constraints.IsTrue;
% Theses are the tests for the system VnV (k,N,P)
% Table 2 test cases from system VnV appendix
Table2cases = [ 'a' 'a' 'a' 
                ;'t' 30 2
                ; 'r' 'w' 4
                ; 'a' 100 '9'
                ; 0.5 'X' 2
                ; 0.8 'w' 'o'
                ; 'A' 'X' 4
                ; 'Z' 1000 'P'
                ; 0.99 'z' 'Z'
                ; 0.6 250 'X'] ;

 % test-Rin1NonNumeric
 for i=1:length(Table2cases(:,1))
             a=0;
    try
         SpectralProgramtest2(Table2cases(i,:)) ;
    catch e 
        %e is an MException struct
        fprintf('Test Passed \n') 
        a=1;
    end  
    if (a==0)
        fprintf('Table 2 Test Failed: Program Should have thrown exception \n')
    end
 end  
 
 % Table 3 test cases from system VnV appendix
 Table3cases = [ 1 100 2 
                ;0 100 4
                ;-10 50 2
                ;-55 200 4
                ; 2 150 2
                ; 1.0001 100 2
                ; -0.001 200 4
                ; 1.01 200 2
                ; -0.01 100 4
                ; 0.7 -10 2
                ; 0.9 20 4
                ; 0.9 5 2
                ; 0.7 0 4
                ; 0.5 -1 2
                ; 0.9 100 0
                ; 0.9 500 -2
                ; 0.7 150 -4
                ; 0.5 200 100
                ; 0.7 0.5 100
                ] ;
    % test-Rin1kBounds, test-Rin1NBounds,test-Rin1PBounds        
 for i=1:length(Table3cases(:,1))
             a=0;
    try
       %Error-maker 
        SpectralProgramtest2(Table3cases(i,:)) ;
    catch e 
        %e is an MException struct
        fprintf('Test Passed \n') 
        a=1;
    end  
    if (a==0)
        fprintf('Table 3 Test Failed: Program Should have thrown exception \n')
        Table3cases(i,:)
    end
 end  
 
  Table4cases = [ 0.6 100 2 
                ;0.1 120 2
                ;0.9 300 2
                ;0.88 300 2
                ; 0.99 250 4
                ; 0.65 200 2
                ; 0.4 100 2
                ; 0.8 200 4
                ; 0.9 500 4
                ; 0.2 200 4
                ; 0.3 200 4
                ; 0.8 100 4
                ; 0.89 150 4
                ; 0.69 200 4
                ; 0.55 300 2
                ; 0.9 200 4
                ] ;
 % checking that program runs smoothly with input within constraints
 for i=1:length(Table4cases(:,1))
             a=0;
    try
       %Error-maker 
        [tmp1,tmp2,tmp3,inp]=SpectralProgramtest2(Table4cases(i,:)) ;
    catch e 
        %e is an MException struct
        a=1;
        fprintf('Table 4 Test Failed: Program should not have failed. \n')
    end  
    if (a==0)
        fprintf('Test Passed \n')
    end
 end  
 
 % test-Rin-Rfind
 for i=1:length(Table4cases(:,1))
     [tmp1,tmp2,tmp3,inp]=SpectralProgramtest2(Table4cases(i,:)) ;
             a=0; 
    try
        % asserting that number of eigenvalues is correct

        assert(length(tmp2{2})==tmp1{6});
    catch e 
        %e is an MException struct
        a=1;
        fprintf('Table 4 Test Failed: Incorrect number of eigenvalues \n')
    end  
    if (a==0)
        fprintf('Test Passed \n')
    end
 end  
 
    
