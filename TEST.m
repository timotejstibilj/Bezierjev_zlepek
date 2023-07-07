% Primer risanja kubicnega C^2 Bezierjevega zlepka
% z enakomerno porazdeljenimi delilnimi točkami

p=[1,2,3,4,5; 1,5,0,5,8]'; %interpolacijske tocke
u=(1:size(p, 1))'; % delilne tocke

%tangentna vektorja v zacetni in koncni tocki
v0=[1 0];
vN = [0 -6];

subplot(1,2,1);
kubicni_C2_zlepek(u, p, v0, vN);

% Besselov zlepek
subplot(1,2,2);
kubicni_C2_zlepek(u, p);

%==========================================================
% Prikaz vpliva različnih alfa-parametrizacij na obliko interpolanta,
% pri čemer uporabimo Besselov zlepek

p=[1,2,3,4,2;1,-2,4,6,-5]';

n = size(p, 1); %zahtevano število delilnih točk
dp = p(2:end, 1:2) - p(1:end-1, 1:2);

figure
% enakomerna parametrizacija (alfa=0)
u=(0:n-1)';
kubicni_C2_zlepek(u,p);
pause;
clf;

%centripetalna parametrizacija (alfa=1/2)
u=zeros(n, 1);
for i=2:n
    u(i)=u(i-1)+sqrt(norm(dp(i-1,:)));
end
kubicni_C2_zlepek(u,p,v);
pause;
clf;

% tetivna parametrizacija (alfa=1)
u=zeros(n, 1);
for i=2:n
    u(i)=u(i-1)+norm(dp(i-1));
end
kubicni_C2_zlepek(u,p,v);
