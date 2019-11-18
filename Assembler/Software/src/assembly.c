/*
 * File name: assembly.c
 * Description: This file converts the preprocessed file from assembly to machine code
 * Author: Sreethyan Aravinthan
*/

// standard header files
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// personal header files
#include "assembly.h"
#include "extra.h"

void get_list_of_instr(instructions * list_of_instr)
{
	// open file which contains all the instructions that can run on 
	// the processor
	FILE * instructions_file = xfopen("/mnt/d/Documents/University/Year_3/Project/Solution/Assembler/Software/src/instructions.txt", "r");
	
	// read from the file and store it in the array field called mnemonic
	for(unsigned short int index = 0; index < NUM_OF_INSTR; index++)
	{
		fscanf(instructions_file, "%s", list_of_instr->mnemonic[index]);
	}
	
	// close the file
	fclose(instructions_file);
}

void get_list_of_regs(registers * list_of_regs)
{
	// open file which contains all the registers that are part of the processor
	FILE * registers_file = xfopen("/mnt/d/Documents/University/Year_3/Project/Solution/Assembler/Software/src/registers.txt", "r");
	
	// read from the file and store it in the array field called reg
	for(unsigned int index = 0; index < NUM_OF_REG; index++)
	{
		fscanf(registers_file, "%s\n", list_of_regs->reg[index]);
	}

	// close the file
	fclose(registers_file);
}

void free_all_opcodes_and_operands(instructions * list_of_instr, registers * list_of_regs)
{
	// free the opcodes
	for(int i = 0; i < NUM_OF_INSTR; i++)
	{
		free(list_of_instr->opcode[i]);
		list_of_instr->opcode[i] = NULL;
	}
	
	// free the operands
	for(int i = 0; i < NUM_OF_REG; i++)
	{
		free(list_of_regs->operand[i]);
		list_of_regs->operand[i] = NULL;
	}
}

