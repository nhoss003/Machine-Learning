function z = randomPartC(m,d)
mu = zeros(1,d);
sigma = eye(d);
sigma(sigma==0)=0.8;
R = chol(sigma);
z = repmat(mu,m,1) + randn(m,d)*R;