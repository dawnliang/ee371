#include <stdio.h>
int main(void)
{
    // declare and initialise variables
    // inputs
    float man_cost, mark_up, sales_tax, discount;

    // outputs
    float list_price = 0.0;

    printf("Car list price calculator\n\n");

    printf("Enter the manufacturer's cost ($): ");
    scanf("%f", &man_cost);

    printf("Enter the estimated markup (%%): ");
    scanf("%f", &mark_up);

    printf("Enter the sales tax (%%): ");
    scanf("%f", &sales_tax);

    printf("Enter the dealer's pre-tax discount (%%): ");
    scanf("%f", &discount);

    printf("Manufacturer's cost  = $%.2lf\n", man_cost);
    printf("Est. dealer's markup = %.2lf%%\n", mark_up);
    printf("Pre-tax discount     = %.2lf%%\n", discount);
    printf("Sales tax            = %.2lf%%\n", sales_tax);
    printf("----------------------\n");

    list_price = man_cost * (1 + mark_up / 100) * (1 - discount/100) * (1 + sales_tax/100);

    printf("Your car will cost %3.2f\n", list_price);

    return 0;
}