void convert_to_machine_code(char * output_file)
{
	// open the file called no_labels in read mode
	FILE * no_labels_code = xfopen("no_labels.asm", "r");
	
	// open the file called machine code in write mode which contains the machine code
	// that will run on the processor
	FILE * machine_code = xfopen(output_file, "w");
	
	// create memory which holds the mnemonics and the coresponding opcodes
	instructions * list_of_instr = (instructions *) xmalloc(sizeof(instructions));
	// load mnemonics that are part of the processor
	get_list_of_instr(list_of_instr);
	
	// convert each opcode from decimal to binary and store in the opcode field
	for(unsigned short int index = 0; index < NUM_OF_INSTR; index++)
	{
		list_of_instr->opcode[index] = convert_to_binary(index, 0, 6);
	}
	
	// create memory which golds the registers and the coresponding operands in binary format
	registers * list_of_regs = (registers *)xmalloc(sizeof(registers));
	// load the registers and get the operands for each registers
	get_list_of_regs(list_of_regs);
	
	// convert each operand from decimal to binary and store in the operand field
	for(unsigned short int index = 0; index < NUM_OF_REG; index++)
	{
		list_of_regs->operand[index] = convert_to_binary(index, 0, 5);
	}

//	// print out the mnemonics and the opcodes
//	for(int index = 0; index < NUM_OF_INSTR; index++)
//	{
//		printf("%s\t%s\n", list_of_instr->mnemonic[index], list_of_instr->opcode[index]);
//	}
//	
//	// print out the mnemonics and the opcodes
//	for(int index = 0; index < NUM_OF_REG; index++)
//	{
//		printf("%s\t%s\n", list_of_regs.reg[index], list_of_regs.operand[index]);
//	}
	
	// get the current line from the file
	char line[30];
	// ge the mnemonic from the current instruction that was read
	char mnemonic[6];
	// this will be the index that will go through the string
	int index = 0;
	// used to index the array of instructions
	int instr = 0;
	
	while(fgets(line, 30, no_labels_code) != NULL)
	{
		index = 0;
		// copy label
		while(line[index] >= 97 && line[index] <= 122)
		{
			mnemonic[index] = line[index];
			index++;
		}
		mnemonic[index] = '\0';

		// find the mnemonic
		for(instr = 0; instr < NUM_OF_INSTR; instr++)
		{
			// if the mnemonic is found then break out
			if(strcmp(mnemonic, list_of_instr->mnemonic[instr]) == 0)
			{
				break;
			}
		}
		
		// if the mnemonic is not found then print an error message and exit
		if(instr == NUM_OF_INSTR)
		{
			// store the length of the new line
			int length = strlen(line) - 1;
			// create memeory on heap to store the line without newline
			char * error_line = (char *)xmalloc(sizeof(char) * length);
			// copy a string one length than the original size
			for(int i = 0; i < length; i++)
			{
				error_line[i] = line[i];
			}
			// print the error message
			fprintf(stderr, "Instruction \"%s\" is not valid as it has an invalid mnemonic %s\n", error_line, mnemonic);
			// free the memory
			free(error_line);
			clean_up(no_labels_code, machine_code, list_of_instr, list_of_regs);
			// exit the program
			exit(-1);
		}
		
		switch(instr)
		{
			case 0:		// ld
			case 1:		// str
			case 2:		// add
			case 3:		// sub
			case 4:		// and
			case 5:		// or
			case 6:		// mov
			case 7:		// cmp
			{
				char * error_operand = two_operands(line, machine_code, list_of_regs, list_of_instr);
				if(error_operand != NULL)
				{		
					// store the length of the new line
					int length = strlen(line) - 1;
					// create memeory on heap to store the line without newline
					char * error_line = (char *)xmalloc(sizeof(char) * length);
					// copy a string one length than the original size
					for(int i = 0; i < length; i++)
					{
						error_line[i] = line[i];
					}
					// print the error message
					fprintf(stderr, "Instruction \"%s\" is not valid as it has an invalid operand %s\n", error_line, error_operand);
					// free the memory
					free(error_line);
					free(error_operand);
					clean_up(no_labels_code, machine_code, list_of_instr, list_of_regs);
					// exit the program
					exit(-1);
				}
			}
				break;
			case 8:		// jz
			case 9:		// jmp
			case 17:	// call
			case 19:	// jb
			case 20:	// jbe
			case 21:	// ja
			case 22:	// jae
			case 23:	// jg
			case 24:	// jge
			case 25:	// jl
			case 26:	// jle
				label_operands(line, machine_code, list_of_instr);
				break;
			case 10:	// movi
			case 11:	// addi
			case 12:	// subi
			case 13:	// andi
			case 14:	// ori
			{	
				char * error_operand = immediate_operands(line, machine_code, list_of_regs, list_of_instr);
				if(error_operand != NULL)
				{		
					// store the length of the new line
					int length = strlen(line) - 1;
					// create memeory on heap to store the line without newline
					char * error_line = (char *)xmalloc(sizeof(char) * length);
					// copy a string one length than the original size
					for(int i = 0; i < length; i++)
					{
						error_line[i] = line[i];
					}
					// print the error message
					fprintf(stderr, "Instruction \"%s\" is not valid as it has an invalid operand %s\n", error_line, error_operand);
					// free the memory
					free(error_line);
					free(error_operand);
					clean_up(no_labels_code, machine_code, list_of_instr, list_of_regs);
					// exit the program
					exit(-1);
				}
			}
				break;
			case 15:	// push
			case 16:	// pop
			{	
				char * error_operand = stack_operands(line, machine_code, list_of_regs, list_of_instr);
				if(error_operand != NULL)
				{		
					// store the length of the new line
					int length = strlen(line) - 1;
					// create memeory on heap to store the line without newline
					char * error_line = (char *)xmalloc(sizeof(char) * length);
					// copy a string one length than the original size
					for(int i = 0; i < length; i++)
					{
						error_line[i] = line[i];
					}
					// print the error message
					fprintf(stderr, "Instruction \"%s\" is not valid as it has an invalid operand %s\n", error_line, error_operand);
					// free the memory
					free(error_line);
					free(error_operand);
					clean_up(no_labels_code, machine_code, list_of_instr, list_of_regs);
					// exit the program
					exit(-1);
				}
			}
				break;
			case 18:	// return
				return_instr(machine_code);
				break;
			default:
				break;
		}
	}
	
	clean_up(no_labels_code, machine_code, list_of_instr, list_of_regs);
}

char * reg_operand_get(char * reg, registers * list_of_regs)
{
	// hold the address where the binary format of the register is stored
	char * operand;
	// use this variable to index through the array of registers
	int index = 0;
	// find the register
	for(index = 0; index < NUM_OF_REG; index++)
	{
		if(strcmp(reg, list_of_regs->reg[index]) == 0)
		{
			operand = list_of_regs->operand[index];
			break;
		}
	}
	// if index is NUM_OF_REG then the register does not exist
	// therefore return NULL to indicate the register does not exist
	if(index == NUM_OF_REG)
	{
		return NULL;
	}
	// return the address of the binary format of the register
	return operand;
}

