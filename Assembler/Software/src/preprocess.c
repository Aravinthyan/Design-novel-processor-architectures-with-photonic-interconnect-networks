/***********************************************************************************
*	File name
				preprocess.c
*	Description
				This file has functions which remove comments and labels were.
*	Author
				Sreethyan Aravinthan (UCL)
**********************************************************************************/

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
	FILE * no_comment_code = xfopen("no_comments.asm", "w");
	char line[100];	// stores current line read
	char * target = ";";
	char * occur = NULL;

	while(fgets(line, 100, original_code) != NULL)
	{
		occur = strstr(line, target);

		// check to see if the pointer is not NULL indicating that this line has a ;
		if(occur != NULL)
		{
			// remove the ;
			// add a \n and \0
			*occur = '\n';
			*(occur + 1) = '\0';
			
			// provided the format is not a tab then new line then save line in file
			if(strcmp(line, "	\n") != 0 && strcmp(line, "\n") != 0)
			{
				fprintf(no_comment_code, "%s", line);
			}
		}
		// if the pointer is null then the line has no comment therefore write it in
		else
		{	
			fprintf(no_comment_code, "%s", line);
		}
	}

	// close all the files
	fclose(original_code);
	fclose(no_comment_code);
}

void remove_label(void)
{
	FILE * no_comment_code = xfopen("no_comments.asm", "r");
	FILE * no_labels_code = xfopen("no_labels.asm", "w");
	char line[LENGTH_OF_INSTR];	// hold the current line that was read from the file

	// hold the instructions that will take two 16 bit values in instruction memory in a multi-dimmesional array 
	char two_space_instr[16][5];
	// copythe values in
	strcpy(two_space_instr[0], "jz");
	strcpy(two_space_instr[1], "jmp");
	strcpy(two_space_instr[2], "movi");
	strcpy(two_space_instr[3], "addi");
	strcpy(two_space_instr[4], "subi");
	strcpy(two_space_instr[5], "andi");
	strcpy(two_space_instr[6], "ori");
	strcpy(two_space_instr[7], "call");
	strcpy(two_space_instr[8], "jb");
	strcpy(two_space_instr[9], "jbe");
	strcpy(two_space_instr[10], "ja");
	strcpy(two_space_instr[11], "jae");
	strcpy(two_space_instr[12], "jg");
	strcpy(two_space_instr[13], "jge");
	strcpy(two_space_instr[14], "jl");
	strcpy(two_space_instr[15], "jle");

	// this will hold all the labels and their addresses	
	labels_and_addresses_file file_data;
	// initialise the index field to 0
	file_data.index = 0;

	char * colon = ":";
	char * occur = NULL;
	// this holds the address of the current instruction
	unsigned short int address = 0;	

	// find the labels and the corresponding address
	while(fgets(line, LENGTH_OF_INSTR, no_comment_code) != NULL)
	{
		// check if the line has a colon
		occur = strstr(line, colon);

		// if the line does have a colon get the label
		if(occur != NULL)
		{
			// place null terminator at the same place as colon
			*occur = '\0';
			// copy the label into the array
			strcpy(file_data.labels[file_data.index], line);
			// save the address of this label as well
			file_data.label_address[file_data.index] = address;
			// increment index for next label
			file_data.index++;
		}
		// else calculate the next address 
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
	
	// get the line
	// see if it has a :
	// if yes do nothing
	// if no (NULL) then check if it has a ,
	// if yes then print line to file
	// if no then the instruction can be jump, call, one operand(pop) or zero opernad instructions(cbt)
	// get the instruction and compare it to the list of jump and call
	// if no print the line to file
	// if yes find the address of the label and replace it and write to file

	char * comma = ",";
	char has_label = 0;

	char label_instr[11][5];
	strcpy(label_instr[0], "jz");
	strcpy(label_instr[1], "jmp");
	strcpy(label_instr[2], "call");
	strcpy(label_instr[3], "jb");
	strcpy(label_instr[4], "jbe");
	strcpy(label_instr[5], "ja");
	strcpy(label_instr[6], "jae");
	strcpy(label_instr[7], "jg");
	strcpy(label_instr[8], "jge");
	strcpy(label_instr[9], "jl");
	strcpy(label_instr[10], "jle");

	char ** words_in_line;
	int num_of_words = 0;
	int num_of_frees = 0;	
	char * shifted_line = NULL;

	// remove all the labels and replace it with the address
	// also remove all the labels that has a colon next to iti	
	while(fgets(line, LENGTH_OF_INSTR, no_comment_code) != NULL)
	{
		shifted_line = shift_left_one(line);
		
		occur = strstr(shifted_line, colon);
		
		// this line is not a label
		if(occur == NULL)
		{
			// find out if a comma exists in the line
			occur = strstr(shifted_line, comma);
			
			// this means that this is a two operand instruction and they do not have labels. Simply print the line into the file
			if(occur != NULL)
			{
				fprintf(no_labels_code, "%s", shifted_line);
			}
			// the instruction can be jump, call, one operand(pop) or zero opernad instructions(cbt)
			else
			{
				words_in_line = get_words_from_string(shifted_line, &num_of_words, &num_of_frees);
				// go through the instructions and see if it has 2 space instructions	
				for(int i = 0; i < 16; i++)
				{
					if(strcmp(words_in_line[0], label_instr[i]) == 0)
					{
						has_label = 1;
						break;
					}
				}
				
				// free the allocated memory
				free_split(words_in_line, num_of_frees);

				// this line of code does not have a label as an operand
				if(has_label == 0)
				{
					fprintf(no_labels_code, "%s", shifted_line);
				}
				// this line of code does have a label as an operand
				else if(has_label == 1)
				{
					// get the words from the line of code
					words_in_line = get_words_from_string(line, &num_of_words, &num_of_frees);
					fprintf(no_labels_code,"%s ", words_in_line[0]);
					// now go through all the labels and find the address and replace it with its address
					for(int j = 0; j < file_data.index; j++)
					{
						if(strcmp(file_data.labels[j], words_in_line[1]) == 0)
						{
							fprintf(no_labels_code,"%d\n", file_data.label_address[j]);
							break;
						}
					}
					// free the allocated memory
					free_split(words_in_line, num_of_frees);
				}
				has_label = 0;
			}
		}
	}
		
	fclose(no_comment_code);
	fclose(no_labels_code);
}
