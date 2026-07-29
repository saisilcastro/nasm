#include <coderio.h>

int main(void)
{
    PutnbrFd(0, 1);
    PutendlFd("", 1);

    PutnbrFd(42, 1);
    PutendlFd("", 1);

    PutnbrFd(-42, 1);
    PutendlFd("", 1);

    PutnbrFd(2147483647, 1);
    PutendlFd("", 1);

    PutnbrFd(-2147483648, 1);
    PutendlFd("", 1);

    PutnbrFd(999, 2);
    PutendlFd("", 2);

    return (0);
}
