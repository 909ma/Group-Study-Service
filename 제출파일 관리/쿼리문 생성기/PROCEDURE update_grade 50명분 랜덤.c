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
    
    // 파일 생성 및 문자열 출력
    /*
BEGIN
  update_grade(
  'studious_123',
  '2'
  );
END;
*/
	srand(time(NULL));  // 난수 생성기 초기화
    int grade = rand() % 31 + 1;  // 랜덤으로 일 생성
    
    FILE *fp = fopen("output.sql", "w");
    if(fp == NULL) {
        printf("파일을 생성할 수 없습니다.");
        return -1;
    }
    for(int i=0; i<50; i++) {
    	fprintf(fp,"BEGIN\n");
    	fprintf(fp,"update_grade(\n");
        fprintf(fp, "'%s',\n", strings[i]);//아이디  
        
        grade = rand() % 6 + 1;
    	fprintf(fp,"'%d'\n",grade);
    	fprintf(fp,");\n");
    	fprintf(fp,"END;\n/\n");
    }

    fclose(fp);
    return 0;
}

