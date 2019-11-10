/*
 * Design Unit:
 * File name:
 * Description:
 * Author:
 * Version:
*/

#ifndef _PREPROCESS_H_
#define _PREPROCESS_H_

#define NUM_OF_LABELS 		100
#define NUM_OF_ADDRESSES 	100
#define LENGTH_OF_LABEL 	25
#define LENGTH_OF_INSTR 	30
#define SPACE 			32
#define TAB 			9
#define NEW_LINE 		10
#define UPPER_A 		65
#define UPPER_Z 		90
#define LOWER_A 		97
#define LOWER_Z 		122
#define UNDERSCORE 		95
#define ZERO 			48
#define NINE 			57

// 
typedef struct
{
	char labels[NUM_OF_LABELS][LENGTH_OF_LABEL];	// multi-array which holds all the labels in the assembly file

	char label_address[NUM_OF_ADDRESSES];	// array which holds the address of each label

	int index;	// this indicates the number of labels/addresses that were filled	
}labels_and_addresses_file;

// functions
void remove_comments(char * file_name);
void remove_label(void);

#endif
