/* Jun Park, Dawn Liang, William Li
   EE371 Lab3 Temperature Calculator
   Displays Fahrenheit, Celsius, and Kelvin
*/
#include <stdio.h>
int main() {
    char scale;
    while (scale != 'f' || scale != 'F' || scale != 'c' || scale != 'C' || scale != 'k' || scale != 'K') {
        printf("Current temperature scale(C, F, or K)? ");
        scanf(" %c", &scale);
        if (scale == 'f' || scale == 'F' || scale == 'c' || scale == 'C' || scale == 'k' || scale == 'K') {
            break;
        } else {
            printf("Scale you entered was not a valid scale. Try again.\n");
        }
    }
    double temperature;
    printf("Current Temperature? ");
    while(scanf("%lf", &temperature) != 1) {
        scanf("%*s"); //ignore the non-double value
        printf("Temperature you entered was not valid. Try again.\n");
        printf("Temperature?");
        if(scanf("%lf", &temperature) == 1) {
            break;
        }
    }

    double tempC;
    double tempF;
    double tempK;
    if (scale == 'f' || scale == 'F') { //Converts F to C and K
        tempF = temperature;
        tempC = (tempF-32.0) * (5.0/9.0);
        tempK = tempC + 273.15;
    } else if (scale == 'c' || scale == 'C') { //Converts C to F and K
        tempC = temperature;
        tempK = tempC + 273.15;
        tempF = tempC*(9.0/5.0) + 32;
    } else { //(scale == 'k' || scale == 'K') //Converts K to F and C
        tempK = temperature;
        tempC = tempK - 273.15;
        tempF = tempC*(9.0/5.0) + 32;
    }

    char outScale;
    while (outScale != 'f' || outScale != 'F' || outScale != 'c' || outScale != 'C' || outScale != 'k' || outScale != 'K') {
        printf("Convert to which temperature scale(C, F, or K)? ");
        scanf(" %c", &outScale);
        if (outScale== 'f' || outScale == 'F' || outScale == 'c' || outScale == 'C' || outScale == 'k' || outScale == 'K') {
            break;
        } else {
            printf("Scale you entered was not a valid scale. Try again.\n");
        }
    }

    if (outScale == 'f' || outScale == 'F') {
        printf("Temperature in Fahrenheit: %.2f degrees\n", tempF);
    } else if (outScale == 'c' || outScale == 'C') {
        printf("Temperature in Celsius   : %.2f degrees\n", tempC);
    } else {
        printf("Temperature in Kelvin    : %.2f degrees\n", tempK);
    }
    return 0;
}















