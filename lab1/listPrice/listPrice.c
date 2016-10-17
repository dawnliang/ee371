/*
   EE 371 Lab 1
   Car Calculator Program

   The listPrice class estimates the user's desired car price
   given manufacturing costs, markup price, sales tax, and
   pre-tax discount price.

   @author(s) William Li, Jun Park, Dawn Liang
*/

#include <stdio.h>

int main(void) {
    // Variables to hold the required values to be calculated
    double in_price;
    double markup_price;
    double tax_percentage;
    double discount_price;
    double result;

    // User prompt and data entry 
    printf("Please enter the manufacture's cost of your desired car: ");
    scanf("%lf", &in_price);
    printf("Please enter an estimated dealer's markup price: ");
    scanf("%lf", &markup_price);
    printf("Please enter the sales tax that you will need to pay: ");
    scanf("%lf", &tax_percentage);
    printf("Please estimate the pre-tax discount you will receive: ");
    scanf("%lf", &discount_price);

    // calculate list price & print
    result = (in_price + markup_price - discount_price) * (1 + tax_percentage / 100);
    printf("Your estimated price of your vehicle is %2.2f\n", result);
    getchar();
    return 0;
}
