﻿#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>
#include <assert.h>
#include <exception>

// System.Text.EncoderExceptionFallbackBuffer
struct EncoderExceptionFallbackBuffer_t1635;

#include "codegen/il2cpp-codegen.h"

// System.Void System.Text.EncoderExceptionFallbackBuffer::.ctor()
extern "C" void EncoderExceptionFallbackBuffer__ctor_m9728 (EncoderExceptionFallbackBuffer_t1635 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 System.Text.EncoderExceptionFallbackBuffer::get_Remaining()
extern "C" int32_t EncoderExceptionFallbackBuffer_get_Remaining_m9729 (EncoderExceptionFallbackBuffer_t1635 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.Text.EncoderExceptionFallbackBuffer::Fallback(System.Char,System.Int32)
extern "C" bool EncoderExceptionFallbackBuffer_Fallback_m9730 (EncoderExceptionFallbackBuffer_t1635 * __this, uint16_t ___charUnknown, int32_t ___index, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.Text.EncoderExceptionFallbackBuffer::Fallback(System.Char,System.Char,System.Int32)
extern "C" bool EncoderExceptionFallbackBuffer_Fallback_m9731 (EncoderExceptionFallbackBuffer_t1635 * __this, uint16_t ___charUnknownHigh, uint16_t ___charUnknownLow, int32_t ___index, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Char System.Text.EncoderExceptionFallbackBuffer::GetNextChar()
extern "C" uint16_t EncoderExceptionFallbackBuffer_GetNextChar_m9732 (EncoderExceptionFallbackBuffer_t1635 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
