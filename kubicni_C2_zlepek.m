function b = kubicni_C2_zlepek(u,p,v0,vN)
    % KUBICNI_C2_ZLEPEK racuna kontrolne tocke C^2 kubičnega zlepka
    % b=KUBICNI_C2_ZLEPEK(u,p,v) vrne matriko kontrolnih tock C^2 kubičnega zlepka,
    % ki interpolira dane točke pri čemer upošteva tangentna vektorja v prvi in
    % zadnji točki
    % u je vektor delilnih točk,
    % p je matrika interpolacijskih točk (2 vrstici - x in y koordinate),
    % v0 in vN sta tangentna vektorja v prvi in zadnji točki
    
    
    %TODO: lahko bi združil primera s podanimi tangentami in Besselov zlepek:nargin = 3 oz nargin <3...
    
    V = tangente_kubicnega_C2_zlepka(u,p,v0, vN);

    n = size(p, 1); %število interpolacijskih točk
    b = zeros(3*(n-1) + 1, 2); % kontrolne točke
    b(1:3:end, 1:2) = p; % interpolacijske točke določajo b_{0+3i}

    du = u(2:end) - u(1:end-1); % razlike delilnih točk
    b_up = p(1:end-1,1:2) + 1/3 .* du .* V(1:end-1,1:2);
    b_down = p(2:end, 1:2) - 1/3 .* du .* V(2:end, 1:2);

    b(2:3:end, 1:2) = b_up;
    b(3:3:end, 1:2) = b_down;
    
    % risanje zlepka
    for i = 0:n-2
        control_points = b(3*i + 1 : 3*i + 4,1:2);
        plotBezier(control_points, 100);
        hold on
    end
end