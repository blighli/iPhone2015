﻿#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.Collections.Generic.Stack`1<System.Collections.Generic.List`1<UnityEngine.Vector4>>
struct Stack_1_t2293;
// UnityEngine.Events.UnityAction`1<System.Collections.Generic.List`1<UnityEngine.Vector4>>
struct UnityAction_1_t2292;

#include "mscorlib_System_Object.h"

// UnityEngine.UI.ObjectPool`1<System.Collections.Generic.List`1<UnityEngine.Vector4>>
struct  ObjectPool_1_t2291  : public Object_t
{
	// System.Collections.Generic.Stack`1<T> UnityEngine.UI.ObjectPool`1<System.Collections.Generic.List`1<UnityEngine.Vector4>>::m_Stack
	Stack_1_t2293 * ___m_Stack_0;
	// UnityEngine.Events.UnityAction`1<T> UnityEngine.UI.ObjectPool`1<System.Collections.Generic.List`1<UnityEngine.Vector4>>::m_ActionOnGet
	UnityAction_1_t2292 * ___m_ActionOnGet_1;
	// UnityEngine.Events.UnityAction`1<T> UnityEngine.UI.ObjectPool`1<System.Collections.Generic.List`1<UnityEngine.Vector4>>::m_ActionOnRelease
	UnityAction_1_t2292 * ___m_ActionOnRelease_2;
	// System.Int32 UnityEngine.UI.ObjectPool`1<System.Collections.Generic.List`1<UnityEngine.Vector4>>::<countAll>k__BackingField
	int32_t ___U3CcountAllU3Ek__BackingField_3;
};
