create or replace function calculer_longueur_max(valeur1 varchar,valeur2 varchar ) returns integer as
$$ 
    
    BEGIN
        if  length(valeur1) < length(valeur2) then
            return length(valeur2);
        elsif length(valeur1) = length(valeur2) then
            return length(valeur1);
        else
            return length(valeur1);
        end if;
        
    END;
$$ 
LANGUAGE plpgsql;

drop function nb_occurence;
create or replace function nb_occurence(caractere varchar,chaine varchar,debut int,fin int) returns integer as
$$
    DECLARE
        nb_occurences integer = 0;
        i integer = 0;

    BEGIN
    if debut >= 0 and fin <= length(chaine) and fin > 0 then
        for i in debut..fin loop
            if substr(left(chaine,i),i) = caractere then
                nb_occurences = nb_occurences+1;
            end if ;
            i = i + 1;
        end loop;
        return nb_occurences;
    else
        RAISE INFO 'le debut et la fin doivent etre compris entre 0 et %',length(chaine);
    end if;
    END;

$$

LANGUAGE plpgsql;