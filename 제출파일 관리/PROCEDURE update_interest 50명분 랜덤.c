#pragma warning(disable:4996)
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
    int * interesting[] = {
        1,2,3,4,5,6,7,8,9
    };

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

    srand(time(NULL));

    FILE* fp = fopen("update_interest.sql", "w");
    if (fp == NULL) {
        printf("파일을 생성 할 수 없습니다");
        return -1;
    }

    for (int i = 0; i < 50; i++)
    {
        fprintf(fp, "BEGIN\n");
        fprintf(fp, "update_interest('%s', '%d');\n", strings[i], interesting[rand() % 9]); // 프로시저 호출, 전자=ID, 후자=관심과목
        fprintf(fp, "END;\n\n");
        fprintf(fp, "/\n");
    }

    fclose(fp);

    return 0;
}