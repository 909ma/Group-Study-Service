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

/*INSERT INTO study_cafe (cafe_id, cafe_name, address, phone, open_time, close_time, facilities, seats, outlets, wifi, smoking_area, membership, membership_fee)
VALUES ('SC0001', '종로 스터디카페', '서울특별시 종로구 종로 123', '02-123-4567', '09:00', '22:00', '스탠드, 회의실, 노트북 대여, 무료음료', 50, 20, '무선인터넷', '분리석 내외 모두 금연', '프리미엄 멤버십', 30000);
INSERT INTO study_cafe (cafe_id, cafe_name, address, phone, open_time, close_time, facilities, seats, outlets, wifi, smoking_area, membership, membership_fee)
VALUES ('SC0002', '강남 스터디카페', '서울특별시 강남구 강남대로 123', '02-234-5678', '10:00', '23:00', '스탠드, 자유롭게 이용 가능한 공간, 무료음료', 60, 30, '무선인터넷', '흡연 가능', '베이직 멤버십', 20000);
INSERT INTO study_cafe (cafe_id, cafe_name, address, phone, open_time, close_time, facilities, seats, outlets, wifi, smoking_area, membership, membership_fee)
VALUES ('SC0003', '홍대 스터디카페', '서울특별시 마포구 와우산로 123', '02-345-6789', '08:00', '22:00', '스탠드, 노트북 대여, 무료음료', 40, 15, '유선인터넷', '분리석 내외 모두 금연', '프리미엄 멤버십', 35000);
INSERT INTO study_cafe (cafe_id, cafe_name, address, phone, open_time, close_time, facilities, seats, outlets, wifi, smoking_area, membership, membership_fee)
VALUES ('SC0004', '건대 스터디카페', '서울특별시 광진구 능동로 123', '02-456-7890', '11:00', '02:00', '스탠드, 노트북 대여, 무료음료, 야간 영업', 70, 25, '무선인터넷', '흡연 가능', '베이직 멤버십', 15000);*/

--임시 자료도 있긴 한데 거주지는 FK로 불러오는게 맞을듯? 거주지테이블을 단순화해서 좀 쉽게 갑시다