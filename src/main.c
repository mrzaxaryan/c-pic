#include "environment.h"

ENTRYPOINT INT32 main() {
	
	PCHAR message = "Hello world!\r\n";

	USIZE messageLength = GetStringLength(message);
	WriteConsole(message, messageLength);

	ExitProcess(0);
}

