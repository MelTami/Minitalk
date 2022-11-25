/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mvavasso <mvavasso@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/18 14:57:16 by mvavasso          #+#    #+#             */
/*   Updated: 2022/11/25 18:31:52 by mvavasso         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/minitalk.h"

static void	ft_char_display(int signal, siginfo_t *sa, void *context)
{
	(void)context;
	if (signal == SIGUSR1)
		g_char.assembled += (0b00000001 << g_char.bits_shifted);
	else if (g_char.bits_shifted == 7)
	{
		if (!g_char.assembled)
		{
			ft_putchar_fd('\n', STDOUT_FILENO);
			kill(sa->si_pid, SIGUSR2);
		}
		ft_putchar_fd(g_char.assembled, STDOUT_FILENO);
		g_char.bits_shifted = 0;
		g_char.assembled = 0;
		return ;
	}
	g_char.bits_shifted++;
}

int	main(void)
{
	struct sigaction	sa;

	g_char.bits_shifted = 0;
	g_char.assembled = 0;
	ft_putnbr_fd(getpid(), STDOUT_FILENO);
	ft_putchar_fd('\n', STDOUT_FILENO);
	sa.sa_sigaction = &ft_char_display;
	sa.sa_flags = SA_SIGINFO;
	sigaction(SIGUSR1, &sa, NULL);
	sigaction(SIGUSR2, &sa, NULL);
	while (true)
		pause();
	return (0);
}
