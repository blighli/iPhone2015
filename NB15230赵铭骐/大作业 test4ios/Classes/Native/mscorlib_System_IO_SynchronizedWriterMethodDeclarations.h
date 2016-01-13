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

// System.IO.SynchronizedWriter
struct SynchronizedWriter_t1294;
// System.IO.TextWriter
struct TextWriter_t943;
// System.Char[]
struct CharU5BU5D_t458;
// System.String
struct String_t;

#include "codegen/il2cpp-codegen.h"

// System.Void System.IO.SynchronizedWriter::.ctor(System.IO.TextWriter,System.Boolean)
extern "C" void SynchronizedWriter__ctor_m7958 (SynchronizedWriter_t1294 * __this, TextWriter_t943 * ___writer, bool ___neverClose, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.IO.SynchronizedWriter::Close()
extern "C" void SynchronizedWriter_Close_m7959 (SynchronizedWriter_t1294 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.IO.SynchronizedWriter::Flush()
extern "C" void SynchronizedWriter_Flush_m7960 (SynchronizedWriter_t1294 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.IO.SynchronizedWriter::Write(System.Char)
extern "C" void SynchronizedWriter_Write_m7961 (SynchronizedWriter_t1294 * __this, uint16_t ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.IO.SynchronizedWriter::Write(System.Char[])
extern "C" void SynchronizedWriter_Write_m7962 (SynchronizedWriter_t1294 * __this, CharU5BU5D_t458* ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.IO.SynchronizedWriter::Write(System.String)
extern "C" void SynchronizedWriter_Write_m7963 (SynchronizedWriter_t1294 * __this, String_t* ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.IO.SynchronizedWriter::Write(System.Char[],System.Int32,System.Int32)
extern "C" void SynchronizedWriter_Write_m7964 (SynchronizedWriter_t1294 * __this, CharU5BU5D_t458* ___buffer, int32_t ___index, int32_t ___count, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.IO.SynchronizedWriter::WriteLine()
extern "C" void SynchronizedWriter_WriteLine_m7965 (SynchronizedWriter_t1294 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.IO.SynchronizedWriter::WriteLine(System.String)
extern "C" void SynchronizedWriter_WriteLine_m7966 (SynchronizedWriter_t1294 * __this, String_t* ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
