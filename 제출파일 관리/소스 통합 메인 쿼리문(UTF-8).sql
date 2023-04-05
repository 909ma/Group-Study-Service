/*
회원가입 테이블 작성
받아야 되는 정보

사용자 아이디
비밀번호
이메일
이름
생년월일
성별
연락처1(Cell Phone)
연락처2(H.P.)
거주지  - FK address
관심과목  - FK INTEREST
공부시간대 - fk hour_study
자격증
학력 --Fk education_level
회원 등급(ex. 학생, 선생, 대학생, 구직자 등등) --Fk grade
*/

/*
users : 회원 관리 테이블
    grade : 회원 등급 관리 테이블
    INTEREST : 관심 분야 관리 테이블
    education_level : 학력 관리 테이블
    address : 주소 관리 테이블
    hour_study : 선호 공부 시간 테이블
STUDY_TIME : 공부 시간 관리 테이블
RANKING : 석차 테이블
study_cafe : 제휴 맺은 스터디 카페 관리 테이블
message2 : 쪽지 관리 테이블
user_log : 유저 관리 테이블
*/
--CREATE-----------------------------------------------------------------------------------------------------------------------
CREATE TABLE users(
  id VARCHAR2(20) PRIMARY KEY, -- 사용자 아이디
  pw VARCHAR2(20) NOT NULL, -- 비밀번호
  email VARCHAR2(50) NOT NULL UNIQUE, -- 이메일
  name VARCHAR2(20) NOT NULL, -- 이름, 저흰 실명제가 되버렸습니다... 닉넴 없음
  birthday DATE NOT NULL, -- 생년월일. 이걸로 나이 계산
  gender VARCHAR2(10) NOT NULL, -- 성별
  phone1 VARCHAR2(20) NOT NULL, -- 전화번호1
  phone2 VARCHAR2(20), -- 전화번호2
  address VARCHAR2(100), -- 거주지
  interest VARCHAR2(50), -- 관심 과목
  hourStudy VARCHAR2(50), -- 공부 시간대
  certificate VARCHAR2(100), -- 자격증
  Education_level VARCHAR2(50), -- 학력
  grade VARCHAR2(20) NOT NULL -- 회원 등급(ex. 학생, 선생, 대학생, 구직자 등등)
);

--회원 등급 테이블 추가
CREATE TABLE grade (
  GRADE_CODE VARCHAR2(20) PRIMARY KEY,
  GRADE VARCHAR2(20) NOT NULL
);

--관심분야 테이블 추가
CREATE TABLE INTEREST (
INTEREST_CODE VARCHAR(20) PRIMARY KEY,
INTEREST VARCHAR(20)
);

--공부시간 테이블추가
CREATE SEQUENCE STUDY_TIME_SEQ START WITH 1 INCREMENT BY 1;

CREATE TABLE STUDY_TIME(
  num INT DEFAULT STUDY_TIME_SEQ.NEXTVAL PRIMARY KEY,
  ID VARCHAR2(20) NOT NULL,
  SUBJECT VARCHAR2(20) NOT NULL,
  STUDY_TIME INT NOT NULL,
  STUDY_DATE TIMESTAMP DEFAULT SYSDATE
);


--석차 테이블 추가
  --"RANK_SCORE" 열은 전체 자릿수가 3이고 배율이 2인 null이 아닌 NUMBER 열
  --즉, 소수점 이하 최대 2자리를 포함하여 최대 총 3자리의 숫자 값을 저장.
  --EX) 0.00, 1.23, 99.99 등과 같은 값을 저장
  -- 백분율 점수와 연결
CREATE TABLE RANKING (
  RANK_CODE VARCHAR2(20) PRIMARY KEY,
  RANK_NAME VARCHAR2(20) NOT NULL,
  RANK_SCORE NUMBER(3,2) NOT NULL
);

CREATE TABLE study_cafe (
  study_cafe_id NUMBER(10) PRIMARY KEY, --스터디카페 코드
  study_cafe_name VARCHAR2(50) NOT NULL, --스터디카페 이름
  study_cafe_address VARCHAR2(100) NOT NULL, --주소
  study_cafe_phone VARCHAR2(20) NOT NULL, --전화번호
  study_cafe_hours VARCHAR2(50) NOT NULL, --운영시간
  study_cafe_fee NUMBER(10, 2) NOT NULL, --요금
  study_cafe_facilities VARCHAR2(100), --제공시설(와이파이,컴퓨터,프린터 등)
  study_cafe_amenities VARCHAR2(100) --편의시설(음료,스낵,휴게실 등)
);

