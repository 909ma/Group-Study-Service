CREATE OR REPLACE PROCEDURE send_message(
    sender_id_in IN NUMBER,
    receiver_id_in IN NUMBER,
    message_text_in IN VARCHAR2
)
IS
    message_id NUMBER;
BEGIN
    -- 메시지 ID 값을 시퀀스에서 가져옵니다.
    SELECT message_seq.NEXTVAL INTO message_id FROM DUAL;

    -- 메시지를 삽입합니다.
    INSERT INTO message(message_id, sender_id, receiver_id, message_text, author, created_date)
    VALUES(message_id, sender_id_in, receiver_id_in, message_text_in, 'system', SYSDATE);
    
    -- 성공 메시지 출력
    DBMS_OUTPUT.PUT_LINE('Message sent successfully!');
    
EXCEPTION
    WHEN OTHERS THEN
        -- 실패 메시지 출력
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLCODE || ' - ' || SQLERRM);
END;
/

--예시
BEGIN
    send_message(1, 2, 'Hello, World!');
END;
/