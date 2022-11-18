# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mvavasso <mvavasso@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/08 15:55:52 by mvavasso          #+#    #+#              #
#    Updated: 2022/11/18 14:17:10 by mvavasso         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME_SV			= server
NAME_CLIENT		= client

CFLAGS			= -Wall -Werror -Wextra

RM				= rm -rf
			
PATH_INCLUDES	= ./includes/
PATH_OBJS		= ./objects/
PATH_SRCS		= ./sources/
PATH_LIBFT		= ./libft

SRCS_CLIENT		= $(addprefix $(PATH_SRCS), \
					)
SRCS_SV			= $(addprefix $(PATH_SRCS), \
					)
LFLAGS			= -L $(PATH_LIBFT) -lft
OBJS 			= $(patsubst $(PATH_SRCS)%.c, $(PATH_OBJS)%.o, $(SRCS))
INCLUDES		= -I $(PATH_INCLUDES)
MLXFLAGS		= -lmlx -lXext -lX11 -lm -lz

all:	$(NAME)

$(NAME): $(OBJS)
	@ make -C $(PATH_LIBFT)
	@ clang $(CFLAGS) $(OBJS) $(LFLAGS) $(MLXFLAGS) -o $(NAME)
	@ echo -e '\033[0;32m[SUCCESS]\033[0m Compilation done!'

$(PATH_OBJS)%.o: $(PATH_SRCS)%.c
	@ mkdir -p $(PATH_OBJS)
	@ clang $(CFLAGS) $(INCLUDES) -I mlx.h -O3 -c $< -o $@
	
clean:
	@ $(RM) $(PATH_OBJS)
	@ make clean -C $(PATH_LIBFT)
	@ echo -e '\033[0;33mObjects removed\033[0m'

fclean:	clean
	@ $(RM) $(NAME)
	@ make fclean -C $(PATH_LIBFT)
	@ echo -e '\033[0;33mEverything is clean\033[0m'

re:		fclean all

.PHONY: all clean fclean re