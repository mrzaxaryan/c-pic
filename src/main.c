#include "environment.h"

INT32 _fltused = 0;

ENTRYPOINT INT32 main() {
	
	PrintFormatedString("%s\r\n", "Hello world!");

	ExitProcess(0);
}

