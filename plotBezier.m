function plotBezier(b)
    % PLOTBEZIER izrise Bezierjevo krivuljo in kontrolni poligon.
    % plotBezier(b)
    % Za izracun tock na krivulji uporabimo deCasteljauov algoritem.
    % b je matrika kontrolnih točk z dvema stolpcema (x in y koordinate)

    t = linspace(0,1,100);
    tocke = deCasteljau(b, t);
    x=tocke(1,:);
    y=tocke(2,:);
    
    hold on
    plot(b(:, 1), b(:, 2), "o"); %Kontrolne točke
    plot(b(:, 1), b(:, 2)); %Kontrolni poligon

    plot(x,y) %nariše bezierjevo krivuljo, več t-jev kot vzamemo bolj bo gladka, 
    % V resnici riše daljice med točkami za katere smo izračunali, da ležijo
    % na krivulji. Prvo podamo vse x_koordinate, potem pa še vse y
    % koordinate.
end