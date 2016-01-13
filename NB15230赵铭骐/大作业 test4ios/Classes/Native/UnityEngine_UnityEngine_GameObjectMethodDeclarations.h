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

// UnityEngine.GameObject
struct GameObject_t77;
// System.String
struct String_t;
// UnityEngine.Component
struct Component_t169;
// System.Type
struct Type_t;
// System.Array
struct Array_t;
// System.Object
struct Object_t;
// UnityEngine.Transform
struct Transform_t3;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_IntPtr.h"
#include "UnityEngine_UnityEngine_SendMessageOptions.h"

// System.Void UnityEngine.GameObject::.ctor(System.String)
extern "C" void GameObject__ctor_m654 (GameObject_t77 * __this, String_t* ___name, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Component UnityEngine.GameObject::GetComponent(System.Type)
extern "C" Component_t169 * GameObject_GetComponent_m744 (GameObject_t77 * __this, Type_t * ___type, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.GameObject::GetComponentFastPath(System.Type,System.IntPtr)
extern "C" void GameObject_GetComponentFastPath_m1354 (GameObject_t77 * __this, Type_t * ___type, IntPtr_t ___oneFurtherThanResultValue, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Component UnityEngine.GameObject::GetComponentByName(System.String)
extern "C" Component_t169 * GameObject_GetComponentByName_m1355 (GameObject_t77 * __this, String_t* ___type, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Component UnityEngine.GameObject::GetComponent(System.String)
extern "C" Component_t169 * GameObject_GetComponent_m746 (GameObject_t77 * __this, String_t* ___type, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Component UnityEngine.GameObject::GetComponentInChildren(System.Type)
extern "C" Component_t169 * GameObject_GetComponentInChildren_m1356 (GameObject_t77 * __this, Type_t * ___type, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Component UnityEngine.GameObject::GetComponentInParent(System.Type)
extern "C" Component_t169 * GameObject_GetComponentInParent_m1357 (GameObject_t77 * __this, Type_t * ___type, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Array UnityEngine.GameObject::GetComponentsInternal(System.Type,System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.Object)
extern "C" Array_t * GameObject_GetComponentsInternal_m1358 (GameObject_t77 * __this, Type_t * ___type, bool ___useSearchTypeAsArrayReturnType, bool ___recursive, bool ___includeInactive, bool ___reverse, Object_t * ___resultList, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Transform UnityEngine.GameObject::get_transform()
extern "C" Transform_t3 * GameObject_get_transform_m416 (GameObject_t77 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 UnityEngine.GameObject::get_layer()
extern "C" int32_t GameObject_get_layer_m1359 (GameObject_t77 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.GameObject::set_layer(System.Int32)
extern "C" void GameObject_set_layer_m1360 (GameObject_t77 * __this, int32_t ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.GameObject::SetActive(System.Boolean)
extern "C" void GameObject_SetActive_m592 (GameObject_t77 * __this, bool ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.GameObject::get_activeSelf()
extern "C" bool GameObject_get_activeSelf_m447 (GameObject_t77 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.GameObject::get_activeInHierarchy()
extern "C" bool GameObject_get_activeInHierarchy_m1361 (GameObject_t77 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.String UnityEngine.GameObject::get_tag()
extern "C" String_t* GameObject_get_tag_m1362 (GameObject_t77 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.GameObject UnityEngine.GameObject::FindGameObjectWithTag(System.String)
extern "C" GameObject_t77 * GameObject_FindGameObjectWithTag_m415 (Object_t * __this /* static, unused */, String_t* ___tag, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.GameObject::SendMessage(System.String,System.Object,UnityEngine.SendMessageOptions)
extern "C" void GameObject_SendMessage_m1363 (GameObject_t77 * __this, String_t* ___methodName, Object_t * ___value, int32_t ___options, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.GameObject::BroadcastMessage(System.String,System.Object,UnityEngine.SendMessageOptions)
extern "C" void GameObject_BroadcastMessage_m1364 (GameObject_t77 * __this, String_t* ___methodName, Object_t * ___parameter, int32_t ___options, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.GameObject::BroadcastMessage(System.String)
extern "C" void GameObject_BroadcastMessage_m615 (GameObject_t77 * __this, String_t* ___methodName, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Component UnityEngine.GameObject::Internal_AddComponentWithType(System.Type)
extern "C" Component_t169 * GameObject_Internal_AddComponentWithType_m1365 (GameObject_t77 * __this, Type_t * ___componentType, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Component UnityEngine.GameObject::AddComponent(System.Type)
extern "C" Component_t169 * GameObject_AddComponent_m1366 (GameObject_t77 * __this, Type_t * ___componentType, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.GameObject::Internal_CreateGameObject(UnityEngine.GameObject,System.String)
extern "C" void GameObject_Internal_CreateGameObject_m1367 (Object_t * __this /* static, unused */, GameObject_t77 * ___mono, String_t* ___name, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.GameObject UnityEngine.GameObject::Find(System.String)
extern "C" GameObject_t77 * GameObject_Find_m741 (Object_t * __this /* static, unused */, String_t* ___name, const MethodInfo* method) IL2CPP_METHOD_ATTR;
