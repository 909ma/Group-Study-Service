SELECT * FROM users
WHERE TRUNC(MONTHS_BETWEEN(SYSDATE, birthday)/12) BETWEEN 20 AND 30; --20살부터 30살까지 추려냄

SELECT * FROM users
WHERE member_level = '학생'; --회원등급이 '학생'인 회원들 추려냄



SELECT * FROM users
WHERE certificate IS NOT NULL; --자격증이 있는 사람들 추려냄


SELECT * FROM users
WHERE interest LIKE '%수학%'; --관심과목이 '수학'인 경우 추려냄

SELECT * FROM users
WHERE Education >= '대졸'; --'대졸'을 추려냄

