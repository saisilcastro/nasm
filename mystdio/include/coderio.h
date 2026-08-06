#ifndef CODERIO_H
#define CODERIO_H

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>

extern void		*Calloc(size_t, size_t);
extern void		bZero(void *, size_t);
extern void		*MemSet(void *, int, size_t);
extern char 	*MemCpy(void *dest, const void *src, size_t size);
extern void		*MemMove(void *dest, const void *src, size_t size);
extern void		*MemChr(const void *mem, int c, size_t size);
extern int		MemCmp(const void *, const void *, size_t);
extern char		*StrDup(char *);
extern char		*StrJoin(const char*, const char *);
extern char		*StrCpy(char *dest, const char *src);
extern size_t	StrlCpy(char *, const char *, size_t);
extern char		*StrnCat(char *, const char *, size_t);
extern size_t	StrlCat(char *, const char *, size_t);
extern size_t	StrnCpy(char *, const char *, size_t);
extern char		*StrChr(const char *str, int c);
extern char		*StrrChr(const char *, int);
extern char		*StrTrim(const char *, const char *);
extern char		*StrSub(const char *, size_t, size_t);
extern size_t	StrLen(const char *);
extern int		StrCmp(const char *, const char *);
extern int		StrnCmp(const char *, const char *, size_t);
extern char		*StrnStr(const char *, const char *, size_t);
extern char		*StrMapi(const char *, char (*f)(unsigned int, char));
extern void		StrIteri(char *, void (*f)(unsigned int, char *));
extern void		PutcharFd(char, int);
extern void		PutnbrFd(int, int);
extern void		PutendlFd(const char *, int);
extern void		PutstrFd(const char *, int);
extern int		Atoi(const char*);
extern char		*Itoa(int);
extern int		NumLen(int);
extern int		IsDigit(char);
extern int		IsAlpha(char);
extern int		IsAlnum(char);
extern int		IsPrint(char);
extern int		IsAscii(char);
extern int		ToLower(char);
extern int		ToUpper(char);
extern char		**Split(const char *, char);

#endif
