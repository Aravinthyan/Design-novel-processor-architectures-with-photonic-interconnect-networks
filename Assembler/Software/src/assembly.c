/*
 * Design Unit:
 * File name:
 * Description:
 * Author:
 * Version:
*/

// standard header files
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// personal header files
#include "assembly.h"
#include "extra.h"

instructions get_list_of_instr(void)
{
	instructions list_of_instr;
	FILE * instructions_file = xfopen("instructions.txt", "r");

	for(unsigned short int index = 0; index < NUM_OF_INSTR; index++)
	{
		fscanf(instructions_file, "%s", list_of_instr.mnemonic[index]);
	}
	fclose(instructions_file);

	return list_of_instr;
}

registers get_list_of_regs(void)
{
	registers list_of_regs;
	FILE * registers_file = xfopen("registers.txt", "r");
	
	for(unsigned int index = 0; index < NUM_OF_REG; index++)
	{
		fscanf(registers_file, "%s\n", list_of_regs.reg[index]);
	}
	fclose(registers_file);
	return list_of_regs;
}

void free_all_opcodes_and_operands(instructions * list_of_instr, registers * list_of_regs)
{
	// free the opcodes
	for(int i = 0; i < NUM_OF_INSTR; i++)
	{
		free(list_of_instr->opcode[i]);
		list_of_instr->opcode[i] = NULL;
	}

	for(int i = 0; i < NUM_OF_REG; i++)
	{
		free(list_of_regs->operand[i]);
		list_of_regs->operand[i] = NULL;
	}
	
}

void convert_to_machine_code(void)
{
	FILE * no_labels_code = xfopen("no_labels.asm", "r");
	FILE * machine_code = xfopen("out.mem", "w");

	// load instructions and get the opcodes for each instruction
	instructions list_of_instr = get_list_of_instr();
	for(unsigned short int index = 0; index < NUM_OF_INSTR; index++)
	{
		list_of_instr.opcode[index] = convert_to_binary(index, 0, 6);
	}

	// load the registers and get the operands for each registers
	registers list_of_regs = get_list_of_regs();
	for(unsigned short int index = 0; index < NUM_OF_REG; index++)
	{
		list_of_regs.operand[index] = convert_to_binary(index, 0, 5);
	}

//	// print out the mnemonics and the opcodes
//	for(int index = 0; index < NUM_OF_INSTR; index++)
//	{
//		printf("%s\t%s\n", list_of_instr.mnemonic[index], list_of_instr.opcode[index]);
//	}
//	
//	// print out the mnemonics and the opcodes
//	for(int index = 0; index < NUM_OF_REG; index++)
//	{
//		printf("%s\t%s\n", list_of_regs.reg[index], list_of_regs.operand[index]);
//	}

	char line[30];
	char mnemonic[6];
	int index = 0;
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
		for(int i = 0; i < NUM_OF_INSTR; i++)
		{
			if(strcmp(mnemonic, list_of_instr.mnemonic[i]) == 0)
			{
				instr = i;
				break;
			}
		}
		switch(instr)
		{
			case 0:
			case 1:
			case 2:
			case 3:
			case 4:
			case 5:
			case 6:
			case 7:
				two_operands(line, machine_code, &list_of_regs, &list_of_instr);
				break;
			case 8:
			case 9:
			case 17:
				label_operands(line, machine_code, &list_of_instr);
				break;
			case 10:
			case 11:
			case 12:
			case 13:
			case 14:
				immediate_operands(line, machine_code, &list_of_regs, &list_of_instr);
				break;
			case 15:
			case 16:
				stack_operands(line, machine_code, &list_of_regs, &list_of_instr);
				break;
			case 18:
				return_instr(machine_code);
				break;
			default:
				break;
		}
	}

	fclose(no_labels_code);
	fclose(machine_code);
	free_all_opcodes_and_operands(&list_of_instr, &list_of_regs);
}

char * reg_operand_get(char * reg, registers * list_of_regs)
{
	char * operand;
	for(int index = 0; index < NUM_OF_REG; index++)
	{
		if(strcmp(reg, list_of_regs->reg[index]) == 0)
		{
			operand = list_of_regs->operand[index];
			break;
		}
	}
	return operand;
}

void free_split(char ** words, int num_of_frees)
{
	for(int i = 0; i < num_of_frees; i++)
	{
		free(words[i]);
		words[i] = NULL;
	}

	free(words);
	words = NULL;
}

void two_operands(char * code, FILE * machine_code, registers * list_of_regs, instructions * list_of_instr)
{
	char ** indiv;
	int num_of_data = 0;
	int num_of_frees = 0;
	indiv = get_words_from_string(code, &num_of_data, &num_of_frees);
	int length = strlen(indiv[1]);
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
	
	fprintf(machine_code, "%s", reg_operand_get(indiv[1], list_of_regs));
	fprintf(machine_code, "%s", reg_operand_get(indiv[2], list_of_regs));
	fprintf(machine_code, "\n");
	free_split(indiv, num_of_frees);
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

void immediate_operands(char * code, FILE * machine_code, registers * list_of_regs, instructions * list_of_instr)
{
	char ** indiv;
	int num_of_data = 0;
	int num_of_frees = 0;
	indiv = get_words_from_string(code, &num_of_data, &num_of_frees);
	int length = strlen(indiv[1]);
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
	fprintf(machine_code, "%s%s", reg_operand, reg_operand);
	fprintf(machine_code, "\n");
	
	// check if the code has any '-'
	int i = 0;
	for(i = 0; i < strlen(indiv[2]); i++)
	{
		if(indiv[2][i] == '-')
		{
			break;
		}
	}
	char * immediate;

	if(i == 1)
	{
		i++;
		immediate = (char *)xmalloc(sizeof(char) * (strlen(indiv[2]) - 2));	
		int j = 0;
		for(j = 0; j < strlen(indiv[2]) - 2; j++, i++)
		{
			immediate[j] = indiv[2][i];
		}
		immediate[j] = '\0';
		int immediate_int = atoi(immediate);
		char * immediate_bin = convert_to_binary(immediate_int, 1, 16);	
		fprintf(machine_code, "%s\n", immediate_bin);
		free(immediate_bin);
	}
	else
	{
		i = 1;
		immediate = (char *)xmalloc(sizeof(char) * (strlen(indiv[2]) - 1));	
		int j = 0;
		for(j = 0; j < strlen(indiv[2]) - 1; j++, i++)
		{
			immediate[j] = indiv[2][i];
		}
		immediate[j] = '\0';
		int immediate_int = atoi(immediate);
		char * immediate_bin = convert_to_binary(immediate_int, 0, 16);	
		fprintf(machine_code, "%s\n", immediate_bin);
		free(immediate_bin);
	}

	free(immediate);
	free_split(indiv, num_of_frees);
}

void stack_operands(char * code, FILE * machine_code, registers * list_of_regs, instructions * list_of_instr)
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
	
	fprintf(machine_code, "00000");
	fprintf(machine_code, "%s", reg_operand_get(indiv[1], list_of_regs));
	fprintf(machine_code, "\n");
	free_split(indiv, num_of_frees);
}

void return_instr(FILE * machine_code)
{
	fprintf(machine_code, "0100100000000000\n");
}
