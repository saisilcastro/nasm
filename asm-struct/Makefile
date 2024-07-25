NAME = struct
SRC = by-struct.asm
OBJ = obj
SRCOBJ = $(SRC:%.asm=${OBJ}/%.o)
CREATE = mkdir -p $(1)
REMOVE = rm -rf $(1)

all: $(NAME)
$(NAME) : $(SRCOBJ)
	@echo Building $^
	gcc -g -o $(NAME) $^ asm-struct.c
${OBJ}/%.o : %.asm
	echo Compiling $<
	@$(call CREATE,${OBJ})
	@nasm -g -f elf64 $< -o $@
clean:
	@$(call REMOVE,${OBJ})
fclean: clean
	@$(call REMOVE,${NAME})
re: fclean all
