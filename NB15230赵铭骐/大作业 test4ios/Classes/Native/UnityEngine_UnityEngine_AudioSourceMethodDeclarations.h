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

// UnityEngine.AudioSource
struct AudioSource_t37;
// UnityEngine.AudioClip
struct AudioClip_t35;

#include "codegen/il2cpp-codegen.h"

// UnityEngine.AudioClip UnityEngine.AudioSource::get_clip()
extern "C" AudioClip_t35 * AudioSource_get_clip_m528 (AudioSource_t37 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.AudioSource::set_clip(UnityEngine.AudioClip)
extern "C" void AudioSource_set_clip_m514 (AudioSource_t37 * __this, AudioClip_t35 * ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.AudioSource::Play(System.UInt64)
extern "C" void AudioSource_Play_m1519 (AudioSource_t37 * __this, uint64_t ___delay, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.AudioSource::Play()
extern "C" void AudioSource_Play_m515 (AudioSource_t37 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.AudioSource::PlayOneShot(UnityEngine.AudioClip,System.Single)
extern "C" void AudioSource_PlayOneShot_m1520 (AudioSource_t37 * __this, AudioClip_t35 * ___clip, float ___volumeScale, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.AudioSource::PlayOneShot(UnityEngine.AudioClip)
extern "C" void AudioSource_PlayOneShot_m529 (AudioSource_t37 * __this, AudioClip_t35 * ___clip, const MethodInfo* method) IL2CPP_METHOD_ATTR;