void free_split(char ** words, int num_of_frees)
{
	// free the individual strings
	for(int i = 0; i < num_of_frees; i++)
	{
		free(words[i]);
		words[i] = NULL;
	}
	// free the double pointer
	free(words);
	words = NULL;
}

char * two_operands(char * code, FILE * machine_code, registers * list_of_regs, instructions * list_of_instr)
{
	// this will be a double pointer that holds the address of all the strings in an instruction
	char ** indiv;
	// this will hold the number of strings in the instruction
	int num_of_data = 0;
	// this will hold the number of frees
	int num_of_frees = 0;
	// get all the strings in the instruction
	indiv = get_words_from_string(code, &num_of_data, &num_of_frees);
	// get the length of the 1st operand
	int length = strlen(indiv[1]);
	// add a null terminator one less than length of the string so that the comma is removed
	indiv[1][length - 1] = '\0';
	
	// print opcode
	for(int i = 0; i < NUM_OF_INSTR; i++)
	{
		if(strcmp(indiv[0], list_of_instr->mnemonic[i]) == 0)
		{
			fprintf(machine_code, "%s", list_of_instr->opcode[i]);
			break;
		}
	}
	
	// get the 1st operand
	char * operand_1 = reg_operand_get(indiv[1], list_of_regs);
	// get the 2nd operand
	char * operand_2 = reg_operand_get(indiv[2], list_of_regs);
	
	// if the 1st operand is NULL then the register does not exisit
	if(operand_1 == NULL)
	{
		char * error_operand = (char *)xmalloc(sizeof(char) * strlen(indiv[1]));
		strcpy(error_operand, indiv[1]);
		free_split(indiv, num_of_frees);
		return error_operand;
	}
	// if the 2nd operand is NULL then the register does not exisit
	else if(operand_2 == NULL)
	{
		char * error_operand = (char *)xmalloc(sizeof(char) * strlen(indiv[2]));
		strcpy(error_operand, indiv[2]);
		free_split(indiv, num_of_frees);
		return error_operand;
	}
	
	// print the 1st and 2nd operand and a newline
	fprintf(machine_code, "%s", operand_1);
	fprintf(machine_code, "%s", operand_2);
	fprintf(machine_code, "\n");
	// free the strings and the double pointer
	free_split(indiv, num_of_frees);
	// return NULL to indicate that it is successul
	return NULL;
}

void label_operands(char * code, FILE * machine_code, instructions * list_of_instr)
{
	char ** indiv;
	int num_of_data = 0;
	int num_of_frees = 0;
	indiv = get_words_from_string(code, &num_of_data, &num_of_frees);
	
	// print opcode
	for(int i = 0; i < NUM_OF_INSTR; i++)
	{
		if(strcmp(indiv[0], list_of_instr->mnemonic[i]) == 0)
		{
			fprintf(machine_code, "%s", list_of_instr->opcode[i]);
			break;
		}
	}
	fprintf(machine_code, "0000000000");
	fprintf(machine_code, "\n");
	
	int label = atoi(indiv[1]);
	char * label_bin = convert_to_binary(label, 0, 16);
	fprintf(machine_code, "%s\n", label_bin);
	
	free(label_bin);	
	free_split(indiv, num_of_frees);
}