--쪽지
CREATE TABLE message2 (
    message_id INT PRIMARY KEY,
    sender_id VARCHAR2(20),
    receiver_id VARCHAR2(20),
    message_text NVARCHAR2(1000),
	created_date DATE
);

--학력 테이블
CREATE TABLE education_level (
  education_level_id VARCHAR2(50) PRIMARY KEY, -- 학력수준 ID
  education_level_name VARCHAR2(50) NOT NULL -- 학력수준 이름
);

--주소 테이블
create table address
(city_number varchar2(60) PRIMARY key,
gwangcity_do varchar2(60),
city_District varchar2(60),
eup_myeon_dong varchar2(60),
Ri_tong varchar2(60));
/*
--회원 탈퇴 테이블
create table withdraw_id(
id VARCHAR2(20) PRIMARY KEY,--탈퇴 ID
date varchar2(20)--탈퇴 날짜 
);
*/
CREATE TABLE user_log (
    log_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,  -- 로그 id
    user_id VARCHAR2(20) NOT NULL, -- 유저 아이디
    log_time TIMESTAMP(6) NOT NULL, -- 로그 시간
    log_type VARCHAR2(50) NOT NULL, -- 로그 종류(로그인, 로그 아웃, 회원탈퇴 등)
    log_message VARCHAR2(255), -- 로그 메시지 , 유저가 어떤 행동을 한 지 기록
    ip_address VARCHAR2(50) NOT NULL -- 로그 ip 주소.
);

--hour study 테이블 추가
CREATE TABLE HOUR_STUDY(
CODE VARCHAR(50) PRIMARY KEY,
DAYS VARCHAR(20) NOT NULL,
HOURS VARCHAR(20) NOT NULL
);
--ALTER-----------------------------------------------------------------------------------------------------------------------
ALTER TABLE users
ADD CONSTRAINT fk_education_level
FOREIGN KEY (Education_level)
REFERENCES education_level (education_level_id);  --학력을 학력테이블에서 참조하게 함

--FK_GRADE_CODE"라는 외래 키 제약 조건을 "users" 테이블에 추가
-- "users" 테이블의 "GRADE" 열을 "grade"의 "GRADE_CODE" 열에 연결
ALTER TABLE USERS
ADD CONSTRAINT FK_GRADE_CODE 
FOREIGN KEY(GRADE)
REFERENCES GRADE(GRADE_CODE);

--관심분야 테이블 외래키 추가
ALTER TABLE USERS
ADD CONSTRAINT FK_INTEREST_CODE
FOREIGN KEY(INTEREST)
REFERENCES INTEREST(INTEREST_CODE);

ALTER TABLE users
ADD CONSTRAINT fk_users_grade
FOREIGN KEY (grade)
REFERENCES grade(grade_id);

--주소 외래키 추가
alter table users add CONSTRAINT fk_city_number
foreign KEY(address) references address(city_number);

--외래키 추가
ALTER TABLE USERS
ADD CONSTRAINT FK_HOUR_STUDY_CODE
FOREIGN KEY(HOURSTUDY)
REFERENCES HOUR_STUDY(CODE);
--INSERT-----------------------------------------------------------------------------------------------------------------------
--7개의 회원등급으로 나눔
INSERT INTO GRADE VALUES(1, '학생');
INSERT INTO GRADE VALUES(2, '선생님');
INSERT INTO GRADE VALUES(3, '대학생');
INSERT INTO GRADE VALUES(4, '취준생');
INSERT INTO GRADE VALUES(5, '직장인');
INSERT INTO GRADE VALUES(6, '사장님');
INSERT INTO GRADE VALUES(7, '관리자');

INSERT INTO INTEREST VALUES('1','국어');--KOREAN_LAN
INSERT INTO INTEREST VALUES('2','영어');--ENGLISH);
INSERT INTO INTEREST VALUES('3','수학');--;MATHEMATICS);
INSERT INTO INTEREST VALUES('4','수능');--COLLEGE
INSERT INTO INTEREST VALUES('5','토익');--TOEIC);
INSERT INTO INTEREST VALUES('6','주식');--REALTOL);
INSERT INTO INTEREST VALUES('7','앱개발');
INSERT INTO INTEREST VALUES('8','주식');--STOCK);
INSERT INTO INTEREST VALUES('9','취업');--EMPLOYMENT);
INSERT INTO INTEREST VALUES('10','창업');--STARTUPS);

