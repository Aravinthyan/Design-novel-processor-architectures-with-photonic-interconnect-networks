/*
 * Design Unit:
 * File name:
 * Description:
 * Author:
 * Version:
*/

// standard header files
#include <stdio.h>

// personal header files
#include "assembly.h"
#include "preprocess.h"

int main(int argc, char * argv[])
{
	// check if two arguments are supplied
	if(argc != 2)
	{
		printf("Too few arguements\n");
		return 0;
	}
	char * file_name = argv[1];
	remove_comments(file_name);	// remove the comments - creates a file called no_comments.asm
	remove_label();
	convert_to_machine_code();
	return 0;
}
