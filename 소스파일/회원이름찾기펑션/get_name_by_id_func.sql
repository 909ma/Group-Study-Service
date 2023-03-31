CREATE OR REPLACE FUNCTION get_name_by_id(user_id IN VARCHAR2)
RETURN VARCHAR2
IS
  user_name VARCHAR2(20);
BEGIN
  SELECT name INTO user_name
  FROM users
  WHERE id = user_id;
  
  RETURN user_name;
END;



select get_name_by_id(sadf) from dual;