/*INSERT INTO study_cafe (cafe_id, cafe_name, address, phone, open_time, close_time, facilities, seats, outlets, wifi, smoking_area, membership, membership_fee)
VALUES ('SC0001', '종로 스터디카페', '서울특별시 종로구 종로 123', '02-123-4567', '09:00', '22:00', '스탠드, 회의실, 노트북 대여, 무료음료', 50, 20, '무선인터넷', '분리석 내외 모두 금연', '프리미엄 멤버십', 30000);
INSERT INTO study_cafe (cafe_id, cafe_name, address, phone, open_time, close_time, facilities, seats, outlets, wifi, smoking_area, membership, membership_fee)
VALUES ('SC0002', '강남 스터디카페', '서울특별시 강남구 강남대로 123', '02-234-5678', '10:00', '23:00', '스탠드, 자유롭게 이용 가능한 공간, 무료음료', 60, 30, '무선인터넷', '흡연 가능', '베이직 멤버십', 20000);
INSERT INTO study_cafe (cafe_id, cafe_name, address, phone, open_time, close_time, facilities, seats, outlets, wifi, smoking_area, membership, membership_fee)
VALUES ('SC0003', '홍대 스터디카페', '서울특별시 마포구 와우산로 123', '02-345-6789', '08:00', '22:00', '스탠드, 노트북 대여, 무료음료', 40, 15, '유선인터넷', '분리석 내외 모두 금연', '프리미엄 멤버십', 35000);
INSERT INTO study_cafe (cafe_id, cafe_name, address, phone, open_time, close_time, facilities, seats, outlets, wifi, smoking_area, membership, membership_fee)
VALUES ('SC0004', '건대 스터디카페', '서울특별시 광진구 능동로 123', '02-456-7890', '11:00', '02:00', '스탠드, 노트북 대여, 무료음료, 야간 영업', 70, 25, '무선인터넷', '흡연 가능', '베이직 멤버십', 15000);*/
--임시 자료도 있긴 한데 거주지는 FK로 불러오는게 맞을듯? 거주지테이블을 단순화해서 좀 쉽게 갑시다
INSERT INTO address (city_number, gwangcity_do, city_District) VALUES ('0','대구광역시', '중구');
INSERT INTO address (city_number, gwangcity_do, city_District) VALUES ('1', '대구광역시', '동구');
INSERT INTO address (city_number, gwangcity_do, city_District) VALUES ('2', '대구광역시', '서구');
INSERT INTO address (city_number, gwangcity_do, city_District) VALUES ('3', '대구광역시', '남구');
INSERT INTO address (city_number, gwangcity_do, city_District) VALUES ('4', '대구광역시', '북구');
INSERT INTO address (city_number, gwangcity_do, city_District) VALUES ('5', '대구광역시', '수성구');
INSERT INTO address (city_number, gwangcity_do, city_District) VALUES ('6', '대구광역시', '달서구');
INSERT INTO address (city_number, gwangcity_do, city_District) VALUES ('7', '대구광역시', '달성군');

INSERT INTO education_level (education_level_id, education_level_name) VALUES (0, '중학교 졸업');
INSERT INTO education_level (education_level_id, education_level_name) VALUES (1, '고등학교 졸업');
INSERT INTO education_level (education_level_id, education_level_name) VALUES (2, '전문대학 졸업');
INSERT INTO education_level (education_level_id, education_level_name) VALUES (3, '대학교 졸업');
INSERT INTO education_level (education_level_id, education_level_name) VALUES (4, '대학원 졸업 이상');

INSERT INTO HOUR_STUDY VALUES ('case1','평일','주간');
INSERT INTO HOUR_STUDY VALUES ('case2','평일','야간');
INSERT INTO HOUR_STUDY VALUES ('case3','평일','종일');
INSERT INTO HOUR_STUDY VALUES ('case4','주말','주간');
INSERT INTO HOUR_STUDY VALUES ('case5','주말','야간');
INSERT INTO HOUR_STUDY VALUES ('case6','주말','종일');
INSERT INTO HOUR_STUDY VALUES ('case7','매일','주간');
INSERT INTO HOUR_STUDY VALUES ('case8','매일','야간');
INSERT INTO HOUR_STUDY VALUES ('case9','매일','종일');

