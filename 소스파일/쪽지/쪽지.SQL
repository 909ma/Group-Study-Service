CREATE TABLE message_sender (
    sender_id INT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE message_receiver (
    receiver_id INT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE message (
    message_id INT PRIMARY KEY,
    sender_id INT,
    receiver_id INT,
    message_text NVARCHAR2(1000),
    author VARCHAR2(100),
    created_date DATE,
    FOREIGN KEY (sender_id) REFERENCES message_sender(sender_id),
    FOREIGN KEY (receiver_id) REFERENCES message_receiver(receiver_id)
);

-- message_sender 테이블에 사용자 추가
INSERT INTO message_sender (sender_id, username, email) 
VALUES (1, 'sender', 'sender@example.com');

-- message_receiver 테이블에 사용자 추가
INSERT INTO message_receiver (receiver_id, username, email) 
VALUES (1, 'receiver', 'receiver@example.com');

INSERT INTO message (message_id, sender_id, receiver_id, message_text, author, created_date)
VALUES (1, 1, 1, 'Hello, World!', 'sender', SYSDATE);



select * from message_sender;
select * from message_receiver;
select * from message;