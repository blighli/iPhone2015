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

// System.Runtime.Remoting.Channels.CrossAppDomainChannel
struct CrossAppDomainChannel_t1439;
// System.String
struct String_t;
// System.Object
struct Object_t;
// System.Runtime.Remoting.Messaging.IMessageSink
struct IMessageSink_t1445;

#include "codegen/il2cpp-codegen.h"

// System.Void System.Runtime.Remoting.Channels.CrossAppDomainChannel::.ctor()
extern "C" void CrossAppDomainChannel__ctor_m8676 (CrossAppDomainChannel_t1439 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Remoting.Channels.CrossAppDomainChannel::.cctor()
extern "C" void CrossAppDomainChannel__cctor_m8677 (Object_t * __this /* static, unused */, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Remoting.Channels.CrossAppDomainChannel::RegisterCrossAppDomainChannel()
extern "C" void CrossAppDomainChannel_RegisterCrossAppDomainChannel_m8678 (Object_t * __this /* static, unused */, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.String System.Runtime.Remoting.Channels.CrossAppDomainChannel::get_ChannelName()
extern "C" String_t* CrossAppDomainChannel_get_ChannelName_m8679 (CrossAppDomainChannel_t1439 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 System.Runtime.Remoting.Channels.CrossAppDomainChannel::get_ChannelPriority()
extern "C" int32_t CrossAppDomainChannel_get_ChannelPriority_m8680 (CrossAppDomainChannel_t1439 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Object System.Runtime.Remoting.Channels.CrossAppDomainChannel::get_ChannelData()
extern "C" Object_t * CrossAppDomainChannel_get_ChannelData_m8681 (CrossAppDomainChannel_t1439 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Remoting.Channels.CrossAppDomainChannel::StartListening(System.Object)
extern "C" void CrossAppDomainChannel_StartListening_m8682 (CrossAppDomainChannel_t1439 * __this, Object_t * ___data, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Runtime.Remoting.Messaging.IMessageSink System.Runtime.Remoting.Channels.CrossAppDomainChannel::CreateMessageSink(System.String,System.Object,System.String&)
extern "C" Object_t * CrossAppDomainChannel_CreateMessageSink_m8683 (CrossAppDomainChannel_t1439 * __this, String_t* ___url, Object_t * ___data, String_t** ___uri, const MethodInfo* method) IL2CPP_METHOD_ATTR;
