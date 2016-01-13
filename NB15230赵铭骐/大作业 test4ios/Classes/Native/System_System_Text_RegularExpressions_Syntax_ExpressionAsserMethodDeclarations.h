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

// System.Text.RegularExpressions.Syntax.ExpressionAssertion
struct ExpressionAssertion_t875;
// System.Text.RegularExpressions.Syntax.Expression
struct Expression_t865;
// System.Text.RegularExpressions.ICompiler
struct ICompiler_t911;

#include "codegen/il2cpp-codegen.h"

// System.Void System.Text.RegularExpressions.Syntax.ExpressionAssertion::.ctor()
extern "C" void ExpressionAssertion__ctor_m4468 (ExpressionAssertion_t875 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Text.RegularExpressions.Syntax.ExpressionAssertion::set_Reverse(System.Boolean)
extern "C" void ExpressionAssertion_set_Reverse_m4469 (ExpressionAssertion_t875 * __this, bool ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Text.RegularExpressions.Syntax.ExpressionAssertion::set_Negate(System.Boolean)
extern "C" void ExpressionAssertion_set_Negate_m4470 (ExpressionAssertion_t875 * __this, bool ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Text.RegularExpressions.Syntax.Expression System.Text.RegularExpressions.Syntax.ExpressionAssertion::get_TestExpression()
extern "C" Expression_t865 * ExpressionAssertion_get_TestExpression_m4471 (ExpressionAssertion_t875 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Text.RegularExpressions.Syntax.ExpressionAssertion::set_TestExpression(System.Text.RegularExpressions.Syntax.Expression)
extern "C" void ExpressionAssertion_set_TestExpression_m4472 (ExpressionAssertion_t875 * __this, Expression_t865 * ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Text.RegularExpressions.Syntax.ExpressionAssertion::Compile(System.Text.RegularExpressions.ICompiler,System.Boolean)
extern "C" void ExpressionAssertion_Compile_m4473 (ExpressionAssertion_t875 * __this, Object_t * ___cmp, bool ___reverse, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.Text.RegularExpressions.Syntax.ExpressionAssertion::IsComplex()
extern "C" bool ExpressionAssertion_IsComplex_m4474 (ExpressionAssertion_t875 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
