CC = gcc
RM = rm -rf
NAME = minishell
FLAG = -Wall -Werror -Wextra
SPECIAL_FLAG = -L./readline -lreadline -lhistory

FILES :=	main.c 

OBJS_DIR := objs
OBJS := $(addprefix $(OBJS_DIR)/, $(FILES:.c=.o))

all: $(OBJS_DIR) $(NAME)

$(OBJS_DIR):
	@mkdir -p $(dir $(OBJS))

$(OBJS_DIR)/%.o: %.c | $(OBJS_DIR)
	@$(CC) $(FLAG) -c $< -o $@
	@echo $(BLACKBCK)$(CYAN)[-] Compiling: $@$(ENDCOLOR)

$(NAME): $(OBJS)
	@$(CC) $(FLAG) $(OBJS) -lncurses -o $(NAME) $(SPECIAL_FLAG)
	@echo $(SUCCESS)

clean:
	@$(RM) $(OBJS)
	@echo $(CLEANING)

fclean: clean
	@$(RM) $(NAME) $(OBJS_DIR)

re: fclean all

leaks: $(NAME)
	valgrind --track-fds=yes --trace-children=yes --leak-check=full --show-leak-kinds=all --show-reachable=yes --suppressions=./minishell.sup ./$(NAME)

run: $(NAME)
	@./$(NAME)

.PHONY: all clean fclean re leaks run