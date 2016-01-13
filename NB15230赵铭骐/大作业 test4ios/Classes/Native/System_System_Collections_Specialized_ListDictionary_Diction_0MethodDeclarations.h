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

// System.Collections.Specialized.ListDictionary/DictionaryNodeEnumerator
struct DictionaryNodeEnumerator_t728;
// System.Collections.Specialized.ListDictionary
struct ListDictionary_t726;
// System.Object
struct Object_t;
// System.Collections.Specialized.ListDictionary/DictionaryNode
struct DictionaryNode_t727;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_Collections_DictionaryEntry.h"

// System.Void System.Collections.Specialized.ListDictionary/DictionaryNodeEnumerator::.ctor(System.Collections.Specialized.ListDictionary)
extern "C" void DictionaryNodeEnumerator__ctor_m3713 (DictionaryNodeEnumerator_t728 * __this, ListDictionary_t726 * ___dict, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Collections.Specialized.ListDictionary/DictionaryNodeEnumerator::FailFast()
extern "C" void DictionaryNodeEnumerator_FailFast_m3714 (DictionaryNodeEnumerator_t728 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.Collections.Specialized.ListDictionary/DictionaryNodeEnumerator::MoveNext()
extern "C" bool DictionaryNodeEnumerator_MoveNext_m3715 (DictionaryNodeEnumerator_t728 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Collections.Specialized.ListDictionary/DictionaryNodeEnumerator::Reset()
extern "C" void DictionaryNodeEnumerator_Reset_m3716 (DictionaryNodeEnumerator_t728 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Object System.Collections.Specialized.ListDictionary/DictionaryNodeEnumerator::get_Current()
extern "C" Object_t * DictionaryNodeEnumerator_get_Current_m3717 (DictionaryNodeEnumerator_t728 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Collections.Specialized.ListDictionary/DictionaryNode System.Collections.Specialized.ListDictionary/DictionaryNodeEnumerator::get_DictionaryNode()
extern "C" DictionaryNode_t727 * DictionaryNodeEnumerator_get_DictionaryNode_m3718 (DictionaryNodeEnumerator_t728 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Collections.DictionaryEntry System.Collections.Specialized.ListDictionary/DictionaryNodeEnumerator::get_Entry()
extern "C" DictionaryEntry_t900  DictionaryNodeEnumerator_get_Entry_m3719 (DictionaryNodeEnumerator_t728 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Object System.Collections.Specialized.ListDictionary/DictionaryNodeEnumerator::get_Key()
extern "C" Object_t * DictionaryNodeEnumerator_get_Key_m3720 (DictionaryNodeEnumerator_t728 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Object System.Collections.Specialized.ListDictionary/DictionaryNodeEnumerator::get_Value()
extern "C" Object_t * DictionaryNodeEnumerator_get_Value_m3721 (DictionaryNodeEnumerator_t728 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
