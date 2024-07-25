# Definitions
NAME = run
SRC = stdio.asm
OBJ = obj
SRCOBJ = $(SRC:%.asm=${OBJ}/%.o)
CREATE = mkdir -p $(1)
REMOVE = rm -rf $(1)

# Rules
.PHONY: clean all

all: $(NAME)

$(NAME): $(SRCOBJ)
	@echo Building $^
	gcc -o $(NAME) $^ main.c
#	ld -o $(NAME) $^

${OBJ}/%.o: %.asm
	@echo Compiling $<
	@$(call CREATE,${OBJ})
	@nasm -f elf64 $< -o $@

clean:
	@$(call REMOVE,$(OBJ))

fclean: clean
	@$(call REMOVE,$(NAME))

re: fclean all
