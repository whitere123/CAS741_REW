classdef InParams <handle
    properties
        k = 0;
        N = 0;
        P = 0;
    end
    methods
        function obj=Load_Params(obj)
            prompt = 'What is the [k N P] Value (enter as vector in appropriate order ie [1 30 4]? ';
            m = input(prompt) ;
            obj.k = m(1);
            obj.N = m(2);
            obj.P = m(3);
        end 
        
        function obj=Verify_Params(obj)
            if (obj.k>=1 | obj.k<0)
                  ME = MException('AcctError:NoClient', ...
                     'k out of bound.');
                  throw(ME)
                  quit
            end 
    
             if ( (isnumeric(obj.k)==0) | (isnumeric(obj.N)==0) | (isnumeric(obj.P)==0)) 
                  ME = MException('AcctError:NoClient', ...
                 'NonNumeric.');
                 throw(ME)
                  quit
             end % A == round(A)
 
             if (obj.N~=round(obj.N) | obj.N<20)
                   ME = MException('AcctError:NoClient', ...
                  'N out of bound.');
                    throw(ME)
                   quit
             end 
    
             if (obj.P~=2 & obj.P~=4)
                   ME = MException('AcctError:NoClient', ...
                   'P out of bound.');
                 throw(ME)
               quit
             end 
        end
    end
end