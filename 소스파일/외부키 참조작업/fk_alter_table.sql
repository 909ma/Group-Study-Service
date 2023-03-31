ALTER TABLE users
ADD CONSTRAINT fk_education_level
FOREIGN KEY (Education_level)
REFERENCES education_level (education_level_id);

--회원목록테이블에서 학력이 학력테이블의 첫번째 칼럼을 참조하게 함