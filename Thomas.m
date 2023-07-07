function X = Thomas(a, b, c, F)
    % THOMAS uporabi Thomasov algoritem (prilagojen za matrični problem)
    % za reševanje tridiagonalnega sistema linearnih enacb AX = F
    % podanega z vektorji a, b, c (diagonala, poddiagonala, naddiagonala)
    % in desno stranjo - matriko F
    % vrne matriko tangentnih vektorjev (2 stolpca za R^2)
    
    %TODO: komentar primeren za poročilo
    % Deluje v O(n) časa
    % Za iskanje tangentnih vektorjev C^2 kubičnega Bezierjevega zlepka
    % bo vedno delovalo, saj:
    % LU razcep brez pivotiranja deluje v primeru obrnljive A,
    % Thomasov algoritem je poseben primer LU razcepa,
    % Strogo diagonalno dominantne matrike so obrnljive.

    n = length(b); %b je na diagonali
    X = zeros(n, 2); % TODO: za bezierja v R^2
    for i = 1:n-1
        b(i+1) = b(i+1) - (a(i)/b(i)) * c(i);

        for j = 1:2
            F(i+1, j) = F(i+1, j) - (a(i)/b(i)) * F(i, j);
        end
    end

    %obratna substitucija
    for j = 1:2
        X(n, j) = F(n, j)/b(n);
        for i = (n-1):-1:1
            X(i, j) = (1 / b(i)) * (F(i, j) - c(i) * X(i+1, j));
        end
    end
end

