classdef InParamsTest2 <handle
    properties
        k = 0;
        N = 0;
        P = 0;
    end
    methods
        function obj=Load_Params(obj,m1,m2,m3)
            obj.k = m1;
            obj.N = m2;
            obj.P = m3;
        end 
        
        function obj=Verify_Params(obj)
            if (obj.k>=1 | obj.k<=0)
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
 
             if (obj.N~=round(obj.N) | obj.N<=20)
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