ALTER TABLE users
ADD CONSTRAINT fk_users_grade
FOREIGN KEY (grade)
REFERENCES grade(grade_id);