--SELECT-----------------------------------------------------------------------------------------------------------------------
SELECT * FROM users
WHERE TRUNC(MONTHS_BETWEEN(SYSDATE, birthday)/12) BETWEEN 20 AND 30; --20살부터 30살까지 추려냄

SELECT * FROM users
WHERE grade = '학생'; --회원등급이 '학생'인 회원들 추려냄



SELECT * FROM users
WHERE certificate IS NOT NULL; --자격증이 있는 사람들 추려냄


SELECT * FROM users
WHERE interest LIKE '%수학%'; --관심과목이 '수학'인 경우 추려냄

SELECT * FROM users
WHERE Education_level >= '대학교 졸업'; --'대졸'을 추려냄
--PROCEDURE-----------------------------------------------------------------------------------------------------------------------
--회원 가입
CREATE OR REPLACE PROCEDURE add_user(
  p_id IN VARCHAR2,
  p_pw IN VARCHAR2,
  p_email IN VARCHAR2,
  p_name IN VARCHAR2,
  p_birthday IN DATE,
  p_gender IN VARCHAR2,
  p_phone1 IN VARCHAR2,
  p_phone2 IN VARCHAR2,
  p_address IN VARCHAR2,
  p_interest IN VARCHAR2,
  p_hourStudy IN VARCHAR2,
  p_certificate IN VARCHAR2,
  p_education_level IN VARCHAR2,
  p_grade IN VARCHAR2
)
IS
BEGIN
  INSERT INTO users(id, pw, email, name, birthday, gender, phone1, phone2, address, interest, hourStudy, certificate, education_level, grade)
  VALUES (p_id, p_pw, p_email, p_name, p_birthday, p_gender, p_phone1, p_phone2, p_address, p_interest, p_hourStudy, p_certificate, p_education_level, p_grade);
END;
/
--쪽지 보내기
CREATE OR REPLACE PROCEDURE send_message(
    p_message_id IN INT,
    p_sender_id IN VARCHAR2,
    p_receiver_id IN VARCHAR2,
    p_message_text IN NVARCHAR2,
    p_created_date IN DATE
)
IS
BEGIN
    INSERT INTO message2(message_id, sender_id, receiver_id, message_text, created_date)
    VALUES(p_message_id, p_sender_id, p_receiver_id, p_message_text, p_created_date);
    --COMMIT;
    dbms_output.put_line('Message sent successfully.');
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error while sending message: ' || SQLERRM);
        ROLLBACK;
END;
/
--회원 탈퇴
create or replace PROCEDURE delete_user (
    p_id IN users.id%TYPE
) AS
BEGIN
    DELETE FROM users WHERE id = p_id;
    DELETE FROM study_time WHERE id = p_id;
    DELETE FROM ranking WHERE rank_name = p_id;
    DELETE FROM study_cafe WHERE study_cafe_name = p_id;
    DELETE FROM message2 WHERE receiver_id = p_id;
    UPDATE messege2 SET sender_id = '탈퇴' WHERE sender_id = p_id;
    INSERT INTO user_log (USER_ID, LOG_MESSAGE) VALUES (p_id, '탈퇴');
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('User deleted successfully');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('User not found');
END;
/

--개별 수정 프로시저------

--비밀번호 업데이트 프로시저:
create or replace PROCEDURE update_password(
    p_id IN users.id%TYPE,
    p_new_password IN users.pw%TYPE
) AS
BEGIN
    UPDATE users SET pw = p_new_password WHERE id = p_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Password updated successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating password: ' || SQLERRM);
        ROLLBACK;
END;
/
--이름 업데이트 프로시저:
CREATE OR REPLACE PROCEDURE update_name(
    p_id IN users.id%TYPE,
    p_new_name IN users.name%TYPE
) AS
BEGIN
    UPDATE users SET name = p_new_name WHERE id = p_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Name updated successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating name: ' || SQLERRM);
        ROLLBACK;
