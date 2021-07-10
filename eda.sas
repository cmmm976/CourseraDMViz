LIBNAME Data "/home/u58542073/my_shared_file_links/ldierker/" access=readonly;

DATA r_data;
SET DATA.addhealth_pds;
PROC SORT; BY AID;

PROC SQL;
DROP TABLE myData;
CREATE TABLE myData AS
SELECT H1ED1 AS nb_sick_days, H1ED2 AS nb_skipped_days, H1ED3 AS skipped_grade,H1ED4A AS skipped_first_grade,H1ED4B AS skipped_second_grade,
	   H1ED4C AS skipped_third_grade,H1ED4D AS skipped_fourth_grade,H1ED4E AS skipped_fifth_grade,H1ED4F AS skipped_sixth_grade,
	   H1ED4G AS skipped_seventh_grade,H1ED4H AS skipped_eighth_grade,H1ED4I AS skipped_ninth_grade,H1ED4J AS skipped_tenth_grade,
	   H1ED4K AS skipped_eleventh_grade,H1ED4M AS school_not_graded,
	   H1ED5 AS repeated_grade,H1ED6A AS repeated_first_grade,H1ED6B AS repeated_second_grade,H1ED6C AS repeated_third_grade,
	   H1ED6D AS repeated_fourth_grade,H1ED6E AS repeated_fifth_grade,H1ED6F AS repeated_sixth_grade,H1ED6G AS repeated_seventh_grade,
	   H1ED6H AS repeated_eighth_grade,H1ED6I AS repeated_ninth_grade,H1ED6J AS repeated_tenth_grade,H1ED6K AS repeated_eleventh_grade, 
	   H1ED6L AS repeated_twelfth_grade,
	   H1ED7 AS suspended_from_school, H1ED8 AS suspension_grade, H1ED9 AS expelled_from_school, H1ED10 AS expulsion_grade,
	   H1ED11 AS english_grade,H1ED12 AS maths_grade,H1ED13 AS social_sciences_grade,H1ED14 AS sciences_grade,H1ED15 AS trouble_with_teachers,
	   H1ED16 AS trouble_paying_attention,H1ED17 AS trouble_doing_homework,H1ED18 AS trouble_with_students,H1ED19 AS close_to_people,
	   H1ED20 AS part_of_school,H1ED21 AS students_prejudiced,H1ED22 AS happy_to_be_at_its_school, H1ED23 AS fair_teachers,H1ED24 AS school_safe,
	   H1SE1 AS stopping_after_being_turned_on,H1SE2 AS having_birth_control_available,H1SE3 AS refusing_unprotected_sex,
	   H1SE4 AS selfperceived_intelligence
FROM r_data;

PROC FORMAT;
	value yesno
		1='yes'
		0='no'
		6='refused'
		7='legitimate skip'
		8="don't know"
		9='not applicable';
	value sick_days
		0='never'
		1='1 or 2 times'
		2='3 to 10 times'
		3='more than 10 times'
		6='refused'
		7='legitimate skip'
		8="don't know"
		9='not applicable';
	value skipped_days
		996='refused'
		997='legitimate skip'
		998="don't know"
		999='not applicable';
	value marked
		0='not marked'
		1='marked'
		6='refused'
		7='legitimate skip'
		8="don't know"
		9='not applicable';
	value grade
		1='first'
		2='second'
		3='third'
		4='forth'
		5='fifth'
		6='sixth'
		7='seventh'
		8='eighth'
		9='ninth'
		10='tenth'
		11='eleventh'
		12='twelfth'
		96='refused'
		97='legitimate skip'
		98="don't know"
		99="not applicable";
	value subject_grade
		1="A"
		2="B"
		3="C"
		4="D or lower"
		5="didn't take that subject"
		6="wasn't graded this way"
		96='refused'
		97='legitimate skip'
		98="don't know"
		99="not applicable";
	value trouble
		0='never'
		1='just a few times'
		2='about once a week'
		3='almost everyday'
		4='everyday'
		6='refused'
		7='legitimate skip'
		8="don't know"
		9='not applicable';
	value agreement
		1='strongly agree'
		2='agree'
		3='neither agree or disagree'
		4='disagree'
		5='strongly disagree'
		6='refused'
		7='legitimate skip'
		8="don't know"
		9='not applicable';
	value confidence
		1='very sure'
		2='moderately sure'
		3='neither sure or unsure'
		4='moderately sure'
		5='very unsure'
		6='I never want to use birth control'
		96='refused'
		97='legitimate skip'
		98="don't know"
		99="not applicable";
	value intelligence
		1='moderately below average'
		2='slightly below average'
		3='about average'
		4='slightly above average'
		5='moderately above average'
		6='extremely above average'
		96='refused'
		97='legitimate skip'
		98="don't know"
		99="not applicable";
RUN;

