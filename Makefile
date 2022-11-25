# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mvavasso <mvavasso@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/08 15:55:52 by mvavasso          #+#    #+#              #
#    Updated: 2022/11/25 21:09:34 by mvavasso         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME			= minitalk

SV				= server
CLIENT			= client

CFLAGS			= -Wall -Werror -Wextra

RM				= rm -rf
			
PATH_INCLUDES	= ./includes/
PATH_OBJS		= ./objects/
PATH_SRCS		= ./sources/
PATH_LIBFT		= ./libft/libft.a

SRCS_CLIENT		= $(addprefix $(PATH_SRCS), client.c)
SRCS_SV			= $(addprefix $(PATH_SRCS), server.c)
LFLAGS			= -L $(PATH_LIBFT) -lft
OBJS_CLIENT		= $(patsubst $(PATH_SRCS)%.c, $(PATH_OBJS)%.o, $(SRCS_CLIENT))
OBJS_SV			= $(patsubst $(PATH_SRCS)%.c, $(PATH_OBJS)%.o, $(SRCS_SV))
INCLUDES		= -I $(PATH_INCLUDES)

all:	$(NAME)

$(NAME): $(SV) $(CLIENT)

$(SV): $(OBJS_SV) $(PATH_LIBFT)
	@$(CC) $(CFLAGS) $(IFLAGS) -o $(SV) $(OBJS_SV) $(PATH_LIBFT)

$(OBJS_SV): $(SRCS_SV)
	@mkdir -p $(PATH_OBJS)
	@$(CC) $(CFLAGS) $(IFLAGS) -c $< -o $@

$(CLIENT): $(OBJS_CLIENT) $(PATH_LIBFT)
	@$(CC) $(CFLAGS) $(IFLAGS) -o $(CLIENT) $(OBJS_CLIENT) $(PATH_LIBFT)

$(OBJS_CLIENT): $(SRCS_CLIENT)
	@mkdir -p $(PATH_OBJS)
	@$(CC) $(CFLAGS) $(IFLAGS) -c $< -o $@
	@ echo -e '\033[0;32m[SUCCESS]\033[0m Compilation done!'
	
clean:
	@ $(RM) $(PATH_OBJS)
	@ echo -e '\033[0;33mObjects removed\033[0m'

fclean:	clean
	@ $(RM) $(SV)
	@ $(RM) $(CLIENT)
	@ echo -e '\033[0;33mEverything is clean\033[0m'

re:		fclean all

valgrind:
			@echo "$(WHT)Removing old log.$(EOC)"
			@rm -f valgrind-out.txt
			@echo "$(WHT)Old log removed.$(EOC)"
			@echo "$(WHT)Executing Valgrind.$(EOC)"
			@valgrind --leak-check=full --show-leak-kinds=reachable --track-origins=yes \
			--log-file=valgrind-out.txt \
			./server
			@echo "$(GREEN)Valgrind-log created.$(EOC)"

.PHONY: all clean fclean re valgrind