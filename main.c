#include "minishell.h"

#include <stdlib.h>		// Free
#include <stdbool.h>	// Bool (true/false)

int	main(int ac, char **av, char **env)
{
	(void)ac;
	(void)av;
	(void)env;
	int loop = 0;
	char	*input;

	while (true && loop < 2)
	{
		input = readline("Minishell > ");	// Get User input inside char *input

		// Do something

		// free(input);					// Free the char *
		loop++;

	}
	return (0);
}
