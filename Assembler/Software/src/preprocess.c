/*
 * File name: preprocess.c
 * Description: This file has functions which remove comments and labels were replaced with addresses
 * Author: Sreethyan Aravinthan
*/

// standard header files
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// personal header files
#include "preprocess.h"
#include "extra.h"

// remove the comments from the code and create a new file
// lets call the file no_comments.asm
void remove_comments(char * file_name)
{
	FILE * original_code = xfopen(file_name, "r");
	FILE * pass_1 = xfopen("pass_1.asm", "w+");
	FILE * no_comment_code = xfopen("no_comments.asm", "w");
	char current_char = fgetc(original_code);	// hold the current character read
	char prev_char = 0;	// hold the previous character read
	char line[25];	// 
	
	// get the first character from the original code
	current_char = fgetc(original_code);
	
	if(current_char != ';')
	{
		fputc(9, pass_1);
	}

	// 1st pass for removing the comments	
	while(current_char != EOF)
	{
		// if the charcter is a ';' then it is a comment
		// therefore until the end of the line do not put that character and the following characters into the new file
		if(current_char == ';')
		{
			while(current_char != '\n')
			{
				current_char = fgetc(original_code);
			}
		}
		// place the character taken from the original file	
		fputc(current_char, pass_1);
		// get the next character		
		current_char = fgetc(original_code);	
	}

	// go back the begining of the file
	rewind(pass_1);

	// read each line from the 2nd temp file and store in final file
	while(fgets(line, 25, pass_1) != NULL)
	{
		// provided the format is not a tab then new line then save line in file
		if(strcmp(line, "	\n") != 0 && strcmp(line, "\n") != 0)
		{
			fprintf(no_comment_code, "%s", line);
		}
	}

	// close all the files
	fclose(original_code);
	fclose(pass_1);
	fclose(no_comment_code);

	// remove temporary files
 	remove("pass_1.asm");
}

void remove_label(void)
{
	FILE * no_comment_code = xfopen("no_comments.asm", "r");
	FILE * no_labels_code = xfopen("no_labels.asm", "w");
	char line[LENGTH_OF_INSTR];	// hold the current line that was read from the file
	char * colon = ":";	// this is used to see if a colon exisits in a line
	char * comma = ",";	// this is used to see if a comma exisits in a line
	char * token;		// this will hold the address of the occurenec of a needle 
	unsigned short int address = 0;	// this holds the address of the current instruction
	unsigned int labels_index = 0;	// this is an index to traverse the labels array
	unsigned int label_address_index = 0;	// this is an index to traverse the label_address array

	// hold the instructions that will take two 16 bit values in instruction memory in a multi-dimmesional array 
	char two_space_instr[16][5];
	// copythe values in
	strcpy(two_space_instr[0],"jz");
	strcpy(two_space_instr[1], "jmp");
	strcpy(two_space_instr[2], "movi");
	strcpy(two_space_instr[3], "addi");
	strcpy(two_space_instr[4], "subi");
	strcpy(two_space_instr[5], "andi");
	strcpy(two_space_instr[6], "ori");
	strcpy(two_space_instr[7], "call");
	strcpy(two_space_instr[8],"jb");
	strcpy(two_space_instr[9],"jbe");
	strcpy(two_space_instr[10],"ja");
	strcpy(two_space_instr[11],"jae");
	strcpy(two_space_instr[12],"jg");
	strcpy(two_space_instr[13],"jge");
	strcpy(two_space_instr[14],"jl");
	strcpy(two_space_instr[15],"jle");
	
	labels_and_addresses_file file_data;
	file_data.index = 0;
	
	// find the labels and the corresponding address
	while(fgets(line, LENGTH_OF_INSTR, no_comment_code) != NULL)
	{
		// check if the line has a colon
		token = strstr(line, colon);

		// if the line does have a colon get the label
		// else calculate the next address 
		if(token != NULL)
		{
			int index = 0;
			while(line[index] != ':')
			{
				file_data.labels[file_data.index][index] = line[index];
				index++;
			}
			file_data.labels[file_data.index][index] = '\0';
			file_data.label_address[file_data.index] = address;
			file_data.index++;
		}
		else
		{
			// flag to indicate if the address needs to be jumped by 2
			char plus_2 = 0;

			// check to see if the current instruction has an instruction which takes up 2 16 bit fields
			for(int i = 0; i < 16; i++)
			{
				if(strstr(line, two_space_instr[i]) != NULL)
				{
					plus_2 = 1;
					break;
				}
			}
			
			// if yes add 2 or else add 1
			if(plus_2 == 1)
			{
				address += 2;
			}
			else
			{
				address++;
			}
		}
	}
	
	// go back to the begining of the file
	rewind(no_comment_code);
	
	// remove all the labels and replace it with the address
	// also remove all the labels that has a colon next to iti	
	while(fgets(line, LENGTH_OF_INSTR, no_comment_code) != NULL)
	{
		// check if the line has a comma
		token = strstr(line, comma);

		// if null it means we are dealing with a jump or call instruction
		if(token == NULL)
		{
			// check if colon exist
			token = strstr(line, colon);
			// if the colon does not exist then the line is a jump or call instruction
			if(line[1] == 'p' || line[1] == 'r')
			{			
				for(int index = 1; index < strlen(line); index++)
				{
					fprintf(no_labels_code,"%c", line[index]);
				}
			}
			else if(token == NULL)
			{
				// this is used to index through the current line of code
				int index = 0;
				// print the first character
			//	fprintf(no_labels_code, "%c", line[index]);
				index++;	// index for the next character in the line
				char label[LENGTH_OF_LABEL];	// this holds the current label that was read from the line
				// print the opcode
				while(index < strlen(line))
				{
					if(line[index] != SPACE)
					{
						fprintf(no_labels_code,"%c", line[index]);
					}
					else
					{
						fprintf(no_labels_code," ");
						break;
					}
					index++;
				}

				// go to the next character after the space
				index++;

				// go through the rest of the line and get the label and store in a seperate variable called label
				int i = 0;	// this is used to go through the label array
				// go through the rest of the line and get the label for comparsion with the list of labels later to replace it with the corresponding address
				while(index < strlen(line))
				{
					// if the current character that is being read from the line is between A-Z or a-z or 0-9 or _ then pass it through or exit
					if((line[index] >= UPPER_A && line[index] <= UPPER_Z) || (line[index] >= LOWER_A && line[index] <= LOWER_Z) || line[index] == UNDERSCORE || (line[index] >= ZERO && line[index] <= NINE))
					{
						// fill the current character and increment for next character
						label[i] = line[index];
						index++;
						i++;
					}
					else
					{
						break;
					}
				}

				// place null terminator to show the end of the label
				label[i] = '\0';

				// now go through all the labels and find the address and replace it with its address
				for(int j = 0; j < file_data.index; j++)
				{
					if(strcmp(file_data.labels[j], label) == 0)
					{
						fprintf(no_labels_code,"%d", file_data.label_address[j]);
					}
				}
				fprintf(no_labels_code,"\n");
			}
		}
		else
		{
			for(int index = 1; index < strlen(line); index++)
			{
				fprintf(no_labels_code,"%c", line[index]);
			}
		}
	}
	
	// print all the labels and the coressponding addresses
//	for(int i = 0; i < file_data.index; i++)
//	{
//		printf("%s %d\n", file_data.labels[i], file_data.label_address[i]);
//	}
	
	fclose(no_comment_code);
	fclose(no_labels_code);
}

