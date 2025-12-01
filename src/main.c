#include "environment.h"

ENTRYPOINT INT32 main(VOID) {
	// DOUBLE a = 5.5;
	// DOUBLE b = 2.2;
	// DOUBLE d = a / b;
	PrintFormatedString("%s\r\n", "Hello world!");
	//PrintFormatedString("Result: %f\r\n", d);
	
	ExitProcess(0);
}

