create or replace trigger auditoriaAlquiler after insert or delete or update on alquiler for each row
begin
    IF INSERTING THEN
        INSERT INTO tmp_estructura (origen_datos,c1,n1,n2,n3) VALUES ('INSERTARALQUILER',to_char(new.fecha),new.importebase,new.importeiva,new.clienteid);
    ELSIF DELETING THEN
        INSERT INTO tmp_estructura (origen_datos,c1,n1,n2,n3) VALUES ('BORRARALQUILER',to_char(old.fecha),old.importebase,old.importeiva,old.clienteid);
    ELSIF UPDATING THEN
        INSERT INTO tmp_estructura (origen_datos,c1,n1,n2,n3) VALUES ('ACTUALIZARALQUILER',to_char(new.fecha),new.importebase,new.importeiva,new.clienteid);
    end if;
end;
