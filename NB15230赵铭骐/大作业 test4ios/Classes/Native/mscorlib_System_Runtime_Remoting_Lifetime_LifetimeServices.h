#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.Runtime.Remoting.Lifetime.LeaseManager
struct LeaseManager_t1455;

#include "mscorlib_System_Object.h"
#include "mscorlib_System_TimeSpan.h"

// System.Runtime.Remoting.Lifetime.LifetimeServices
struct  LifetimeServices_t1458  : public Object_t
{
};
struct LifetimeServices_t1458_StaticFields{
	// System.TimeSpan System.Runtime.Remoting.Lifetime.LifetimeServices::_leaseManagerPollTime
	TimeSpan_t803  ____leaseManagerPollTime_0;
	// System.TimeSpan System.Runtime.Remoting.Lifetime.LifetimeServices::_leaseTime
	TimeSpan_t803  ____leaseTime_1;
	// System.TimeSpan System.Runtime.Remoting.Lifetime.LifetimeServices::_renewOnCallTime
	TimeSpan_t803  ____renewOnCallTime_2;
	// System.TimeSpan System.Runtime.Remoting.Lifetime.LifetimeServices::_sponsorshipTimeout
	TimeSpan_t803  ____sponsorshipTimeout_3;
	// System.Runtime.Remoting.Lifetime.LeaseManager System.Runtime.Remoting.Lifetime.LifetimeServices::_leaseManager
	LeaseManager_t1455 * ____leaseManager_4;
};
