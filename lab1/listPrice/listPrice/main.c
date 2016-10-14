#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    // declare and initialise variables
    // inputs
    float man_cost = 0.0;
    float mark_up = 0.0;
    float sales_tax = 0.0;
    float discount = 0.0;

    // outputs
    float list_price = 0.0;

    printf("Calculating list price...\n");

    printf("Enter the manufacturer's cost ($): ");
    scanf("%f", &man_cost);

    printf("Enter the estimated markup (%%): ");
    scanf("%f", &mark_up);

    printf("Enter the sales tax (%%): ");
    scanf("%f", &sales_tax);

    printf("Enter the dealer's pre-tax discount (%%): ");
    scanf("%f", &discount);

    list_price = man_cost * (1 + mark_up / 100) * (1 - discount) * (1 + sales_tax);

    printf("Your car will cost %3.2f\n", list_price);

    return 0;
}
