function U = PDHGMp_SIM ( F, rho, theta, sigma )
% That is the PDHGMp denoising alghotithm
% F is the original image, rho and theta are coefficients
% such that their product doesn't exceed 1/9
% and U is the clear image

K = 5000; %K is the maximum number of iterations of the optimizing algorithm
%eps = 1*e-10; % epsilon is a treshold for the conversion criterion

% Initializing U, P1, P2, P1_bar, P2_bar to be zero matrices of the size of
% F
[m, n] = size(F);
U = zeros(m, n);
P1 = zeros(m, n);
P2x = zeros(m, n);
P2y = zeros(m, n);
P1_bar = zeros(m, n);
P2x_bar = zeros(m, n);
P2y_bar = zeros(m, n);
%Set Lx and Ly
Lx = L(m);
Ly = L(n);

%Create the second sphere
Dim = size(F(:),1);
R1 = sqrt((sigma+1)*Dim);
R1
[F1, R2] = Get_Sphere_1S(F, sigma);
R2
U = F1;
return;
[S, R, B] = Get_Intersection_1S(F, R1, F1, R2);
U = S;
return
%I_sect = SIM(F, sigma);
% Algorithm for optimizing;
% At each iteration U, P1, P2, P1_bar and P2_bar are updated until the
% algorithm converges with the approximation of the given threshold epsilon
for k = 1:K
    %First step of the algorithm is updating U
    DP2 = Lx' * P2x_bar + P2y_bar * Ly;
    X = U - (P1_bar + DP2) * rho * theta;
    U = min(max(0, X), 1);
    
    %Second step is projecting (u+p1) - point onto an N-dimensional sphere
    %centered at the input image F with a radius of R 
    %R = sqrt(m*n*sigma);
    V1 = Ball_proj_SIM(U + P1, S, R, B);
    
    %Third step requires adding proximity mapping to our cost function
    %ROF and minimizing it by differentiating at zero
    Gx = P2x + Lx * U;
    Gy = P2y + U * Ly';
    Gr = sqrt(Gx.*Gx + Gy.*Gy);
    V2x = Gx - ((1/theta) * Gx)./max(Gr, 1/theta);
    V2y = Gy - ((1/theta) * Gy)./max(Gr, 1/theta);
    
    %Initializing the dual variables for the next iteration
    P1_prev = P1;
    P2_prev_x = P2x;
    P2_prev_y = P2y;
    P1 = P1 + U - V1;
    P2x = P2x + Lx * U - V2x;
    P2y = P2y + U * Ly' - V2y;
    
    P1_bar = P1 + ( P1 - P1_prev);
    P2x_bar = P2x + ( P2x - P2_prev_x);
    P2y_bar = P2y + ( P2y - P2_prev_y);
    
    
%    Conv = P1-P1_prev;
    
end
end

