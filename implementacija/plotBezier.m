function plotBezier(b, st_tock)
    % PLOTBEZIER izrise Bezierjevo krivuljo in kontrolni poligon.
    % plotBezier(b)
    % b je matrika kontrolnih točk z dvema stolpcema (x in y koordinate)
    % %st_tock je stevilo tock risanja
    % Za izracun tock na krivulji uporabimo deCasteljauov algoritem.

    t = linspace(0,1,st_tock);
    tocke = deCasteljau(b, t);
    x=tocke(1,:);
    y=tocke(2,:);
    
    hold on
    plot(b(:, 1), b(:, 2), "o"); %Kontrolne točke
    plot(b(:, 1), b(:, 2)); %Kontrolni poligon
    p=b(1:3:end,1:2); %interpolacijske tocke
    plot(p(:, 1), p(:, 2),"ro", 'MarkerSize', 7.5, 'MarkerFaceColor', 'r');
    

    plot(x,y) %nariše bezierjevo krivuljo, več t-jev kot vzamemo bolj bo gladka, 
    % V resnici riše daljice med točkami za katere smo izračunali, da ležijo
    % na krivulji. Prvo podamo vse x_koordinate, potem pa še vse y
    % koordinate.
end