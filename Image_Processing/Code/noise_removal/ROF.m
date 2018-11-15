function M = ROF( F )
    G = Grad(F);
    M = sum(sum(G));
end