% Primer risanja kubicnega C^2 Bezierjevega zlepka
% z enakomerno porazdeljenimi delilnimi točkami

p=[1,2,3, 4, 5, 6; 1, 5, 0, 3, 0, 6]'; %interpolacijske tocke
u=(1:size(p, 1))'; % delilne tocke

%tangentna vektorja v zacetni in koncni tocki
v0=[1 0];
vN = [-0.5 -1];

subplot(1,2,1);
title("podana v0 in vN")

kubicni_C2_zlepek(u, p, v0, vN);
%tangentna vektorja
hold on
plot([p(1, 1), p(1,1) + v0(1)], [p(1, 2), p(1,2) + v0(2)], "b", LineStyle="--", LineWidth=1.5);
plot([p(end, 1), p(end,1) + vN(1)], [p(end, 2), p(end,2) + vN(2)], "b", LineStyle="--", LineWidth=1.5);
hold off

% Besselov zlepek
subplot(1,2,2);
title("Besselov zlepek");
kubicni_C2_zlepek(u, p);

%==========================================================
% Prikaz vpliva različnih alfa-parametrizacij na obliko interpolanta,
% pri čemer uporabimo Besselov zlepek

p=[1,2,3,4,5; 0,5,3,6,2]';

n = size(p, 1); %zahtevano število delilnih točk
dp = p(2:end, 1:2) - p(1:end-1, 1:2);

figure
% enakomerna parametrizacija (alfa=0)
u=(0:n-1)';
title("enakomerna parametrizacija");
kubicni_C2_zlepek(u,p);
pause;
clf;

%centripetalna parametrizacija (alfa=1/2)
u=zeros(n, 1);
for i=2:n
    u(i)=u(i-1)+sqrt(norm(dp(i-1,:)));
end
title("centripetalna parametrizacija");
kubicni_C2_zlepek(u,p);
pause;
clf;

% tetivna parametrizacija (alfa=1)
u=zeros(n, 1);
for i=2:n
    u(i)=u(i-1)+norm(dp(i-1));
end
title("tetivna parametrizacija");
kubicni_C2_zlepek(u,p);

