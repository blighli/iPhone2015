#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>
#include <assert.h>
#include <exception>

// System.IO.StreamReader
struct StreamReader_t1288;
// System.IO.Stream
struct Stream_t1039;
// System.Text.Encoding
struct Encoding_t931;
// System.String
struct String_t;
// System.Char[]
struct CharU5BU5D_t458;

#include "codegen/il2cpp-codegen.h"

// System.Void System.IO.StreamReader::.ctor()
extern "C" void StreamReader__ctor_m7882 (StreamReader_t1288 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.IO.StreamReader::.ctor(System.IO.Stream,System.Text.Encoding)
extern "C" void StreamReader__ctor_m7883 (StreamReader_t1288 * __this, Stream_t1039 * ___stream, Encoding_t931 * ___encoding, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.IO.StreamReader::.ctor(System.IO.Stream,System.Text.Encoding,System.Boolean,System.Int32)
extern "C" void StreamReader__ctor_m7884 (StreamReader_t1288 * __this, Stream_t1039 * ___stream, Encoding_t931 * ___encoding, bool ___detectEncodingFromByteOrderMarks, int32_t ___bufferSize, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.IO.StreamReader::.ctor(System.String)
extern "C" void StreamReader__ctor_m7885 (StreamReader_t1288 * __this, String_t* ___path, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.IO.StreamReader::.ctor(System.String,System.Text.Encoding,System.Boolean,System.Int32)
extern "C" void StreamReader__ctor_m7886 (StreamReader_t1288 * __this, String_t* ___path, Encoding_t931 * ___encoding, bool ___detectEncodingFromByteOrderMarks, int32_t ___bufferSize, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.IO.StreamReader::.cctor()
extern "C" void StreamReader__cctor_m7887 (Object_t * __this /* static, unused */, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.IO.StreamReader::Initialize(System.IO.Stream,System.Text.Encoding,System.Boolean,System.Int32)
extern "C" void StreamReader_Initialize_m7888 (StreamReader_t1288 * __this, Stream_t1039 * ___stream, Encoding_t931 * ___encoding, bool ___detectEncodingFromByteOrderMarks, int32_t ___bufferSize, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.IO.StreamReader::Dispose(System.Boolean)
extern "C" void StreamReader_Dispose_m7889 (StreamReader_t1288 * __this, bool ___disposing, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 System.IO.StreamReader::DoChecks(System.Int32)
extern "C" int32_t StreamReader_DoChecks_m7890 (StreamReader_t1288 * __this, int32_t ___count, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 System.IO.StreamReader::ReadBuffer()
extern "C" int32_t StreamReader_ReadBuffer_m7891 (StreamReader_t1288 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 System.IO.StreamReader::Peek()
extern "C" int32_t StreamReader_Peek_m7892 (StreamReader_t1288 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 System.IO.StreamReader::Read()
extern "C" int32_t StreamReader_Read_m7893 (StreamReader_t1288 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 System.IO.StreamReader::Read(System.Char[],System.Int32,System.Int32)
extern "C" int32_t StreamReader_Read_m7894 (StreamReader_t1288 * __this, CharU5BU5D_t458* ___buffer, int32_t ___index, int32_t ___count, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 System.IO.StreamReader::FindNextEOL()
extern "C" int32_t StreamReader_FindNextEOL_m7895 (StreamReader_t1288 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.String System.IO.StreamReader::ReadLine()
extern "C" String_t* StreamReader_ReadLine_m7896 (StreamReader_t1288 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.String System.IO.StreamReader::ReadToEnd()
extern "C" String_t* StreamReader_ReadToEnd_m7897 (StreamReader_t1288 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
