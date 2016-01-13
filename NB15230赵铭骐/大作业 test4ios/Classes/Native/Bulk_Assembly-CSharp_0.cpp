#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <cstring>
#include <string.h>
#include <stdio.h>
#include <cmath>
#include <limits>
#include <assert.h>

// GoDie
struct GoDie_t171;
// UnityEngine.Animator
struct Animator_t10;

#include "class-internals.h"
#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_Array.h"
#include "AssemblyU2DCSharp_U3CModuleU3E.h"
#include "AssemblyU2DCSharp_U3CModuleU3EMethodDeclarations.h"
#include "AssemblyU2DCSharp_GoDie.h"
#include "AssemblyU2DCSharp_GoDieMethodDeclarations.h"
#include "mscorlib_System_Void.h"
#include "UnityEngine_UnityEngine_StateMachineBehaviourMethodDeclarations.h"
#include "UnityEngine_UnityEngine_StateMachineBehaviour.h"
#include "UnityEngine_UnityEngine_AnimatorStateInfo.h"
#include "UnityEngine_UnityEngine_Animator.h"
#include "mscorlib_System_Int32.h"
#include "UnityEngine_UnityEngine_AnimatorMethodDeclarations.h"
#include "mscorlib_System_String.h"
#include "mscorlib_System_Boolean.h"

#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// System.Void GoDie::.ctor()
extern "C" void GoDie__ctor_m711 (GoDie_t171 * __this, const MethodInfo* method)
{
	{
		StateMachineBehaviour__ctor_m713(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void GoDie::OnStateEnter(UnityEngine.Animator,UnityEngine.AnimatorStateInfo,System.Int32)
extern Il2CppCodeGenString* _stringLiteral45;
extern "C" void GoDie_OnStateEnter_m712 (GoDie_t171 * __this, Animator_t10 * ___animator, AnimatorStateInfo_t148  ___stateInfo, int32_t ___layerIndex, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		_stringLiteral45 = il2cpp_codegen_string_literal_from_index(45);
		s_Il2CppMethodIntialized = true;
	}
	{
		Animator_t10 * L_0 = ___animator;
		NullCheck(L_0);
		Animator_SetBool_m430(L_0, _stringLiteral45, 1, /*hidden argument*/NULL);
		return;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
