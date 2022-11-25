/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   minitalk.h                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mvavasso <mvavasso@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/18 14:57:28 by mvavasso          #+#    #+#             */
/*   Updated: 2022/11/25 18:39:51 by mvavasso         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef MINITALK_H
# define MINITALK_H

# include <stdarg.h>
# include <stdbool.h>
# include <signal.h>
# include "../libft/libft.h"

typedef struct s_char
{
	int		bits_shifted;
	char	assembled;
}	t_char;

t_char	g_char;

#endif