END;
/
--전화번호1 업데이트 프로시저:
CREATE OR REPLACE PROCEDURE update_phone1(
    p_id IN users.id%TYPE,
    p_new_phone1 IN users.phone1%TYPE
) AS
BEGIN
    UPDATE users SET phone1 = p_new_phone1 WHERE id = p_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Phone1 updated successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating phone1: ' || SQLERRM);
        ROLLBACK;
END;
/
--전화번호2 업데이트 프로시저:
CREATE OR REPLACE PROCEDURE update_phone2(
    p_id IN users.id%TYPE,
    p_new_phone2 IN users.phone2%TYPE
) AS
BEGIN
    UPDATE users SET phone2 = p_new_phone2 WHERE id = p_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Phone2 updated successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating phone2: ' || SQLERRM);
        ROLLBACK;
END;
/
--거주지 업데이트 프로시저:
CREATE OR REPLACE PROCEDURE update_address(
    p_id IN users.id%TYPE,
    p_new_address IN users.address%TYPE
) AS
BEGIN
    UPDATE users SET address = p_new_address WHERE id = p_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Address updated successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating address: ' || SQLERRM);
        ROLLBACK;
END;
/
--관심 과목 업데이트 프로시저:
CREATE OR REPLACE PROCEDURE update_interest(
    p_id IN users.id%TYPE,
    p_new_interest IN users.interest%TYPE
) AS
BEGIN
    UPDATE users SET interest = p_new_interest WHERE id = p_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Interest updated successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating interest: ' || SQLERRM);
        ROLLBACK;
END;
/
--공부 시간대(hourStudy) 수정 프로시저
CREATE OR REPLACE PROCEDURE update_hourStudy(
    p_id IN users.id%TYPE,
    p_hourStudy IN users.hourStudy%TYPE
) AS
BEGIN
    UPDATE users
    SET hourStudy = p_hourStudy
    WHERE id = p_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('hourStudy updated successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating hourStudy: ' || SQLERRM);
        ROLLBACK;
END;
/
--자격증(certificate) 수정 프로시저
CREATE OR REPLACE PROCEDURE update_certificate(
    p_id IN users.id%TYPE,
    p_certificate IN users.certificate%TYPE
) AS
BEGIN
    UPDATE users
    SET certificate = p_certificate
    WHERE id = p_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('certificate updated successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating certificate: ' || SQLERRM);
        ROLLBACK;
END;
/
--학력(Education_level) 수정 프로시저

CREATE OR REPLACE PROCEDURE update_Education_level(
    p_id IN users.id%TYPE,
    p_Education_level IN users.Education_level%TYPE
) AS
BEGIN
    UPDATE users
    SET Education_level = p_Education_level
    WHERE id = p_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Education_level updated successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating Education_level: ' || SQLERRM);
        ROLLBACK;
END;
/
--회원 등급(grade) 수정 프로시저
CREATE OR REPLACE PROCEDURE update_grade(
    p_id IN users.id%TYPE,
    p_grade IN users.grade%TYPE
) AS
BEGIN
    UPDATE users
    SET grade = p_grade
    WHERE id = p_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('grade updated successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating grade: ' || SQLERRM);
        ROLLBACK;
END;
/

--전체 수정 프로시저(관리자 기능으로 추가하면 좋을 듯 합니다.)
CREATE OR REPLACE PROCEDURE insert_user(
    p_pw IN users.pw%TYPE,    --비밀번호
    p_email IN users.email%TYPE,    --이메일
    p_name IN users.name%TYPE,    --이름
    p_phone1 IN users.phone1%TYPE,    --핸드폰1
    p_phone2 IN users.phone2%TYPE DEFAULT NULL,   --핸드폰2
    p_address IN users.address%TYPE DEFAULT NULL,    --거주지
    p_interest IN users.interest%TYPE DEFAULT NULL,  --관심 과목
    p_hourStudy IN users.hourStudy%TYPE DEFAULT NULL,   --공부시간대
    p_certificate IN users.certificate%TYPE DEFAULT NULL,    --자격증
    p_Education_level IN users.Education_level%TYPE DEFAULT NULL,   --학력
    p_grade IN users.grade%TYPE   --회원 등급
) AS
BEGIN
    INSERT INTO users(pw, email, name, phone1, phone2, address, interest, hourStudy, certificate, Education_level, grade)
    VALUES(p_pw, p_email, p_name, p_phone1, p_phone2, p_address, p_interest, p_hourStudy, p_certificate, p_Education_level, p_grade);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('User inserted successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inserting user: ' || SQLERRM);
        ROLLBACK;
