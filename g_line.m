function gline = g_line(gline, vect, power, m, newel, indice)

    newel = newel * vect(indice);% We create the new element which we are gonna put in gline
    power = power + 1; % We increase the power of the polynom
    if power == m % If our grade is equal with the predefined power m
        gline = [gline ,newel]; % We put in gline the newel variable
    else
        for i = indice:length(vect) 
            % We take the variable 'indice' to not create duplicates
            % If the power is not the one we want,we call it recursive 
            % In order to create the correct newel
           gline = g_line(gline, vect, power, m, newel, i);
        end
    end
end