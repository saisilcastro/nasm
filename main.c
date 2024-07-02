#include <unistd.h>

extern int _isdigit(int value);
extern int _isalpha(int value);
extern int _isalnum(int value);

int main(void) {
	int symbol = 0x30;
	int	i = -1;
	
	while (++i < 256) {
		if (_isalnum(i))
			write(1, &i, 1);
	}
	return 0;
}