#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    char *name;
    int age;
} Person;

extern void person_set(Person *person, char *name, int age);

int main() {
    Person p;
    char name[] = "Mister Coder";

    // Allocate memory for name in Person struct
    p.name = (char *)malloc(strlen(name) + 1);
    if (p.name == NULL) {
        perror("malloc failed");
        return 1;
    }

    // Call the assembly function to set the name and age
    person_set(&p, name, 30);

    // Print the results
    printf("Name: %s\n", p.name);
    printf("Age: %d\n", p.age);

    // Free the allocated memory
    free(p.name);

    return 0;
}

