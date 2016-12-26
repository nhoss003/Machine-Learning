function z = randomPartA(m,d)
mu = zeros(1,d);
sigma = eye(d);
R = chol(sigma);
z = repmat(mu,m,1) + randn(m,d)*R;