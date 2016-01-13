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

// UnityEngine.SocialPlatforms.Impl.UserProfile
struct UserProfile_t362;
// UnityEngine.SocialPlatforms.Impl.UserProfile[]
struct UserProfileU5BU5D_t202;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UnityEngine_SocialPlatforms_GameCenter_GcUserPro.h"

// UnityEngine.SocialPlatforms.Impl.UserProfile UnityEngine.SocialPlatforms.GameCenter.GcUserProfileData::ToUserProfile()
extern "C" UserProfile_t362 * GcUserProfileData_ToUserProfile_m1824 (GcUserProfileData_t350 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.SocialPlatforms.GameCenter.GcUserProfileData::AddToArray(UnityEngine.SocialPlatforms.Impl.UserProfile[]&,System.Int32)
extern "C" void GcUserProfileData_AddToArray_m1825 (GcUserProfileData_t350 * __this, UserProfileU5BU5D_t202** ___array, int32_t ___number, const MethodInfo* method) IL2CPP_METHOD_ATTR;