char * immediate_operands(char * code, FILE * machine_code, registers * list_of_regs, instructions * list_of_instr)
{
	// this will be a double pointer that holds the address of all the strings in an instruction
	char ** indiv;
	// this will hold the number of strings in the instruction
	int num_of_data = 0;
	// this will hold the number of frees
	int num_of_frees = 0;
	// get all the strings in the instruction
	indiv = get_words_from_string(code, &num_of_data, &num_of_frees);
	// get the length of the 1st operand
	int length = strlen(indiv[1]);
	// add a null terminator one less than length of the string so that the comma is removed
	indiv[1][length - 1] = '\0';
	
	// print opcode
	for(int i = 0; i < NUM_OF_INSTR; i++)
	{
		if(strcmp(indiv[0], list_of_instr->mnemonic[i]) == 0)
		{
			fprintf(machine_code, "%s", list_of_instr->opcode[i]);
			break;
		}
	}
	
	char * reg_operand = reg_operand_get(indiv[1], list_of_regs);
	// if the reg operand is NULL then the register does not exisit
	if(reg_operand == NULL)
	{
		char * error_operand = (char *)xmalloc(sizeof(char) * strlen(indiv[1]));
		strcpy(error_operand, indiv[1]);
		free_split(indiv, num_of_frees);
		return error_operand;
	}
	// print the reg_operand
	fprintf(machine_code, "%s%s", reg_operand, reg_operand);
	fprintf(machine_code, "\n");
	
	// check if the immediate has a '-'
	int i = 0;
	for(i = 0; i < strlen(indiv[2]); i++)
	{
		if(indiv[2][i] == '-')
		{
			break;
		}
	}
	
	// this will hold the address of the immediate value that will be extracted from the 2nd operand
	char * immediate;
	
	// if i is 1 then it means that the immediate is a negative value
	if(i == 1)
	{
		// increment by 1 so that we skip the '-'
		i++;
		// create memory on the heap
		immediate = (char *)xmalloc(sizeof(char) * (strlen(indiv[2]) - 2));	
		int j = 0;
		// copy data
		for(j = 0; j < strlen(indiv[2]) - 2; j++, i++)
		{
			immediate[j] = indiv[2][i];
		}
		// place null terminator
		immediate[j] = '\0';
		// convert from string to integer
		int immediate_int = atoi(immediate);
		// convert the integer to binary format
		char * immediate_bin = convert_to_binary(immediate_int, 1, 16);	
		// print the binary format of the immediate to the file
		fprintf(machine_code, "%s\n", immediate_bin);
		// free the immediate binary format
		free(immediate_bin);
	}
	else
	{
		// set the i to 1 so that the data is copied after the # character
		i = 1;
		// create memory on the heap
		immediate = (char *)xmalloc(sizeof(char) * (strlen(indiv[2]) - 1));	
		// copy the immediate
		int j = 0;
		for(j = 0; j < strlen(indiv[2]) - 1; j++, i++)
		{
			immediate[j] = indiv[2][i];
		}
		// place null terminator
		immediate[j] = '\0';
		// convert from string to integer
		int immediate_int = atoi(immediate);
		// convert from integer to binary format
		char * immediate_bin = convert_to_binary(immediate_int, 0, 16);	
		// print the binary format of the immediate to the file
		fprintf(machine_code, "%s\n", immediate_bin);
		// free the immediate binary format
		free(immediate_bin);
	}
	
	// free the immediate value that was copied
	free(immediate);
	// free the each opcode and operand from the current instruction
	free_split(indiv, num_of_frees);

	return NULL;
}

char * stack_operands(char * code, FILE * machine_code, registers * list_of_regs, instructions * list_of_instr)
{
	char ** indiv;
	int num_of_data = 0;
	int num_of_frees = 0;
	indiv = get_words_from_string(code, &num_of_data, &num_of_frees);
	int length = strlen(indiv[1]);
	indiv[1][length] = '\0';
	
	// print opcode
	for(int i = 0; i < NUM_OF_INSTR; i++)
	{
		if(strcmp(indiv[0], list_of_instr->mnemonic[i]) == 0)
		{
			fprintf(machine_code, "%s", list_of_instr->opcode[i]);
			break;
		}
	}
	
	char * reg_operand = reg_operand_get(indiv[1], list_of_regs);
	// if the reg operand is NULL then the register does not exisit
	if(reg_operand == NULL)
	{
		char * error_operand = (char *)xmalloc(sizeof(char) * strlen(indiv[1]));
		strcpy(error_operand, indiv[1]);
		free_split(indiv, num_of_frees);
		return error_operand;
	}
	
	fprintf(machine_code, "00000");
	fprintf(machine_code, "%s", reg_operand);
	fprintf(machine_code, "\n");
	free_split(indiv, num_of_frees);

	return NULL;
}

void return_instr(FILE * machine_code)
{
	fprintf(machine_code, "0100100000000000\n");
}

void clean_up(FILE * no_labels_code, FILE * machine_code, instructions * list_of_instr, registers * list_of_regs)
{
	fclose(no_labels_code);
	fclose(machine_code);
	free_all_opcodes_and_operands(list_of_instr, list_of_regs);	
	free(list_of_instr);
	free(list_of_regs);
}

