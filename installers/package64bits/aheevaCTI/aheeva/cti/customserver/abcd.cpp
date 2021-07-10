
#include <string>
#include <iostream>

extern "C"
{
	char* getBalance(char *);
}

char* getBalance(char* param)
{
	return "dollars=50^cents=16";
}


