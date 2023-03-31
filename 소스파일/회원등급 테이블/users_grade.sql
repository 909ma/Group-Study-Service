CREATE TABLE grade (
  grade_id NUMBER(10) PRIMARY KEY, -- 회원등급 ID
  grade_name VARCHAR2(20) NOT NULL -- 회원등급 이름
);

/*
INSERT INTO grade (grade_id, grade_name) VALUES (1, '구직자');
INSERT INTO grade (grade_id, grade_name) VALUES (2, '대학생');
INSERT INTO grade (grade_id, grade_name) VALUES (3, 'Gold');
INSERT INTO grade (grade_id, grade_name) VALUES (4, 'Platinum');
INSERT INTO grade (grade_id, grade_name) VALUES (5, 'Diamond');
*/