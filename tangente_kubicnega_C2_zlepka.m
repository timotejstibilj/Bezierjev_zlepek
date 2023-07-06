function V =tangente_kubicnega_C2_zlepka(u,p,v0, vN)
    % TANGENTE_KUBICNEGA_C2_ZLEPKA racuna tangentne vektorje v notranjosti C^2 kubičnega zlepka
    % V=TANGENTE_KUBICNEGA_C2_ZLEPKA(u,p) vrne matriko tangentnih vektorjev
    % v interpolacijskih točkah
    % u je vektor delilnih točk,
    % p je matrika interpolacijskih točk (2 vrstici - x in y koordinate),
    % v0 in vN sta tangentna vektorja v začetni in končni točki
    
    %TODO: zaenkrat je v R^2
    %dimenzija prostora:
    %d=size(u,1);
    n = size(u, 1) - 2;

    % razdalje med delilnimi točkami
    du = u(2:end) - u(1:end-1);
    a = du(3:end) ./ (du(3:end) + du(2:end-1));
    c= du(1:end-2) ./ (du(1:end-2) + du(2:end-1));
    b = 2*ones(n, 1);
    %A = diag(a, -1) + diag(b, 0) + diag(c, 1);
    
    dp = p(2:end, 1:2) - p(1:end-1, 1:2);
    F = 3 ./ (du(1:end-1) + du(2:end)) .* ( dp(2:end, 1:2) .* du(1:end-1) ./ du(2:end) + dp(1:end-1, 1:2) .* du(2:end) ./ du(1:end-1) );
    % dodamo začetni in končni člen, ki ga dasta v0 in vN
    F(1, 1:2) = F(1, 1:2) - v0 .* (du(2) / (du(2) + du(1)));
    F(end, 1:2) = F(end, 1:2) - vN .* (du(end-1) / (du(end) + du(end-1)));

    %notranji tangentni vektorjev v1, v2, ..., v_{N-1) C^2 kubičnega zlepka,
    V_in = Thomas(a, b, c, F);
    V = [v0; V_in; vN]; % celoten nabor vektorjev
end