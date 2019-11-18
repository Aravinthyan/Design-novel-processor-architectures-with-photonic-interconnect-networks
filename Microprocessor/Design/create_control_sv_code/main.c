#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void *xmalloc(size_t size)
{
    void *data = malloc(size);

    // if the requested data is not given in other words returned NULL exit
    if (data == NULL)
    {
        fprintf(stderr, "virtual memory exhausted");
        exit(-1);
    }

    // return the data variable
    return data;
}

void *xrealloc(void *ptr, size_t size)
{
    void *data = realloc(ptr, size);

    // if the requested data is not given in other words returned NULL exit
    if (data == NULL)
    {
        fprintf(stderr, "virtual memory exhausted");
        exit(-1);
    }

    // return the data variable
    return data;
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

void print_code(char * data)
{	
	int num_of_words = 0;
	int num_of_frees = 0;

	for(int i = 0; i < strlen(data); i++)
	{
		if(data[i] == ',')
		{
			data[i] = ' ';
		}
	}

	char ** seperate = get_words_from_string(data, &num_of_words, &num_of_frees);
	
	printf("6'b%s:\t// %s\n", seperate[1], seperate[0]);
	printf("begin\n");
	printf("\tcontrols[23] = 1'b%s;\n", seperate[2]);
	printf("\tcontrols[22:21] = 2'b%s;\n", seperate[3]);
	int j = 4;
	for(int i = 20; i >= 17; i--, j++)
	{
		printf("\tcontrols[%d] = 1'b%s;\n", i, seperate[j]);
	}
	printf("\tcontrols[16:15] = 2'b%s;\n", seperate[8]);
	printf("\tcontrols[14:13] = 2'b%s;\n", seperate[9]);
	j = 10;
	for(int i = 12; i >= 2; i--, j++)
	{
		printf("\tcontrols[%d] = 1'b%s;\n", i, seperate[j]);
	}
	printf("\tcontrols[1:0] = 2'b%s;\n", seperate[21]);

	printf("end\n");

	for(int i = 0; i < num_of_frees; i++)
	{
		free(seperate[i]);
	}
	free(seperate);
}

int main(int argc, char * argv[])
{	
	char line[100];
	char buffer [1000];

	FILE * control = fopen("../Control_Signals.csv", "r");

	fgets(line, 100, control);
	fgets(buffer, 1000, control);

	while(fgets(line, 100, control) != NULL)	
	{
	//	printf("%s", line);
		print_code(line);
		printf("\n");
	}

	fclose(control);
	return 0;
}
