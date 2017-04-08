p = source;
q = target;

%function [ R, t ] = svd_rot( p, q, w )
%SVD_ROT Summary of this function goes here
%   Detailed explanation goes here
    
    N = size(p,1);
    d = size(p,2);
    
    if true%nargin == 2
        w = ones(N, 1);
    end
    
    p_ = mean(w.*p, 1);
    p_ = p_ * N / sum(w);
    
    q_ = mean(w.*q, 1);
    q_ = q_ * N / sum(w);
    
    X = p - p_;
    Y = q - q_;
    
    S = X' * diag(w) * Y;

    [U, ~, V] = svd(S);
    
    diagonal = ones(d);
    diagonal(d,d) = det(V * U');
    
    R = V * diagonal * U';
    
    t = q_ - p_*R;
%end

