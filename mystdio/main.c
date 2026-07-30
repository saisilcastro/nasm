#include <coderio.h>

static int is_zeroed(unsigned char *ptr, size_t total)
{
    size_t i;

    i = 0;
    while (i < total)
    {
        if (ptr[i] != 0)
            return 0;
        i++;
    }
    return 1;
}

int main(void)
{
    void *ptr;

    ptr = Calloc(10, sizeof(long));
    if (!ptr)
        return 1;

    if (is_zeroed((unsigned char *)ptr, 10 * sizeof(long)))
        PutendlFd("Normal allocation test: PASSED", 1);
    else
        PutendlFd("Normal allocation test: FAILED", 1);
    free(ptr);

    ptr = Calloc((size_t)-1, 2);
    if (!ptr)
        PutendlFd("Overflow test: PASSED", 1);
    else
        PutendlFd("Overflow test: FAILED", 1);

    ptr = Calloc(0, 5);
    if (ptr)
        free(ptr);
    PutendlFd("Zero count test: PASSED", 1);

    return 0;
}
