function vrednosti = deCasteljau(b, t)
    % DECASTELJAU računa točke na bezierjevi krivulji
    % DECASTELJAU(b, t) vrne vektor točk na bezierjevi krivulji pri
    % izbranih parametrih t
    % b je matrika kontrolnih točk z x in y koordinatami (2 stolpca),
    % t je vrstični vektor parametrov,
    % za vsak parameter t_i vrne eno točko na bezierjevi krivulji

    %TODO: komentar zame: sprotnih rešitev si ne shranjujemo, kot pri vec1
    %verziji, ampak kar overwrite-amo

    n=size(b, 1) - 1; % za izračun potrebujemo en nivo manj od števila točk
    time_num = size(t,2); % število časovnih parametrov
    
    % naredimo kopijo x in y koordinat kontrolnih točk b, za vsak čas t_i
    % imamo eno kopijo(stolpec)
    x = repmat(b(:, 1), 1, time_num); 
    y = repmat(b(:, 2), 1, time_num);

    for i=1:n
        x(1:end-i, :) = (1-t).*x(1:end-i,:) + t.*x(2:end-i+1,:);
        y(1:end-i, :) = (1-t).*y(1:end-i,:) + t.*y(2:end-i+1,:);   
    end

    vrednosti = [x(1,:); y(1,:)];
end