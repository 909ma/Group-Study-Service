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

--아래는 입력 예시입니다
BEGIN
  add_user(
    'johndoe', -- 아이디
    '123456', -- 비밀번호
    'johndoe@example.com', -- 이메일
    'John Doe', -- 이름
    TO_DATE('1980-01-01', 'YYYY-MM-DD'), -- 생년월일
    '남성', -- 성별
    '010-1234-5678', -- 연락처1
    '02-123-4567', -- 연락처2
    '서울특별시 강남구', -- 거주지
    '영어, 프로그래밍', -- 관심 과목
    '저녁', -- 공부 시간대
    'TOEIC, 정보처리기사', -- 자격증
    '학사', -- 학력
    '일반회원' -- 회원 등급
  );
END;