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



ALTER TABLE users
ADD CONSTRAINT fk_education_level
FOREIGN KEY (Education_level)
REFERENCES education_level (education_level_id);  --학력을 학력테이블에서 참조하게 함


--회원 등급 테이블 추가
CREATE TABLE grade (
  GRADE_CODE VARCHAR2(20) PRIMARY KEY,
  GRADE VARCHAR2(20) NOT NULL
);

--7개의 회원등급으로 나눔
INSERT INTO GRADE VALUES(1, '학생');
INSERT INTO GRADE VALUES(2, '선생님');
INSERT INTO GRADE VALUES(3, '대학생');
INSERT INTO GRADE VALUES(4, '취준생');
INSERT INTO GRADE VALUES(5, '직장인');
INSERT INTO GRADE VALUES(6, '사장님');
INSERT INTO GRADE VALUES(7, '관리자');

--FK_GRADE_CODE"라는 외래 키 제약 조건을 "users" 테이블에 추가
-- "users" 테이블의 "GRADE" 열을 "grade"의 "GRADE_CODE" 열에 연결
ALTER TABLE USERS
ADD CONSTRAINT FK_GRADE_CODE 
FOREIGN KEY(GRADE)
REFERENCES GRADE(GRADE_CODE);
