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

// NewBehaviourScript
struct NewBehaviourScript_t174;
// NewBehaviourScript1
struct NewBehaviourScript1_t175;
// UnityEngine.Collider2D
struct Collider2D_t129;
// NewBehaviourScript2
struct NewBehaviourScript2_t176;
// retry
struct retry_t177;
// robo2
struct robo2_t178;
// s2
struct s2_t179;

#include "class-internals.h"
#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_Array.h"
#include "AssemblyU2DUnityScript_U3CModuleU3E.h"
#include "AssemblyU2DUnityScript_U3CModuleU3EMethodDeclarations.h"
#include "AssemblyU2DUnityScript_NewBehaviourScript.h"
#include "AssemblyU2DUnityScript_NewBehaviourScriptMethodDeclarations.h"
#include "mscorlib_System_Void.h"
#include "UnityEngine_UnityEngine_MonoBehaviourMethodDeclarations.h"
#include "UnityEngine_UnityEngine_MonoBehaviour.h"
#include "UnityEngine_UnityEngine_GameObjectMethodDeclarations.h"
#include "UnityEngine_UnityEngine_Vector3MethodDeclarations.h"
#include "UnityEngine_UnityEngine_TimeMethodDeclarations.h"
#include "UnityEngine_UnityEngine_TransformMethodDeclarations.h"
#include "UnityEngine_UnityEngine_InputMethodDeclarations.h"
#include "mscorlib_System_String.h"
#include "UnityEngine_UnityEngine_GameObject.h"
#include "UnityEngine_UnityEngine_Transform.h"
#include "UnityEngine_UnityEngine_Vector3.h"
#include "mscorlib_System_Single.h"
#include "mscorlib_System_Boolean.h"
#include "UnityEngine_UnityEngine_KeyCode.h"
#include "AssemblyU2DUnityScript_NewBehaviourScript1.h"
#include "AssemblyU2DUnityScript_NewBehaviourScript1MethodDeclarations.h"
#include "UnityEngine_UnityEngine_Collider2D.h"
#include "mscorlib_System_TypeMethodDeclarations.h"
#include "UnityEngine_UnityEngine_AnimatorMethodDeclarations.h"
#include "UnityEngine_UnityEngine_BehaviourMethodDeclarations.h"
#include "mscorlib_System_Type.h"
#include "mscorlib_System_RuntimeTypeHandle.h"
#include "UnityEngine_UnityEngine_Component.h"
#include "UnityEngine_UnityEngine_Animator.h"
#include "UnityEngine_UnityEngine_Behaviour.h"
#include "AssemblyU2DUnityScript_NewBehaviourScript2.h"
#include "AssemblyU2DUnityScript_NewBehaviourScript2MethodDeclarations.h"
#include "AssemblyU2DUnityScript_retry.h"
#include "AssemblyU2DUnityScript_retryMethodDeclarations.h"
#include "UnityEngine_UnityEngine_ApplicationMethodDeclarations.h"
#include "AssemblyU2DUnityScript_robo2.h"
#include "AssemblyU2DUnityScript_robo2MethodDeclarations.h"
#include "AssemblyU2DUnityScript_s2.h"
#include "AssemblyU2DUnityScript_s2MethodDeclarations.h"
#include "UnityEngine_UnityEngine_ObjectMethodDeclarations.h"
#include "mscorlib_System_Int32.h"
#include "UnityEngine_UnityEngine_Object.h"

