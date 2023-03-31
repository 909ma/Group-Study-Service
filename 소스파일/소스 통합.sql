









--CREATE-----------------------------------------------------------------------------------------------------------------------
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
거주지  - FK로 빼내죠
관심과목  - FK로 빼내죠
공부시간대
자격증
학력 --Fk로 빼내는게 나을듯함
회원 등급(ex. 학생, 선생, 대학생, 구직자 등등) --Fk로 빼내는게 나을듯함
*/
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
CREATE TABLE STUDY_TIME(
  STUDY_ID VARCHAR2(20) PRIMARY KEY,
  SUBJECT VARCHAR2(20),
  STUDY_TIME INT,
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

INSERT INTO education_level (id, name) VALUES (1, '초등학교 졸업');
INSERT INTO education_level (id, name) VALUES (2, '중학교 졸업');
INSERT INTO education_level (id, name) VALUES (3, '고등학교 졸업');
INSERT INTO education_level (id, name) VALUES (4, '전문대학 졸업');
INSERT INTO education_level (id, name) VALUES (5, '대학교 졸업');
INSERT INTO education_level (id, name) VALUES (6, '대학원 졸업 이상');

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

--회원 탈퇴
CREATE OR REPLACE PROCEDURE delete_user (
    p_id IN users.id%TYPE
) AS
BEGIN
    DELETE FROM users WHERE id = p_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('User deleted successfully');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('User not found');
END;
/
--아래는 user1을 없애는 예시입니다.
BEGIN
    delete_user('user01');
END;

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


*/