function Vec = closest( U, p, temp, max )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[m, n] = size(temp);
h = max;
Vec = [];
min = max;
p(1) = round(p(1));
p(2) = round(p(2));
if(p(1)<min+1) 
    min = p(1)-1;
end
if(p(1)+max>m)
    max = m - p(1);
end
for i = p(1)-min:p(1)+max;
    if(temp(i, p(2) - 1)) 
        Vec = horzcat(Vec, [i, p(2) - 1]);
    end
    if(temp(i, p(2) + 1)) 
        Vec = horzcat(Vec, [i, p(2) + 1]);
    end
    if(temp(i, p(2))) 
        if(i ~= p(2))
            Vec = horzcat(Vec, [i, p(2)]);
        end
    end
end
min = h; 
max = h;
if(p(2)<min+1) 
    min = p(1)-1;
end
if(p(2)+max>m)
    max = m - p(1);
end
for i = p(2)-min:p(2)-1;
    if(temp(p(1) - 1, i)) 
        Vec = horzcat(Vec, [p(1) - 1, i]);
    end
    if(temp(p(1) + 1, i)) 
        Vec = horzcat(Vec, [p(1) + 1, i]);
    end
    if(temp(p(1), i)) 
        Vec = horzcat(Vec, [p(1), i]);
    end
end
for i = p(2)+1:p(2)+max;
    if(temp(p(1) - 1, i)) 
        Vec = horzcat(Vec, [p(1) - 1, i]);
    end
    if(temp(p(1) + 1, i)) 
        Vec = horzcat(Vec, [p(1) + 1, i]);
    end
    if(temp(p(1), i)) 
        Vec = horzcat(Vec, [p(1), i]);
    end
end
    
end

