/***********************************************************************************
*	File name
				preprocess.h
*	Description
				Header file preprocess.h
*	Author
				Sreethyan Aravinthan (UCL)
**********************************************************************************/

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
#define LENGTH_OF_LABEL 	100
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

typedef struct
{
	// multi-array which holds all the labels in the assembly file
	char labels[NUM_OF_LABELS][LENGTH_OF_LABEL];	
	
	// array which holds the address of each label
	unsigned int label_address[NUM_OF_ADDRESSES];	

	// this indicates the number of labels/addresses that were filled
	int index;		
}labels_and_addresses_file;

// functions
void remove_comments(char * file_name);
void remove_label(void);

#endif
