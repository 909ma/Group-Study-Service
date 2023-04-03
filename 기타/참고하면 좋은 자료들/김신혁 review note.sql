오라클 문법 정리
  오라클은 대소문자를 가리지 않는다.
#################################################################################
CRUD 연산

*Create
CREATE TABLE STUDENT
(
HAKBEON VARCHAR2(100) PRIMARY KEY,
NAME VARCHAR2(100) NOT NULL,
BIRTHDAY VARCHAR2(8)
);

INSERT INTO STUDENT (HAKBEON,NAME,BIRTHDAY) VALUES 
('2009038033','이동준','950430');
INSERT INTO STUDENT (HAKBEON,NAME,BIRTHDAY) VALUES 
('1999038012','박승찬','650105');

create table sbscompany(
sabeon varchar2(5) primary key,
age int,
birthday date default sysdate);
birthday : 칼럼명
date : 날짜 형식으로ㅇㅇ
dafault sysdate : 입력이 없으면 오늘 날짜로 ㄱ

CREATE TABLE tempsbs AS SELECT * FROM sbscompany;--백업용 데이터 테이블 작성


*Read
SELECT * FROM STUDENT;


*Update
UPDATE STUDENT SET NAME='이수성' WHERE HAKBEON='1999038012';


*Delete : ROLLBACK 가능
DELETE FROM STUDENT WHERE HAKBEON='2009038033';
#################################################################################
VARCHAR, CHAR, INT, NCHAR, NVARCHAR 차이
    VARCHAR : 문자열을 할당, ABC를 입력하면 3바이트 할당, 가나다를 입력하면 9바이트를 할당
    CHAR : 문자열을 할당, ABS를 입력하거나 가나다를 하거나 상관없이 CHAR[10]이면 10바이트 할당
    INT : 정수형 숫자를 할당
    NCHAR : CHAR이랑 똑같이 공간을 미리 할당하지만, 한글이나 영어 구분없이 글자 수를 셈
    NVARCHAR : VARCHAR랑 똑같이 공간을 맞춰 할당하지만, 한글, 영어 상관없이 글자수에 따라 맞춰 할당
#################################################################################
*Alter
alter table mysoldier add gender char(1);
ALTER TABLE sbscompany ADD (name varchar2(50), department varchar2(50));
ALTER TABLE sbscompany RENAME COLUMN birthday TO ipsail;


*Commit
COMMIT;


*Rollback
ROLLBACK;


*Truncate : 영구 삭제
TRUNCATE TABLE MYSOLDIER;
ROLLBACK 안 됨

DROP : 테이블 자체를 완전히 지워버림. 각 컬럼들의 자료형들도 다 소실됨


*Trim : 공백이 싹 지워짐. 앞뒤의 공백을 지우는 것.
update mysoldier set name = trim(name);


*Join
SELECT sabeon, age, TO_CHAR(ipsail, 'YYYY-MM-DD') AS ipsail, name, depart.departname FROM sbscompany JOIN depart ON sbscompany.department = depart.departcode;

SELECT sabeon 사번, age 나이, sbscompany.name 이름, buseogwali.name 부서명 FROM sbscompany JOIN buseogwali ON sbscompany.department = buseogwali.code;


*Where
SELECT sbscompany.sabeon, sbscompany.age, TO_CHAR(sbscompany.ipsail, 'YYYY-MM-DD') AS ipsail, sbscompany.name, depart.departname FROM sbscompany, depart WHERE sbscompany.department = depart.departcode;


*View : 가상 테이블이며, 원본에 영향을 받고 실제로 존재하는 테이블은 아니다.
CREATE VIEW mycompany AS SELECT sabeon 사번, age 나이, sbscompany.name 이름, buseogwali.name 부서명 FROM sbscompany JOIN buseogwali ON sbscompany.department = buseogwali.code;
  AS 뒤에서부터는 그냥 SELECT문이다.


*칼럼명 바꾸고 싶을 때
ALTER TABLE sbscompany RENAME COLUMN birthday TO ipsail;


*칼럼 자료형 바꾸고 싶을 때(데이터 유형을 변경할 열은 데이터가 비어 있어야 한다)
DELETE FROM sbscompany;
ALTER TABLE sbscompany MODIFY sabeon INT;


*Order by
SELECT * FROM mycompany ORDER BY 나이;
SELECT * FROM mycompany ORDER BY 나이 DESC;


*Group by
SELECT 부서명, ROUND(AVG(나이),1) FROM mycompany GROUP BY 부서명;


*HAVING
SELECT 부서명, ROUND(AVG(나이),1) FROM mycompany GROUP BY 부서명 HAVING ROUND(AVG(나이),1)>35;


*Foreign key
ALTER TABLE sbscompany ADD CONSTRAINT fk_depart FOREIGN KEY(department) REFERENCES depart(departcode);

CREATE TABLE MyDbStudent(
hakbeon NVARCHAR2(10) PRIMARY KEY,
name NVARCHAR2(20),
age INT,
HakGwaCode CHAR(3) REFERENCES MyDbHakgwa(code));


*Procedure
프로시저
함수랑 유사한 것
--사람 추가하는 프로시저
DROP PROCEDURE add_person;
CREATE OR REPLACE PROCEDURE add_person(
mynum IN INT,
myname VARCHAR2,
myhp VARCHAR2)
IS BEGIN
INSERT INTO simple_test_table VALUES(mynum,myname,myhp);
END add_person;
/*
CREATE OR REPLACE : 같은 이름의 프로시저를 또 만들려고 하면 덮어쓴다. 없으면 새로 만든다.
IN : 매개변수 의미. 원래는 myname, myhp 뒤에도 IN이 붙어야 하는데 하나만 붙어도 나머지 애들을 모두 다 매개변수라고 생각함.
alt + F10 : 새 SQL 워크시트 생성
다 만들었으면 다른 워크시트에서 프로시저를 호출하는게 좋으나 굳이 같인 워크시트에서 하고 싶다면 /를 하나 써주고 나서 그 밑에 호출한다.
*/

호출
EXEC add_person(3,'박연진','4444');


함수
리턴이 있는 것