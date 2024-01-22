# code-samples
This repo contains Richard Campo's code samples.

The data I used are from the 2022 American Community Survey downloaded from
[IPUMS](https://usa.ipums.org/usa/).

I prepared the data before graphing and analyzing by creating the following 
variables:
- INCWAGE_LOG: the natural log of INCWAGE, the amount of wage income reported
- EDUCDC: Years of education derived from EDUCD
- AGESQ: AGE squared
- WHITE: =1 if white
- BLACK: =1 if black
- HISPANIC: =1 if Hispanic
- MARRIED: =1 if married
- VET: =1 if a veteran
- HSDIP: =1 if graduated from high school but not college
- COLDIP: =1 if graduated from college or higher
- HSDIP-EDUCDC: interaction
- COLDIP-EDUCDC: interaction

The scatterplot and regression line show a linear model of the relationship
between the years of education received and log income. We can predict that
an additional year of education will increase log income.

The multiple regression output shows a more complicated story. An
additional year of education for someone with no high school or college
diploma has no statistically significant effect on wages. However, an
additional year of education for someone with a high school diploma and
someone with a college diploma does have a positive expected effect on
log income.

The positive estimated coefficients for the dummy variables that record
whether an individual has a high school or college diploma provide evidence
for the sheepskin effect, the idea that getting a diploma results in an 
income boost due to a signal effect. Similarly, the positive estimated
coefficient of HSDIP-EDUCDC and more positive estimated coefficient of
COLDIP-EDUCDC provide evidence for increasing returns to education.


