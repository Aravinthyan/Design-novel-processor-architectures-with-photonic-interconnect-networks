/*
 * Design Unit:
 * File name:
 * Description:
 * Author:
 * Version:
*/

#ifndef _ASSEMBLY_H_
#define _ASSEMBLY_H_

#define NUM_OF_INSTR		19
#define MNEMONIC_LENGTH		6
#define OPCODE_LENGTH		6
#define NUM_OF_REG		32
#define REG_LENGTH		6

typedef struct
{
	char mnemonic[NUM_OF_INSTR][MNEMONIC_LENGTH];
	char * opcode[NUM_OF_INSTR];
}instructions;

typedef struct
{
	char reg[NUM_OF_REG][REG_LENGTH];
	char * operand[NUM_OF_REG];
}registers;

// functions
void convert_to_machine_code(void);
instructions get_list_of_instr(void);
registers get_list_of_regs(void);
void free_all_opcodes_and_operands(instructions * list_of_instr, registers * list_of_regs);
char * reg_operand_get(char * reg, registers * list_of_regs);
void two_operands(char * code, FILE * machine_code, registers * list_of_regs, instructions * list_of_instr);
void label_operands(char * code, FILE * machine_code, instructions * list_of_instr);
void immediate_operands(char * code, FILE * machine_code, registers * list_of_regs, instructions * list_of_instr);
void stack_operands(char * code, FILE * machine_code, registers * list_of_regs, instructions * list_of_instr);
void return_instr();

#endif
