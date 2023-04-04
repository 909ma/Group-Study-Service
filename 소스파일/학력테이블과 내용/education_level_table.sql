CREATE TABLE education_level (
  education_level_id VARCHAR2(50) PRIMARY KEY, -- 학력수준 ID
  education_level_name VARCHAR2(50) NOT NULL -- 학력수준 이름
);

INSERT INTO education_level (education_level_id, education_level_name) VALUES (0, '중학교 졸업');
INSERT INTO education_level (education_level_id, education_level_name) VALUES (1, '고등학교 졸업');
INSERT INTO education_level (education_level_id, education_level_name) VALUES (2, '전문대학 졸업');
INSERT INTO education_level (education_level_id, education_level_name) VALUES (3, '대학교 졸업');
INSERT INTO education_level (education_level_id, education_level_name) VALUES (4, '대학원 졸업 이상');