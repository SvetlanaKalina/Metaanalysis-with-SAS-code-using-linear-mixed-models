*Data from Franz et al. (2019); 

TITLE 'Attention-Deficit/Hyperactivity Disorder and Very Preterm/Very Low Birth Weight';

DATA ADHD;
INPUT study OR diagnostics $; *identifier, effect estimate and diagnostics group;
CARDS;
1 1.94 VP 
2 4.84 VP
3 1.67 VP
4 3.8 VP
5 2.18 VP
6 0.45 VP
7 3.57 VP
8 3.57 VP
9 2.23 EP
10 4.34 EP
11 5.96 EP
12 4.63 EP
;
*VP: very preterm, EP: extremely preterm;

PROC MIXED COVTEST DATA=ADHD;
CLASS study diagnostics;
MODEL OR = diagnostics/  SOLUTION;
RANDOM study /  SOLUTION;
REPEATED / GROUP = study;
PARMS (.50)
 (0.06) (8.06) (.43) (1.28)
 (0.38) (0.03) (.58) (0.21)
 (0.136) (0.31) (.048) (0.648) 
 / EQCONS=2 to 13;
RUN;
*Results: Fixed effect estimates of 2.4040 (SE=0.5372) for VP and 4.2915 (1.8875+2.4040/ SE=0.8852) for EP.

With this information the confidence intervalls can be calculated:

2.4040 +/- 1.96*0.5372 = [1.351 - 3.457]
4.2915 +/- 1.96*0.8852 = [2.557 - 6.026]

Final OR: 
VP: 2.4040 [95%CI = 1.351 - 3.457]
EP: 4.2915 [95%CI = 1.351 - 3.457];