END;
/

--전체 수정 프로시저2(관리자 기능으로 추가하면 좋을 듯 합니다.)
CREATE OR REPLACE PROCEDURE update_user(
    p_email IN users.email%TYPE,   --이메일
    p_pw IN users.pw%TYPE DEFAULT NULL,   --비밀번호
    p_name IN users.name%TYPE DEFAULT NULL,   --이름
    p_phone1 IN users.phone1%TYPE DEFAULT NULL,   --핸드폰1
    p_phone2 IN users.phone2%TYPE DEFAULT NULL,   --핸드폰2
    p_address IN users.address%TYPE DEFAULT NULL,   --거주지
    p_interest IN users.interest%TYPE DEFAULT NULL,   --관심과목
    p_hourStudy IN users.hourStudy%TYPE DEFAULT NULL,   --공부시간대
    p_certificate IN users.certificate%TYPE DEFAULT NULL,   --자격증
    p_education_level IN users.education_level%TYPE DEFAULT NULL,    --학력
    p_grade IN users.grade%TYPE DEFAULT NULL   --회원 등급
)
IS
BEGIN
    UPDATE users
    SET pw = NVL(p_pw, pw),   --비밀번호
        name = NVL(p_name, name),   --이름
        phone1 = NVL(p_phone1, phone1),  --핸드폰1
        phone2 = NVL(p_phone2, phone2),   --핸드폰2
        address = NVL(p_address, address),   --거주지
        interest = NVL(p_interest, interest),   --관심과목
        hourStudy = NVL(p_hourStudy, hourStudy),   --공부시간대
        certificate = NVL(p_certificate, certificate),   --자격증
        education_level = NVL(p_education_level, education_level),   --학력
        grade = NVL(p_grade, grade)   --회원등급
    WHERE email = p_email;   --이메일
END;
/

--로그 관리자 기능
CREATE SEQUENCE log_id_seq START WITH 1 INCREMENT BY 1;-- log id는 순차적 증가로 시퀀스를 만들어서 적용 했습니다.
CREATE OR REPLACE PROCEDURE add_user_log(
    P_user_id IN VARCHAR2,
    P_log_time IN TIMESTAMP,
    P_log_type IN VARCHAR2,
    P_log_message IN VARCHAR2,
    P_ip_address IN VARCHAR2
)
AS
    log_id NUMBER;
BEGIN
    SELECT log_id_seq.NEXTVAL INTO log_id FROM dual;
    INSERT INTO user_log (user_id, log_time, log_type, log_message, ip_address)
    VALUES (P_user_id, P_log_time, P_log_type, P_log_message, P_ip_address);
END;
/


-- 로그 프로시저

CREATE SEQUENCE log_id_seq START WITH 1 INCREMENT BY 1;-- log id는 순차적 증가로 시퀀스를 만들어서 적용 했습니다.
CREATE OR REPLACE PROCEDURE add_user_log(
    P_user_id IN VARCHAR2,
    P_log_time IN TIMESTAMP,
    P_log_type IN VARCHAR2,
    P_log_message IN VARCHAR2,
    P_ip_address IN VARCHAR2
)
AS
    log_id NUMBER;
BEGIN
    SELECT log_id_seq.NEXTVAL INTO log_id FROM dual;
    INSERT INTO user_log (user_id, log_time, log_type, log_message, ip_address)
    VALUES (P_user_id, P_log_time, P_log_type, P_log_message, P_ip_address);
END;
/
/
--석차 프로시저
-- RANK_CODE 값을 생성하기 위한 시퀀스 생성
CREATE SEQUENCE ranking_seq
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;
-- 시퀀스를 사용하여 RANKING 테이블에 새 행을 삽입하는 저장 프로시저 생성
CREATE OR REPLACE PROCEDURE insert_ranking (
  p_rank_name IN RANKING.RANK_NAME%TYPE,
  p_rank_score IN RANKING.RANK_SCORE%TYPE
)
IS
  v_rank_code VARCHAR2(20);
