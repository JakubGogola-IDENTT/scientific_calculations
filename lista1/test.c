#include <stdio.h>
#include <float.h>

int main() {
	printf("float\n");
	printf("macheps: %.7e\n", __FLT_EPSILON__);
	printf("max: %.7e\n", __FLT_MAX__);

	printf("\ndouble\n");
	printf("macheps: %.15e\n", __DBL_EPSILON__);
	printf("max: %.16e\n", __DBL_MAX__);
	
	return 0;
}
