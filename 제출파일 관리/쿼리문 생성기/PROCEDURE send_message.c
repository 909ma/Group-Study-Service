#pragma warning(disable:4996)
#include <stdio.h>
#include <stdlib.h>

int main()
{
    // 문자열 50개
    char* strings[] = {
        "studious_123",
        "smartgirl_456",
        "bookworm_789",
        "genius_kid123",
        "studysquad_246",
        "mathwhiz_135",
        "englishpro_567",
        "sciencegeek_890",
        "studybuddy_1234",
        "historybuff_5678",
        "pinkunicorn123",
        "galaxytraveler22",
        "bookworm_librarian",
        "nightowl_student",
        "sunnybeachlover",
        "techgeek2022",
        "musicjunkie88",
        "sweettoothbaker",
        "yogafitnessfan",
        "adventureseeker21",
        "candy_lover",
        "blue_moon",
        "star_dreamer",
        "velvet_echo",
        "mystic_garden",
        "silver_wings",
        "midnight_rider",
        "honey_bloom",
        "ocean_whisper",
        "golden_glory",
        "happy_day123",
        "future_plan567",
        "study_hard789",
        "peaceful_mind111",
        "success_story555",
        "learning_way222",
        "knowledge_hub999",
        "growth_mindset333",
        "challenge_accepted4",
        "explore_more777",
        "happyhiker33",
        "coffeeaddict99",
        "bookwormgal",
        "musicjunkie22",
        "wanderlustguru",
        "doglover2023",
        "fitnessfreak88",
        "plantmama77",
        "adventureseeker10",
        "foodieforever999"
    };

    char* message[] = {
    "안녕하세요.",
    "오늘 수업 엄청 재밌었는데, 너무 흥미롭게 들었어!",
    "이 문제 어떻게 푸는지 모르겠는데, 같이 공부하면 좋을 것 같아서 말이야.",
    "그 동영상 보면서 새로운 개념을 배웠는데, 진짜 유용하더라.",
    "저번 시험 문제랑 비슷한 문제가 나올 거 같아서 미리 연습해보고 싶은데 같이 해줄 수 있어?",
    "과제 너무 어려워서 힘들다... 이 부분 좀 설명해줄래?",
    "오늘 푼 연습문제 다 틀려서 답답해... 너는 어떻게 풀었어?",
    "무슨 공부 방법이 효과적인지 궁금한데, 너는 어떤 방법으로 공부하니?",
    "오늘 시험 대박 망쳤어... 어떻게 다음에는 더 잘 볼 수 있을까?",
    "이 책 정말 좋다고 추천받은 건데, 같이 읽으면서 이야기해볼래?",
    "수업 중에 궁금한 게 많아서, 질문 좀 하다 보니까 너무 많아져서 미리 미안해!",
    "요즘 공부하는 내용이 어떤 것인가요 ? 함께 공부해볼까요 ?",
    "공부하다가 잠시 쉬는 시간이 필요할 때 어떤 활동을 하시나요 ?",
    "공부를 시작한 이유가 무엇인가요 ? 자신이 가진 목표가 무엇인지 궁금합니다.",
    "같은 분야를 공부하는데 자신이 잘하는 부분과 어려운 부분이 있다면 어떤 부분인가요 ?",
    "여러가지 공부법 중 자신이 효과적이라고 생각하는 방법이 있다면 어떤 것인가요 ?",
    "언제부터 어떤 분야를 공부하기 시작했는지 알려주시겠어요 ?",
    "공부와 함께 일상 생활에서 관심을 가지고 있는 것이 있다면 무엇인가요 ?",
    "공부를 하면서 힘든 순간이 있다면 어떻게 극복하시나요 ?",
    "지금까지 공부를 하면서 가장 큰 성취감을 느꼈던 순간이 언제인가요 ?",
    "공부와 별개로 취미생활이 있다면 어떤 것을 즐기시나요 ? 함께 취미생활을 나눠볼까요 ?",
    "내일 시험인데, 두려움이 좀 있어. 같이 공부하면 덜 두려울 것 같아서 너랑 같이 하자!",
    "어떤 공부 방법이 효과적인지 모르겠어. 너는 어떻게 하면 좋은 결과를 얻을 수 있었어?",
    "공부하다가 지쳐서 좀 쉬고 싶은데, 너는 어떻게 해서 자극을 받으며 공부하니?",
    "오늘 공부한 내용 너무 재미있었어! 이런 것도 공부할 수 있다는 거에 놀랐어.",
    "시험 기간에는 서로 응원하면서 공부하는 게 좋을 것 같아. 같이 화이팅 하자!",
    "나는 공부할 때 집중이 잘 안돼. 너는 어떻게 해서 집중을 잘 유지하니?",
    "이번 시험에는 좋은 성적을 받고 싶어서 열심히 공부하고 있어. 너도 같이 성적 좋게 받자!",
    "공부할 때 스트레스 받거나 불안해지는 경우가 있는데, 그럴 때는 어떻게 해야 해?",
    "이제 시험기간이라고 해도 같이 식사하거나 쉬는 시간도 줄일 수 없잖아? 같이 시간을 활용해서 공부하자!"
    };
    // 파일 생성 및 문자열 출력
    /*
DECLARE
    message_id NUMBER := 1;
    sender_id VARCHAR2(20) := 'user1';
    receiver_id VARCHAR2(20) := 'user2';
    message_text NVARCHAR2(1000) := '안녕하세요. 오늘 일정이 어떻게 되나요?';
    created_date DATE := SYSDATE;
BEGIN
    send_message(message_id, sender_id, receiver_id, message_text, created_date);
END;
/
*/

    FILE* fp = fopen("output.sql", "w");
    if (fp == NULL) {
        printf("파일을 생성할 수 없습니다.");
        return -1;
    }

    srand(time(NULL)); // 난수 생성기 초기화

    for (int i = 0; i < 50; i++) {

        int year = rand() % 20 + 2003; // 2003~2022 년도 중에서 랜덤 선택
        int month = rand() % 12 + 1; // 1~12 월 중에서 랜덤 선택
        int day = rand() % 28 + 1; // 1~28 일 중에서 랜덤 선택 (2월을 제외한 경우)

        //fprintf(fp, "DECLARE\n");
        //fprintf(fp, "message_id number:=%d\n", i + 1);
        //fprintf(fp, "sender_id VARCHAR2(20) := '%s'\n", strings[i % 50]);
        //fprintf(fp, "receiver_id VARCHAR2(20) := '%s'\n", strings[(i + 1) % 50]);
        //fprintf(fp, "message_text NVARCHAR2(1000) := '%s'\n", message[i % 30]);
        //fprintf(fp, "created_date DATE := to_date('%04d-%02d-%02d')\n", year, month, day);
        fprintf(fp, "BEGIN\n");
        fprintf(fp, "send_message(\n%d, \n'%s', \n'%s', \n'%s', \n'%04d-%02d-%02d');\n", i + 1, strings[i % 50], strings[(i + 1) % 50], message[i % 30], year, month, day);
        fprintf(fp, "END;\n");
        fprintf(fp, "/\n\n");

    }

    fclose(fp);
    return 0;
}

