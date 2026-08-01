#include <coderio.h>

static void free_tab(char **tab)
{
    size_t i;

    if (!tab)
        return;
    i = 0;
    while (tab[i])
    {
        free(tab[i]);
        i++;
    }
    free(tab);
}

static void print_array(char const *prefix, char **arr)
{
    size_t i;

    printf("%s", prefix);
    if (!arr)
    {
        printf("NULL\n");
        return;
    }
    if (!arr[0])
    {
        printf("[0]: NULL\n");
        return;
    }
    i = 0;
    while (arr[i])
    {
        printf("[%lu]: %s  ", (unsigned long)i, arr[i]);
        i++;
    }
    printf("[%lu]: NULL\n", (unsigned long)i);
}

static void print_expected(char const **exp)
{
    size_t i;

    printf("Expected: ");
    if (!exp || !exp[0])
    {
        printf("[0]: NULL\n");
        return;
    }
    i = 0;
    while (exp[i])
    {
        printf("[%lu]: %s  ", (unsigned long)i, exp[i]);
        i++;
    }
    printf("[%lu]: NULL\n", (unsigned long)i);
}

static void run_test(char const *label, char const *s, char c, char const **exp)
{
    char **res;

    printf("--- %s ---\n", label);
    res = Split(s, c);
    print_array("Got:      ", res);
    print_expected(exp);
    printf("\n");
    free_tab(res);
}

int main(void)
{
    char const *exp1[] = {"hello", "world", "42", NULL};
    char const *exp2[] = {"helloworld", NULL};
    char const *exp3[] = {NULL};
    char const *exp4[] = {NULL};
    char const *exp5[] = {"a", "b", "c", NULL};
    char const *exp6[] = {NULL};
    char const *exp7[] = {"hello world", NULL};

    run_test("Multiple consecutive spaces", "  hello   world  42  ", ' ', exp1);
    run_test("No delimiters", "helloworld", ' ', exp2);
    run_test("Only delimiters", "     ", ' ', exp3);
    run_test("Empty string", "", ' ', exp4);
    run_test("Delimiter at edges", "-a-b-c-", '-', exp5);
    run_test("Single character matching delimiter", "a", 'a', exp6);
    run_test("Null delimiter", "hello world", '\0', exp7);
	return (0);
}
