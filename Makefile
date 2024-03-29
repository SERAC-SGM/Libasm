NAME =		libasm.a

SRC =		ft_strlen.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_write.s \
		ft_read.s \
		ft_strdup.s

SRCB =	ft_atoi_base.s\

OBJ =		$(SRC:%.s=%.o)
OBJB =		$(SRCB:%.s=%.o)

%.o: %.s
	nasm -f elf64 $< -o $@ -g

all:		$(NAME)

$(NAME): $(OBJ)
	ar -rc $(NAME) $(OBJ)
	ranlib $(NAME)

bonus:	$(ALL) $(OBJB)
	ar -rc $(NAME) $(OBJB)
	ranlib	$(NAME)

clean:
	rm -f $(OBJ)
	rm -f $(OBJB)

fclean:	clean
	rm -f $(NAME)

re:	fclean all

.PHONY:	all clean fclean re