BEGIN
  
  -- 다음 값 시퀀스에서 가져와 새 행의 RANK_CODE로 사용
  SELECT 'R' || LPAD(ranking_seq.NEXTVAL, 3, '0')
  INTO v_rank_code
  FROM DUAL;
  
  
  -- 새 행을 RANKING 테이블에 삽입
  INSERT INTO RANKING (RANK_CODE, RANK_NAME, RANK_SCORE)
  VALUES (v_rank_code, p_rank_name, p_rank_score);
  
  COMMIT;
END;
/

--석차 출력 프로시저
-- RANKING 테이블에서 모든 행을 검색하고 콘솔에 출력하는 저장 프로시저 생성
CREATE OR REPLACE PROCEDURE print_ranking IS
BEGIN
 
  -- RANKING 테이블에서 모든 행 선택
  FOR row IN (SELECT * FROM RANKING)
  LOOP
    
    -- 값을 콘솔에 출력
    DBMS_OUTPUT.PUT_LINE(row.RANK_CODE || ' - ' || row.RANK_NAME || ' - ' || row.RANK_SCORE);
  END LOOP;
END;
/

--공부시간 프로시저
-- 네 가지 입력 매개변수를 사용하여 "insert_study_time"이라는 저장 프로시저를 생성
CREATE SEQUENCE STUDY_TIME_SEQ START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE PROCEDURE insert_study_time (
    P_STUDY_ID IN VARCHAR2,
    P_SUBJECT IN VARCHAR2,
    P_STUDY_TIME IN INT,
    P_STUDY_DATE IN DATE
)
IS
BEGIN
    INSERT INTO study_time(num, ID, SUBJECT, STUDY_TIME, STUDY_DATE)
    VALUES(study_time_seq.NEXTVAL, P_STUDY_ID, P_SUBJECT, P_STUDY_TIME, P_STUDY_DATE);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Study time record inserted successfully.');
END;
/
--프로시저 예시-----------------------------------------------------------------------------------------------------------------------
/*
DECLARE
    message_id NUMBER := 1;
    sender_id VARCHAR2(20) := 'user1';
    receiver_id VARCHAR2(20) := 'user2';
    message_text NVARCHAR2(1000) := '안녕하세요. 오늘 일정이 어떻게 되나요?';
    created_date DATE := SYSDATE;
BEGIN
    send_message(message_id, sender_id, receiver_id, message_text, created_date);
END;


--아래는 user1을 없애는 예시입니다.
BEGIN
    delete_user('user01');
END;


-- 로그 프로시저 예시
DECLARE
    user_id VARCHAR2(20) := 'soo.doe';
    log_time TIMESTAMP := SYSTIMESTAMP;
    log_type VARCHAR2(20) := 'LOGIN';
    log_message VARCHAR2(100) := 'User logged in';
    ip_address VARCHAR2(20) := '192.168.1.100';
BEGIN
    add_user_log(user_id, log_time, log_type, log_message, ip_address);
END;

--석차 프로시저 예시
-- insert_ranking 프로시저를 호출하여 RANKING 테이블에 새 행 삽입
BEGIN
  insert_ranking('1등', 75.5);
END;
/

--공부시간 프로시저 예시
--프로시저는 "study_time" 테이블에 새 행을 삽입
--'ST01', 'Math', 120 및 '2023-03-27'을 사용하여 코드에서 호출
BEGIN
    insert_study_time('ST01', 'Math', 120,'2023-03-27');
END;

--유저 로그 프로시저 사용 예시
DECLARE
    user_id VARCHAR2(20) := 'john.doe';
    log_time TIMESTAMP := SYSTIMESTAMP;
    log_type VARCHAR2(20) := 'LOGIN';
    log_message VARCHAR2(100) := 'User logged in';
    ip_address VARCHAR2(20) := '192.168.1.100';
BEGIN
    add_user_log(user_id, log_time, log_type, log_message, ip_address);
END;
/
-- 예시
DECLARE
    user_id VARCHAR2(20) := 'soo.doe';
    log_time TIMESTAMP := SYSTIMESTAMP;
    log_type VARCHAR2(20) := 'LOGIN';
    log_message VARCHAR2(100) := 'User logged in';
    ip_address VARCHAR2(20) := '192.168.1.100';
BEGIN
    add_user_log(user_id, log_time, log_type, log_message, ip_address);
END;
/
*/