CREATE OR REPLACE PROCEDURE add_user (
    p_id IN users.id%TYPE,
    p_pw IN users.pw%TYPE,
    p_email IN users.email%TYPE,
    p_name IN users.name%TYPE,
    p_birthday IN users.birthday%TYPE,
    p_gender IN users.gender%TYPE,
    p_phone1 IN users.phone1%TYPE,
    p_phone2 IN users.phone2%TYPE,
    p_address IN users.address%TYPE,
    p_interest IN users.interest%TYPE,
    p_hourStudy IN users.hourStudy%TYPE,
    p_certificate IN users.certificate%TYPE,
    p_Education IN users.Education%TYPE
) AS
BEGIN
    INSERT INTO users (id, pw, email, name, birthday, gender, phone1, phone2, address, interest, hourStudy, certificate, Education)
    VALUES (p_id, p_pw, p_email, p_name, p_birthday, p_gender, p_phone1, p_phone2, p_address, p_interest, p_hourStudy, p_certificate, p_Education);
    COMMIT;
END;
/
--아래는 실행 예시입니다.
BEGIN
    add_user('user01', 'password01', 'user01@example.com', 'John', '1995-01-01', 'M', '010-1111-2222', null, 'Seoul', 'Math', 'Evening', 'Certificate A', 'University B');
END;
--10명 추가 때는 이렇게
BEGIN
    add_user('user01', 'password01', 'user01@example.com', 'John', '1995-01-01', 'M', '010-1111-2222', null, 'Seoul', 'Math', 'Evening', 'Certificate A', 'University B');
    add_user('user02', 'password02', 'user02@example.com', 'Jane', '1996-02-02', 'F', '010-2222-3333', null, 'Busan', 'Science', 'Morning', 'Certificate B', 'University A');
    add_user('user03', 'password03', 'user03@example.com', 'Mike', '1997-03-03', 'M', '010-3333-4444', null, 'Incheon', 'History', 'Afternoon', 'Certificate C', 'University C');
    add_user('user04', 'password04', 'user04@example.com', 'Sarah', '1998-04-04', 'F', '010-4444-5555', null, 'Gyeonggi', 'English', 'Evening', 'Certificate D', 'University B');
    add_user('user05', 'password05', 'user05@example.com', 'David', '1999-05-05', 'M', '010-5555-6666', null, 'Gangwon', 'Math', 'Morning', 'Certificate E', 'University A');
    add_user('user06', 'password06', 'user06@example.com', 'Linda', '2000-06-06', 'F', '010-6666-7777', null, 'Jeju', 'Science', 'Afternoon', 'Certificate F', 'University D');
    add_user('user07', 'password07', 'user07@example.com', 'Tom', '2001-07-07', 'M', '010-7777-8888', null, 'Daegu', 'History', 'Evening', 'Certificate G', 'University C');
    add_user('user08', 'password08', 'user08@example.com', 'Emily', '2002-08-08', 'F', '010-8888-9999', null, 'Chungcheong', 'English', 'Morning', 'Certificate H', 'University B');
    add_user('user09', 'password09', 'user09@example.com', 'Ryan', '2003-09-09', 'M', '010-9999-0000', null, 'Jeolla', 'Math', 'Afternoon', 'Certificate I', 'University A');
    add_user('user10', 'password10', 'user10@example.com', 'Olivia', '2004-10-10', 'F', '010-0000-1111', null, 'Sejong', 'Science', 'Evening', 'Certificate J', 'University D');
END;
