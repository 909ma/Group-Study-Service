BEGIN
  FOR cur_rec IN (SELECT object_name, object_type
                  FROM user_objects
                  WHERE object_type IN ('TABLE', 'VIEW', 'PROCEDURE', 'SEQUENCE'))
  LOOP
    BEGIN
      IF cur_rec.object_type = 'TABLE' THEN
        EXECUTE IMMEDIATE 'DROP ' || cur_rec.object_type || ' "' || cur_rec.object_name || '" CASCADE CONSTRAINTS';
      ELSE
        EXECUTE IMMEDIATE 'DROP ' || cur_rec.object_type || ' "' || cur_rec.object_name || '"';
      END IF;
      DBMS_OUTPUT.PUT_LINE('Dropped ' || cur_rec.object_type || ': ' || cur_rec.object_name);
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error dropping ' || cur_rec.object_type || ': ' || cur_rec.object_name || '. ' || SQLERRM);
    END;
  END LOOP;

  FOR cur_seq IN (SELECT sequence_name FROM user_sequences)
  LOOP
    BEGIN
      EXECUTE IMMEDIATE 'DROP SEQUENCE "' || cur_seq.sequence_name || '"';
      DBMS_OUTPUT.PUT_LINE('Dropped sequence: ' || cur_seq.sequence_name);
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error dropping sequence: ' || cur_seq.sequence_name || '. ' || SQLERRM);
    END;
  END LOOP;
END;
/
