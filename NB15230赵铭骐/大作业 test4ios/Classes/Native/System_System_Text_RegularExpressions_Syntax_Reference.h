﻿#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.Text.RegularExpressions.Syntax.CapturingGroup
struct CapturingGroup_t869;

#include "System_System_Text_RegularExpressions_Syntax_Expression.h"

// System.Text.RegularExpressions.Syntax.Reference
struct  Reference_t879  : public Expression_t865
{
	// System.Text.RegularExpressions.Syntax.CapturingGroup System.Text.RegularExpressions.Syntax.Reference::group
	CapturingGroup_t869 * ___group_0;
	// System.Boolean System.Text.RegularExpressions.Syntax.Reference::ignore
	bool ___ignore_1;
};
