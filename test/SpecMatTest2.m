function SpecMat = SpecMatTest2(NumPars) 
    % Create a variable that controls which order to output. 
    LEN = length(NumPars{2}) ; 
    
    % Creating Spectral matrix with derivatives accurate within order 8
    % Creating differentiation matrix.
    c = zeros(1,LEN) ; 
    d = zeros(1,LEN) ; 
    c(2) = (-4/5); c(3) = (1/5); c(4) = (-4/105); c(5) = (1/280); 
    c(LEN)= (4/5); c(LEN-1) = (-1/5); c(LEN-2) = (4/105); c(LEN-3) = (-1/280); 
    d = (-1)*c;  
    
    A1 = (1/NumPars{3})*toeplitz(c,d) ; 
    SpecMat{7} = A1;
    % creating dn solution matrix
    A2 = NumPars{5};
    SpecMat{1} = [A1 A2; A2 -A1];   
    % creating cn solution matrix
    A2 = NumPars{4};
    SpecMat{4} = [A1 A2; A2 -A1];
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Spectral matrix with derivatives accurate within order 10 
    % Creating differentiation matrix.
    e = zeros(1,LEN) ; 
    f = zeros(1,LEN) ; 
    e(2) = (-5/6); e(3) = (5/21); e(4) = (-5/84); e(5) = (5/504); e(6) = (-1/1260); 
    e(LEN) = (5/6); e(LEN-1) = (-5/21); e(LEN-2) = (5/84); e(LEN-3) = (-5/504); e(LEN-4) = (1/1260); 
    f = (-1)*e; 
    
    A1 = (1/NumPars{3})*toeplitz(e,f) ; 
    % creating dn solution matrix
    A2 = NumPars{5};
    SpecMat{2} = [A1 A2; A2 -A1];  
    % creating cn solution matrix
    A2 = NumPars{4};
    SpecMat{5} = [A1 A2; A2 -A1];
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Spectral matrix with derivatives accurate within order 12
    % Creating differentiation matrix.
    g = zeros(1,LEN) ; 
    h = zeros(1,LEN) ; 
    g(2) = (-6/7); g(3) = (15/56); g(4) = (-5/63) ; g(5) = (1/56); g(6) = (-1/385); g(7) = (1/5544);
    g(LEN)=(6/7); g(LEN-1)=(-15/56);g(LEN-2)=(5/63); g(LEN-3)=(-1/56); g(LEN-4)=(1/385); g(LEN-5)=(-1/5544); 
    h=(-1)*g; 
    
    A1 = (1/NumPars{3})*toeplitz(g,h) ; 
    % creating dn solution matrix
    A2 = NumPars{5};
    SpecMat{3} = [A1 A2; A2 -A1]; 
    % creating cn solution matrix.
    A2 = NumPars{4};
    SpecMat{6} = [A1 A2; A2 -A1];
    
    
    
    
    
    
    
    