#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.IO.TextWriter
struct TextWriter_t943;
// System.IO.TextReader
struct TextReader_t1210;
// System.Text.Encoding
struct Encoding_t931;

#include "mscorlib_System_Object.h"

// System.Console
struct  Console_t942  : public Object_t
{
};
struct Console_t942_StaticFields{
	// System.IO.TextWriter System.Console::stdout
	TextWriter_t943 * ___stdout_0;
	// System.IO.TextWriter System.Console::stderr
	TextWriter_t943 * ___stderr_1;
	// System.IO.TextReader System.Console::stdin
	TextReader_t1210 * ___stdin_2;
	// System.Text.Encoding System.Console::inputEncoding
	Encoding_t931 * ___inputEncoding_3;
	// System.Text.Encoding System.Console::outputEncoding
	Encoding_t931 * ___outputEncoding_4;
};
