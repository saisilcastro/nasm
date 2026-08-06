#include <coderio.h>

int main() {
	for (int i = 'A'; i <= 'Z'; i++) {
		int	c = ToLower(i);
		printf("[%c.%c]", c, i);
	}
    return 0;
}
