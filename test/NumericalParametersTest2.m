function NumPars = NumericalParametersTest2(k,N,P)
    
    % Calculating the end points of the intervals 
    xend = P*ellipticK(k^2); 
    len = 2*N-1 ; 
    
    % Storing the period endpoint
	NumPars{1} = xend ; 
   
    % The complete domain is made up of len equal spaced points with 
    % +/- xend as endpoints. The first point of the domain is deleted because
    % the solutions are periodic. Therefore, an endpoint is redundant. 
    Xcomplete = linspace(-xend,xend,len+1) ; 
    X = Xcomplete(2:end);
    NumPars{2} = X ; 
    NumPars{7} = Xcomplete; 
    
    % Calculating the distance between adjacent points in the domain. 
    h = X(2)-X(1); 
    NumPars{3} = h; 
    
    % Finding the elliptic function values at each point in domain.
    [elipsn,elipcn,elipdn] = ellipj(X,k^2) ; 
    NumPars{8} = elipcn ;
    NumPars{9} = elipdn ; 
    % Creating the diagonal matrices with solutions to NLS on boundary as 
    % the diagonal entries.
    A2cn = (-k)*diag(elipcn) ; 
    A2dn = (-1)*diag(elipdn) ; 
    NumPars{4} = A2cn ; 
    NumPars{5} = A2dn ; 
    NumPars{6} = 2*len; 
    
    