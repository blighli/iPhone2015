﻿#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// Mono.Security.Protocol.Tls.Alert
struct Alert_t1014;

#include "mscorlib_System_Exception.h"

// Mono.Security.Protocol.Tls.TlsException
struct  TlsException_t1058  : public Exception_t152
{
	// Mono.Security.Protocol.Tls.Alert Mono.Security.Protocol.Tls.TlsException::alert
	Alert_t1014 * ___alert_11;
};
