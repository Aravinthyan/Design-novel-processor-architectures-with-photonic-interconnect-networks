/*
 * File name: main.c
 * Description: This is the main program file
 * Author: Sreethyan Aravinthan
*/

// standard header files
#include <stdio.h>
#include <string.h>

// personal header files
#include "assembly.h"
#include "preprocess.h"
#include "extra.h"

void combine_files(int argc, char * argv[], char out_file)
{
	// open the combined file in write mode
	FILE * combine = xfopen("combined.asm", "w");
	// this will be the pointer of the read file
	FILE * read_file;
	// this will hold the current file that is read from the current file
       	char line[1000];
	// go through all the files and combine into a single new file
	for(int i = 1; i < argc - out_file; i++)
	{
		// open the file
		read_file = xfopen(argv[i], "r");
		// read until EOF
		while(fgets(line, 1000, read_file) != NULL)
		{
			// write to new combined file
			fprintf(combine, "%s", line);
		}
		// close current file and then go to the next file if it exists
		fclose(read_file);
	}
	// close the combined file
	fclose(combine);
}

int main(int argc, char * argv[])
{
	char * file_name;
	char out_file = 1;

	// check if three arguments are supplied
	if(argc < 2)
	{
		printf("Too few arguements\nNeed atleast two arguements\n");
		return 0;
	}
	else	// one file assembly
	{
		// check to see if the output file is supplied	
		if(strstr(argv[argc - 1], ".mem") == NULL)
		{
			printf("No output file given\nSetting output file as out.mem\n");
			out_file = 0;
		}
		// combine all input files
		combine_files(argc, argv, out_file);
	}
	// remove the comments - creates a file called no_comments.asm
	remove_comments("combined.asm");		
	// remove and replace with addresses
	remove_label();
	if(out_file == 1)
	{	
		// convert from mnemonics to machine code
		convert_to_machine_code(argv[argc - 1]);
	}
	else
	{
		// convert from mnemonics to machine code
		convert_to_machine_code("out.mem");	
	}
	// remove temporary files
	remove("combined.asm");
	remove("no_comments.asm");	
	remove("no_labels.asm");
	return 0;
}
