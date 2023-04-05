#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
    // 문자열 50개
    char *strings[] = {
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
char* names[] = {"Emma", "Liam", "Olivia", "Noah", "Ava", "William", "Sophia", "James", "Isabella", "Oliver", "Mia", "Benjamin", "Charlotte", "Elijah", "Amelia", "Lucas", "Harper", "Mason", "Evelyn", "Logan", "Abigail", "Alexander", "Emily", "Ethan", "Elizabeth", "Jacob", "Mila", "Michael", "Ella", "Daniel", "Avery", "Henry", "Sofia", "Jackson", "Camila", "Sebastian", "Aria", "Aiden", "Scarlett", "Matthew", "Victoria", "Samuel", "Madison", "David", "Luna", "Joseph", "Grace", "Carter", "Chloe", "Owen", "Penelope"};
char* sex[] = {"남자","여자"};
    // 파일 생성 및 문자열 출력
    /*
    BEGIN
  add_user(
    'studious_123', -- 아이디
    'password1', -- 비밀번호
    'test1@test.com', -- 이메일
    '홍길동', -- 이름
    TO_DATE('19900101', 'YYYY-MM-DD'), -- 생년월일
    '남성', -- 성별
    '010-1234-5678', -- 연락처1
    '02-123-4567', -- 연락처2
    NULL, -- 거주지
    NULL, -- 관심 과목
    NULL, -- 공부 시간대
    NULL, -- 자격증
    NULL, -- 학력
    '1' -- 회원 등급
  );
END;
*/
	srand(time(NULL));  // 난수 생성기 초기화
    
    int start_year = 1900;  // 년도 범위 시작
    int end_year = 2023;    // 년도 범위 끝
    int year = rand() % (end_year - start_year + 1) + start_year;  // 랜덤으로 년도 생성
    
    int month = rand() % 12 + 1;  // 랜덤으로 월 생성
    int day = rand() % 31 + 1;  // 랜덤으로 일 생성
    int first_part;
    int second_part;
    //printf("%d년 %d월 %d일\n", year, month, day);
    
    FILE *fp = fopen("output.sql", "w");
    if(fp == NULL) {
        printf("파일을 생성할 수 없습니다.");
        return -1;
    }
    for(int i=0; i<50; i++) {
    	fprintf(fp,"BEGIN\n");
    	fprintf(fp,"add_user(\n");
        fprintf(fp, "'%s',\n", strings[i]);//아이디  
    	fprintf(fp,"'password%d',\n",i+1);
    	fprintf(fp,"'test%d@test.com',\n",i+1);//이메일
    	fprintf(fp,"'%s',\n",names[i]);//이름 
    	
    	year = rand() % (end_year - start_year + 1) + start_year;  // 랜덤으로 년도 생성
    	month = rand() % 12 + 1;  // 랜덤으로 월 생성
    	day = rand() % 31 + 1;  // 랜덤으로 일 생성
    	fprintf(fp,"TO_DATE('%d-%d-%d','YYYY-MM-DD'),\n",year,month,day);//생년월일 
    	
    	fprintf(fp,"'%s',\n",sex[i%2]);//성별 
    	first_part = rand() % 10000;  // 0부터 9999 사이의 랜덤 정수 생성
    	second_part = rand() % 10000;  // 0부터 9999 사이의 랜덤 정수 생성
    	fprintf(fp,"'010-%04d-%04d',\n",first_part,second_part);//연락처 1
    	
    	first_part = rand() % 1000;  // 0부터 999 사이의 랜덤 정수 생성
    	second_part = rand() % 10000;  // 0부터 9999 사이의 랜덤 정수 생성
    	fprintf(fp,"'02-%03d-%04d',\n",first_part,second_part);//연락처2 
    	
    	fprintf(fp,"NULL,\n");//거주지 
    	fprintf(fp,"NULL,\n");//관심과목 
    	fprintf(fp,"NULL,\n");//공부시간대 
    	fprintf(fp,"NULL,\n");//자격증 
    	fprintf(fp,"NULL,\n");//학력 
    	fprintf(fp,"'1'\n");//회원등급 
    	fprintf(fp,");\n");
    	fprintf(fp,"END;\n/\n");
    }

    fclose(fp);
    return 0;
}

