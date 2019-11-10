#include <stdio.h>

int main(void)
{
	FILE * reg = fopen("registers.txt", "w");

	for(int i = 0; i < 32; i++)
	{
		fprintf(reg, "reg%d\n", i);
	}

	fclose(reg);
	return 0;
}