#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// System.Void NewBehaviourScript::.ctor()
extern "C" void NewBehaviourScript__ctor_m714 (NewBehaviourScript_t174 * __this, const MethodInfo* method)
{
	{
		MonoBehaviour__ctor_m399(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void NewBehaviourScript::Start()
extern "C" void NewBehaviourScript_Start_m715 (NewBehaviourScript_t174 * __this, const MethodInfo* method)
{
	{
		return;
	}
}
// System.Void NewBehaviourScript::Update()
extern TypeInfo* Input_t135_il2cpp_TypeInfo_var;
extern Il2CppCodeGenString* _stringLiteral46;
extern "C" void NewBehaviourScript_Update_m716 (NewBehaviourScript_t174 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		Input_t135_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(4);
		_stringLiteral46 = il2cpp_codegen_string_literal_from_index(46);
		s_Il2CppMethodIntialized = true;
	}
	{
		GameObject_t77 * L_0 = GameObject_Find_m741(NULL /*static, unused*/, _stringLiteral46, /*hidden argument*/NULL);
		__this->___t_2 = L_0;
		GameObject_t77 * L_1 = (__this->___t_2);
		NullCheck(L_1);
		Transform_t3 * L_2 = GameObject_get_transform_m416(L_1, /*hidden argument*/NULL);
		Vector3_t4  L_3 = Vector3_get_left_m742(NULL /*static, unused*/, /*hidden argument*/NULL);
		Vector3_t4  L_4 = Vector3_op_Multiply_m407(NULL /*static, unused*/, L_3, (0.05f), /*hidden argument*/NULL);
		float L_5 = Time_get_time_m474(NULL /*static, unused*/, /*hidden argument*/NULL);
		Vector3_t4  L_6 = Vector3_op_Multiply_m407(NULL /*static, unused*/, L_4, L_5, /*hidden argument*/NULL);
		NullCheck(L_2);
		Transform_Translate_m743(L_2, L_6, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(Input_t135_il2cpp_TypeInfo_var);
		bool L_7 = Input_GetKey_m421(NULL /*static, unused*/, ((int32_t)119), /*hidden argument*/NULL);
		if (!L_7)
		{
			goto IL_0069;
		}
	}
	{
		GameObject_t77 * L_8 = (__this->___t_2);
		NullCheck(L_8);
		Transform_t3 * L_9 = GameObject_get_transform_m416(L_8, /*hidden argument*/NULL);
		Vector3_t4  L_10 = Vector3_get_up_m448(NULL /*static, unused*/, /*hidden argument*/NULL);
		Vector3_t4  L_11 = Vector3_op_Multiply_m407(NULL /*static, unused*/, L_10, (0.1f), /*hidden argument*/NULL);
		NullCheck(L_9);
		Transform_Translate_m743(L_9, L_11, /*hidden argument*/NULL);
		goto IL_00c4;
	}

IL_0069:
	{
		IL2CPP_RUNTIME_CLASS_INIT(Input_t135_il2cpp_TypeInfo_var);
		bool L_12 = Input_GetKey_m421(NULL /*static, unused*/, ((int32_t)106), /*hidden argument*/NULL);
		if (!L_12)
		{
			goto IL_0099;
		}
	}
	{
		GameObject_t77 * L_13 = (__this->___t_2);
		NullCheck(L_13);
		Transform_t3 * L_14 = GameObject_get_transform_m416(L_13, /*hidden argument*/NULL);
		Vector3_t4  L_15 = Vector3_get_left_m742(NULL /*static, unused*/, /*hidden argument*/NULL);
		Vector3_t4  L_16 = Vector3_op_Multiply_m407(NULL /*static, unused*/, L_15, (0.1f), /*hidden argument*/NULL);
		NullCheck(L_14);
		Transform_Translate_m743(L_14, L_16, /*hidden argument*/NULL);
		goto IL_00c4;
	}

IL_0099:
	{
		IL2CPP_RUNTIME_CLASS_INIT(Input_t135_il2cpp_TypeInfo_var);
		bool L_17 = Input_GetKey_m421(NULL /*static, unused*/, ((int32_t)107), /*hidden argument*/NULL);
		if (!L_17)
		{
			goto IL_00c4;
		}
	}
	{
		GameObject_t77 * L_18 = (__this->___t_2);
		NullCheck(L_18);
		Transform_t3 * L_19 = GameObject_get_transform_m416(L_18, /*hidden argument*/NULL);
		Vector3_t4  L_20 = Vector3_get_right_m404(NULL /*static, unused*/, /*hidden argument*/NULL);
		Vector3_t4  L_21 = Vector3_op_Multiply_m407(NULL /*static, unused*/, L_20, (0.1f), /*hidden argument*/NULL);
		NullCheck(L_19);
		Transform_Translate_m743(L_19, L_21, /*hidden argument*/NULL);
	}

IL_00c4:
	{
		return;
	}
}
// System.Void NewBehaviourScript::Main()
extern "C" void NewBehaviourScript_Main_m717 (NewBehaviourScript_t174 * __this, const MethodInfo* method)
{
	{
		return;
	}
}
// System.Void NewBehaviourScript1::.ctor()
extern "C" void NewBehaviourScript1__ctor_m718 (NewBehaviourScript1_t175 * __this, const MethodInfo* method)
{
	{
		MonoBehaviour__ctor_m399(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void NewBehaviourScript1::Start()
extern "C" void NewBehaviourScript1_Start_m719 (NewBehaviourScript1_t175 * __this, const MethodInfo* method)
{
	{
		return;
	}
}
// System.Void NewBehaviourScript1::Update()
extern "C" void NewBehaviourScript1_Update_m720 (NewBehaviourScript1_t175 * __this, const MethodInfo* method)
{
	{
		return;
	}
}
// System.Void NewBehaviourScript1::OnTriggerEnter2D(UnityEngine.Collider2D)
extern const Il2CppType* Animator_t10_0_0_0_var;
extern TypeInfo* Type_t_il2cpp_TypeInfo_var;
extern TypeInfo* Animator_t10_il2cpp_TypeInfo_var;
extern TypeInfo* Behaviour_t156_il2cpp_TypeInfo_var;
extern Il2CppCodeGenString* _stringLiteral47;
extern Il2CppCodeGenString* _stringLiteral48;
extern Il2CppCodeGenString* _stringLiteral49;
extern Il2CppCodeGenString* _stringLiteral50;
extern Il2CppCodeGenString* _stringLiteral51;
extern "C" void NewBehaviourScript1_OnTriggerEnter2D_m721 (NewBehaviourScript1_t175 * __this, Collider2D_t129 * ___other, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		Animator_t10_0_0_0_var = il2cpp_codegen_type_from_index(5);
		Type_t_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(38);
		Animator_t10_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(5);
		Behaviour_t156_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(53);
		_stringLiteral47 = il2cpp_codegen_string_literal_from_index(47);
		_stringLiteral48 = il2cpp_codegen_string_literal_from_index(48);
		_stringLiteral49 = il2cpp_codegen_string_literal_from_index(49);
		_stringLiteral50 = il2cpp_codegen_string_literal_from_index(50);
		_stringLiteral51 = il2cpp_codegen_string_literal_from_index(51);
		s_Il2CppMethodIntialized = true;
	}
	{
		GameObject_t77 * L_0 = GameObject_Find_m741(NULL /*static, unused*/, _stringLiteral47, /*hidden argument*/NULL);
		__this->___robo_4 = L_0;
		GameObject_t77 * L_1 = (__this->___robo_4);
		IL2CPP_RUNTIME_CLASS_INIT(Type_t_il2cpp_TypeInfo_var);
		Type_t * L_2 = Type_GetTypeFromHandle_m585(NULL /*static, unused*/, LoadTypeToken(Animator_t10_0_0_0_var), /*hidden argument*/NULL);
		NullCheck(L_1);
		Component_t169 * L_3 = GameObject_GetComponent_m744(L_1, L_2, /*hidden argument*/NULL);
		__this->___t_2 = ((Animator_t10 *)CastclassSealed(L_3, Animator_t10_il2cpp_TypeInfo_var));
		GameObject_t77 * L_4 = GameObject_Find_m741(NULL /*static, unused*/, _stringLiteral48, /*hidden argument*/NULL);
		Type_t * L_5 = Type_GetTypeFromHandle_m585(NULL /*static, unused*/, LoadTypeToken(Animator_t10_0_0_0_var), /*hidden argument*/NULL);
		NullCheck(L_4);
		Component_t169 * L_6 = GameObject_GetComponent_m744(L_4, L_5, /*hidden argument*/NULL);
		__this->___g_3 = ((Animator_t10 *)CastclassSealed(L_6, Animator_t10_il2cpp_TypeInfo_var));
		Animator_t10 * L_7 = (__this->___t_2);
		NullCheck(L_7);
		Animator_SetTrigger_m745(L_7, _stringLiteral49, /*hidden argument*/NULL);
		Animator_t10 * L_8 = (__this->___g_3);
		NullCheck(L_8);
		Animator_SetTrigger_m745(L_8, _stringLiteral50, /*hidden argument*/NULL);
		GameObject_t77 * L_9 = (__this->___robo_4);
		NullCheck(L_9);
		Component_t169 * L_10 = GameObject_GetComponent_m746(L_9, _stringLiteral51, /*hidden argument*/NULL);
		__this->___s_5 = ((Behaviour_t156 *)CastclassClass(L_10, Behaviour_t156_il2cpp_TypeInfo_var));
		Behaviour_t156 * L_11 = (__this->___s_5);
		NullCheck(L_11);
		Behaviour_set_enabled_m618(L_11, 0, /*hidden argument*/NULL);
		return;
	}
}
// System.Void NewBehaviourScript1::Main()
extern "C" void NewBehaviourScript1_Main_m722 (NewBehaviourScript1_t175 * __this, const MethodInfo* method)
{
	{
		return;
	}
}
// System.Void NewBehaviourScript2::.ctor()
extern "C" void NewBehaviourScript2__ctor_m723 (NewBehaviourScript2_t176 * __this, const MethodInfo* method)
{
	{
		MonoBehaviour__ctor_m399(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void NewBehaviourScript2::Start()
extern "C" void NewBehaviourScript2_Start_m724 (NewBehaviourScript2_t176 * __this, const MethodInfo* method)
{
	{
		return;
	}
}
// System.Void NewBehaviourScript2::Update()
extern "C" void NewBehaviourScript2_Update_m725 (NewBehaviourScript2_t176 * __this, const MethodInfo* method)
{
	{
		return;
	}
}
// System.Void NewBehaviourScript2::OnTriggerEnter2D(UnityEngine.Collider2D)
extern const Il2CppType* Animator_t10_0_0_0_var;
extern TypeInfo* Type_t_il2cpp_TypeInfo_var;
extern TypeInfo* Animator_t10_il2cpp_TypeInfo_var;
extern TypeInfo* Behaviour_t156_il2cpp_TypeInfo_var;
extern Il2CppCodeGenString* _stringLiteral47;
extern Il2CppCodeGenString* _stringLiteral52;
extern Il2CppCodeGenString* _stringLiteral50;
extern Il2CppCodeGenString* _stringLiteral51;
extern "C" void NewBehaviourScript2_OnTriggerEnter2D_m726 (NewBehaviourScript2_t176 * __this, Collider2D_t129 * ___other, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		Animator_t10_0_0_0_var = il2cpp_codegen_type_from_index(5);
		Type_t_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(38);
		Animator_t10_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(5);
		Behaviour_t156_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(53);
		_stringLiteral47 = il2cpp_codegen_string_literal_from_index(47);
		_stringLiteral52 = il2cpp_codegen_string_literal_from_index(52);
		_stringLiteral50 = il2cpp_codegen_string_literal_from_index(50);
		_stringLiteral51 = il2cpp_codegen_string_literal_from_index(51);
		s_Il2CppMethodIntialized = true;
	}
	{
		GameObject_t77 * L_0 = GameObject_Find_m741(NULL /*static, unused*/, _stringLiteral47, /*hidden argument*/NULL);
		__this->___robo_3 = L_0;
		GameObject_t77 * L_1 = GameObject_Find_m741(NULL /*static, unused*/, _stringLiteral52, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(Type_t_il2cpp_TypeInfo_var);
		Type_t * L_2 = Type_GetTypeFromHandle_m585(NULL /*static, unused*/, LoadTypeToken(Animator_t10_0_0_0_var), /*hidden argument*/NULL);
		NullCheck(L_1);
		Component_t169 * L_3 = GameObject_GetComponent_m744(L_1, L_2, /*hidden argument*/NULL);
		__this->___g_2 = ((Animator_t10 *)CastclassSealed(L_3, Animator_t10_il2cpp_TypeInfo_var));
		Animator_t10 * L_4 = (__this->___g_2);
		NullCheck(L_4);
		Animator_SetTrigger_m745(L_4, _stringLiteral50, /*hidden argument*/NULL);
		GameObject_t77 * L_5 = (__this->___robo_3);
		NullCheck(L_5);
		Component_t169 * L_6 = GameObject_GetComponent_m746(L_5, _stringLiteral51, /*hidden argument*/NULL);
		__this->___s_4 = ((Behaviour_t156 *)CastclassClass(L_6, Behaviour_t156_il2cpp_TypeInfo_var));
		Behaviour_t156 * L_7 = (__this->___s_4);
		NullCheck(L_7);
		Behaviour_set_enabled_m618(L_7, 0, /*hidden argument*/NULL);
		return;
	}
}
// System.Void NewBehaviourScript2::Main()
extern "C" void NewBehaviourScript2_Main_m727 (NewBehaviourScript2_t176 * __this, const MethodInfo* method)
{
	{
		return;
	}
}
// System.Void retry::.ctor()
extern "C" void retry__ctor_m728 (retry_t177 * __this, const MethodInfo* method)
{
	{
		MonoBehaviour__ctor_m399(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void retry::Start()
extern "C" void retry_Start_m729 (retry_t177 * __this, const MethodInfo* method)
{
	{
		return;
	}
}
// System.Void retry::Update()
extern TypeInfo* Input_t135_il2cpp_TypeInfo_var;
extern "C" void retry_Update_m730 (retry_t177 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		Input_t135_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(4);
		s_Il2CppMethodIntialized = true;
	}
	{
		IL2CPP_RUNTIME_CLASS_INIT(Input_t135_il2cpp_TypeInfo_var);
		bool L_0 = Input_GetKey_m421(NULL /*static, unused*/, ((int32_t)114), /*hidden argument*/NULL);
		if (!L_0)
		{
			goto IL_0016;
		}
	}
	{
		String_t* L_1 = Application_get_loadedLevelName_m443(NULL /*static, unused*/, /*hidden argument*/NULL);
		Application_LoadLevel_m444(NULL /*static, unused*/, L_1, /*hidden argument*/NULL);
	}

IL_0016:
	{
		return;
	}
}
// System.Void retry::Main()
extern "C" void retry_Main_m731 (retry_t177 * __this, const MethodInfo* method)
{
	{
		return;
	}
}
// System.Void robo2::.ctor()
extern "C" void robo2__ctor_m732 (robo2_t178 * __this, const MethodInfo* method)
{
	{
		MonoBehaviour__ctor_m399(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void robo2::Start()
extern Il2CppCodeGenString* _stringLiteral47;
extern "C" void robo2_Start_m733 (robo2_t178 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		_stringLiteral47 = il2cpp_codegen_string_literal_from_index(47);
		s_Il2CppMethodIntialized = true;
	}
	float V_0 = 0.0f;
	Vector3_t4  V_1 = {0};
	Vector3_t4  V_2 = {0};
	float V_3 = 0.0f;
	Vector3_t4  V_4 = {0};
	{
		GameObject_t77 * L_0 = GameObject_Find_m741(NULL /*static, unused*/, _stringLiteral47, /*hidden argument*/NULL);
		__this->___r_2 = L_0;
		GameObject_t77 * L_1 = (__this->___r_2);
		NullCheck(L_1);
		Transform_t3 * L_2 = GameObject_get_transform_m416(L_1, /*hidden argument*/NULL);
		NullCheck(L_2);
		Vector3_t4  L_3 = Transform_get_position_m400(L_2, /*hidden argument*/NULL);
		V_2 = L_3;
		float L_4 = ((&V_2)->___x_1);
		float L_5 = ((float)((float)L_4-(float)(((float)((float)((int32_t)30))))));
		V_0 = L_5;
		GameObject_t77 * L_6 = (__this->___r_2);
		NullCheck(L_6);
		Transform_t3 * L_7 = GameObject_get_transform_m416(L_6, /*hidden argument*/NULL);
		NullCheck(L_7);
		Vector3_t4  L_8 = Transform_get_position_m400(L_7, /*hidden argument*/NULL);
		Vector3_t4  L_9 = L_8;
		V_1 = L_9;
		float L_10 = V_0;
		float L_11 = L_10;
		V_3 = L_11;
		(&V_1)->___x_1 = L_11;
		float L_12 = V_3;
		GameObject_t77 * L_13 = (__this->___r_2);
		NullCheck(L_13);
		Transform_t3 * L_14 = GameObject_get_transform_m416(L_13, /*hidden argument*/NULL);
		Vector3_t4  L_15 = V_1;
		Vector3_t4  L_16 = L_15;
		V_4 = L_16;
		NullCheck(L_14);
		Transform_set_position_m414(L_14, L_16, /*hidden argument*/NULL);
		Vector3_t4  L_17 = V_4;
		return;
	}
}
// System.Void robo2::Update()
extern "C" void robo2_Update_m734 (robo2_t178 * __this, const MethodInfo* method)
{
	{
		return;
	}
}
// System.Void robo2::Main()
extern "C" void robo2_Main_m735 (robo2_t178 * __this, const MethodInfo* method)
{
	{
		return;
	}
}
// System.Void s2::.ctor()
extern "C" void s2__ctor_m736 (s2_t179 * __this, const MethodInfo* method)
{
	{
		MonoBehaviour__ctor_m399(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void s2::Start()
extern "C" void s2_Start_m737 (s2_t179 * __this, const MethodInfo* method)
{
	{
		return;
	}
}
// System.Void s2::Update()
extern "C" void s2_Update_m738 (s2_t179 * __this, const MethodInfo* method)
{
	{
		return;
	}
}
// System.Void s2::OnTriggerEnter2D(UnityEngine.Collider2D)
extern Il2CppCodeGenString* _stringLiteral48;
extern Il2CppCodeGenString* _stringLiteral47;
extern Il2CppCodeGenString* _stringLiteral53;
extern "C" void s2_OnTriggerEnter2D_m739 (s2_t179 * __this, Collider2D_t129 * ___other, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		_stringLiteral48 = il2cpp_codegen_string_literal_from_index(48);
		_stringLiteral47 = il2cpp_codegen_string_literal_from_index(47);
		_stringLiteral53 = il2cpp_codegen_string_literal_from_index(53);
		s_Il2CppMethodIntialized = true;
	}
	float V_0 = 0.0f;
	Vector3_t4  V_1 = {0};
	Vector3_t4  V_2 = {0};
	float V_3 = 0.0f;
	Vector3_t4  V_4 = {0};
	{
		int32_t L_0 = (__this->___i_4);
		if (L_0)
		{
			goto IL_009c;
		}
	}
	{
		GameObject_t77 * L_1 = GameObject_Find_m741(NULL /*static, unused*/, _stringLiteral48, /*hidden argument*/NULL);
		__this->___g_2 = L_1;
		GameObject_t77 * L_2 = GameObject_Find_m741(NULL /*static, unused*/, _stringLiteral47, /*hidden argument*/NULL);
		__this->___r_3 = L_2;
		GameObject_t77 * L_3 = (__this->___r_3);
		Object_DontDestroyOnLoad_m747(NULL /*static, unused*/, L_3, /*hidden argument*/NULL);
		Application_LoadLevel_m444(NULL /*static, unused*/, _stringLiteral53, /*hidden argument*/NULL);
		GameObject_t77 * L_4 = (__this->___r_3);
		NullCheck(L_4);
		Transform_t3 * L_5 = GameObject_get_transform_m416(L_4, /*hidden argument*/NULL);
		NullCheck(L_5);
		Vector3_t4  L_6 = Transform_get_position_m400(L_5, /*hidden argument*/NULL);
		V_2 = L_6;
		float L_7 = ((&V_2)->___x_1);
		float L_8 = ((float)((float)L_7-(float)(((float)((float)((int32_t)30))))));
		V_0 = L_8;
		GameObject_t77 * L_9 = (__this->___r_3);
		NullCheck(L_9);
		Transform_t3 * L_10 = GameObject_get_transform_m416(L_9, /*hidden argument*/NULL);
		NullCheck(L_10);
		Vector3_t4  L_11 = Transform_get_position_m400(L_10, /*hidden argument*/NULL);
		Vector3_t4  L_12 = L_11;
		V_1 = L_12;
		float L_13 = V_0;
		float L_14 = L_13;
		V_3 = L_14;
		(&V_1)->___x_1 = L_14;
		float L_15 = V_3;
		GameObject_t77 * L_16 = (__this->___r_3);
		NullCheck(L_16);
		Transform_t3 * L_17 = GameObject_get_transform_m416(L_16, /*hidden argument*/NULL);
		Vector3_t4  L_18 = V_1;
		Vector3_t4  L_19 = L_18;
		V_4 = L_19;
		NullCheck(L_17);
		Transform_set_position_m414(L_17, L_19, /*hidden argument*/NULL);
		Vector3_t4  L_20 = V_4;
		__this->___i_4 = 1;
	}

IL_009c:
	{
		return;
	}
}
// System.Void s2::Main()
extern "C" void s2_Main_m740 (s2_t179 * __this, const MethodInfo* method)
{
	{
		return;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
