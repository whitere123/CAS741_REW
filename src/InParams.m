classdef InParams <handle
    properties 
        % initializing the spectral parameters
        k = 0;
        N = 0;
        P = 0;
    end
    methods
        % Prompts the user to input the three necessary parameters in
        % builing the spectrum
        function obj=Load_Params(obj)
            prompt = 'What is the [k N P] Value (enter as vector in appropriate order ie [0.9 30 4]? ';
            m = input(prompt) ;
            obj.k = m(1);
            obj.N = m(2);
            obj.P = m(3);
        end 
        % Checking to see if the parameters are within their constraints
        function obj=Verify_Params(obj) 
            % k constraint
            if (obj.k>=1 | obj.k<0)
                  ME = MException('AcctError:NoClient', ...
                     'k out of bound.');
                  throw(ME)
                  quit
            end 
             % checking for non numerical input ('X' in documentation)
             if ( (isnumeric(obj.k)==0) | (isnumeric(obj.N)==0) | (isnumeric(obj.P)==0)) 
                  ME = MException('AcctError:NoClient', ...
                 'NonNumeric.');
                 throw(ME)
                  quit
             end 
             % N constraint
             if (obj.N~=round(obj.N) | obj.N<20)
                   ME = MException('AcctError:NoClient', ...
                  'N out of bound.');
                    throw(ME)
                   quit
             end 
             % P constraint
             if (obj.P~=2 & obj.P~=4)
                   ME = MException('AcctError:NoClient', ...
                   'P out of bound.');
                 throw(ME)
               quit
             end 
        end
    end
end