﻿#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.Collections.Specialized.HybridDictionary
struct HybridDictionary_t724;
// System.Net.ICertificatePolicy
struct ICertificatePolicy_t768;
// System.Net.Security.RemoteCertificateValidationCallback
struct RemoteCertificateValidationCallback_t754;

#include "mscorlib_System_Object.h"
#include "System_System_Net_SecurityProtocolType.h"

// System.Net.ServicePointManager
struct  ServicePointManager_t767  : public Object_t
{
};
struct ServicePointManager_t767_StaticFields{
	// System.Collections.Specialized.HybridDictionary System.Net.ServicePointManager::servicePoints
	HybridDictionary_t724 * ___servicePoints_0;
	// System.Net.ICertificatePolicy System.Net.ServicePointManager::policy
	Object_t * ___policy_1;
	// System.Int32 System.Net.ServicePointManager::defaultConnectionLimit
	int32_t ___defaultConnectionLimit_2;
	// System.Int32 System.Net.ServicePointManager::maxServicePointIdleTime
	int32_t ___maxServicePointIdleTime_3;
	// System.Int32 System.Net.ServicePointManager::maxServicePoints
	int32_t ___maxServicePoints_4;
	// System.Boolean System.Net.ServicePointManager::_checkCRL
	bool ____checkCRL_5;
	// System.Net.SecurityProtocolType System.Net.ServicePointManager::_securityProtocol
	int32_t ____securityProtocol_6;
	// System.Boolean System.Net.ServicePointManager::expectContinue
	bool ___expectContinue_7;
	// System.Boolean System.Net.ServicePointManager::useNagle
	bool ___useNagle_8;
	// System.Net.Security.RemoteCertificateValidationCallback System.Net.ServicePointManager::server_cert_cb
	RemoteCertificateValidationCallback_t754 * ___server_cert_cb_9;
};
