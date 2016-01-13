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


#include "codegen/il2cpp-codegen.h"
#include "System_System_Text_RegularExpressions_Interpreter_IntStack.h"

// System.Int32 System.Text.RegularExpressions.Interpreter/IntStack::Pop()
extern "C" int32_t IntStack_Pop_m4301 (IntStack_t851 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Text.RegularExpressions.Interpreter/IntStack::Push(System.Int32)
extern "C" void IntStack_Push_m4302 (IntStack_t851 * __this, int32_t ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 System.Text.RegularExpressions.Interpreter/IntStack::get_Count()
extern "C" int32_t IntStack_get_Count_m4303 (IntStack_t851 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Text.RegularExpressions.Interpreter/IntStack::set_Count(System.Int32)
extern "C" void IntStack_set_Count_m4304 (IntStack_t851 * __this, int32_t ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
extern "C" void IntStack_t851_marshal(const IntStack_t851& unmarshaled, IntStack_t851_marshaled& marshaled);
extern "C" void IntStack_t851_marshal_back(const IntStack_t851_marshaled& marshaled, IntStack_t851& unmarshaled);
extern "C" void IntStack_t851_marshal_cleanup(IntStack_t851_marshaled& marshaled);
