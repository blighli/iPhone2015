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

// UnityEngine.TouchScreenKeyboard
struct TouchScreenKeyboard_t229;
// System.String
struct String_t;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UnityEngine_TouchScreenKeyboardType.h"
#include "UnityEngine_UnityEngine_TouchScreenKeyboard_InternalConstruc.h"

// System.Void UnityEngine.TouchScreenKeyboard::.ctor(System.String,UnityEngine.TouchScreenKeyboardType,System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.String)
extern "C" void TouchScreenKeyboard__ctor_m919 (TouchScreenKeyboard_t229 * __this, String_t* ___text, int32_t ___keyboardType, bool ___autocorrection, bool ___multiline, bool ___secure, bool ___alert, String_t* ___textPlaceholder, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.TouchScreenKeyboard::Destroy()
extern "C" void TouchScreenKeyboard_Destroy_m920 (TouchScreenKeyboard_t229 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.TouchScreenKeyboard::Finalize()
extern "C" void TouchScreenKeyboard_Finalize_m921 (TouchScreenKeyboard_t229 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.TouchScreenKeyboard::TouchScreenKeyboard_InternalConstructorHelper(UnityEngine.TouchScreenKeyboard_InternalConstructorHelperArguments&,System.String,System.String)
extern "C" void TouchScreenKeyboard_TouchScreenKeyboard_InternalConstructorHelper_m922 (TouchScreenKeyboard_t229 * __this, TouchScreenKeyboard_InternalConstructorHelperArguments_t227 * ___arguments, String_t* ___text, String_t* ___textPlaceholder, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.TouchScreenKeyboard::get_isSupported()
extern "C" bool TouchScreenKeyboard_get_isSupported_m923 (Object_t * __this /* static, unused */, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.TouchScreenKeyboard UnityEngine.TouchScreenKeyboard::Open(System.String,UnityEngine.TouchScreenKeyboardType,System.Boolean,System.Boolean,System.Boolean)
extern "C" TouchScreenKeyboard_t229 * TouchScreenKeyboard_Open_m924 (Object_t * __this /* static, unused */, String_t* ___text, int32_t ___keyboardType, bool ___autocorrection, bool ___multiline, bool ___secure, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.TouchScreenKeyboard UnityEngine.TouchScreenKeyboard::Open(System.String,UnityEngine.TouchScreenKeyboardType,System.Boolean,System.Boolean)
extern "C" TouchScreenKeyboard_t229 * TouchScreenKeyboard_Open_m925 (Object_t * __this /* static, unused */, String_t* ___text, int32_t ___keyboardType, bool ___autocorrection, bool ___multiline, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.TouchScreenKeyboard UnityEngine.TouchScreenKeyboard::Open(System.String,UnityEngine.TouchScreenKeyboardType,System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.String)
extern "C" TouchScreenKeyboard_t229 * TouchScreenKeyboard_Open_m926 (Object_t * __this /* static, unused */, String_t* ___text, int32_t ___keyboardType, bool ___autocorrection, bool ___multiline, bool ___secure, bool ___alert, String_t* ___textPlaceholder, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.String UnityEngine.TouchScreenKeyboard::get_text()
extern "C" String_t* TouchScreenKeyboard_get_text_m927 (TouchScreenKeyboard_t229 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.TouchScreenKeyboard::set_text(System.String)
extern "C" void TouchScreenKeyboard_set_text_m928 (TouchScreenKeyboard_t229 * __this, String_t* ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.TouchScreenKeyboard::set_hideInput(System.Boolean)
extern "C" void TouchScreenKeyboard_set_hideInput_m929 (Object_t * __this /* static, unused */, bool ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.TouchScreenKeyboard::get_active()
extern "C" bool TouchScreenKeyboard_get_active_m930 (TouchScreenKeyboard_t229 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.TouchScreenKeyboard::set_active(System.Boolean)
extern "C" void TouchScreenKeyboard_set_active_m931 (TouchScreenKeyboard_t229 * __this, bool ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.TouchScreenKeyboard::get_done()
extern "C" bool TouchScreenKeyboard_get_done_m932 (TouchScreenKeyboard_t229 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.TouchScreenKeyboard::get_wasCanceled()
extern "C" bool TouchScreenKeyboard_get_wasCanceled_m933 (TouchScreenKeyboard_t229 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
