#include "console.h"

UINT32 PrintFormatedString(const PCHAR format, ...){

    va_list args; // Variatic arguments list
    
   

    va_start(args, format); // Initialize the argument list with format so we can access the variable arguments
    
    CHAR   buffer[1024]; // Buffer to hold the formatted string



    INT32 len = String_FormatV(WriteConsole(buffer, len), format, args); // Format the string using the variable arguments
    va_end(args); // Clean up the argument list

    return ; // Write the formatted string to the console and return the number of characters written
}