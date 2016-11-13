/* Jun Park, Dawn Liang, William Li
   EE371 Lab3 Propagation Delay Calculator
   Displays total propagation delay caused
   by trace lengths and logic devices.
*/
#include <stdio.h>
#include <stdlib.h>

int main() {
    printf("Propagation Delay Calculator\n");
    printf("Definitions:\n");
    printf("There is 16 ps of delay per 0.1 inches of trace.\n");
    printf("There is 0.1 inches of trace between logic devices.\n");
    printf("Each logic device has a 5 ns delay or 5000 ps delay.\n");
    printf("\n");
    printf("Number of logic devices in the signal path?");
    char *p, s[100];
    int gates;
    while (fgets(s, sizeof(s), stdin)) { // re-prompt until non-negative integer
        gates = strtol(s, &p, 10);
        if (p == s || *p != '\n') {
            printf("Please enter a non-negative integer1: ");
        } else if (gates < 0) {
            printf("Please enter a non-negative integer2: ");
        } else {
            break;
        }
    }
    int totalDelay;
    if (gates == 0) {
        totalDelay = 0;
    } else {
        totalDelay = gates*5000 + (gates-1)*18;
    }
    printf("\n");
    printf("Total Propgation Delay: %dps\n", totalDelay);
    printf("Or equivalent to      : %.3lfns\n", (totalDelay/1000.0));
    return 0;
}















