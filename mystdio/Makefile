NAME = run
OBJ = obj
INCLUDE = -I./include

SRC_ASM = $(notdir $(wildcard asm-src/*.s))
#SRC_ASM = memset.s memcpy.s memmove.s memchr.s memcmp.s \
#		  strdup.s strjoin.s strcpy.s strncat.s strlcat.s strchr.s strlen.s atoi.s \
#		  isdigit.s isalpha.s isalnum.s isascii.s isprint.s \
#		  tolower.s toupper.s
SRC_C = $(wildcard *.c)

ASMOBJS = $(patsubst %.s,$(OBJ)/%.o,$(SRC_ASM))
COBJS = $(patsubst %.c,$(OBJ)/%.o,$(SRC_C))
SRCOBJS = $(ASMOBJS) $(COBJS)

AS = nasm
CC = gcc
LD = gcc
LDFLAGS = -o $(NAME)
CFLAGS = -c -Wall -Wextra -std=c11

VPATH = .:asm-src

ifeq ($(OS),Windows_NT)
    ASFLAGS = -f win64
    CREATE = mkdir -p $(1) #if not exist $(1) mkdir $(1)
    REMOVE_DIR = rm -rf $(1) #-rmdir /s /q $(1) 2>NUL
    REMOVE_FILE = rm -f $(1) #-del /f /q $(1).exe 2>NUL
else
    ASFLAGS = -f elf64
    CREATE = mkdir -p $(1)
    REMOVE_DIR = rm -rf $(1)
    REMOVE_FILE = rm -f $(1)
endif

.PHONY: all clean fclean re

all: $(NAME)

$(NAME): $(SRCOBJS)
	@echo compiling done
	@$(LD) $(SRCOBJS) $(LDFLAGS)

$(OBJ)/%.o: %.s | $(OBJ)
	@echo Generating $@ from $<
	@$(AS) $< $(ASFLAGS) -o $@

$(OBJ)/%.o: %.c | $(OBJ)
	@echo creating $@ from $<
	@$(CC) $< $(CFLAGS) -o $@ $(INCLUDE)

$(OBJ):
	@$(call CREATE,$(OBJ))

clean:
	@$(call REMOVE_DIR,$(OBJ))

fclean: clean
	@$(call REMOVE_FILE,$(NAME))

re: fclean all