DATA myData;
	SET myData;
	
	FORMAT nb_sick_days sick_days.;
	FORMAT nb_skipped_days skipped_days.;
	FORMAT skipped_grade yesno.;
	FORMAT skipped_first_grade marked.;
	FORMAT skipped_second_grade marked.;
	FORMAT skipped_third_grade marked.;
	FORMAT skipped_fourth_grade marked.;
	FORMAT skipped_fifth_grade marked.;
	FORMAT skipped_sixth_grade marked.;
	FORMAT skipped_seventh_grade marked.;
	FORMAT skipped_eighth_grade marked.;
	FORMAT skipped_ninth_grade marked.;
	FORMAT skipped_tenth_grade marked.;
	FORMAT skipped_eleventh_grade marked.;
	FORMAT school_not_graded marked.;
	FORMAT repeated_grade yesno.;
	FORMAT repeated_first_grade marked.;
	FORMAT repeated_second_grade marked.;
	FORMAT repeated_third_grade marked.;
	FORMAT repeated_fourth_grade marked.;
	FORMAT repeated_fifth_grade marked.;
	FORMAT repeated_sixth_grade marked.;
	FORMAT repeated_seventh_grade marked.;
	FORMAT repeated_eighth_grade marked.;
	FORMAT repeated_ninth_grade marked.;
	FORMAT repeated_tenth_grade marked.;
	FORMAT repeated_eleventh_grade marked.;
	FORMAT repeated_twelfth_grade marked.;
	FORMAT suspended_from_school yesno.;
	FORMAT suspension_grade grade.;
	FORMAT expelled_from_school yesno.;
	FORMAT expulsion_grade grade.;
	FORMAT english_grade subject_grade.;
	FORMAT maths_grade subject_grade.;
	FORMAT social_sciences_grade subject_grade.;
	FORMAT sciences_grade subject_grade.;
	FORMAT trouble_with_teachers trouble.;
	FORMAT trouble_paying_attention trouble.;
	FORMAT trouble_doing_homework trouble.;
	FORMAT trouble_with_students trouble.;
	FORMAT close_to_people agreement.;
 	FORMAT part_of_school agreement.;
 	FORMAT students_prejudiced agreement.;
 	FORMAT happy_to_be_at_its_school agreement.;
 	FORMAT fair_teachers agreement.;
 	FORMAT school_safe agreement.;
 	FORMAT stopping_after_being_turned_on confidence.;
 	FORMAT having_birth_control_available confidence.;
 	FORMAT refusing_unprotected_sex confidence.;
 	FORMAT selfperceived_intelligence intelligence.;
 	
 	LABEL skipped_grade ='Have skipped a grade'
 		  school_not_graded ="Haven't graded school"
 		  repeated_grade = 'Have repeated a grade'
 		  maths_grade='Mathematics grade'
 		  social_sciences_grade="History or Social Sciences grade"
 		  sciences_grade='Sciences grade'
 		  selfperceived_intelligence='Self-perceived intelligence';
 		  
 	IF skipped_grade = 6 THEN skipped_grade = .;
 	IF skipped_grade = 8 THEN skipped_grade = .;
 	
 	IF school_not_graded = 6 THEN school_not_graded = .;
 	IF school_not_graded = 8 THEN school_not_graded = .;
 	
 	IF repeated_grade = 6 THEN repeated_grade = .;
 	IF repeated_grade = 8 THEN repeated_grade = .;
 	
 	IF english_grade = 5 THEN english_grade = .;
	IF english_grade = 6 THEN english_grade = .;
	IF english_grade = 96 THEN english_grade = .;
	IF english_grade = 97 THEN english_grade = .;
	IF english_grade = 98 THEN english_grade = .;
	IF english_grade = 99 THEN english_grade = .;
 	
 	IF maths_grade = 5 THEN maths_grade = .;
 	IF maths_grade = 6 THEN maths_grade = .;
 	IF maths_grade = 96 THEN maths_grade = .;
 	IF maths_grade = 97 THEN maths_grade = .; 
 	IF maths_grade = 98 THEN maths_grade = .;
 	IF maths_grade = 99 THEN maths_grade = .;
 	
 	IF social_sciences_grade = 5 THEN social_sciences_grade = .;
 	IF social_sciences_grade = 6 THEN social_sciences_grade = .;
 	IF social_sciences_grade = 96 THEN social_sciences_grade = .;
 	IF social_sciences_grade = 97 THEN social_sciences_grade = .;
 	IF social_sciences_grade = 98 THEN social_sciences_grade = .;
 	IF social_sciences_grade = 99 THEN social_sciences_grade = .;
 	
 	IF sciences_grade = 5 THEN sciences_grade = .;
 	IF sciences_grade = 6 THEN sciences_grade = .;
 	IF sciences_grade = 96 THEN sciences_grade = .;
 	IF sciences_grade = 97 THEN sciences_grade = .;
 	IF sciences_grade = 98 THEN sciences_grade = .;
 	IF sciences_grade = 99 THEN sciences_grade = .;
 	
 	IF selfperceived_intelligence = 96 THEN selfperceived_intelligence = .;
 	IF selfperceived_intelligence = 98 THEN selfperceived_intelligence = .;
 	
 	general_grade = MEAN(english_grade,maths_grade,social_sciences_grade,sciences_grade);
 	IF general_grade < 1.5 THEN general_grade = 1;
 	IF general_grade >= 1.5 AND general_grade <2.5 THEN general_grade = 2;
 	IF general_grade >= 2.5 AND general_grade <3.5 THEN general_grade = 3;
 	IF general_grade >= 3.5 THEN general_grade = 4;
 	
 	FORMAT general_grade subject_grade.;
 	LABEL general_grade = 'Mean of all grades';
 	
 		 
 	
RUN;
	
PROC FREQ data=myData;
TABLES 
	skipped_grade 
	school_not_graded 
	repeated_grade
	english_grade
	maths_grade 
	social_sciences_grade 
	sciences_grade
	general_grade
 	selfperceived_intelligence;
RUN;
	
PROC GCHART; 
VBAR general_grade/DISCRETE TYPE=PCT WIDTH=30;

PROC GCHART; 
VBAR selfperceived_intelligence/DISCRETE TYPE=PCT WIDTH=30;
	
