/*
 * Design Unit:
 * File name:
 * Description:
 * Author:
 * Version:
*/

#ifndef _EXTRA_H_
#define _EXTRA_H_

#define WIDTH		16

// functions
FILE * xfopen(char * file_name, char * mode);
void * xmalloc(size_t size);
int positive_binary(unsigned short int immediate, char * binary_form, unsigned int index);
void twos_complement(char * binary_form, unsigned char width1);
char * convert_to_binary(unsigned short int immediate, char negative, unsigned char width);
char **get_words_from_string(const char *input_string, int *num_of_words, int *num_of_frees);

#endif
