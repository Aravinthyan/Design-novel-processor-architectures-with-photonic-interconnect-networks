/***********************************************************************************
*       File name
			extra.c
*	Description
			This file has extra tools that are used for converting to machine code
*	Author
			Sreethyan Aravinthan (UCL)
**********************************************************************************/

// standard header files
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// personal header files
#include "extra.h"

FILE * xfopen(char * file_name, char * mode)
{
	// open the file
	FILE * file = fopen(file_name, mode);
	// if the file is NULL then exit gracefully
	if(file == NULL)
	{
		fprintf(stderr, "File opening error");
		exit(-1);
	}
	return file;
}

void * xmalloc(size_t size)
{
    void * data = malloc(size);

    // if the requested data is not given in other words returned NULL exit
    if (data == NULL)
    {
        fprintf(stderr, "virtual memory exhausted");
        exit(-1);
    }

    // return the data variable
    return data;
}

void * xrealloc(void *ptr, size_t size)
{
    void * data = realloc(ptr, size);

    // if the requested data is not given in other words returned NULL exit
    if (data == NULL)
    {
        fprintf(stderr, "virtual memory exhausted");
        exit(-1);
    }

    // return the data variable
    return data;
}


int positive_binary(unsigned short int immediate, char * binary_form, unsigned int index)
{
	// check if the value is greater than 1
        if(immediate > 1)
        {
                index = positive_binary(immediate/2, binary_form, index);
        }
	
	// if the moduls is 1 then set that index value to 1
	// else 0
        if(immediate % 2 == 1)
        {
                binary_form[index] = '1';
        }
        else
        {
                binary_form[index] = '0';
        }
	// increment index for the next binary number
        index++;
	
	// return index for the next binary number which was called in a recursive manner
        return index;
}

void twos_complement(char * binary_form, unsigned char width)
{
        // convert to 1s complement
        for(int i = 0; i < width; i++)
        {
                if(binary_form[i] == '0')
                {
                        binary_form[i] = '1';
                }
                else
                {
                        binary_form[i] = '0';
                }
        }

        // convert to 2s complement from 1s complement
        for(int i = width - 1; i >= 0; i--)
        {
                if(binary_form[i] == '1')
                {
                        binary_form[i] = '0';
                }
                else
                {
                        binary_form[i] = '1';
                        break;
                }
        }
}

char * convert_to_binary(unsigned short int immediate, char negative, unsigned char width)
{
	// this will contain the positive binary form of a number
        char * pos_binary = (char *)malloc(sizeof(char) * width);
	// this variable will hold the pointer to which the correct number of bits of the binary number should be
        char * pos_binary_form = (char *)malloc(sizeof(char) * width);
        // set the length to 0 which hold the length of the initial postive version of the binary number
	int length = 0;
        // get the positive version of the number passed in
        length = positive_binary(immediate, pos_binary, 0);
        // add null terminator
        length++;
        pos_binary[length] = '\0';
        length--;

        int i = 0;
        int j = 0;
	
	// create the positive binary number with the correct width
        for(i = 0; i < width - length; i++)
        {
                pos_binary_form[i] = '0';
        }

        for(j = 0; j < length; j++, i++)
        {
                pos_binary_form[i] = pos_binary[j];
        }

        // if the flag for negative was set then get the 2s complement
        if(negative == 1)
        {
                twos_complement(pos_binary_form, width);
        }
	
	// place null terminator
	pos_binary_form[width] = '\0';
	// free the earlier version of the positive binary number
	free(pos_binary);

        // printf("%s\n", pos_binary_form);
	
	// return the pointer to the positive binary number
	return pos_binary_form;
}

char **get_words_from_string(const char *input_string, int *num_of_words, int *num_of_frees)
{
    // amount holds the number of words that can be taken from string
    // intialy 5
    unsigned int amount = 5;

    // start with asumming that there are 5 words in the string
    char **words = (char **)xmalloc(amount * sizeof(char *));

    // this is the defualt size of each word
    unsigned int word_size = 5;

    // allocate each word size as 5 as default
    for (int i = 0; i < amount; i++)
    {
        words[i] = (char *)xmalloc(word_size * sizeof(char));
    }

    // this is used to go through the string
    unsigned int index = 0;
    /* this is used to see how many words of the allocated amount has actually
    been filled */
    unsigned int amount_level = 0;
    // this is used to see how many characters have been filled
    unsigned int word_size_level = 0;

    // this is a flag used to see if the end of a word has been reached
    char clean = 0;

    // until space or \n or tab is not reached
    while(input_string[index] == ' ' || input_string[index] == '\n' 
                                                    || input_string[index] == 9)
    {
        // increment index to skip ' ' or '\n'
        index++;
    }

    while(input_string[index] != '\0')
    {
        if(word_size_level == word_size)
        {
            word_size += 5;
            // create a new string of this size
            words[amount_level] = (char *)xrealloc((void *)words[amount_level], 
                                                    word_size * sizeof(char));
        }

        // until space or \n or tab is not reached
        while(input_string[index] == ' ' || input_string[index] == '\n' 
                                                    || input_string[index] == 9)
        {
            // increment index to skip ' ' or '\n'
            index++;
            clean = 1;
        }

        if(clean == 1)
        {
            // place null terminator at the end of string
            words[amount_level][word_size_level] = '\0';
            // reset flag
            word_size_level = 0;

            //amount_levelincrement for the next string
            amount_level++;
            
            /* if the amount filled is the same as the max available then 
            increase */
            if(amount_level == amount)
            {
                // create a temp variable of char **
                char ** temp = (char **)xmalloc((amount + 5) * sizeof(char *));

                // create space for each word
                for(int i = 0; i < amount + 5; i++)
                {
                    // this for the old data to be copied over so strlen used
                    if(i < amount)
                    {
                        temp[i] = (char *)xmalloc((strlen(words[i]) + 1) 
                                                   * sizeof(char));
                    }
                    else    // this is for new data so default word_size
                    {
                        temp[i] = (char *)xmalloc(word_size * sizeof(char));
                    }
                }

                // copy old data over
                for(int i = 0; i < amount; i++)
                {
                    strcpy(temp[i], words[i]);
                }

                // clear old data
                for(int i = 0; i < amount; i++)
                {
                    free(words[i]);
                }

                // clear words
                free(words);

                // assign words to the newly created memory
                words = temp;
                // NULL the inital pointer pointing to the newly created memory
                temp = NULL;
                // increment the total number of words for comparison next time
                amount += 5;
            }

            // reset flag such next time a space, \n or tab is reached
            clean = 0;
        }

        // assign current character
        words[amount_level][word_size_level] = input_string[index];

        // increment track and index for next character
        word_size_level++;
        index++;
    }

    // place \0 for last one
    words[amount_level][word_size_level] = '\0';

    // assign the num_of_words and num_of_frees for use of printing and freeing
    *num_of_words = amount_level + 1;
    *num_of_frees = amount;

    // return words
    return words;
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

char * shift_left_one(char * data)
{
	int i;

	for(i = 1; i < strlen(data); i++)
	{
		data[i - 1] = data[i];
	}
	data[i - 1] = '\0';
	return data;
}
