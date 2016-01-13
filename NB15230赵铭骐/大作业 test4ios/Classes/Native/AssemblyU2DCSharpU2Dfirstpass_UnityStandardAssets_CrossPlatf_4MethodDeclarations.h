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

// System.String
struct String_t;
// UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager/VirtualAxis
struct VirtualAxis_t51;
// UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager/VirtualButton
struct VirtualButton_t54;

#include "codegen/il2cpp-codegen.h"
#include "AssemblyU2DCSharpU2Dfirstpass_UnityStandardAssets_CrossPlatf_1.h"
#include "UnityEngine_UnityEngine_Vector3.h"

// System.Void UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager::.cctor()
extern "C" void CrossPlatformInputManager__cctor_m156 (Object_t * __this /* static, unused */, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager::SwitchActiveInputMethod(UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager/ActiveInputMethod)
extern "C" void CrossPlatformInputManager_SwitchActiveInputMethod_m157 (Object_t * __this /* static, unused */, int32_t ___activeInputMethod, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager::AxisExists(System.String)
extern "C" bool CrossPlatformInputManager_AxisExists_m158 (Object_t * __this /* static, unused */, String_t* ___name, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager::ButtonExists(System.String)
extern "C" bool CrossPlatformInputManager_ButtonExists_m159 (Object_t * __this /* static, unused */, String_t* ___name, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager::RegisterVirtualAxis(UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager/VirtualAxis)
extern "C" void CrossPlatformInputManager_RegisterVirtualAxis_m160 (Object_t * __this /* static, unused */, VirtualAxis_t51 * ___axis, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager::RegisterVirtualButton(UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager/VirtualButton)
extern "C" void CrossPlatformInputManager_RegisterVirtualButton_m161 (Object_t * __this /* static, unused */, VirtualButton_t54 * ___button, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager::UnRegisterVirtualAxis(System.String)
extern "C" void CrossPlatformInputManager_UnRegisterVirtualAxis_m162 (Object_t * __this /* static, unused */, String_t* ___name, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager::UnRegisterVirtualButton(System.String)
extern "C" void CrossPlatformInputManager_UnRegisterVirtualButton_m163 (Object_t * __this /* static, unused */, String_t* ___name, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager/VirtualAxis UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager::VirtualAxisReference(System.String)
extern "C" VirtualAxis_t51 * CrossPlatformInputManager_VirtualAxisReference_m164 (Object_t * __this /* static, unused */, String_t* ___name, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Single UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager::GetAxis(System.String)
extern "C" float CrossPlatformInputManager_GetAxis_m165 (Object_t * __this /* static, unused */, String_t* ___name, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Single UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager::GetAxisRaw(System.String)
extern "C" float CrossPlatformInputManager_GetAxisRaw_m166 (Object_t * __this /* static, unused */, String_t* ___name, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Single UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager::GetAxis(System.String,System.Boolean)
extern "C" float CrossPlatformInputManager_GetAxis_m167 (Object_t * __this /* static, unused */, String_t* ___name, bool ___raw, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager::GetButton(System.String)
extern "C" bool CrossPlatformInputManager_GetButton_m168 (Object_t * __this /* static, unused */, String_t* ___name, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager::GetButtonDown(System.String)
extern "C" bool CrossPlatformInputManager_GetButtonDown_m169 (Object_t * __this /* static, unused */, String_t* ___name, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager::GetButtonUp(System.String)
extern "C" bool CrossPlatformInputManager_GetButtonUp_m170 (Object_t * __this /* static, unused */, String_t* ___name, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager::SetButtonDown(System.String)
extern "C" void CrossPlatformInputManager_SetButtonDown_m171 (Object_t * __this /* static, unused */, String_t* ___name, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager::SetButtonUp(System.String)
extern "C" void CrossPlatformInputManager_SetButtonUp_m172 (Object_t * __this /* static, unused */, String_t* ___name, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager::SetAxisPositive(System.String)
extern "C" void CrossPlatformInputManager_SetAxisPositive_m173 (Object_t * __this /* static, unused */, String_t* ___name, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager::SetAxisNegative(System.String)
extern "C" void CrossPlatformInputManager_SetAxisNegative_m174 (Object_t * __this /* static, unused */, String_t* ___name, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager::SetAxisZero(System.String)
extern "C" void CrossPlatformInputManager_SetAxisZero_m175 (Object_t * __this /* static, unused */, String_t* ___name, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager::SetAxis(System.String,System.Single)
extern "C" void CrossPlatformInputManager_SetAxis_m176 (Object_t * __this /* static, unused */, String_t* ___name, float ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Vector3 UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager::get_mousePosition()
extern "C" Vector3_t4  CrossPlatformInputManager_get_mousePosition_m177 (Object_t * __this /* static, unused */, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager::SetVirtualMousePositionX(System.Single)
extern "C" void CrossPlatformInputManager_SetVirtualMousePositionX_m178 (Object_t * __this /* static, unused */, float ___f, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager::SetVirtualMousePositionY(System.Single)
extern "C" void CrossPlatformInputManager_SetVirtualMousePositionY_m179 (Object_t * __this /* static, unused */, float ___f, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager::SetVirtualMousePositionZ(System.Single)
extern "C" void CrossPlatformInputManager_SetVirtualMousePositionZ_m180 (Object_t * __this /* static, unused */, float ___f, const MethodInfo* method) IL2CPP_METHOD_ATTR;
