function Vec = closest(p, temp, max )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[m, n] = size(temp);
h = max;
Vec = [];
min = max;
p(1) = round(p(1));
p(2) = round(p(2));
if(p(1)+max>m)
    max = m - p(1);
end
for i = p(1):p(1)+max;
    if(temp(i, p(2) + 1)) 
        Vec = vertcat(Vec, [i, p(2) + 1]);
    end
    if(temp(i, p(2))) 
        if(i ~= p(2))
            Vec = vertcat(Vec, [i, p(2)]);
        end
    end
end 
max = h;
if(p(2)+max>m)
    max = m - p(2);
end
for i = p(2)+1:p(2)+max;
    if(temp(p(1) + 1, i)) 
        Vec = vertcat(Vec, [p(1) + 1, i]);
    end
    if(temp(p(1), i)) 
        Vec = vertcat(Vec, [p(1), i]);
    end
end
    
end

