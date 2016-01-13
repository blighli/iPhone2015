#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <cstring>
#include <string.h>
#include <stdio.h>
#include <cmath>
#include <limits>
#include <assert.h>

// UnityEngine.UI.ClipperRegistry
struct ClipperRegistry_t625;
// UnityEngine.UI.IClipper
struct IClipper_t683;
// System.Collections.Generic.List`1<UnityEngine.UI.RectMask2D>
struct List_1_t595;
// UnityEngine.UI.RectangularVertexClipper
struct RectangularVertexClipper_t593;
// UnityEngine.RectTransform
struct RectTransform_t242;
// UnityEngine.Canvas
struct Canvas_t321;
// UnityEngine.Transform
struct Transform_t3;
// System.Object
struct Object_t;
// UnityEngine.UI.AspectRatioFitter
struct AspectRatioFitter_t629;
// UnityEngine.UI.CanvasScaler
struct CanvasScaler_t633;
// UnityEngine.UI.ContentSizeFitter
struct ContentSizeFitter_t635;
// UnityEngine.UI.GridLayoutGroup
struct GridLayoutGroup_t639;
// UnityEngine.UI.HorizontalLayoutGroup
struct HorizontalLayoutGroup_t641;
// UnityEngine.UI.HorizontalOrVerticalLayoutGroup
struct HorizontalOrVerticalLayoutGroup_t642;
// UnityEngine.UI.LayoutElement
struct LayoutElement_t643;
// UnityEngine.UI.LayoutGroup
struct LayoutGroup_t640;
// UnityEngine.RectOffset
struct RectOffset_t333;
// System.Collections.Generic.List`1<UnityEngine.RectTransform>
struct List_1_t644;
// UnityEngine.UI.LayoutRebuilder
struct LayoutRebuilder_t645;
// System.Collections.Generic.List`1<UnityEngine.Component>
struct List_1_t422;
// UnityEngine.Events.UnityAction`1<UnityEngine.Component>
struct UnityAction_1_t649;
// System.String
struct String_t;
// UnityEngine.Component
struct Component_t169;
// System.Func`2<UnityEngine.UI.ILayoutElement,System.Single>
struct Func_2_t651;
// UnityEngine.UI.ILayoutElement
struct ILayoutElement_t684;
// UnityEngine.UI.VerticalLayoutGroup
struct VerticalLayoutGroup_t652;
// UnityEngine.UI.VertexHelper
struct VertexHelper_t562;
// UnityEngine.Mesh
struct Mesh_t208;
// UnityEngine.UIVertex[]
struct UIVertexU5BU5D_t425;
// System.Collections.Generic.List`1<UnityEngine.UIVertex>
struct List_1_t316;
// UnityEngine.UI.BaseMeshEffect
struct BaseMeshEffect_t653;
// UnityEngine.UI.Graphic
struct Graphic_t560;
// UnityEngine.UI.Outline
struct Outline_t654;
// UnityEngine.UI.PositionAsUV1
struct PositionAsUV1_t656;
// UnityEngine.UI.Shadow
struct Shadow_t655;

#include "class-internals.h"
#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_Array.h"
#include "UnityEngine_UI_UnityEngine_UI_ClipperRegistry.h"
#include "UnityEngine_UI_UnityEngine_UI_ClipperRegistryMethodDeclarations.h"
#include "mscorlib_System_Void.h"
#include "UnityEngine_UI_UnityEngine_UI_Collections_IndexedSet_1_gen_1MethodDeclarations.h"
#include "mscorlib_System_ObjectMethodDeclarations.h"
#include "mscorlib_System_Collections_Generic_Dictionary_2_gen_7.h"
#include "UnityEngine_UI_UnityEngine_UI_Collections_IndexedSet_1_gen_1.h"
#include "mscorlib_System_Object.h"
#include "mscorlib_System_Int32.h"
#include "mscorlib_System_Boolean.h"
#include "UnityEngine_UI_UnityEngine_UI_Clipping.h"
#include "UnityEngine_UI_UnityEngine_UI_ClippingMethodDeclarations.h"
#include "UnityEngine_UnityEngine_Rect.h"
#include "mscorlib_System_Collections_Generic_List_1_gen_28.h"
#include "UnityEngine_UI_UnityEngine_UI_RectMask2DMethodDeclarations.h"
#include "UnityEngine_UnityEngine_RectMethodDeclarations.h"
#include "UnityEngine_UnityEngine_Vector3MethodDeclarations.h"
#include "UnityEngine_UnityEngine_Vector3.h"
#include "mscorlib_System_Collections_Generic_List_1_gen_28MethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_RectMask2D.h"
#include "mscorlib_System_Single.h"
#include "UnityEngine_UnityEngine_MathfMethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_RectangularVertexClipper.h"
#include "UnityEngine_UI_UnityEngine_UI_RectangularVertexClipperMethodDeclarations.h"
#include "UnityEngine_ArrayTypes.h"
#include "UnityEngine_UnityEngine_RectTransform.h"
#include "UnityEngine_UnityEngine_Canvas.h"
#include "UnityEngine_UnityEngine_RectTransformMethodDeclarations.h"
#include "UnityEngine_UnityEngine_ComponentMethodDeclarations.h"
#include "UnityEngine_UnityEngine_TransformMethodDeclarations.h"
#include "UnityEngine_UnityEngine_Transform.h"
#include "UnityEngine_UnityEngine_Component.h"
#include "UnityEngine_UI_UnityEngine_UI_AspectRatioFitter_AspectMode.h"
#include "UnityEngine_UI_UnityEngine_UI_AspectRatioFitter_AspectModeMethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_AspectRatioFitter.h"
#include "UnityEngine_UI_UnityEngine_UI_AspectRatioFitterMethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_EventSystems_UIBehaviourMethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_EventSystems_UIBehaviour.h"
#include "UnityEngine_UI_UnityEngine_UI_SetPropertyUtilityMethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_SetPropertyUtility.h"
#include "UnityEngine_UnityEngine_ObjectMethodDeclarations.h"
#include "UnityEngine_UnityEngine_Object.h"
#include "UnityEngine_UnityEngine_DrivenRectTransformTrackerMethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_LayoutRebuilderMethodDeclarations.h"
#include "UnityEngine_UnityEngine_DrivenRectTransformTracker.h"
#include "UnityEngine_UnityEngine_Vector2MethodDeclarations.h"
#include "UnityEngine_UnityEngine_Vector2.h"
#include "UnityEngine_UnityEngine_DrivenTransformProperties.h"
#include "UnityEngine_UnityEngine_RectTransform_Axis.h"
#include "UnityEngine_UI_UnityEngine_UI_CanvasScaler_ScaleMode.h"
#include "UnityEngine_UI_UnityEngine_UI_CanvasScaler_ScaleModeMethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_CanvasScaler_ScreenMatchMode.h"
#include "UnityEngine_UI_UnityEngine_UI_CanvasScaler_ScreenMatchModeMethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_CanvasScaler_Unit.h"
#include "UnityEngine_UI_UnityEngine_UI_CanvasScaler_UnitMethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_CanvasScaler.h"
#include "UnityEngine_UI_UnityEngine_UI_CanvasScalerMethodDeclarations.h"
#include "UnityEngine_UnityEngine_CanvasMethodDeclarations.h"
#include "UnityEngine_UnityEngine_RenderMode.h"
#include "UnityEngine_UnityEngine_ScreenMethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_ContentSizeFitter_FitMode.h"
#include "UnityEngine_UI_UnityEngine_UI_ContentSizeFitter_FitModeMethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_ContentSizeFitter.h"
#include "UnityEngine_UI_UnityEngine_UI_ContentSizeFitterMethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_LayoutUtilityMethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_GridLayoutGroup_Corner.h"
#include "UnityEngine_UI_UnityEngine_UI_GridLayoutGroup_CornerMethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_GridLayoutGroup_Axis.h"
#include "UnityEngine_UI_UnityEngine_UI_GridLayoutGroup_AxisMethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_GridLayoutGroup_Constraint.h"
#include "UnityEngine_UI_UnityEngine_UI_GridLayoutGroup_ConstraintMethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_GridLayoutGroup.h"
#include "UnityEngine_UI_UnityEngine_UI_GridLayoutGroupMethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_LayoutGroupMethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_LayoutGroup.h"
#include "UnityEngine_UnityEngine_RectOffsetMethodDeclarations.h"
#include "mscorlib_System_Collections_Generic_List_1_gen_34.h"
#include "mscorlib_System_Collections_Generic_List_1_gen_34MethodDeclarations.h"
#include "UnityEngine_UnityEngine_RectOffset.h"
#include "UnityEngine_UI_UnityEngine_UI_HorizontalLayoutGroup.h"
#include "UnityEngine_UI_UnityEngine_UI_HorizontalLayoutGroupMethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_HorizontalOrVerticalLayoutGrouMethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_HorizontalOrVerticalLayoutGrou.h"
#include "UnityEngine_UI_UnityEngine_UI_LayoutElement.h"
#include "UnityEngine_UI_UnityEngine_UI_LayoutElementMethodDeclarations.h"
#include "UnityEngine_UnityEngine_TextAnchor.h"
#include "UnityEngine_UI_UnityEngine_UI_ListPool_1_gen_0MethodDeclarations.h"
#include "UnityEngine_UnityEngine_GameObjectMethodDeclarations.h"
#include "mscorlib_System_TypeMethodDeclarations.h"
#include "mscorlib_System_Collections_Generic_List_1_gen_8.h"
#include "UnityEngine_UnityEngine_GameObject.h"
#include "mscorlib_System_Type.h"
#include "mscorlib_System_RuntimeTypeHandle.h"
#include "mscorlib_System_Collections_Generic_List_1_gen_8MethodDeclarations.h"
#include "UnityEngine_UnityEngine_RectTransform_Edge.h"
#include "UnityEngine_UI_UnityEngine_UI_LayoutRebuilder.h"
#include "UnityEngine_UnityEngine_Events_UnityAction_1_gen_3MethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_ObjectPool_1_gen_0MethodDeclarations.h"
#include "UnityEngine_UnityEngine_RectTransform_ReapplyDrivenPropertieMethodDeclarations.h"
#include "UnityEngine_UnityEngine_Events_UnityAction_1_gen_3.h"
#include "mscorlib_System_IntPtr.h"
#include "UnityEngine_UI_UnityEngine_UI_ObjectPool_1_gen_0.h"
#include "UnityEngine_UnityEngine_RectTransform_ReapplyDrivenPropertie.h"
#include "mscorlib_System_Predicate_1_gen_1MethodDeclarations.h"
#include "mscorlib_System_Predicate_1_gen_1.h"
#include "UnityEngine_UI_UnityEngine_UI_CanvasUpdate.h"
#include "UnityEngine_UnityEngine_Events_UnityAction_1_gen_4MethodDeclarations.h"
#include "UnityEngine_UnityEngine_Events_UnityAction_1_gen_4.h"
#include "UnityEngine_UI_UnityEngine_UI_CanvasUpdateRegistryMethodDeclarations.h"
#include "mscorlib_System_String.h"
#include "mscorlib_System_StringMethodDeclarations.h"
#include "UnityEngine_UnityEngine_BehaviourMethodDeclarations.h"
#include "UnityEngine_UnityEngine_Behaviour.h"
#include "UnityEngine_UI_UnityEngine_UI_LayoutUtility.h"
#include "System_Core_System_Func_2_gen_0MethodDeclarations.h"
#include "System_Core_System_Func_2_gen_0.h"
#include "UnityEngine_UI_UnityEngine_UI_VerticalLayoutGroup.h"
#include "UnityEngine_UI_UnityEngine_UI_VerticalLayoutGroupMethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_VertexHelper.h"
#include "UnityEngine_UI_UnityEngine_UI_VertexHelperMethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_ListPool_1_gen_1MethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_ListPool_1_gen_2MethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_ListPool_1_gen_3MethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_ListPool_1_gen_4MethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_ListPool_1_gen_5MethodDeclarations.h"
#include "mscorlib_System_Collections_Generic_List_1_gen_3.h"
#include "mscorlib_System_Collections_Generic_List_1_gen_6.h"
#include "mscorlib_System_Collections_Generic_List_1_gen_5.h"
#include "mscorlib_System_Collections_Generic_List_1_gen_4.h"
#include "mscorlib_System_Collections_Generic_List_1_gen_7.h"
#include "UnityEngine_UnityEngine_Mesh.h"
#include "UnityEngine_UnityEngine_MeshMethodDeclarations.h"
#include "mscorlib_System_Collections_Generic_List_1_gen_3MethodDeclarations.h"
#include "mscorlib_System_Collections_Generic_List_1_gen_6MethodDeclarations.h"
#include "mscorlib_System_Collections_Generic_List_1_gen_5MethodDeclarations.h"
#include "mscorlib_System_Collections_Generic_List_1_gen_4MethodDeclarations.h"
#include "mscorlib_System_Collections_Generic_List_1_gen_7MethodDeclarations.h"
#include "UnityEngine_UnityEngine_Color32.h"
#include "UnityEngine_UnityEngine_Vector4.h"
#include "mscorlib_ArrayTypes.h"
#include "UnityEngine_UnityEngine_Vector4MethodDeclarations.h"
#include "UnityEngine_UnityEngine_UIVertex.h"
#include "mscorlib_System_ArgumentExceptionMethodDeclarations.h"
#include "mscorlib_System_ArgumentException.h"
#include "mscorlib_System_Collections_Generic_List_1_gen_10.h"
#include "UnityEngine_UnityEngine_CanvasRendererMethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_BaseMeshEffect.h"
#include "UnityEngine_UI_UnityEngine_UI_BaseMeshEffectMethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_Graphic.h"
#include "UnityEngine_UI_UnityEngine_UI_GraphicMethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_Outline.h"
#include "UnityEngine_UI_UnityEngine_UI_OutlineMethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_ShadowMethodDeclarations.h"
#include "UnityEngine_UI_UnityEngine_UI_Shadow.h"
#include "UnityEngine_UI_UnityEngine_UI_ListPool_1_gen_6MethodDeclarations.h"
#include "mscorlib_System_Collections_Generic_List_1_gen_10MethodDeclarations.h"
#include "UnityEngine_UnityEngine_Color32MethodDeclarations.h"
#include "UnityEngine_UnityEngine_Color.h"
#include "UnityEngine_UI_UnityEngine_UI_PositionAsUV1.h"
#include "UnityEngine_UI_UnityEngine_UI_PositionAsUV1MethodDeclarations.h"
#include "UnityEngine_UnityEngine_ColorMethodDeclarations.h"
#include "mscorlib_System_Byte.h"

// !!0 UnityEngine.Component::GetComponent<System.Object>()
extern "C" Object_t * Component_GetComponent_TisObject_t_m704_gshared (Component_t169 * __this, const MethodInfo* method);
#define Component_GetComponent_TisObject_t_m704(__this, method) (( Object_t * (*) (Component_t169 *, const MethodInfo*))Component_GetComponent_TisObject_t_m704_gshared)(__this, method)
// !!0 UnityEngine.Component::GetComponent<UnityEngine.Transform>()
#define Component_GetComponent_TisTransform_t3_m3650(__this, method) (( Transform_t3 * (*) (Component_t169 *, const MethodInfo*))Component_GetComponent_TisObject_t_m704_gshared)(__this, method)
// System.Boolean UnityEngine.UI.SetPropertyUtility::SetStruct<UnityEngine.UI.AspectRatioFitter/AspectMode>(!!0&,!!0)
extern "C" bool SetPropertyUtility_SetStruct_TisAspectMode_t628_m3651_gshared (Object_t * __this /* static, unused */, int32_t* p0, int32_t p1, const MethodInfo* method);
#define SetPropertyUtility_SetStruct_TisAspectMode_t628_m3651(__this /* static, unused */, p0, p1, method) (( bool (*) (Object_t * /* static, unused */, int32_t*, int32_t, const MethodInfo*))SetPropertyUtility_SetStruct_TisAspectMode_t628_m3651_gshared)(__this /* static, unused */, p0, p1, method)
// System.Boolean UnityEngine.UI.SetPropertyUtility::SetStruct<System.Single>(!!0&,!!0)
extern "C" bool SetPropertyUtility_SetStruct_TisSingle_t165_m3579_gshared (Object_t * __this /* static, unused */, float* p0, float p1, const MethodInfo* method);
#define SetPropertyUtility_SetStruct_TisSingle_t165_m3579(__this /* static, unused */, p0, p1, method) (( bool (*) (Object_t * /* static, unused */, float*, float, const MethodInfo*))SetPropertyUtility_SetStruct_TisSingle_t165_m3579_gshared)(__this /* static, unused */, p0, p1, method)
// !!0 UnityEngine.Component::GetComponent<UnityEngine.RectTransform>()
#define Component_GetComponent_TisRectTransform_t242_m3562(__this, method) (( RectTransform_t242 * (*) (Component_t169 *, const MethodInfo*))Component_GetComponent_TisObject_t_m704_gshared)(__this, method)
// !!0 UnityEngine.Component::GetComponent<UnityEngine.Canvas>()
#define Component_GetComponent_TisCanvas_t321_m3570(__this, method) (( Canvas_t321 * (*) (Component_t169 *, const MethodInfo*))Component_GetComponent_TisObject_t_m704_gshared)(__this, method)
// System.Boolean UnityEngine.UI.SetPropertyUtility::SetStruct<UnityEngine.UI.ContentSizeFitter/FitMode>(!!0&,!!0)
extern "C" bool SetPropertyUtility_SetStruct_TisFitMode_t634_m3652_gshared (Object_t * __this /* static, unused */, int32_t* p0, int32_t p1, const MethodInfo* method);
#define SetPropertyUtility_SetStruct_TisFitMode_t634_m3652(__this /* static, unused */, p0, p1, method) (( bool (*) (Object_t * /* static, unused */, int32_t*, int32_t, const MethodInfo*))SetPropertyUtility_SetStruct_TisFitMode_t634_m3652_gshared)(__this /* static, unused */, p0, p1, method)
// System.Void UnityEngine.UI.LayoutGroup::SetProperty<UnityEngine.UI.GridLayoutGroup/Corner>(!!0&,!!0)
extern "C" void LayoutGroup_SetProperty_TisCorner_t636_m3653_gshared (LayoutGroup_t640 * __this, int32_t* p0, int32_t p1, const MethodInfo* method);
#define LayoutGroup_SetProperty_TisCorner_t636_m3653(__this, p0, p1, method) (( void (*) (LayoutGroup_t640 *, int32_t*, int32_t, const MethodInfo*))LayoutGroup_SetProperty_TisCorner_t636_m3653_gshared)(__this, p0, p1, method)
// System.Void UnityEngine.UI.LayoutGroup::SetProperty<UnityEngine.UI.GridLayoutGroup/Axis>(!!0&,!!0)
extern "C" void LayoutGroup_SetProperty_TisAxis_t637_m3654_gshared (LayoutGroup_t640 * __this, int32_t* p0, int32_t p1, const MethodInfo* method);
#define LayoutGroup_SetProperty_TisAxis_t637_m3654(__this, p0, p1, method) (( void (*) (LayoutGroup_t640 *, int32_t*, int32_t, const MethodInfo*))LayoutGroup_SetProperty_TisAxis_t637_m3654_gshared)(__this, p0, p1, method)
// System.Void UnityEngine.UI.LayoutGroup::SetProperty<UnityEngine.Vector2>(!!0&,!!0)
extern "C" void LayoutGroup_SetProperty_TisVector2_t6_m3655_gshared (LayoutGroup_t640 * __this, Vector2_t6 * p0, Vector2_t6  p1, const MethodInfo* method);
#define LayoutGroup_SetProperty_TisVector2_t6_m3655(__this, p0, p1, method) (( void (*) (LayoutGroup_t640 *, Vector2_t6 *, Vector2_t6 , const MethodInfo*))LayoutGroup_SetProperty_TisVector2_t6_m3655_gshared)(__this, p0, p1, method)
// System.Void UnityEngine.UI.LayoutGroup::SetProperty<UnityEngine.UI.GridLayoutGroup/Constraint>(!!0&,!!0)
extern "C" void LayoutGroup_SetProperty_TisConstraint_t638_m3656_gshared (LayoutGroup_t640 * __this, int32_t* p0, int32_t p1, const MethodInfo* method);
#define LayoutGroup_SetProperty_TisConstraint_t638_m3656(__this, p0, p1, method) (( void (*) (LayoutGroup_t640 *, int32_t*, int32_t, const MethodInfo*))LayoutGroup_SetProperty_TisConstraint_t638_m3656_gshared)(__this, p0, p1, method)
// System.Void UnityEngine.UI.LayoutGroup::SetProperty<System.Int32>(!!0&,!!0)
extern "C" void LayoutGroup_SetProperty_TisInt32_t161_m3657_gshared (LayoutGroup_t640 * __this, int32_t* p0, int32_t p1, const MethodInfo* method);
#define LayoutGroup_SetProperty_TisInt32_t161_m3657(__this, p0, p1, method) (( void (*) (LayoutGroup_t640 *, int32_t*, int32_t, const MethodInfo*))LayoutGroup_SetProperty_TisInt32_t161_m3657_gshared)(__this, p0, p1, method)
// System.Void UnityEngine.UI.LayoutGroup::SetProperty<System.Single>(!!0&,!!0)
extern "C" void LayoutGroup_SetProperty_TisSingle_t165_m3658_gshared (LayoutGroup_t640 * __this, float* p0, float p1, const MethodInfo* method);
#define LayoutGroup_SetProperty_TisSingle_t165_m3658(__this, p0, p1, method) (( void (*) (LayoutGroup_t640 *, float*, float, const MethodInfo*))LayoutGroup_SetProperty_TisSingle_t165_m3658_gshared)(__this, p0, p1, method)
// System.Void UnityEngine.UI.LayoutGroup::SetProperty<System.Boolean>(!!0&,!!0)
extern "C" void LayoutGroup_SetProperty_TisBoolean_t448_m3659_gshared (LayoutGroup_t640 * __this, bool* p0, bool p1, const MethodInfo* method);
#define LayoutGroup_SetProperty_TisBoolean_t448_m3659(__this, p0, p1, method) (( void (*) (LayoutGroup_t640 *, bool*, bool, const MethodInfo*))LayoutGroup_SetProperty_TisBoolean_t448_m3659_gshared)(__this, p0, p1, method)
// System.Boolean UnityEngine.UI.SetPropertyUtility::SetStruct<System.Boolean>(!!0&,!!0)
extern "C" bool SetPropertyUtility_SetStruct_TisBoolean_t448_m3577_gshared (Object_t * __this /* static, unused */, bool* p0, bool p1, const MethodInfo* method);
#define SetPropertyUtility_SetStruct_TisBoolean_t448_m3577(__this /* static, unused */, p0, p1, method) (( bool (*) (Object_t * /* static, unused */, bool*, bool, const MethodInfo*))SetPropertyUtility_SetStruct_TisBoolean_t448_m3577_gshared)(__this /* static, unused */, p0, p1, method)
// System.Void UnityEngine.UI.LayoutGroup::SetProperty<System.Object>(!!0&,!!0)
extern "C" void LayoutGroup_SetProperty_TisObject_t_m3692_gshared (LayoutGroup_t640 * __this, Object_t ** p0, Object_t * p1, const MethodInfo* method);
#define LayoutGroup_SetProperty_TisObject_t_m3692(__this, p0, p1, method) (( void (*) (LayoutGroup_t640 *, Object_t **, Object_t *, const MethodInfo*))LayoutGroup_SetProperty_TisObject_t_m3692_gshared)(__this, p0, p1, method)
// System.Void UnityEngine.UI.LayoutGroup::SetProperty<UnityEngine.RectOffset>(!!0&,!!0)
#define LayoutGroup_SetProperty_TisRectOffset_t333_m3661(__this, p0, p1, method) (( void (*) (LayoutGroup_t640 *, RectOffset_t333 **, RectOffset_t333 *, const MethodInfo*))LayoutGroup_SetProperty_TisObject_t_m3692_gshared)(__this, p0, p1, method)
// System.Void UnityEngine.UI.LayoutGroup::SetProperty<UnityEngine.TextAnchor>(!!0&,!!0)
extern "C" void LayoutGroup_SetProperty_TisTextAnchor_t305_m3662_gshared (LayoutGroup_t640 * __this, int32_t* p0, int32_t p1, const MethodInfo* method);
#define LayoutGroup_SetProperty_TisTextAnchor_t305_m3662(__this, p0, p1, method) (( void (*) (LayoutGroup_t640 *, int32_t*, int32_t, const MethodInfo*))LayoutGroup_SetProperty_TisTextAnchor_t305_m3662_gshared)(__this, p0, p1, method)
// !!0 UnityEngine.Component::GetComponent<UnityEngine.UI.Graphic>()
#define Component_GetComponent_TisGraphic_t560_m3610(__this, method) (( Graphic_t560 * (*) (Component_t169 *, const MethodInfo*))Component_GetComponent_TisObject_t_m704_gshared)(__this, method)
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// System.Void UnityEngine.UI.ClipperRegistry::.ctor()
extern TypeInfo* IndexedSet_1_t626_il2cpp_TypeInfo_var;
extern const MethodInfo* IndexedSet_1__ctor_m3649_MethodInfo_var;
extern "C" void ClipperRegistry__ctor_m3204 (ClipperRegistry_t625 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		IndexedSet_1_t626_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(393);
		IndexedSet_1__ctor_m3649_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483919);
		s_Il2CppMethodIntialized = true;
	}
	Dictionary_2_t710 * V_0 = {0};
	{
		IndexedSet_1_t626 * L_0 = (IndexedSet_1_t626 *)il2cpp_codegen_object_new (IndexedSet_1_t626_il2cpp_TypeInfo_var);
		IndexedSet_1__ctor_m3649(L_0, /*hidden argument*/IndexedSet_1__ctor_m3649_MethodInfo_var);
		__this->___m_Clippers_1 = L_0;
		Object__ctor_m482(__this, /*hidden argument*/NULL);
		return;
	}
}
// UnityEngine.UI.ClipperRegistry UnityEngine.UI.ClipperRegistry::get_instance()
extern TypeInfo* ClipperRegistry_t625_il2cpp_TypeInfo_var;
extern "C" ClipperRegistry_t625 * ClipperRegistry_get_instance_m3205 (Object_t * __this /* static, unused */, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		ClipperRegistry_t625_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(394);
		s_Il2CppMethodIntialized = true;
	}
	{
		ClipperRegistry_t625 * L_0 = ((ClipperRegistry_t625_StaticFields*)ClipperRegistry_t625_il2cpp_TypeInfo_var->static_fields)->___s_Instance_0;
		if (L_0)
		{
			goto IL_0014;
		}
	}
	{
		ClipperRegistry_t625 * L_1 = (ClipperRegistry_t625 *)il2cpp_codegen_object_new (ClipperRegistry_t625_il2cpp_TypeInfo_var);
		ClipperRegistry__ctor_m3204(L_1, /*hidden argument*/NULL);
		((ClipperRegistry_t625_StaticFields*)ClipperRegistry_t625_il2cpp_TypeInfo_var->static_fields)->___s_Instance_0 = L_1;
	}

IL_0014:
	{
		ClipperRegistry_t625 * L_2 = ((ClipperRegistry_t625_StaticFields*)ClipperRegistry_t625_il2cpp_TypeInfo_var->static_fields)->___s_Instance_0;
		return L_2;
	}
}
// System.Void UnityEngine.UI.ClipperRegistry::Cull()
extern TypeInfo* IClipper_t683_il2cpp_TypeInfo_var;
extern "C" void ClipperRegistry_Cull_m3206 (ClipperRegistry_t625 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		IClipper_t683_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(392);
		s_Il2CppMethodIntialized = true;
	}
	int32_t V_0 = 0;
	{
		V_0 = 0;
		goto IL_001c;
	}

IL_0007:
	{
		IndexedSet_1_t626 * L_0 = (__this->___m_Clippers_1);
		int32_t L_1 = V_0;
		NullCheck(L_0);
		Object_t * L_2 = (Object_t *)VirtFuncInvoker1< Object_t *, int32_t >::Invoke(7 /* T UnityEngine.UI.Collections.IndexedSet`1<UnityEngine.UI.IClipper>::get_Item(System.Int32) */, L_0, L_1);
		NullCheck(L_2);
		InterfaceActionInvoker0::Invoke(0 /* System.Void UnityEngine.UI.IClipper::PerformClipping() */, IClipper_t683_il2cpp_TypeInfo_var, L_2);
		int32_t L_3 = V_0;
		V_0 = ((int32_t)((int32_t)L_3+(int32_t)1));
	}

IL_001c:
	{
		int32_t L_4 = V_0;
		IndexedSet_1_t626 * L_5 = (__this->___m_Clippers_1);
		NullCheck(L_5);
		int32_t L_6 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(10 /* System.Int32 UnityEngine.UI.Collections.IndexedSet`1<UnityEngine.UI.IClipper>::get_Count() */, L_5);
		if ((((int32_t)L_4) < ((int32_t)L_6)))
		{
			goto IL_0007;
		}
	}
	{
		return;
	}
}
// System.Void UnityEngine.UI.ClipperRegistry::Register(UnityEngine.UI.IClipper)
extern "C" void ClipperRegistry_Register_m3207 (Object_t * __this /* static, unused */, Object_t * ___c, const MethodInfo* method)
{
	{
		Object_t * L_0 = ___c;
		if (L_0)
		{
			goto IL_0007;
		}
	}
	{
		return;
	}

IL_0007:
	{
		ClipperRegistry_t625 * L_1 = ClipperRegistry_get_instance_m3205(NULL /*static, unused*/, /*hidden argument*/NULL);
		NullCheck(L_1);
		IndexedSet_1_t626 * L_2 = (L_1->___m_Clippers_1);
		Object_t * L_3 = ___c;
		NullCheck(L_2);
		VirtActionInvoker1< Object_t * >::Invoke(12 /* System.Void UnityEngine.UI.Collections.IndexedSet`1<UnityEngine.UI.IClipper>::Add(T) */, L_2, L_3);
		return;
	}
}
// System.Void UnityEngine.UI.ClipperRegistry::Unregister(UnityEngine.UI.IClipper)
extern "C" void ClipperRegistry_Unregister_m3208 (Object_t * __this /* static, unused */, Object_t * ___c, const MethodInfo* method)
{
	{
		ClipperRegistry_t625 * L_0 = ClipperRegistry_get_instance_m3205(NULL /*static, unused*/, /*hidden argument*/NULL);
		NullCheck(L_0);
		IndexedSet_1_t626 * L_1 = (L_0->___m_Clippers_1);
		Object_t * L_2 = ___c;
		NullCheck(L_1);
		VirtFuncInvoker1< bool, Object_t * >::Invoke(16 /* System.Boolean UnityEngine.UI.Collections.IndexedSet`1<UnityEngine.UI.IClipper>::Remove(T) */, L_1, L_2);
		return;
	}
}
// UnityEngine.Rect UnityEngine.UI.Clipping::FindCullAndClipWorldRect(System.Collections.Generic.List`1<UnityEngine.UI.RectMask2D>,System.Boolean&)
extern TypeInfo* Rect_t232_il2cpp_TypeInfo_var;
extern "C" Rect_t232  Clipping_FindCullAndClipWorldRect_m3209 (Object_t * __this /* static, unused */, List_1_t595 * ___rectMaskParents, bool* ___validRect, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		Rect_t232_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(128);
		s_Il2CppMethodIntialized = true;
	}
	Rect_t232  V_0 = {0};
	int32_t V_1 = 0;
	bool V_2 = false;
	Vector3_t4  V_3 = {0};
	Vector3_t4  V_4 = {0};
	Rect_t232  V_5 = {0};
	Rect_t232  V_6 = {0};
	int32_t G_B8_0 = 0;
	{
		List_1_t595 * L_0 = ___rectMaskParents;
		NullCheck(L_0);
		int32_t L_1 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.UI.RectMask2D>::get_Count() */, L_0);
		if (L_1)
		{
			goto IL_0019;
		}
	}
	{
		bool* L_2 = ___validRect;
		*((int8_t*)(L_2)) = (int8_t)0;
		Initobj (Rect_t232_il2cpp_TypeInfo_var, (&V_5));
		Rect_t232  L_3 = V_5;
		return L_3;
	}

IL_0019:
	{
		List_1_t595 * L_4 = ___rectMaskParents;
		NullCheck(L_4);
		RectMask2D_t587 * L_5 = (RectMask2D_t587 *)VirtFuncInvoker1< RectMask2D_t587 *, int32_t >::Invoke(31 /* !0 System.Collections.Generic.List`1<UnityEngine.UI.RectMask2D>::get_Item(System.Int32) */, L_4, 0);
		NullCheck(L_5);
		Rect_t232  L_6 = RectMask2D_get_canvasRect_m2858(L_5, /*hidden argument*/NULL);
		V_0 = L_6;
		V_1 = 0;
		goto IL_0044;
	}

IL_002d:
	{
		Rect_t232  L_7 = V_0;
		List_1_t595 * L_8 = ___rectMaskParents;
		int32_t L_9 = V_1;
		NullCheck(L_8);
		RectMask2D_t587 * L_10 = (RectMask2D_t587 *)VirtFuncInvoker1< RectMask2D_t587 *, int32_t >::Invoke(31 /* !0 System.Collections.Generic.List`1<UnityEngine.UI.RectMask2D>::get_Item(System.Int32) */, L_8, L_9);
		NullCheck(L_10);
		Rect_t232  L_11 = RectMask2D_get_canvasRect_m2858(L_10, /*hidden argument*/NULL);
		Rect_t232  L_12 = Clipping_RectIntersect_m3210(NULL /*static, unused*/, L_7, L_11, /*hidden argument*/NULL);
		V_0 = L_12;
		int32_t L_13 = V_1;
		V_1 = ((int32_t)((int32_t)L_13+(int32_t)1));
	}

IL_0044:
	{
		int32_t L_14 = V_1;
		List_1_t595 * L_15 = ___rectMaskParents;
		NullCheck(L_15);
		int32_t L_16 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.UI.RectMask2D>::get_Count() */, L_15);
		if ((((int32_t)L_14) < ((int32_t)L_16)))
		{
			goto IL_002d;
		}
	}
	{
		float L_17 = Rect_get_width_m1016((&V_0), /*hidden argument*/NULL);
		if ((((float)L_17) <= ((float)(0.0f))))
		{
			goto IL_0074;
		}
	}
	{
		float L_18 = Rect_get_height_m1018((&V_0), /*hidden argument*/NULL);
		G_B8_0 = ((((int32_t)((!(((float)L_18) <= ((float)(0.0f))))? 1 : 0)) == ((int32_t)0))? 1 : 0);
		goto IL_0075;
	}

IL_0074:
	{
		G_B8_0 = 1;
	}

IL_0075:
	{
		V_2 = G_B8_0;
		bool L_19 = V_2;
		if (!L_19)
		{
			goto IL_008a;
		}
	}
	{
		bool* L_20 = ___validRect;
		*((int8_t*)(L_20)) = (int8_t)0;
		Initobj (Rect_t232_il2cpp_TypeInfo_var, (&V_6));
		Rect_t232  L_21 = V_6;
		return L_21;
	}

IL_008a:
	{
		float L_22 = Rect_get_x_m1008((&V_0), /*hidden argument*/NULL);
		float L_23 = Rect_get_y_m1010((&V_0), /*hidden argument*/NULL);
		Vector3__ctor_m419((&V_3), L_22, L_23, (0.0f), /*hidden argument*/NULL);
		float L_24 = Rect_get_x_m1008((&V_0), /*hidden argument*/NULL);
		float L_25 = Rect_get_width_m1016((&V_0), /*hidden argument*/NULL);
		float L_26 = Rect_get_y_m1010((&V_0), /*hidden argument*/NULL);
		float L_27 = Rect_get_height_m1018((&V_0), /*hidden argument*/NULL);
		Vector3__ctor_m419((&V_4), ((float)((float)L_24+(float)L_25)), ((float)((float)L_26+(float)L_27)), (0.0f), /*hidden argument*/NULL);
		bool* L_28 = ___validRect;
		*((int8_t*)(L_28)) = (int8_t)1;
		float L_29 = ((&V_3)->___x_1);
		float L_30 = ((&V_3)->___y_2);
		float L_31 = ((&V_4)->___x_1);
		float L_32 = ((&V_3)->___x_1);
		float L_33 = ((&V_4)->___y_2);
		float L_34 = ((&V_3)->___y_2);
		Rect_t232  L_35 = {0};
		Rect__ctor_m1007(&L_35, L_29, L_30, ((float)((float)L_31-(float)L_32)), ((float)((float)L_33-(float)L_34)), /*hidden argument*/NULL);
		return L_35;
	}
}
// UnityEngine.Rect UnityEngine.UI.Clipping::RectIntersect(UnityEngine.Rect,UnityEngine.Rect)
extern TypeInfo* Mathf_t134_il2cpp_TypeInfo_var;
extern "C" Rect_t232  Clipping_RectIntersect_m3210 (Object_t * __this /* static, unused */, Rect_t232  ___a, Rect_t232  ___b, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		Mathf_t134_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(1);
		s_Il2CppMethodIntialized = true;
	}
	float V_0 = 0.0f;
	float V_1 = 0.0f;
	float V_2 = 0.0f;
	float V_3 = 0.0f;
	{
		float L_0 = Rect_get_x_m1008((&___a), /*hidden argument*/NULL);
		float L_1 = Rect_get_x_m1008((&___b), /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(Mathf_t134_il2cpp_TypeInfo_var);
		float L_2 = Mathf_Max_m682(NULL /*static, unused*/, L_0, L_1, /*hidden argument*/NULL);
		V_0 = L_2;
		float L_3 = Rect_get_x_m1008((&___a), /*hidden argument*/NULL);
		float L_4 = Rect_get_width_m1016((&___a), /*hidden argument*/NULL);
		float L_5 = Rect_get_x_m1008((&___b), /*hidden argument*/NULL);
		float L_6 = Rect_get_width_m1016((&___b), /*hidden argument*/NULL);
		float L_7 = Mathf_Min_m1130(NULL /*static, unused*/, ((float)((float)L_3+(float)L_4)), ((float)((float)L_5+(float)L_6)), /*hidden argument*/NULL);
		V_1 = L_7;
		float L_8 = Rect_get_y_m1010((&___a), /*hidden argument*/NULL);
		float L_9 = Rect_get_y_m1010((&___b), /*hidden argument*/NULL);
		float L_10 = Mathf_Max_m682(NULL /*static, unused*/, L_8, L_9, /*hidden argument*/NULL);
		V_2 = L_10;
		float L_11 = Rect_get_y_m1010((&___a), /*hidden argument*/NULL);
		float L_12 = Rect_get_height_m1018((&___a), /*hidden argument*/NULL);
		float L_13 = Rect_get_y_m1010((&___b), /*hidden argument*/NULL);
		float L_14 = Rect_get_height_m1018((&___b), /*hidden argument*/NULL);
		float L_15 = Mathf_Min_m1130(NULL /*static, unused*/, ((float)((float)L_11+(float)L_12)), ((float)((float)L_13+(float)L_14)), /*hidden argument*/NULL);
		V_3 = L_15;
		float L_16 = V_1;
		float L_17 = V_0;
		if ((!(((float)L_16) >= ((float)L_17))))
		{
			goto IL_008c;
		}
	}
	{
		float L_18 = V_3;
		float L_19 = V_2;
		if ((!(((float)L_18) >= ((float)L_19))))
		{
			goto IL_008c;
		}
	}
	{
		float L_20 = V_0;
		float L_21 = V_2;
		float L_22 = V_1;
		float L_23 = V_0;
		float L_24 = V_3;
		float L_25 = V_2;
		Rect_t232  L_26 = {0};
		Rect__ctor_m1007(&L_26, L_20, L_21, ((float)((float)L_22-(float)L_23)), ((float)((float)L_24-(float)L_25)), /*hidden argument*/NULL);
		return L_26;
	}

IL_008c:
	{
		Rect_t232  L_27 = {0};
		Rect__ctor_m1007(&L_27, (0.0f), (0.0f), (0.0f), (0.0f), /*hidden argument*/NULL);
		return L_27;
	}
}
// System.Void UnityEngine.UI.RectangularVertexClipper::.ctor()
extern TypeInfo* Vector3U5BU5D_t125_il2cpp_TypeInfo_var;
extern "C" void RectangularVertexClipper__ctor_m3211 (RectangularVertexClipper_t593 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		Vector3U5BU5D_t125_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(85);
		s_Il2CppMethodIntialized = true;
	}
	{
		__this->___m_WorldCorners_0 = ((Vector3U5BU5D_t125*)SZArrayNew(Vector3U5BU5D_t125_il2cpp_TypeInfo_var, 4));
		__this->___m_CanvasCorners_1 = ((Vector3U5BU5D_t125*)SZArrayNew(Vector3U5BU5D_t125_il2cpp_TypeInfo_var, 4));
		Object__ctor_m482(__this, /*hidden argument*/NULL);
		return;
	}
}
// UnityEngine.Rect UnityEngine.UI.RectangularVertexClipper::GetCanvasRect(UnityEngine.RectTransform,UnityEngine.Canvas)
extern const MethodInfo* Component_GetComponent_TisTransform_t3_m3650_MethodInfo_var;
extern "C" Rect_t232  RectangularVertexClipper_GetCanvasRect_m3212 (RectangularVertexClipper_t593 * __this, RectTransform_t242 * ___t, Canvas_t321 * ___c, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		Component_GetComponent_TisTransform_t3_m3650_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483920);
		s_Il2CppMethodIntialized = true;
	}
	Transform_t3 * V_0 = {0};
	int32_t V_1 = 0;
	{
		RectTransform_t242 * L_0 = ___t;
		Vector3U5BU5D_t125* L_1 = (__this->___m_WorldCorners_0);
		NullCheck(L_0);
		RectTransform_GetWorldCorners_m1175(L_0, L_1, /*hidden argument*/NULL);
		Canvas_t321 * L_2 = ___c;
		NullCheck(L_2);
		Transform_t3 * L_3 = Component_GetComponent_TisTransform_t3_m3650(L_2, /*hidden argument*/Component_GetComponent_TisTransform_t3_m3650_MethodInfo_var);
		V_0 = L_3;
		V_1 = 0;
		goto IL_0046;
	}

IL_001a:
	{
		Vector3U5BU5D_t125* L_4 = (__this->___m_CanvasCorners_1);
		int32_t L_5 = V_1;
		NullCheck(L_4);
		IL2CPP_ARRAY_BOUNDS_CHECK(L_4, L_5);
		Transform_t3 * L_6 = V_0;
		Vector3U5BU5D_t125* L_7 = (__this->___m_WorldCorners_0);
		int32_t L_8 = V_1;
		NullCheck(L_7);
		IL2CPP_ARRAY_BOUNDS_CHECK(L_7, L_8);
		NullCheck(L_6);
		Vector3_t4  L_9 = Transform_InverseTransformPoint_m477(L_6, (*(Vector3_t4 *)((Vector3_t4 *)(Vector3_t4 *)SZArrayLdElema(L_7, L_8, sizeof(Vector3_t4 )))), /*hidden argument*/NULL);
		(*(Vector3_t4 *)((Vector3_t4 *)(Vector3_t4 *)SZArrayLdElema(L_4, L_5, sizeof(Vector3_t4 )))) = L_9;
		int32_t L_10 = V_1;
		V_1 = ((int32_t)((int32_t)L_10+(int32_t)1));
	}

IL_0046:
	{
		int32_t L_11 = V_1;
		if ((((int32_t)L_11) < ((int32_t)4)))
		{
			goto IL_001a;
		}
	}
	{
		Vector3U5BU5D_t125* L_12 = (__this->___m_CanvasCorners_1);
		NullCheck(L_12);
		IL2CPP_ARRAY_BOUNDS_CHECK(L_12, 0);
		float L_13 = (((Vector3_t4 *)(Vector3_t4 *)SZArrayLdElema(L_12, 0, sizeof(Vector3_t4 )))->___x_1);
		Vector3U5BU5D_t125* L_14 = (__this->___m_CanvasCorners_1);
		NullCheck(L_14);
		IL2CPP_ARRAY_BOUNDS_CHECK(L_14, 0);
		float L_15 = (((Vector3_t4 *)(Vector3_t4 *)SZArrayLdElema(L_14, 0, sizeof(Vector3_t4 )))->___y_2);
		Vector3U5BU5D_t125* L_16 = (__this->___m_CanvasCorners_1);
		NullCheck(L_16);
		IL2CPP_ARRAY_BOUNDS_CHECK(L_16, 2);
		float L_17 = (((Vector3_t4 *)(Vector3_t4 *)SZArrayLdElema(L_16, 2, sizeof(Vector3_t4 )))->___x_1);
		Vector3U5BU5D_t125* L_18 = (__this->___m_CanvasCorners_1);
		NullCheck(L_18);
		IL2CPP_ARRAY_BOUNDS_CHECK(L_18, 0);
		float L_19 = (((Vector3_t4 *)(Vector3_t4 *)SZArrayLdElema(L_18, 0, sizeof(Vector3_t4 )))->___x_1);
		Vector3U5BU5D_t125* L_20 = (__this->___m_CanvasCorners_1);
		NullCheck(L_20);
		IL2CPP_ARRAY_BOUNDS_CHECK(L_20, 2);
		float L_21 = (((Vector3_t4 *)(Vector3_t4 *)SZArrayLdElema(L_20, 2, sizeof(Vector3_t4 )))->___y_2);
		Vector3U5BU5D_t125* L_22 = (__this->___m_CanvasCorners_1);
		NullCheck(L_22);
		IL2CPP_ARRAY_BOUNDS_CHECK(L_22, 0);
		float L_23 = (((Vector3_t4 *)(Vector3_t4 *)SZArrayLdElema(L_22, 0, sizeof(Vector3_t4 )))->___y_2);
		Rect_t232  L_24 = {0};
		Rect__ctor_m1007(&L_24, L_13, L_15, ((float)((float)L_17-(float)L_19)), ((float)((float)L_21-(float)L_23)), /*hidden argument*/NULL);
		return L_24;
	}
}
// System.Void UnityEngine.UI.AspectRatioFitter::.ctor()
extern "C" void AspectRatioFitter__ctor_m3213 (AspectRatioFitter_t629 * __this, const MethodInfo* method)
{
	{
		__this->___m_AspectRatio_3 = (1.0f);
		UIBehaviour__ctor_m2193(__this, /*hidden argument*/NULL);
		return;
	}
}
// UnityEngine.UI.AspectRatioFitter/AspectMode UnityEngine.UI.AspectRatioFitter::get_aspectMode()
extern "C" int32_t AspectRatioFitter_get_aspectMode_m3214 (AspectRatioFitter_t629 * __this, const MethodInfo* method)
{
	{
		int32_t L_0 = (__this->___m_AspectMode_2);
		return L_0;
	}
}
// System.Void UnityEngine.UI.AspectRatioFitter::set_aspectMode(UnityEngine.UI.AspectRatioFitter/AspectMode)
extern const MethodInfo* SetPropertyUtility_SetStruct_TisAspectMode_t628_m3651_MethodInfo_var;
extern "C" void AspectRatioFitter_set_aspectMode_m3215 (AspectRatioFitter_t629 * __this, int32_t ___value, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		SetPropertyUtility_SetStruct_TisAspectMode_t628_m3651_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483921);
		s_Il2CppMethodIntialized = true;
	}
	{
		int32_t* L_0 = &(__this->___m_AspectMode_2);
		int32_t L_1 = ___value;
		bool L_2 = SetPropertyUtility_SetStruct_TisAspectMode_t628_m3651(NULL /*static, unused*/, L_0, L_1, /*hidden argument*/SetPropertyUtility_SetStruct_TisAspectMode_t628_m3651_MethodInfo_var);
		if (!L_2)
		{
			goto IL_0017;
		}
	}
	{
		AspectRatioFitter_SetDirty_m3227(__this, /*hidden argument*/NULL);
	}

IL_0017:
	{
		return;
	}
}
// System.Single UnityEngine.UI.AspectRatioFitter::get_aspectRatio()
extern "C" float AspectRatioFitter_get_aspectRatio_m3216 (AspectRatioFitter_t629 * __this, const MethodInfo* method)
{
	{
		float L_0 = (__this->___m_AspectRatio_3);
		return L_0;
	}
}
// System.Void UnityEngine.UI.AspectRatioFitter::set_aspectRatio(System.Single)
extern const MethodInfo* SetPropertyUtility_SetStruct_TisSingle_t165_m3579_MethodInfo_var;
extern "C" void AspectRatioFitter_set_aspectRatio_m3217 (AspectRatioFitter_t629 * __this, float ___value, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		SetPropertyUtility_SetStruct_TisSingle_t165_m3579_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483868);
		s_Il2CppMethodIntialized = true;
	}
	{
		float* L_0 = &(__this->___m_AspectRatio_3);
		float L_1 = ___value;
		bool L_2 = SetPropertyUtility_SetStruct_TisSingle_t165_m3579(NULL /*static, unused*/, L_0, L_1, /*hidden argument*/SetPropertyUtility_SetStruct_TisSingle_t165_m3579_MethodInfo_var);
		if (!L_2)
		{
			goto IL_0017;
		}
	}
	{
		AspectRatioFitter_SetDirty_m3227(__this, /*hidden argument*/NULL);
	}

IL_0017:
	{
		return;
	}
}
// UnityEngine.RectTransform UnityEngine.UI.AspectRatioFitter::get_rectTransform()
extern const MethodInfo* Component_GetComponent_TisRectTransform_t242_m3562_MethodInfo_var;
extern "C" RectTransform_t242 * AspectRatioFitter_get_rectTransform_m3218 (AspectRatioFitter_t629 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		Component_GetComponent_TisRectTransform_t242_m3562_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483849);
		s_Il2CppMethodIntialized = true;
	}
	{
		RectTransform_t242 * L_0 = (__this->___m_Rect_4);
		bool L_1 = Object_op_Equality_m445(NULL /*static, unused*/, L_0, (Object_t76 *)NULL, /*hidden argument*/NULL);
		if (!L_1)
		{
			goto IL_001d;
		}
	}
	{
		RectTransform_t242 * L_2 = Component_GetComponent_TisRectTransform_t242_m3562(__this, /*hidden argument*/Component_GetComponent_TisRectTransform_t242_m3562_MethodInfo_var);
		__this->___m_Rect_4 = L_2;
	}

IL_001d:
	{
		RectTransform_t242 * L_3 = (__this->___m_Rect_4);
		return L_3;
	}
}
// System.Void UnityEngine.UI.AspectRatioFitter::OnEnable()
extern "C" void AspectRatioFitter_OnEnable_m3219 (AspectRatioFitter_t629 * __this, const MethodInfo* method)
{
	{
		UIBehaviour_OnEnable_m2195(__this, /*hidden argument*/NULL);
		AspectRatioFitter_SetDirty_m3227(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.AspectRatioFitter::OnDisable()
extern TypeInfo* LayoutRebuilder_t645_il2cpp_TypeInfo_var;
extern "C" void AspectRatioFitter_OnDisable_m3220 (AspectRatioFitter_t629 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		LayoutRebuilder_t645_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(318);
		s_Il2CppMethodIntialized = true;
	}
	{
		DrivenRectTransformTracker_t238 * L_0 = &(__this->___m_Tracker_5);
		DrivenRectTransformTracker_Clear_m1144(L_0, /*hidden argument*/NULL);
		RectTransform_t242 * L_1 = AspectRatioFitter_get_rectTransform_m3218(__this, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		LayoutRebuilder_MarkLayoutForRebuild_m3368(NULL /*static, unused*/, L_1, /*hidden argument*/NULL);
		UIBehaviour_OnDisable_m2197(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.AspectRatioFitter::OnRectTransformDimensionsChange()
extern "C" void AspectRatioFitter_OnRectTransformDimensionsChange_m3221 (AspectRatioFitter_t629 * __this, const MethodInfo* method)
{
	{
		AspectRatioFitter_UpdateRect_m3222(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.AspectRatioFitter::UpdateRect()
extern "C" void AspectRatioFitter_UpdateRect_m3222 (AspectRatioFitter_t629 * __this, const MethodInfo* method)
{
	Vector2_t6  V_0 = {0};
	Vector2_t6  V_1 = {0};
	int32_t V_2 = {0};
	Rect_t232  V_3 = {0};
	Rect_t232  V_4 = {0};
	{
		bool L_0 = (bool)VirtFuncInvoker0< bool >::Invoke(9 /* System.Boolean UnityEngine.EventSystems.UIBehaviour::IsActive() */, __this);
		if (L_0)
		{
			goto IL_000c;
		}
	}
	{
		return;
	}

IL_000c:
	{
		DrivenRectTransformTracker_t238 * L_1 = &(__this->___m_Tracker_5);
		DrivenRectTransformTracker_Clear_m1144(L_1, /*hidden argument*/NULL);
		int32_t L_2 = (__this->___m_AspectMode_2);
		V_2 = L_2;
		int32_t L_3 = V_2;
		if (((int32_t)((int32_t)L_3-(int32_t)1)) == 0)
		{
			goto IL_007d;
		}
		if (((int32_t)((int32_t)L_3-(int32_t)1)) == 1)
		{
			goto IL_003b;
		}
		if (((int32_t)((int32_t)L_3-(int32_t)1)) == 2)
		{
			goto IL_00c0;
		}
		if (((int32_t)((int32_t)L_3-(int32_t)1)) == 3)
		{
			goto IL_00c0;
		}
	}
	{
		goto IL_0188;
	}

IL_003b:
	{
		DrivenRectTransformTracker_t238 * L_4 = &(__this->___m_Tracker_5);
		RectTransform_t242 * L_5 = AspectRatioFitter_get_rectTransform_m3218(__this, /*hidden argument*/NULL);
		DrivenRectTransformTracker_Add_m1143(L_4, __this, L_5, ((int32_t)4096), /*hidden argument*/NULL);
		RectTransform_t242 * L_6 = AspectRatioFitter_get_rectTransform_m3218(__this, /*hidden argument*/NULL);
		RectTransform_t242 * L_7 = AspectRatioFitter_get_rectTransform_m3218(__this, /*hidden argument*/NULL);
		NullCheck(L_7);
		Rect_t232  L_8 = RectTransform_get_rect_m1151(L_7, /*hidden argument*/NULL);
		V_3 = L_8;
		float L_9 = Rect_get_height_m1018((&V_3), /*hidden argument*/NULL);
		float L_10 = (__this->___m_AspectRatio_3);
		NullCheck(L_6);
		RectTransform_SetSizeWithCurrentAnchors_m1177(L_6, 0, ((float)((float)L_9*(float)L_10)), /*hidden argument*/NULL);
		goto IL_0188;
	}

IL_007d:
	{
		DrivenRectTransformTracker_t238 * L_11 = &(__this->___m_Tracker_5);
		RectTransform_t242 * L_12 = AspectRatioFitter_get_rectTransform_m3218(__this, /*hidden argument*/NULL);
		DrivenRectTransformTracker_Add_m1143(L_11, __this, L_12, ((int32_t)8192), /*hidden argument*/NULL);
		RectTransform_t242 * L_13 = AspectRatioFitter_get_rectTransform_m3218(__this, /*hidden argument*/NULL);
		RectTransform_t242 * L_14 = AspectRatioFitter_get_rectTransform_m3218(__this, /*hidden argument*/NULL);
		NullCheck(L_14);
		Rect_t232  L_15 = RectTransform_get_rect_m1151(L_14, /*hidden argument*/NULL);
		V_4 = L_15;
		float L_16 = Rect_get_width_m1016((&V_4), /*hidden argument*/NULL);
		float L_17 = (__this->___m_AspectRatio_3);
		NullCheck(L_13);
		RectTransform_SetSizeWithCurrentAnchors_m1177(L_13, 1, ((float)((float)L_16/(float)L_17)), /*hidden argument*/NULL);
		goto IL_0188;
	}

IL_00c0:
	{
		DrivenRectTransformTracker_t238 * L_18 = &(__this->___m_Tracker_5);
		RectTransform_t242 * L_19 = AspectRatioFitter_get_rectTransform_m3218(__this, /*hidden argument*/NULL);
		DrivenRectTransformTracker_Add_m1143(L_18, __this, L_19, ((int32_t)16134), /*hidden argument*/NULL);
		RectTransform_t242 * L_20 = AspectRatioFitter_get_rectTransform_m3218(__this, /*hidden argument*/NULL);
		Vector2_t6  L_21 = Vector2_get_zero_m539(NULL /*static, unused*/, /*hidden argument*/NULL);
		NullCheck(L_20);
		RectTransform_set_anchorMin_m1154(L_20, L_21, /*hidden argument*/NULL);
		RectTransform_t242 * L_22 = AspectRatioFitter_get_rectTransform_m3218(__this, /*hidden argument*/NULL);
		Vector2_t6  L_23 = Vector2_get_one_m952(NULL /*static, unused*/, /*hidden argument*/NULL);
		NullCheck(L_22);
		RectTransform_set_anchorMax_m1158(L_22, L_23, /*hidden argument*/NULL);
		RectTransform_t242 * L_24 = AspectRatioFitter_get_rectTransform_m3218(__this, /*hidden argument*/NULL);
		Vector2_t6  L_25 = Vector2_get_zero_m539(NULL /*static, unused*/, /*hidden argument*/NULL);
		NullCheck(L_24);
		RectTransform_set_anchoredPosition_m1162(L_24, L_25, /*hidden argument*/NULL);
		Vector2_t6  L_26 = Vector2_get_zero_m539(NULL /*static, unused*/, /*hidden argument*/NULL);
		V_0 = L_26;
		Vector2_t6  L_27 = AspectRatioFitter_GetParentSize_m3224(__this, /*hidden argument*/NULL);
		V_1 = L_27;
		float L_28 = ((&V_1)->___y_2);
		float L_29 = AspectRatioFitter_get_aspectRatio_m3216(__this, /*hidden argument*/NULL);
		float L_30 = ((&V_1)->___x_1);
		int32_t L_31 = (__this->___m_AspectMode_2);
		if (!((int32_t)((int32_t)((((float)((float)((float)L_28*(float)L_29))) < ((float)L_30))? 1 : 0)^(int32_t)((((int32_t)L_31) == ((int32_t)3))? 1 : 0))))
		{
			goto IL_015b;
		}
	}
	{
		float L_32 = ((&V_1)->___x_1);
		float L_33 = AspectRatioFitter_get_aspectRatio_m3216(__this, /*hidden argument*/NULL);
		float L_34 = AspectRatioFitter_GetSizeDeltaToProduceSize_m3223(__this, ((float)((float)L_32/(float)L_33)), 1, /*hidden argument*/NULL);
		(&V_0)->___y_2 = L_34;
		goto IL_0177;
	}

IL_015b:
	{
		float L_35 = ((&V_1)->___y_2);
		float L_36 = AspectRatioFitter_get_aspectRatio_m3216(__this, /*hidden argument*/NULL);
		float L_37 = AspectRatioFitter_GetSizeDeltaToProduceSize_m3223(__this, ((float)((float)L_35*(float)L_36)), 0, /*hidden argument*/NULL);
		(&V_0)->___x_1 = L_37;
	}

IL_0177:
	{
		RectTransform_t242 * L_38 = AspectRatioFitter_get_rectTransform_m3218(__this, /*hidden argument*/NULL);
		Vector2_t6  L_39 = V_0;
		NullCheck(L_38);
		RectTransform_set_sizeDelta_m1166(L_38, L_39, /*hidden argument*/NULL);
		goto IL_0188;
	}

IL_0188:
	{
		return;
	}
}
// System.Single UnityEngine.UI.AspectRatioFitter::GetSizeDeltaToProduceSize(System.Single,System.Int32)
extern "C" float AspectRatioFitter_GetSizeDeltaToProduceSize_m3223 (AspectRatioFitter_t629 * __this, float ___size, int32_t ___axis, const MethodInfo* method)
{
	Vector2_t6  V_0 = {0};
	Vector2_t6  V_1 = {0};
	Vector2_t6  V_2 = {0};
	{
		float L_0 = ___size;
		Vector2_t6  L_1 = AspectRatioFitter_GetParentSize_m3224(__this, /*hidden argument*/NULL);
		V_0 = L_1;
		int32_t L_2 = ___axis;
		float L_3 = Vector2_get_Item_m943((&V_0), L_2, /*hidden argument*/NULL);
		RectTransform_t242 * L_4 = AspectRatioFitter_get_rectTransform_m3218(__this, /*hidden argument*/NULL);
		NullCheck(L_4);
		Vector2_t6  L_5 = RectTransform_get_anchorMax_m1157(L_4, /*hidden argument*/NULL);
		V_1 = L_5;
		int32_t L_6 = ___axis;
		float L_7 = Vector2_get_Item_m943((&V_1), L_6, /*hidden argument*/NULL);
		RectTransform_t242 * L_8 = AspectRatioFitter_get_rectTransform_m3218(__this, /*hidden argument*/NULL);
		NullCheck(L_8);
		Vector2_t6  L_9 = RectTransform_get_anchorMin_m1153(L_8, /*hidden argument*/NULL);
		V_2 = L_9;
		int32_t L_10 = ___axis;
		float L_11 = Vector2_get_Item_m943((&V_2), L_10, /*hidden argument*/NULL);
		return ((float)((float)L_0-(float)((float)((float)L_3*(float)((float)((float)L_7-(float)L_11))))));
	}
}
// UnityEngine.Vector2 UnityEngine.UI.AspectRatioFitter::GetParentSize()
extern TypeInfo* RectTransform_t242_il2cpp_TypeInfo_var;
extern "C" Vector2_t6  AspectRatioFitter_GetParentSize_m3224 (AspectRatioFitter_t629 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		RectTransform_t242_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(131);
		s_Il2CppMethodIntialized = true;
	}
	RectTransform_t242 * V_0 = {0};
	Rect_t232  V_1 = {0};
	{
		RectTransform_t242 * L_0 = AspectRatioFitter_get_rectTransform_m3218(__this, /*hidden argument*/NULL);
		NullCheck(L_0);
		Transform_t3 * L_1 = Transform_get_parent_m481(L_0, /*hidden argument*/NULL);
		V_0 = ((RectTransform_t242 *)IsInstSealed(L_1, RectTransform_t242_il2cpp_TypeInfo_var));
		RectTransform_t242 * L_2 = V_0;
		bool L_3 = Object_op_Implicit_m435(NULL /*static, unused*/, L_2, /*hidden argument*/NULL);
		if (L_3)
		{
			goto IL_0022;
		}
	}
	{
		Vector2_t6  L_4 = Vector2_get_zero_m539(NULL /*static, unused*/, /*hidden argument*/NULL);
		return L_4;
	}

IL_0022:
	{
		RectTransform_t242 * L_5 = V_0;
		NullCheck(L_5);
		Rect_t232  L_6 = RectTransform_get_rect_m1151(L_5, /*hidden argument*/NULL);
		V_1 = L_6;
		Vector2_t6  L_7 = Rect_get_size_m1020((&V_1), /*hidden argument*/NULL);
		return L_7;
	}
}
// System.Void UnityEngine.UI.AspectRatioFitter::SetLayoutHorizontal()
extern "C" void AspectRatioFitter_SetLayoutHorizontal_m3225 (AspectRatioFitter_t629 * __this, const MethodInfo* method)
{
	{
		return;
	}
}
// System.Void UnityEngine.UI.AspectRatioFitter::SetLayoutVertical()
extern "C" void AspectRatioFitter_SetLayoutVertical_m3226 (AspectRatioFitter_t629 * __this, const MethodInfo* method)
{
	{
		return;
	}
}
// System.Void UnityEngine.UI.AspectRatioFitter::SetDirty()
extern "C" void AspectRatioFitter_SetDirty_m3227 (AspectRatioFitter_t629 * __this, const MethodInfo* method)
{
	{
		bool L_0 = (bool)VirtFuncInvoker0< bool >::Invoke(9 /* System.Boolean UnityEngine.EventSystems.UIBehaviour::IsActive() */, __this);
		if (L_0)
		{
			goto IL_000c;
		}
	}
	{
		return;
	}

IL_000c:
	{
		AspectRatioFitter_UpdateRect_m3222(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.CanvasScaler::.ctor()
extern "C" void CanvasScaler__ctor_m3228 (CanvasScaler_t633 * __this, const MethodInfo* method)
{
	{
		__this->___m_ReferencePixelsPerUnit_4 = (100.0f);
		__this->___m_ScaleFactor_5 = (1.0f);
		Vector2_t6  L_0 = {0};
		Vector2__ctor_m436(&L_0, (800.0f), (600.0f), /*hidden argument*/NULL);
		__this->___m_ReferenceResolution_6 = L_0;
		__this->___m_PhysicalUnit_9 = 3;
		__this->___m_FallbackScreenDPI_10 = (96.0f);
		__this->___m_DefaultSpriteDPI_11 = (96.0f);
		__this->___m_DynamicPixelsPerUnit_12 = (1.0f);
		__this->___m_PrevScaleFactor_14 = (1.0f);
		__this->___m_PrevReferencePixelsPerUnit_15 = (100.0f);
		UIBehaviour__ctor_m2193(__this, /*hidden argument*/NULL);
		return;
	}
}
// UnityEngine.UI.CanvasScaler/ScaleMode UnityEngine.UI.CanvasScaler::get_uiScaleMode()
extern "C" int32_t CanvasScaler_get_uiScaleMode_m3229 (CanvasScaler_t633 * __this, const MethodInfo* method)
{
	{
		int32_t L_0 = (__this->___m_UiScaleMode_3);
		return L_0;
	}
}
// System.Void UnityEngine.UI.CanvasScaler::set_uiScaleMode(UnityEngine.UI.CanvasScaler/ScaleMode)
extern "C" void CanvasScaler_set_uiScaleMode_m3230 (CanvasScaler_t633 * __this, int32_t ___value, const MethodInfo* method)
{
	{
		int32_t L_0 = ___value;
		__this->___m_UiScaleMode_3 = L_0;
		return;
	}
}
// System.Single UnityEngine.UI.CanvasScaler::get_referencePixelsPerUnit()
extern "C" float CanvasScaler_get_referencePixelsPerUnit_m3231 (CanvasScaler_t633 * __this, const MethodInfo* method)
{
	{
		float L_0 = (__this->___m_ReferencePixelsPerUnit_4);
		return L_0;
	}
}
// System.Void UnityEngine.UI.CanvasScaler::set_referencePixelsPerUnit(System.Single)
extern "C" void CanvasScaler_set_referencePixelsPerUnit_m3232 (CanvasScaler_t633 * __this, float ___value, const MethodInfo* method)
{
	{
		float L_0 = ___value;
		__this->___m_ReferencePixelsPerUnit_4 = L_0;
		return;
	}
}
// System.Single UnityEngine.UI.CanvasScaler::get_scaleFactor()
extern "C" float CanvasScaler_get_scaleFactor_m3233 (CanvasScaler_t633 * __this, const MethodInfo* method)
{
	{
		float L_0 = (__this->___m_ScaleFactor_5);
		return L_0;
	}
}
// System.Void UnityEngine.UI.CanvasScaler::set_scaleFactor(System.Single)
extern "C" void CanvasScaler_set_scaleFactor_m3234 (CanvasScaler_t633 * __this, float ___value, const MethodInfo* method)
{
	{
		float L_0 = ___value;
		__this->___m_ScaleFactor_5 = L_0;
		return;
	}
}
// UnityEngine.Vector2 UnityEngine.UI.CanvasScaler::get_referenceResolution()
extern "C" Vector2_t6  CanvasScaler_get_referenceResolution_m3235 (CanvasScaler_t633 * __this, const MethodInfo* method)
{
	{
		Vector2_t6  L_0 = (__this->___m_ReferenceResolution_6);
		return L_0;
	}
}
// System.Void UnityEngine.UI.CanvasScaler::set_referenceResolution(UnityEngine.Vector2)
extern "C" void CanvasScaler_set_referenceResolution_m3236 (CanvasScaler_t633 * __this, Vector2_t6  ___value, const MethodInfo* method)
{
	{
		Vector2_t6  L_0 = ___value;
		__this->___m_ReferenceResolution_6 = L_0;
		return;
	}
}
// UnityEngine.UI.CanvasScaler/ScreenMatchMode UnityEngine.UI.CanvasScaler::get_screenMatchMode()
extern "C" int32_t CanvasScaler_get_screenMatchMode_m3237 (CanvasScaler_t633 * __this, const MethodInfo* method)
{
	{
		int32_t L_0 = (__this->___m_ScreenMatchMode_7);
		return L_0;
	}
}
// System.Void UnityEngine.UI.CanvasScaler::set_screenMatchMode(UnityEngine.UI.CanvasScaler/ScreenMatchMode)
extern "C" void CanvasScaler_set_screenMatchMode_m3238 (CanvasScaler_t633 * __this, int32_t ___value, const MethodInfo* method)
{
	{
		int32_t L_0 = ___value;
		__this->___m_ScreenMatchMode_7 = L_0;
		return;
	}
}
// System.Single UnityEngine.UI.CanvasScaler::get_matchWidthOrHeight()
extern "C" float CanvasScaler_get_matchWidthOrHeight_m3239 (CanvasScaler_t633 * __this, const MethodInfo* method)
{
	{
		float L_0 = (__this->___m_MatchWidthOrHeight_8);
		return L_0;
	}
}
// System.Void UnityEngine.UI.CanvasScaler::set_matchWidthOrHeight(System.Single)
extern "C" void CanvasScaler_set_matchWidthOrHeight_m3240 (CanvasScaler_t633 * __this, float ___value, const MethodInfo* method)
{
	{
		float L_0 = ___value;
		__this->___m_MatchWidthOrHeight_8 = L_0;
		return;
	}
}
// UnityEngine.UI.CanvasScaler/Unit UnityEngine.UI.CanvasScaler::get_physicalUnit()
extern "C" int32_t CanvasScaler_get_physicalUnit_m3241 (CanvasScaler_t633 * __this, const MethodInfo* method)
{
	{
		int32_t L_0 = (__this->___m_PhysicalUnit_9);
		return L_0;
	}
}
// System.Void UnityEngine.UI.CanvasScaler::set_physicalUnit(UnityEngine.UI.CanvasScaler/Unit)
extern "C" void CanvasScaler_set_physicalUnit_m3242 (CanvasScaler_t633 * __this, int32_t ___value, const MethodInfo* method)
{
	{
		int32_t L_0 = ___value;
		__this->___m_PhysicalUnit_9 = L_0;
		return;
	}
}
// System.Single UnityEngine.UI.CanvasScaler::get_fallbackScreenDPI()
extern "C" float CanvasScaler_get_fallbackScreenDPI_m3243 (CanvasScaler_t633 * __this, const MethodInfo* method)
{
	{
		float L_0 = (__this->___m_FallbackScreenDPI_10);
		return L_0;
	}
}
// System.Void UnityEngine.UI.CanvasScaler::set_fallbackScreenDPI(System.Single)
extern "C" void CanvasScaler_set_fallbackScreenDPI_m3244 (CanvasScaler_t633 * __this, float ___value, const MethodInfo* method)
{
	{
		float L_0 = ___value;
		__this->___m_FallbackScreenDPI_10 = L_0;
		return;
	}
}
// System.Single UnityEngine.UI.CanvasScaler::get_defaultSpriteDPI()
extern "C" float CanvasScaler_get_defaultSpriteDPI_m3245 (CanvasScaler_t633 * __this, const MethodInfo* method)
{
	{
		float L_0 = (__this->___m_DefaultSpriteDPI_11);
		return L_0;
	}
}
// System.Void UnityEngine.UI.CanvasScaler::set_defaultSpriteDPI(System.Single)
extern "C" void CanvasScaler_set_defaultSpriteDPI_m3246 (CanvasScaler_t633 * __this, float ___value, const MethodInfo* method)
{
	{
		float L_0 = ___value;
		__this->___m_DefaultSpriteDPI_11 = L_0;
		return;
	}
}
// System.Single UnityEngine.UI.CanvasScaler::get_dynamicPixelsPerUnit()
extern "C" float CanvasScaler_get_dynamicPixelsPerUnit_m3247 (CanvasScaler_t633 * __this, const MethodInfo* method)
{
	{
		float L_0 = (__this->___m_DynamicPixelsPerUnit_12);
		return L_0;
	}
}
// System.Void UnityEngine.UI.CanvasScaler::set_dynamicPixelsPerUnit(System.Single)
extern "C" void CanvasScaler_set_dynamicPixelsPerUnit_m3248 (CanvasScaler_t633 * __this, float ___value, const MethodInfo* method)
{
	{
		float L_0 = ___value;
		__this->___m_DynamicPixelsPerUnit_12 = L_0;
		return;
	}
}
// System.Void UnityEngine.UI.CanvasScaler::OnEnable()
extern const MethodInfo* Component_GetComponent_TisCanvas_t321_m3570_MethodInfo_var;
extern "C" void CanvasScaler_OnEnable_m3249 (CanvasScaler_t633 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		Component_GetComponent_TisCanvas_t321_m3570_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483858);
		s_Il2CppMethodIntialized = true;
	}
	{
		UIBehaviour_OnEnable_m2195(__this, /*hidden argument*/NULL);
		Canvas_t321 * L_0 = Component_GetComponent_TisCanvas_t321_m3570(__this, /*hidden argument*/Component_GetComponent_TisCanvas_t321_m3570_MethodInfo_var);
		__this->___m_Canvas_13 = L_0;
		VirtActionInvoker0::Invoke(17 /* System.Void UnityEngine.UI.CanvasScaler::Handle() */, __this);
		return;
	}
}
// System.Void UnityEngine.UI.CanvasScaler::OnDisable()
extern "C" void CanvasScaler_OnDisable_m3250 (CanvasScaler_t633 * __this, const MethodInfo* method)
{
	{
		CanvasScaler_SetScaleFactor_m3257(__this, (1.0f), /*hidden argument*/NULL);
		CanvasScaler_SetReferencePixelsPerUnit_m3258(__this, (100.0f), /*hidden argument*/NULL);
		UIBehaviour_OnDisable_m2197(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.CanvasScaler::Update()
extern "C" void CanvasScaler_Update_m3251 (CanvasScaler_t633 * __this, const MethodInfo* method)
{
	{
		VirtActionInvoker0::Invoke(17 /* System.Void UnityEngine.UI.CanvasScaler::Handle() */, __this);
		return;
	}
}
// System.Void UnityEngine.UI.CanvasScaler::Handle()
extern "C" void CanvasScaler_Handle_m3252 (CanvasScaler_t633 * __this, const MethodInfo* method)
{
	int32_t V_0 = {0};
	{
		Canvas_t321 * L_0 = (__this->___m_Canvas_13);
		bool L_1 = Object_op_Equality_m445(NULL /*static, unused*/, L_0, (Object_t76 *)NULL, /*hidden argument*/NULL);
		if (L_1)
		{
			goto IL_0021;
		}
	}
	{
		Canvas_t321 * L_2 = (__this->___m_Canvas_13);
		NullCheck(L_2);
		bool L_3 = Canvas_get_isRootCanvas_m1702(L_2, /*hidden argument*/NULL);
		if (L_3)
		{
			goto IL_0022;
		}
	}

IL_0021:
	{
		return;
	}

IL_0022:
	{
		Canvas_t321 * L_4 = (__this->___m_Canvas_13);
		NullCheck(L_4);
		int32_t L_5 = Canvas_get_renderMode_m1701(L_4, /*hidden argument*/NULL);
		if ((!(((uint32_t)L_5) == ((uint32_t)2))))
		{
			goto IL_003a;
		}
	}
	{
		VirtActionInvoker0::Invoke(18 /* System.Void UnityEngine.UI.CanvasScaler::HandleWorldCanvas() */, __this);
		return;
	}

IL_003a:
	{
		int32_t L_6 = (__this->___m_UiScaleMode_3);
		V_0 = L_6;
		int32_t L_7 = V_0;
		if (L_7 == 0)
		{
			goto IL_0058;
		}
		if (L_7 == 1)
		{
			goto IL_0063;
		}
		if (L_7 == 2)
		{
			goto IL_006e;
		}
	}
	{
		goto IL_0079;
	}

IL_0058:
	{
		VirtActionInvoker0::Invoke(19 /* System.Void UnityEngine.UI.CanvasScaler::HandleConstantPixelSize() */, __this);
		goto IL_0079;
	}

IL_0063:
	{
		VirtActionInvoker0::Invoke(20 /* System.Void UnityEngine.UI.CanvasScaler::HandleScaleWithScreenSize() */, __this);
		goto IL_0079;
	}

IL_006e:
	{
		VirtActionInvoker0::Invoke(21 /* System.Void UnityEngine.UI.CanvasScaler::HandleConstantPhysicalSize() */, __this);
		goto IL_0079;
	}

IL_0079:
	{
		return;
	}
}
// System.Void UnityEngine.UI.CanvasScaler::HandleWorldCanvas()
extern "C" void CanvasScaler_HandleWorldCanvas_m3253 (CanvasScaler_t633 * __this, const MethodInfo* method)
{
	{
		float L_0 = (__this->___m_DynamicPixelsPerUnit_12);
		CanvasScaler_SetScaleFactor_m3257(__this, L_0, /*hidden argument*/NULL);
		float L_1 = (__this->___m_ReferencePixelsPerUnit_4);
		CanvasScaler_SetReferencePixelsPerUnit_m3258(__this, L_1, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.CanvasScaler::HandleConstantPixelSize()
extern "C" void CanvasScaler_HandleConstantPixelSize_m3254 (CanvasScaler_t633 * __this, const MethodInfo* method)
{
	{
		float L_0 = (__this->___m_ScaleFactor_5);
		CanvasScaler_SetScaleFactor_m3257(__this, L_0, /*hidden argument*/NULL);
		float L_1 = (__this->___m_ReferencePixelsPerUnit_4);
		CanvasScaler_SetReferencePixelsPerUnit_m3258(__this, L_1, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.CanvasScaler::HandleScaleWithScreenSize()
extern TypeInfo* Mathf_t134_il2cpp_TypeInfo_var;
extern "C" void CanvasScaler_HandleScaleWithScreenSize_m3255 (CanvasScaler_t633 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		Mathf_t134_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(1);
		s_Il2CppMethodIntialized = true;
	}
	Vector2_t6  V_0 = {0};
	float V_1 = 0.0f;
	float V_2 = 0.0f;
	float V_3 = 0.0f;
	float V_4 = 0.0f;
	int32_t V_5 = {0};
	{
		int32_t L_0 = Screen_get_width_m602(NULL /*static, unused*/, /*hidden argument*/NULL);
		int32_t L_1 = Screen_get_height_m688(NULL /*static, unused*/, /*hidden argument*/NULL);
		Vector2__ctor_m436((&V_0), (((float)((float)L_0))), (((float)((float)L_1))), /*hidden argument*/NULL);
		V_1 = (0.0f);
		int32_t L_2 = (__this->___m_ScreenMatchMode_7);
		V_5 = L_2;
		int32_t L_3 = V_5;
		if (L_3 == 0)
		{
			goto IL_0039;
		}
		if (L_3 == 1)
		{
			goto IL_0096;
		}
		if (L_3 == 2)
		{
			goto IL_00c7;
		}
	}
	{
		goto IL_00f8;
	}

IL_0039:
	{
		float L_4 = ((&V_0)->___x_1);
		Vector2_t6 * L_5 = &(__this->___m_ReferenceResolution_6);
		float L_6 = (L_5->___x_1);
		IL2CPP_RUNTIME_CLASS_INIT(Mathf_t134_il2cpp_TypeInfo_var);
		float L_7 = Mathf_Log_m1134(NULL /*static, unused*/, ((float)((float)L_4/(float)L_6)), (2.0f), /*hidden argument*/NULL);
		V_2 = L_7;
		float L_8 = ((&V_0)->___y_2);
		Vector2_t6 * L_9 = &(__this->___m_ReferenceResolution_6);
		float L_10 = (L_9->___y_2);
		float L_11 = Mathf_Log_m1134(NULL /*static, unused*/, ((float)((float)L_8/(float)L_10)), (2.0f), /*hidden argument*/NULL);
		V_3 = L_11;
		float L_12 = V_2;
		float L_13 = V_3;
		float L_14 = (__this->___m_MatchWidthOrHeight_8);
		float L_15 = Mathf_Lerp_m417(NULL /*static, unused*/, L_12, L_13, L_14, /*hidden argument*/NULL);
		V_4 = L_15;
		float L_16 = V_4;
		float L_17 = powf((2.0f), L_16);
		V_1 = L_17;
		goto IL_00f8;
	}

IL_0096:
	{
		float L_18 = ((&V_0)->___x_1);
		Vector2_t6 * L_19 = &(__this->___m_ReferenceResolution_6);
		float L_20 = (L_19->___x_1);
		float L_21 = ((&V_0)->___y_2);
		Vector2_t6 * L_22 = &(__this->___m_ReferenceResolution_6);
		float L_23 = (L_22->___y_2);
		IL2CPP_RUNTIME_CLASS_INIT(Mathf_t134_il2cpp_TypeInfo_var);
		float L_24 = Mathf_Min_m1130(NULL /*static, unused*/, ((float)((float)L_18/(float)L_20)), ((float)((float)L_21/(float)L_23)), /*hidden argument*/NULL);
		V_1 = L_24;
		goto IL_00f8;
	}

IL_00c7:
	{
		float L_25 = ((&V_0)->___x_1);
		Vector2_t6 * L_26 = &(__this->___m_ReferenceResolution_6);
		float L_27 = (L_26->___x_1);
		float L_28 = ((&V_0)->___y_2);
		Vector2_t6 * L_29 = &(__this->___m_ReferenceResolution_6);
		float L_30 = (L_29->___y_2);
		IL2CPP_RUNTIME_CLASS_INIT(Mathf_t134_il2cpp_TypeInfo_var);
		float L_31 = Mathf_Max_m682(NULL /*static, unused*/, ((float)((float)L_25/(float)L_27)), ((float)((float)L_28/(float)L_30)), /*hidden argument*/NULL);
		V_1 = L_31;
		goto IL_00f8;
	}

IL_00f8:
	{
		float L_32 = V_1;
		CanvasScaler_SetScaleFactor_m3257(__this, L_32, /*hidden argument*/NULL);
		float L_33 = (__this->___m_ReferencePixelsPerUnit_4);
		CanvasScaler_SetReferencePixelsPerUnit_m3258(__this, L_33, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.CanvasScaler::HandleConstantPhysicalSize()
extern "C" void CanvasScaler_HandleConstantPhysicalSize_m3256 (CanvasScaler_t633 * __this, const MethodInfo* method)
{
	float V_0 = 0.0f;
	float V_1 = 0.0f;
	float V_2 = 0.0f;
	int32_t V_3 = {0};
	float G_B3_0 = 0.0f;
	{
		float L_0 = Screen_get_dpi_m889(NULL /*static, unused*/, /*hidden argument*/NULL);
		V_0 = L_0;
		float L_1 = V_0;
		if ((!(((float)L_1) == ((float)(0.0f)))))
		{
			goto IL_001c;
		}
	}
	{
		float L_2 = (__this->___m_FallbackScreenDPI_10);
		G_B3_0 = L_2;
		goto IL_001d;
	}

IL_001c:
	{
		float L_3 = V_0;
		G_B3_0 = L_3;
	}

IL_001d:
	{
		V_1 = G_B3_0;
		V_2 = (1.0f);
		int32_t L_4 = (__this->___m_PhysicalUnit_9);
		V_3 = L_4;
		int32_t L_5 = V_3;
		if (L_5 == 0)
		{
			goto IL_004a;
		}
		if (L_5 == 1)
		{
			goto IL_0055;
		}
		if (L_5 == 2)
		{
			goto IL_0060;
		}
		if (L_5 == 3)
		{
			goto IL_006b;
		}
		if (L_5 == 4)
		{
			goto IL_0076;
		}
	}
	{
		goto IL_0081;
	}

IL_004a:
	{
		V_2 = (2.54f);
		goto IL_0081;
	}

IL_0055:
	{
		V_2 = (25.4f);
		goto IL_0081;
	}

IL_0060:
	{
		V_2 = (1.0f);
		goto IL_0081;
	}

IL_006b:
	{
		V_2 = (72.0f);
		goto IL_0081;
	}

IL_0076:
	{
		V_2 = (6.0f);
		goto IL_0081;
	}

IL_0081:
	{
		float L_6 = V_1;
		float L_7 = V_2;
		CanvasScaler_SetScaleFactor_m3257(__this, ((float)((float)L_6/(float)L_7)), /*hidden argument*/NULL);
		float L_8 = (__this->___m_ReferencePixelsPerUnit_4);
		float L_9 = V_2;
		float L_10 = (__this->___m_DefaultSpriteDPI_11);
		CanvasScaler_SetReferencePixelsPerUnit_m3258(__this, ((float)((float)((float)((float)L_8*(float)L_9))/(float)L_10)), /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.CanvasScaler::SetScaleFactor(System.Single)
extern "C" void CanvasScaler_SetScaleFactor_m3257 (CanvasScaler_t633 * __this, float ___scaleFactor, const MethodInfo* method)
{
	{
		float L_0 = ___scaleFactor;
		float L_1 = (__this->___m_PrevScaleFactor_14);
		if ((!(((float)L_0) == ((float)L_1))))
		{
			goto IL_000d;
		}
	}
	{
		return;
	}

IL_000d:
	{
		Canvas_t321 * L_2 = (__this->___m_Canvas_13);
		float L_3 = ___scaleFactor;
		NullCheck(L_2);
		Canvas_set_scaleFactor_m1705(L_2, L_3, /*hidden argument*/NULL);
		float L_4 = ___scaleFactor;
		__this->___m_PrevScaleFactor_14 = L_4;
		return;
	}
}
// System.Void UnityEngine.UI.CanvasScaler::SetReferencePixelsPerUnit(System.Single)
extern "C" void CanvasScaler_SetReferencePixelsPerUnit_m3258 (CanvasScaler_t633 * __this, float ___referencePixelsPerUnit, const MethodInfo* method)
{
	{
		float L_0 = ___referencePixelsPerUnit;
		float L_1 = (__this->___m_PrevReferencePixelsPerUnit_15);
		if ((!(((float)L_0) == ((float)L_1))))
		{
			goto IL_000d;
		}
	}
	{
		return;
	}

IL_000d:
	{
		Canvas_t321 * L_2 = (__this->___m_Canvas_13);
		float L_3 = ___referencePixelsPerUnit;
		NullCheck(L_2);
		Canvas_set_referencePixelsPerUnit_m1707(L_2, L_3, /*hidden argument*/NULL);
		float L_4 = ___referencePixelsPerUnit;
		__this->___m_PrevReferencePixelsPerUnit_15 = L_4;
		return;
	}
}
// System.Void UnityEngine.UI.ContentSizeFitter::.ctor()
extern "C" void ContentSizeFitter__ctor_m3259 (ContentSizeFitter_t635 * __this, const MethodInfo* method)
{
	{
		UIBehaviour__ctor_m2193(__this, /*hidden argument*/NULL);
		return;
	}
}
// UnityEngine.UI.ContentSizeFitter/FitMode UnityEngine.UI.ContentSizeFitter::get_horizontalFit()
extern "C" int32_t ContentSizeFitter_get_horizontalFit_m3260 (ContentSizeFitter_t635 * __this, const MethodInfo* method)
{
	{
		int32_t L_0 = (__this->___m_HorizontalFit_2);
		return L_0;
	}
}
// System.Void UnityEngine.UI.ContentSizeFitter::set_horizontalFit(UnityEngine.UI.ContentSizeFitter/FitMode)
extern const MethodInfo* SetPropertyUtility_SetStruct_TisFitMode_t634_m3652_MethodInfo_var;
extern "C" void ContentSizeFitter_set_horizontalFit_m3261 (ContentSizeFitter_t635 * __this, int32_t ___value, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		SetPropertyUtility_SetStruct_TisFitMode_t634_m3652_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483922);
		s_Il2CppMethodIntialized = true;
	}
	{
		int32_t* L_0 = &(__this->___m_HorizontalFit_2);
		int32_t L_1 = ___value;
		bool L_2 = SetPropertyUtility_SetStruct_TisFitMode_t634_m3652(NULL /*static, unused*/, L_0, L_1, /*hidden argument*/SetPropertyUtility_SetStruct_TisFitMode_t634_m3652_MethodInfo_var);
		if (!L_2)
		{
			goto IL_0017;
		}
	}
	{
		ContentSizeFitter_SetDirty_m3271(__this, /*hidden argument*/NULL);
	}

IL_0017:
	{
		return;
	}
}
// UnityEngine.UI.ContentSizeFitter/FitMode UnityEngine.UI.ContentSizeFitter::get_verticalFit()
extern "C" int32_t ContentSizeFitter_get_verticalFit_m3262 (ContentSizeFitter_t635 * __this, const MethodInfo* method)
{
	{
		int32_t L_0 = (__this->___m_VerticalFit_3);
		return L_0;
	}
}
// System.Void UnityEngine.UI.ContentSizeFitter::set_verticalFit(UnityEngine.UI.ContentSizeFitter/FitMode)
extern const MethodInfo* SetPropertyUtility_SetStruct_TisFitMode_t634_m3652_MethodInfo_var;
extern "C" void ContentSizeFitter_set_verticalFit_m3263 (ContentSizeFitter_t635 * __this, int32_t ___value, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		SetPropertyUtility_SetStruct_TisFitMode_t634_m3652_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483922);
		s_Il2CppMethodIntialized = true;
	}
	{
		int32_t* L_0 = &(__this->___m_VerticalFit_3);
		int32_t L_1 = ___value;
		bool L_2 = SetPropertyUtility_SetStruct_TisFitMode_t634_m3652(NULL /*static, unused*/, L_0, L_1, /*hidden argument*/SetPropertyUtility_SetStruct_TisFitMode_t634_m3652_MethodInfo_var);
		if (!L_2)
		{
			goto IL_0017;
		}
	}
	{
		ContentSizeFitter_SetDirty_m3271(__this, /*hidden argument*/NULL);
	}

IL_0017:
	{
		return;
	}
}
// UnityEngine.RectTransform UnityEngine.UI.ContentSizeFitter::get_rectTransform()
extern const MethodInfo* Component_GetComponent_TisRectTransform_t242_m3562_MethodInfo_var;
extern "C" RectTransform_t242 * ContentSizeFitter_get_rectTransform_m3264 (ContentSizeFitter_t635 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		Component_GetComponent_TisRectTransform_t242_m3562_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483849);
		s_Il2CppMethodIntialized = true;
	}
	{
		RectTransform_t242 * L_0 = (__this->___m_Rect_4);
		bool L_1 = Object_op_Equality_m445(NULL /*static, unused*/, L_0, (Object_t76 *)NULL, /*hidden argument*/NULL);
		if (!L_1)
		{
			goto IL_001d;
		}
	}
	{
		RectTransform_t242 * L_2 = Component_GetComponent_TisRectTransform_t242_m3562(__this, /*hidden argument*/Component_GetComponent_TisRectTransform_t242_m3562_MethodInfo_var);
		__this->___m_Rect_4 = L_2;
	}

IL_001d:
	{
		RectTransform_t242 * L_3 = (__this->___m_Rect_4);
		return L_3;
	}
}
// System.Void UnityEngine.UI.ContentSizeFitter::OnEnable()
extern "C" void ContentSizeFitter_OnEnable_m3265 (ContentSizeFitter_t635 * __this, const MethodInfo* method)
{
	{
		UIBehaviour_OnEnable_m2195(__this, /*hidden argument*/NULL);
		ContentSizeFitter_SetDirty_m3271(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.ContentSizeFitter::OnDisable()
extern TypeInfo* LayoutRebuilder_t645_il2cpp_TypeInfo_var;
extern "C" void ContentSizeFitter_OnDisable_m3266 (ContentSizeFitter_t635 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		LayoutRebuilder_t645_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(318);
		s_Il2CppMethodIntialized = true;
	}
	{
		DrivenRectTransformTracker_t238 * L_0 = &(__this->___m_Tracker_5);
		DrivenRectTransformTracker_Clear_m1144(L_0, /*hidden argument*/NULL);
		RectTransform_t242 * L_1 = ContentSizeFitter_get_rectTransform_m3264(__this, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		LayoutRebuilder_MarkLayoutForRebuild_m3368(NULL /*static, unused*/, L_1, /*hidden argument*/NULL);
		UIBehaviour_OnDisable_m2197(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.ContentSizeFitter::OnRectTransformDimensionsChange()
extern "C" void ContentSizeFitter_OnRectTransformDimensionsChange_m3267 (ContentSizeFitter_t635 * __this, const MethodInfo* method)
{
	{
		ContentSizeFitter_SetDirty_m3271(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.ContentSizeFitter::HandleSelfFittingAlongAxis(System.Int32)
extern "C" void ContentSizeFitter_HandleSelfFittingAlongAxis_m3268 (ContentSizeFitter_t635 * __this, int32_t ___axis, const MethodInfo* method)
{
	int32_t V_0 = {0};
	int32_t G_B3_0 = {0};
	RectTransform_t242 * G_B7_0 = {0};
	ContentSizeFitter_t635 * G_B7_1 = {0};
	DrivenRectTransformTracker_t238 * G_B7_2 = {0};
	RectTransform_t242 * G_B6_0 = {0};
	ContentSizeFitter_t635 * G_B6_1 = {0};
	DrivenRectTransformTracker_t238 * G_B6_2 = {0};
	int32_t G_B8_0 = 0;
	RectTransform_t242 * G_B8_1 = {0};
	ContentSizeFitter_t635 * G_B8_2 = {0};
	DrivenRectTransformTracker_t238 * G_B8_3 = {0};
	{
		int32_t L_0 = ___axis;
		if (L_0)
		{
			goto IL_0011;
		}
	}
	{
		int32_t L_1 = ContentSizeFitter_get_horizontalFit_m3260(__this, /*hidden argument*/NULL);
		G_B3_0 = L_1;
		goto IL_0017;
	}

IL_0011:
	{
		int32_t L_2 = ContentSizeFitter_get_verticalFit_m3262(__this, /*hidden argument*/NULL);
		G_B3_0 = L_2;
	}

IL_0017:
	{
		V_0 = G_B3_0;
		int32_t L_3 = V_0;
		if (L_3)
		{
			goto IL_001f;
		}
	}
	{
		return;
	}

IL_001f:
	{
		DrivenRectTransformTracker_t238 * L_4 = &(__this->___m_Tracker_5);
		RectTransform_t242 * L_5 = ContentSizeFitter_get_rectTransform_m3264(__this, /*hidden argument*/NULL);
		int32_t L_6 = ___axis;
		G_B6_0 = L_5;
		G_B6_1 = __this;
		G_B6_2 = L_4;
		if (L_6)
		{
			G_B7_0 = L_5;
			G_B7_1 = __this;
			G_B7_2 = L_4;
			goto IL_003c;
		}
	}
	{
		G_B8_0 = ((int32_t)4096);
		G_B8_1 = G_B6_0;
		G_B8_2 = G_B6_1;
		G_B8_3 = G_B6_2;
		goto IL_0041;
	}

IL_003c:
	{
		G_B8_0 = ((int32_t)8192);
		G_B8_1 = G_B7_0;
		G_B8_2 = G_B7_1;
		G_B8_3 = G_B7_2;
	}

IL_0041:
	{
		DrivenRectTransformTracker_Add_m1143(G_B8_3, G_B8_2, G_B8_1, G_B8_0, /*hidden argument*/NULL);
		int32_t L_7 = V_0;
		if ((!(((uint32_t)L_7) == ((uint32_t)1))))
		{
			goto IL_006a;
		}
	}
	{
		RectTransform_t242 * L_8 = ContentSizeFitter_get_rectTransform_m3264(__this, /*hidden argument*/NULL);
		int32_t L_9 = ___axis;
		RectTransform_t242 * L_10 = (__this->___m_Rect_4);
		int32_t L_11 = ___axis;
		float L_12 = LayoutUtility_GetMinSize_m3383(NULL /*static, unused*/, L_10, L_11, /*hidden argument*/NULL);
		NullCheck(L_8);
		RectTransform_SetSizeWithCurrentAnchors_m1177(L_8, L_9, L_12, /*hidden argument*/NULL);
		goto IL_0082;
	}

IL_006a:
	{
		RectTransform_t242 * L_13 = ContentSizeFitter_get_rectTransform_m3264(__this, /*hidden argument*/NULL);
		int32_t L_14 = ___axis;
		RectTransform_t242 * L_15 = (__this->___m_Rect_4);
		int32_t L_16 = ___axis;
		float L_17 = LayoutUtility_GetPreferredSize_m3384(NULL /*static, unused*/, L_15, L_16, /*hidden argument*/NULL);
		NullCheck(L_13);
		RectTransform_SetSizeWithCurrentAnchors_m1177(L_13, L_14, L_17, /*hidden argument*/NULL);
	}

IL_0082:
	{
		return;
	}
}
// System.Void UnityEngine.UI.ContentSizeFitter::SetLayoutHorizontal()
extern "C" void ContentSizeFitter_SetLayoutHorizontal_m3269 (ContentSizeFitter_t635 * __this, const MethodInfo* method)
{
	{
		DrivenRectTransformTracker_t238 * L_0 = &(__this->___m_Tracker_5);
		DrivenRectTransformTracker_Clear_m1144(L_0, /*hidden argument*/NULL);
		ContentSizeFitter_HandleSelfFittingAlongAxis_m3268(__this, 0, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.ContentSizeFitter::SetLayoutVertical()
extern "C" void ContentSizeFitter_SetLayoutVertical_m3270 (ContentSizeFitter_t635 * __this, const MethodInfo* method)
{
	{
		ContentSizeFitter_HandleSelfFittingAlongAxis_m3268(__this, 1, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.ContentSizeFitter::SetDirty()
extern TypeInfo* LayoutRebuilder_t645_il2cpp_TypeInfo_var;
extern "C" void ContentSizeFitter_SetDirty_m3271 (ContentSizeFitter_t635 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		LayoutRebuilder_t645_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(318);
		s_Il2CppMethodIntialized = true;
	}
	{
		bool L_0 = (bool)VirtFuncInvoker0< bool >::Invoke(9 /* System.Boolean UnityEngine.EventSystems.UIBehaviour::IsActive() */, __this);
		if (L_0)
		{
			goto IL_000c;
		}
	}
	{
		return;
	}

IL_000c:
	{
		RectTransform_t242 * L_1 = ContentSizeFitter_get_rectTransform_m3264(__this, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		LayoutRebuilder_MarkLayoutForRebuild_m3368(NULL /*static, unused*/, L_1, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.GridLayoutGroup::.ctor()
extern "C" void GridLayoutGroup__ctor_m3272 (GridLayoutGroup_t639 * __this, const MethodInfo* method)
{
	{
		Vector2_t6  L_0 = {0};
		Vector2__ctor_m436(&L_0, (100.0f), (100.0f), /*hidden argument*/NULL);
		__this->___m_CellSize_12 = L_0;
		Vector2_t6  L_1 = Vector2_get_zero_m539(NULL /*static, unused*/, /*hidden argument*/NULL);
		__this->___m_Spacing_13 = L_1;
		__this->___m_ConstraintCount_15 = 2;
		LayoutGroup__ctor_m3328(__this, /*hidden argument*/NULL);
		return;
	}
}
// UnityEngine.UI.GridLayoutGroup/Corner UnityEngine.UI.GridLayoutGroup::get_startCorner()
extern "C" int32_t GridLayoutGroup_get_startCorner_m3273 (GridLayoutGroup_t639 * __this, const MethodInfo* method)
{
	{
		int32_t L_0 = (__this->___m_StartCorner_10);
		return L_0;
	}
}
// System.Void UnityEngine.UI.GridLayoutGroup::set_startCorner(UnityEngine.UI.GridLayoutGroup/Corner)
extern const MethodInfo* LayoutGroup_SetProperty_TisCorner_t636_m3653_MethodInfo_var;
extern "C" void GridLayoutGroup_set_startCorner_m3274 (GridLayoutGroup_t639 * __this, int32_t ___value, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		LayoutGroup_SetProperty_TisCorner_t636_m3653_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483923);
		s_Il2CppMethodIntialized = true;
	}
	{
		int32_t* L_0 = &(__this->___m_StartCorner_10);
		int32_t L_1 = ___value;
		LayoutGroup_SetProperty_TisCorner_t636_m3653(__this, L_0, L_1, /*hidden argument*/LayoutGroup_SetProperty_TisCorner_t636_m3653_MethodInfo_var);
		return;
	}
}
// UnityEngine.UI.GridLayoutGroup/Axis UnityEngine.UI.GridLayoutGroup::get_startAxis()
extern "C" int32_t GridLayoutGroup_get_startAxis_m3275 (GridLayoutGroup_t639 * __this, const MethodInfo* method)
{
	{
		int32_t L_0 = (__this->___m_StartAxis_11);
		return L_0;
	}
}
// System.Void UnityEngine.UI.GridLayoutGroup::set_startAxis(UnityEngine.UI.GridLayoutGroup/Axis)
extern const MethodInfo* LayoutGroup_SetProperty_TisAxis_t637_m3654_MethodInfo_var;
extern "C" void GridLayoutGroup_set_startAxis_m3276 (GridLayoutGroup_t639 * __this, int32_t ___value, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		LayoutGroup_SetProperty_TisAxis_t637_m3654_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483924);
		s_Il2CppMethodIntialized = true;
	}
	{
		int32_t* L_0 = &(__this->___m_StartAxis_11);
		int32_t L_1 = ___value;
		LayoutGroup_SetProperty_TisAxis_t637_m3654(__this, L_0, L_1, /*hidden argument*/LayoutGroup_SetProperty_TisAxis_t637_m3654_MethodInfo_var);
		return;
	}
}
// UnityEngine.Vector2 UnityEngine.UI.GridLayoutGroup::get_cellSize()
extern "C" Vector2_t6  GridLayoutGroup_get_cellSize_m3277 (GridLayoutGroup_t639 * __this, const MethodInfo* method)
{
	{
		Vector2_t6  L_0 = (__this->___m_CellSize_12);
		return L_0;
	}
}
// System.Void UnityEngine.UI.GridLayoutGroup::set_cellSize(UnityEngine.Vector2)
extern const MethodInfo* LayoutGroup_SetProperty_TisVector2_t6_m3655_MethodInfo_var;
extern "C" void GridLayoutGroup_set_cellSize_m3278 (GridLayoutGroup_t639 * __this, Vector2_t6  ___value, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		LayoutGroup_SetProperty_TisVector2_t6_m3655_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483925);
		s_Il2CppMethodIntialized = true;
	}
	{
		Vector2_t6 * L_0 = &(__this->___m_CellSize_12);
		Vector2_t6  L_1 = ___value;
		LayoutGroup_SetProperty_TisVector2_t6_m3655(__this, L_0, L_1, /*hidden argument*/LayoutGroup_SetProperty_TisVector2_t6_m3655_MethodInfo_var);
		return;
	}
}
// UnityEngine.Vector2 UnityEngine.UI.GridLayoutGroup::get_spacing()
extern "C" Vector2_t6  GridLayoutGroup_get_spacing_m3279 (GridLayoutGroup_t639 * __this, const MethodInfo* method)
{
	{
		Vector2_t6  L_0 = (__this->___m_Spacing_13);
		return L_0;
	}
}
// System.Void UnityEngine.UI.GridLayoutGroup::set_spacing(UnityEngine.Vector2)
extern const MethodInfo* LayoutGroup_SetProperty_TisVector2_t6_m3655_MethodInfo_var;
extern "C" void GridLayoutGroup_set_spacing_m3280 (GridLayoutGroup_t639 * __this, Vector2_t6  ___value, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		LayoutGroup_SetProperty_TisVector2_t6_m3655_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483925);
		s_Il2CppMethodIntialized = true;
	}
	{
		Vector2_t6 * L_0 = &(__this->___m_Spacing_13);
		Vector2_t6  L_1 = ___value;
		LayoutGroup_SetProperty_TisVector2_t6_m3655(__this, L_0, L_1, /*hidden argument*/LayoutGroup_SetProperty_TisVector2_t6_m3655_MethodInfo_var);
		return;
	}
}
// UnityEngine.UI.GridLayoutGroup/Constraint UnityEngine.UI.GridLayoutGroup::get_constraint()
extern "C" int32_t GridLayoutGroup_get_constraint_m3281 (GridLayoutGroup_t639 * __this, const MethodInfo* method)
{
	{
		int32_t L_0 = (__this->___m_Constraint_14);
		return L_0;
	}
}
// System.Void UnityEngine.UI.GridLayoutGroup::set_constraint(UnityEngine.UI.GridLayoutGroup/Constraint)
extern const MethodInfo* LayoutGroup_SetProperty_TisConstraint_t638_m3656_MethodInfo_var;
extern "C" void GridLayoutGroup_set_constraint_m3282 (GridLayoutGroup_t639 * __this, int32_t ___value, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		LayoutGroup_SetProperty_TisConstraint_t638_m3656_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483926);
		s_Il2CppMethodIntialized = true;
	}
	{
		int32_t* L_0 = &(__this->___m_Constraint_14);
		int32_t L_1 = ___value;
		LayoutGroup_SetProperty_TisConstraint_t638_m3656(__this, L_0, L_1, /*hidden argument*/LayoutGroup_SetProperty_TisConstraint_t638_m3656_MethodInfo_var);
		return;
	}
}
// System.Int32 UnityEngine.UI.GridLayoutGroup::get_constraintCount()
extern "C" int32_t GridLayoutGroup_get_constraintCount_m3283 (GridLayoutGroup_t639 * __this, const MethodInfo* method)
{
	{
		int32_t L_0 = (__this->___m_ConstraintCount_15);
		return L_0;
	}
}
// System.Void UnityEngine.UI.GridLayoutGroup::set_constraintCount(System.Int32)
extern TypeInfo* Mathf_t134_il2cpp_TypeInfo_var;
extern const MethodInfo* LayoutGroup_SetProperty_TisInt32_t161_m3657_MethodInfo_var;
extern "C" void GridLayoutGroup_set_constraintCount_m3284 (GridLayoutGroup_t639 * __this, int32_t ___value, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		Mathf_t134_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(1);
		LayoutGroup_SetProperty_TisInt32_t161_m3657_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483927);
		s_Il2CppMethodIntialized = true;
	}
	{
		int32_t* L_0 = &(__this->___m_ConstraintCount_15);
		int32_t L_1 = ___value;
		IL2CPP_RUNTIME_CLASS_INIT(Mathf_t134_il2cpp_TypeInfo_var);
		int32_t L_2 = Mathf_Max_m1132(NULL /*static, unused*/, 1, L_1, /*hidden argument*/NULL);
		LayoutGroup_SetProperty_TisInt32_t161_m3657(__this, L_0, L_2, /*hidden argument*/LayoutGroup_SetProperty_TisInt32_t161_m3657_MethodInfo_var);
		return;
	}
}
// System.Void UnityEngine.UI.GridLayoutGroup::CalculateLayoutInputHorizontal()
extern TypeInfo* Mathf_t134_il2cpp_TypeInfo_var;
extern "C" void GridLayoutGroup_CalculateLayoutInputHorizontal_m3285 (GridLayoutGroup_t639 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		Mathf_t134_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(1);
		s_Il2CppMethodIntialized = true;
	}
	int32_t V_0 = 0;
	int32_t V_1 = 0;
	Vector2_t6  V_2 = {0};
	Vector2_t6  V_3 = {0};
	Vector2_t6  V_4 = {0};
	Vector2_t6  V_5 = {0};
	Vector2_t6  V_6 = {0};
	Vector2_t6  V_7 = {0};
	{
		LayoutGroup_CalculateLayoutInputHorizontal_m3335(__this, /*hidden argument*/NULL);
		V_0 = 0;
		V_1 = 0;
		int32_t L_0 = (__this->___m_Constraint_14);
		if ((!(((uint32_t)L_0) == ((uint32_t)1))))
		{
			goto IL_0024;
		}
	}
	{
		int32_t L_1 = (__this->___m_ConstraintCount_15);
		int32_t L_2 = L_1;
		V_1 = L_2;
		V_0 = L_2;
		goto IL_0070;
	}

IL_0024:
	{
		int32_t L_3 = (__this->___m_Constraint_14);
		if ((!(((uint32_t)L_3) == ((uint32_t)2))))
		{
			goto IL_0057;
		}
	}
	{
		List_1_t644 * L_4 = LayoutGroup_get_rectChildren_m3334(__this, /*hidden argument*/NULL);
		NullCheck(L_4);
		int32_t L_5 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.RectTransform>::get_Count() */, L_4);
		int32_t L_6 = (__this->___m_ConstraintCount_15);
		IL2CPP_RUNTIME_CLASS_INIT(Mathf_t134_il2cpp_TypeInfo_var);
		int32_t L_7 = Mathf_CeilToInt_m1137(NULL /*static, unused*/, ((float)((float)((float)((float)(((float)((float)L_5)))/(float)(((float)((float)L_6)))))-(float)(0.001f))), /*hidden argument*/NULL);
		int32_t L_8 = L_7;
		V_1 = L_8;
		V_0 = L_8;
		goto IL_0070;
	}

IL_0057:
	{
		V_0 = 1;
		List_1_t644 * L_9 = LayoutGroup_get_rectChildren_m3334(__this, /*hidden argument*/NULL);
		NullCheck(L_9);
		int32_t L_10 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.RectTransform>::get_Count() */, L_9);
		IL2CPP_RUNTIME_CLASS_INIT(Mathf_t134_il2cpp_TypeInfo_var);
		float L_11 = sqrtf((((float)((float)L_10))));
		int32_t L_12 = Mathf_CeilToInt_m1137(NULL /*static, unused*/, L_11, /*hidden argument*/NULL);
		V_1 = L_12;
	}

IL_0070:
	{
		RectOffset_t333 * L_13 = LayoutGroup_get_padding_m3329(__this, /*hidden argument*/NULL);
		NullCheck(L_13);
		int32_t L_14 = RectOffset_get_horizontal_m1795(L_13, /*hidden argument*/NULL);
		Vector2_t6  L_15 = GridLayoutGroup_get_cellSize_m3277(__this, /*hidden argument*/NULL);
		V_2 = L_15;
		float L_16 = ((&V_2)->___x_1);
		Vector2_t6  L_17 = GridLayoutGroup_get_spacing_m3279(__this, /*hidden argument*/NULL);
		V_3 = L_17;
		float L_18 = ((&V_3)->___x_1);
		int32_t L_19 = V_0;
		Vector2_t6  L_20 = GridLayoutGroup_get_spacing_m3279(__this, /*hidden argument*/NULL);
		V_4 = L_20;
		float L_21 = ((&V_4)->___x_1);
		RectOffset_t333 * L_22 = LayoutGroup_get_padding_m3329(__this, /*hidden argument*/NULL);
		NullCheck(L_22);
		int32_t L_23 = RectOffset_get_horizontal_m1795(L_22, /*hidden argument*/NULL);
		Vector2_t6  L_24 = GridLayoutGroup_get_cellSize_m3277(__this, /*hidden argument*/NULL);
		V_5 = L_24;
		float L_25 = ((&V_5)->___x_1);
		Vector2_t6  L_26 = GridLayoutGroup_get_spacing_m3279(__this, /*hidden argument*/NULL);
		V_6 = L_26;
		float L_27 = ((&V_6)->___x_1);
		int32_t L_28 = V_1;
		Vector2_t6  L_29 = GridLayoutGroup_get_spacing_m3279(__this, /*hidden argument*/NULL);
		V_7 = L_29;
		float L_30 = ((&V_7)->___x_1);
		LayoutGroup_SetLayoutInputForAxis_m3350(__this, ((float)((float)((float)((float)(((float)((float)L_14)))+(float)((float)((float)((float)((float)L_16+(float)L_18))*(float)(((float)((float)L_19)))))))-(float)L_21)), ((float)((float)((float)((float)(((float)((float)L_23)))+(float)((float)((float)((float)((float)L_25+(float)L_27))*(float)(((float)((float)L_28)))))))-(float)L_30)), (-1.0f), 0, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.GridLayoutGroup::CalculateLayoutInputVertical()
extern TypeInfo* Mathf_t134_il2cpp_TypeInfo_var;
extern "C" void GridLayoutGroup_CalculateLayoutInputVertical_m3286 (GridLayoutGroup_t639 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		Mathf_t134_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(1);
		s_Il2CppMethodIntialized = true;
	}
	int32_t V_0 = 0;
	float V_1 = 0.0f;
	int32_t V_2 = 0;
	float V_3 = 0.0f;
	Rect_t232  V_4 = {0};
	Vector2_t6  V_5 = {0};
	Vector2_t6  V_6 = {0};
	Vector2_t6  V_7 = {0};
	Vector2_t6  V_8 = {0};
	Vector2_t6  V_9 = {0};
	Vector2_t6  V_10 = {0};
	Vector2_t6  V_11 = {0};
	{
		V_0 = 0;
		int32_t L_0 = (__this->___m_Constraint_14);
		if ((!(((uint32_t)L_0) == ((uint32_t)1))))
		{
			goto IL_0033;
		}
	}
	{
		List_1_t644 * L_1 = LayoutGroup_get_rectChildren_m3334(__this, /*hidden argument*/NULL);
		NullCheck(L_1);
		int32_t L_2 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.RectTransform>::get_Count() */, L_1);
		int32_t L_3 = (__this->___m_ConstraintCount_15);
		IL2CPP_RUNTIME_CLASS_INIT(Mathf_t134_il2cpp_TypeInfo_var);
		int32_t L_4 = Mathf_CeilToInt_m1137(NULL /*static, unused*/, ((float)((float)((float)((float)(((float)((float)L_2)))/(float)(((float)((float)L_3)))))-(float)(0.001f))), /*hidden argument*/NULL);
		V_0 = L_4;
		goto IL_00ce;
	}

IL_0033:
	{
		int32_t L_5 = (__this->___m_Constraint_14);
		if ((!(((uint32_t)L_5) == ((uint32_t)2))))
		{
			goto IL_004b;
		}
	}
	{
		int32_t L_6 = (__this->___m_ConstraintCount_15);
		V_0 = L_6;
		goto IL_00ce;
	}

IL_004b:
	{
		RectTransform_t242 * L_7 = LayoutGroup_get_rectTransform_m3333(__this, /*hidden argument*/NULL);
		NullCheck(L_7);
		Rect_t232  L_8 = RectTransform_get_rect_m1151(L_7, /*hidden argument*/NULL);
		V_4 = L_8;
		Vector2_t6  L_9 = Rect_get_size_m1020((&V_4), /*hidden argument*/NULL);
		V_5 = L_9;
		float L_10 = ((&V_5)->___x_1);
		V_1 = L_10;
		float L_11 = V_1;
		RectOffset_t333 * L_12 = LayoutGroup_get_padding_m3329(__this, /*hidden argument*/NULL);
		NullCheck(L_12);
		int32_t L_13 = RectOffset_get_horizontal_m1795(L_12, /*hidden argument*/NULL);
		Vector2_t6  L_14 = GridLayoutGroup_get_spacing_m3279(__this, /*hidden argument*/NULL);
		V_6 = L_14;
		float L_15 = ((&V_6)->___x_1);
		Vector2_t6  L_16 = GridLayoutGroup_get_cellSize_m3277(__this, /*hidden argument*/NULL);
		V_7 = L_16;
		float L_17 = ((&V_7)->___x_1);
		Vector2_t6  L_18 = GridLayoutGroup_get_spacing_m3279(__this, /*hidden argument*/NULL);
		V_8 = L_18;
		float L_19 = ((&V_8)->___x_1);
		IL2CPP_RUNTIME_CLASS_INIT(Mathf_t134_il2cpp_TypeInfo_var);
		int32_t L_20 = Mathf_FloorToInt_m1138(NULL /*static, unused*/, ((float)((float)((float)((float)((float)((float)((float)((float)L_11-(float)(((float)((float)L_13)))))+(float)L_15))+(float)(0.001f)))/(float)((float)((float)L_17+(float)L_19)))), /*hidden argument*/NULL);
		int32_t L_21 = Mathf_Max_m1132(NULL /*static, unused*/, 1, L_20, /*hidden argument*/NULL);
		V_2 = L_21;
		List_1_t644 * L_22 = LayoutGroup_get_rectChildren_m3334(__this, /*hidden argument*/NULL);
		NullCheck(L_22);
		int32_t L_23 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.RectTransform>::get_Count() */, L_22);
		int32_t L_24 = V_2;
		int32_t L_25 = Mathf_CeilToInt_m1137(NULL /*static, unused*/, ((float)((float)(((float)((float)L_23)))/(float)(((float)((float)L_24))))), /*hidden argument*/NULL);
		V_0 = L_25;
	}

IL_00ce:
	{
		RectOffset_t333 * L_26 = LayoutGroup_get_padding_m3329(__this, /*hidden argument*/NULL);
		NullCheck(L_26);
		int32_t L_27 = RectOffset_get_vertical_m1796(L_26, /*hidden argument*/NULL);
		Vector2_t6  L_28 = GridLayoutGroup_get_cellSize_m3277(__this, /*hidden argument*/NULL);
		V_9 = L_28;
		float L_29 = ((&V_9)->___y_2);
		Vector2_t6  L_30 = GridLayoutGroup_get_spacing_m3279(__this, /*hidden argument*/NULL);
		V_10 = L_30;
		float L_31 = ((&V_10)->___y_2);
		int32_t L_32 = V_0;
		Vector2_t6  L_33 = GridLayoutGroup_get_spacing_m3279(__this, /*hidden argument*/NULL);
		V_11 = L_33;
		float L_34 = ((&V_11)->___y_2);
		V_3 = ((float)((float)((float)((float)(((float)((float)L_27)))+(float)((float)((float)((float)((float)L_29+(float)L_31))*(float)(((float)((float)L_32)))))))-(float)L_34));
		float L_35 = V_3;
		float L_36 = V_3;
		LayoutGroup_SetLayoutInputForAxis_m3350(__this, L_35, L_36, (-1.0f), 1, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.GridLayoutGroup::SetLayoutHorizontal()
extern "C" void GridLayoutGroup_SetLayoutHorizontal_m3287 (GridLayoutGroup_t639 * __this, const MethodInfo* method)
{
	{
		GridLayoutGroup_SetCellsAlongAxis_m3289(__this, 0, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.GridLayoutGroup::SetLayoutVertical()
extern "C" void GridLayoutGroup_SetLayoutVertical_m3288 (GridLayoutGroup_t639 * __this, const MethodInfo* method)
{
	{
		GridLayoutGroup_SetCellsAlongAxis_m3289(__this, 1, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.GridLayoutGroup::SetCellsAlongAxis(System.Int32)
extern TypeInfo* Mathf_t134_il2cpp_TypeInfo_var;
extern "C" void GridLayoutGroup_SetCellsAlongAxis_m3289 (GridLayoutGroup_t639 * __this, int32_t ___axis, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		Mathf_t134_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(1);
		s_Il2CppMethodIntialized = true;
	}
	int32_t V_0 = 0;
	RectTransform_t242 * V_1 = {0};
	float V_2 = 0.0f;
	float V_3 = 0.0f;
	int32_t V_4 = 0;
	int32_t V_5 = 0;
	int32_t V_6 = 0;
	int32_t V_7 = 0;
	int32_t V_8 = 0;
	int32_t V_9 = 0;
	int32_t V_10 = 0;
	Vector2_t6  V_11 = {0};
	Vector2_t6  V_12 = {0};
	int32_t V_13 = 0;
	int32_t V_14 = 0;
	int32_t V_15 = 0;
	Rect_t232  V_16 = {0};
	Vector2_t6  V_17 = {0};
	Rect_t232  V_18 = {0};
	Vector2_t6  V_19 = {0};
	Vector2_t6  V_20 = {0};
	Vector2_t6  V_21 = {0};
	Vector2_t6  V_22 = {0};
	Vector2_t6  V_23 = {0};
	Vector2_t6  V_24 = {0};
	Vector2_t6  V_25 = {0};
	Vector2_t6  V_26 = {0};
	Vector2_t6  V_27 = {0};
	Vector2_t6  V_28 = {0};
	Vector2_t6  V_29 = {0};
	Vector2_t6  V_30 = {0};
	Vector2_t6  V_31 = {0};
	Vector2_t6  V_32 = {0};
	Vector2_t6  V_33 = {0};
	Vector2_t6  V_34 = {0};
	Vector2_t6  V_35 = {0};
	Vector2_t6  V_36 = {0};
	Vector2_t6  V_37 = {0};
	Vector2_t6  V_38 = {0};
	Vector2_t6  V_39 = {0};
	{
		int32_t L_0 = ___axis;
		if (L_0)
		{
			goto IL_0064;
		}
	}
	{
		V_0 = 0;
		goto IL_0052;
	}

IL_000d:
	{
		List_1_t644 * L_1 = LayoutGroup_get_rectChildren_m3334(__this, /*hidden argument*/NULL);
		int32_t L_2 = V_0;
		NullCheck(L_1);
		RectTransform_t242 * L_3 = (RectTransform_t242 *)VirtFuncInvoker1< RectTransform_t242 *, int32_t >::Invoke(31 /* !0 System.Collections.Generic.List`1<UnityEngine.RectTransform>::get_Item(System.Int32) */, L_1, L_2);
		V_1 = L_3;
		DrivenRectTransformTracker_t238 * L_4 = &(((LayoutGroup_t640 *)__this)->___m_Tracker_5);
		RectTransform_t242 * L_5 = V_1;
		DrivenRectTransformTracker_Add_m1143(L_4, __this, L_5, ((int32_t)16134), /*hidden argument*/NULL);
		RectTransform_t242 * L_6 = V_1;
		Vector2_t6  L_7 = Vector2_get_up_m953(NULL /*static, unused*/, /*hidden argument*/NULL);
		NullCheck(L_6);
		RectTransform_set_anchorMin_m1154(L_6, L_7, /*hidden argument*/NULL);
		RectTransform_t242 * L_8 = V_1;
		Vector2_t6  L_9 = Vector2_get_up_m953(NULL /*static, unused*/, /*hidden argument*/NULL);
		NullCheck(L_8);
		RectTransform_set_anchorMax_m1158(L_8, L_9, /*hidden argument*/NULL);
		RectTransform_t242 * L_10 = V_1;
		Vector2_t6  L_11 = GridLayoutGroup_get_cellSize_m3277(__this, /*hidden argument*/NULL);
		NullCheck(L_10);
		RectTransform_set_sizeDelta_m1166(L_10, L_11, /*hidden argument*/NULL);
		int32_t L_12 = V_0;
		V_0 = ((int32_t)((int32_t)L_12+(int32_t)1));
	}

IL_0052:
	{
		int32_t L_13 = V_0;
		List_1_t644 * L_14 = LayoutGroup_get_rectChildren_m3334(__this, /*hidden argument*/NULL);
		NullCheck(L_14);
		int32_t L_15 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.RectTransform>::get_Count() */, L_14);
		if ((((int32_t)L_13) < ((int32_t)L_15)))
		{
			goto IL_000d;
		}
	}
	{
		return;
	}

IL_0064:
	{
		RectTransform_t242 * L_16 = LayoutGroup_get_rectTransform_m3333(__this, /*hidden argument*/NULL);
		NullCheck(L_16);
		Rect_t232  L_17 = RectTransform_get_rect_m1151(L_16, /*hidden argument*/NULL);
		V_16 = L_17;
		Vector2_t6  L_18 = Rect_get_size_m1020((&V_16), /*hidden argument*/NULL);
		V_17 = L_18;
		float L_19 = ((&V_17)->___x_1);
		V_2 = L_19;
		RectTransform_t242 * L_20 = LayoutGroup_get_rectTransform_m3333(__this, /*hidden argument*/NULL);
		NullCheck(L_20);
		Rect_t232  L_21 = RectTransform_get_rect_m1151(L_20, /*hidden argument*/NULL);
		V_18 = L_21;
		Vector2_t6  L_22 = Rect_get_size_m1020((&V_18), /*hidden argument*/NULL);
		V_19 = L_22;
		float L_23 = ((&V_19)->___y_2);
		V_3 = L_23;
		V_4 = 1;
		V_5 = 1;
		int32_t L_24 = (__this->___m_Constraint_14);
		if ((!(((uint32_t)L_24) == ((uint32_t)1))))
		{
			goto IL_00dc;
		}
	}
	{
		int32_t L_25 = (__this->___m_ConstraintCount_15);
		V_4 = L_25;
		List_1_t644 * L_26 = LayoutGroup_get_rectChildren_m3334(__this, /*hidden argument*/NULL);
		NullCheck(L_26);
		int32_t L_27 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.RectTransform>::get_Count() */, L_26);
		int32_t L_28 = V_4;
		IL2CPP_RUNTIME_CLASS_INIT(Mathf_t134_il2cpp_TypeInfo_var);
		int32_t L_29 = Mathf_CeilToInt_m1137(NULL /*static, unused*/, ((float)((float)((float)((float)(((float)((float)L_27)))/(float)(((float)((float)L_28)))))-(float)(0.001f))), /*hidden argument*/NULL);
		V_5 = L_29;
		goto IL_021e;
	}

IL_00dc:
	{
		int32_t L_30 = (__this->___m_Constraint_14);
		if ((!(((uint32_t)L_30) == ((uint32_t)2))))
		{
			goto IL_0112;
		}
	}
	{
		int32_t L_31 = (__this->___m_ConstraintCount_15);
		V_5 = L_31;
		List_1_t644 * L_32 = LayoutGroup_get_rectChildren_m3334(__this, /*hidden argument*/NULL);
		NullCheck(L_32);
		int32_t L_33 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.RectTransform>::get_Count() */, L_32);
		int32_t L_34 = V_5;
		IL2CPP_RUNTIME_CLASS_INIT(Mathf_t134_il2cpp_TypeInfo_var);
		int32_t L_35 = Mathf_CeilToInt_m1137(NULL /*static, unused*/, ((float)((float)((float)((float)(((float)((float)L_33)))/(float)(((float)((float)L_34)))))-(float)(0.001f))), /*hidden argument*/NULL);
		V_4 = L_35;
		goto IL_021e;
	}

IL_0112:
	{
		Vector2_t6  L_36 = GridLayoutGroup_get_cellSize_m3277(__this, /*hidden argument*/NULL);
		V_20 = L_36;
		float L_37 = ((&V_20)->___x_1);
		Vector2_t6  L_38 = GridLayoutGroup_get_spacing_m3279(__this, /*hidden argument*/NULL);
		V_21 = L_38;
		float L_39 = ((&V_21)->___x_1);
		if ((!(((float)((float)((float)L_37+(float)L_39))) <= ((float)(0.0f)))))
		{
			goto IL_0147;
		}
	}
	{
		V_4 = ((int32_t)2147483647);
		goto IL_0198;
	}

IL_0147:
	{
		float L_40 = V_2;
		RectOffset_t333 * L_41 = LayoutGroup_get_padding_m3329(__this, /*hidden argument*/NULL);
		NullCheck(L_41);
		int32_t L_42 = RectOffset_get_horizontal_m1795(L_41, /*hidden argument*/NULL);
		Vector2_t6  L_43 = GridLayoutGroup_get_spacing_m3279(__this, /*hidden argument*/NULL);
		V_22 = L_43;
		float L_44 = ((&V_22)->___x_1);
		Vector2_t6  L_45 = GridLayoutGroup_get_cellSize_m3277(__this, /*hidden argument*/NULL);
		V_23 = L_45;
		float L_46 = ((&V_23)->___x_1);
		Vector2_t6  L_47 = GridLayoutGroup_get_spacing_m3279(__this, /*hidden argument*/NULL);
		V_24 = L_47;
		float L_48 = ((&V_24)->___x_1);
		IL2CPP_RUNTIME_CLASS_INIT(Mathf_t134_il2cpp_TypeInfo_var);
		int32_t L_49 = Mathf_FloorToInt_m1138(NULL /*static, unused*/, ((float)((float)((float)((float)((float)((float)((float)((float)L_40-(float)(((float)((float)L_42)))))+(float)L_44))+(float)(0.001f)))/(float)((float)((float)L_46+(float)L_48)))), /*hidden argument*/NULL);
		int32_t L_50 = Mathf_Max_m1132(NULL /*static, unused*/, 1, L_49, /*hidden argument*/NULL);
		V_4 = L_50;
	}

IL_0198:
	{
		Vector2_t6  L_51 = GridLayoutGroup_get_cellSize_m3277(__this, /*hidden argument*/NULL);
		V_25 = L_51;
		float L_52 = ((&V_25)->___y_2);
		Vector2_t6  L_53 = GridLayoutGroup_get_spacing_m3279(__this, /*hidden argument*/NULL);
		V_26 = L_53;
		float L_54 = ((&V_26)->___y_2);
		if ((!(((float)((float)((float)L_52+(float)L_54))) <= ((float)(0.0f)))))
		{
			goto IL_01cd;
		}
	}
	{
		V_5 = ((int32_t)2147483647);
		goto IL_021e;
	}

IL_01cd:
	{
		float L_55 = V_3;
		RectOffset_t333 * L_56 = LayoutGroup_get_padding_m3329(__this, /*hidden argument*/NULL);
		NullCheck(L_56);
		int32_t L_57 = RectOffset_get_vertical_m1796(L_56, /*hidden argument*/NULL);
		Vector2_t6  L_58 = GridLayoutGroup_get_spacing_m3279(__this, /*hidden argument*/NULL);
		V_27 = L_58;
		float L_59 = ((&V_27)->___y_2);
		Vector2_t6  L_60 = GridLayoutGroup_get_cellSize_m3277(__this, /*hidden argument*/NULL);
		V_28 = L_60;
		float L_61 = ((&V_28)->___y_2);
		Vector2_t6  L_62 = GridLayoutGroup_get_spacing_m3279(__this, /*hidden argument*/NULL);
		V_29 = L_62;
		float L_63 = ((&V_29)->___y_2);
		IL2CPP_RUNTIME_CLASS_INIT(Mathf_t134_il2cpp_TypeInfo_var);
		int32_t L_64 = Mathf_FloorToInt_m1138(NULL /*static, unused*/, ((float)((float)((float)((float)((float)((float)((float)((float)L_55-(float)(((float)((float)L_57)))))+(float)L_59))+(float)(0.001f)))/(float)((float)((float)L_61+(float)L_63)))), /*hidden argument*/NULL);
		int32_t L_65 = Mathf_Max_m1132(NULL /*static, unused*/, 1, L_64, /*hidden argument*/NULL);
		V_5 = L_65;
	}

IL_021e:
	{
		int32_t L_66 = GridLayoutGroup_get_startCorner_m3273(__this, /*hidden argument*/NULL);
		V_6 = ((int32_t)((int32_t)L_66%(int32_t)2));
		int32_t L_67 = GridLayoutGroup_get_startCorner_m3273(__this, /*hidden argument*/NULL);
		V_7 = ((int32_t)((int32_t)L_67/(int32_t)2));
		int32_t L_68 = GridLayoutGroup_get_startAxis_m3275(__this, /*hidden argument*/NULL);
		if (L_68)
		{
			goto IL_027a;
		}
	}
	{
		int32_t L_69 = V_4;
		V_8 = L_69;
		int32_t L_70 = V_4;
		List_1_t644 * L_71 = LayoutGroup_get_rectChildren_m3334(__this, /*hidden argument*/NULL);
		NullCheck(L_71);
		int32_t L_72 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.RectTransform>::get_Count() */, L_71);
		IL2CPP_RUNTIME_CLASS_INIT(Mathf_t134_il2cpp_TypeInfo_var);
		int32_t L_73 = Mathf_Clamp_m591(NULL /*static, unused*/, L_70, 1, L_72, /*hidden argument*/NULL);
		V_9 = L_73;
		int32_t L_74 = V_5;
		List_1_t644 * L_75 = LayoutGroup_get_rectChildren_m3334(__this, /*hidden argument*/NULL);
		NullCheck(L_75);
		int32_t L_76 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.RectTransform>::get_Count() */, L_75);
		int32_t L_77 = V_8;
		int32_t L_78 = Mathf_CeilToInt_m1137(NULL /*static, unused*/, ((float)((float)(((float)((float)L_76)))/(float)(((float)((float)L_77))))), /*hidden argument*/NULL);
		int32_t L_79 = Mathf_Clamp_m591(NULL /*static, unused*/, L_74, 1, L_78, /*hidden argument*/NULL);
		V_10 = L_79;
		goto IL_02b2;
	}

IL_027a:
	{
		int32_t L_80 = V_5;
		V_8 = L_80;
		int32_t L_81 = V_5;
		List_1_t644 * L_82 = LayoutGroup_get_rectChildren_m3334(__this, /*hidden argument*/NULL);
		NullCheck(L_82);
		int32_t L_83 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.RectTransform>::get_Count() */, L_82);
		IL2CPP_RUNTIME_CLASS_INIT(Mathf_t134_il2cpp_TypeInfo_var);
		int32_t L_84 = Mathf_Clamp_m591(NULL /*static, unused*/, L_81, 1, L_83, /*hidden argument*/NULL);
		V_10 = L_84;
		int32_t L_85 = V_4;
		List_1_t644 * L_86 = LayoutGroup_get_rectChildren_m3334(__this, /*hidden argument*/NULL);
		NullCheck(L_86);
		int32_t L_87 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.RectTransform>::get_Count() */, L_86);
		int32_t L_88 = V_8;
		int32_t L_89 = Mathf_CeilToInt_m1137(NULL /*static, unused*/, ((float)((float)(((float)((float)L_87)))/(float)(((float)((float)L_88))))), /*hidden argument*/NULL);
		int32_t L_90 = Mathf_Clamp_m591(NULL /*static, unused*/, L_85, 1, L_89, /*hidden argument*/NULL);
		V_9 = L_90;
	}

IL_02b2:
	{
		int32_t L_91 = V_9;
		Vector2_t6  L_92 = GridLayoutGroup_get_cellSize_m3277(__this, /*hidden argument*/NULL);
		V_30 = L_92;
		float L_93 = ((&V_30)->___x_1);
		int32_t L_94 = V_9;
		Vector2_t6  L_95 = GridLayoutGroup_get_spacing_m3279(__this, /*hidden argument*/NULL);
		V_31 = L_95;
		float L_96 = ((&V_31)->___x_1);
		int32_t L_97 = V_10;
		Vector2_t6  L_98 = GridLayoutGroup_get_cellSize_m3277(__this, /*hidden argument*/NULL);
		V_32 = L_98;
		float L_99 = ((&V_32)->___y_2);
		int32_t L_100 = V_10;
		Vector2_t6  L_101 = GridLayoutGroup_get_spacing_m3279(__this, /*hidden argument*/NULL);
		V_33 = L_101;
		float L_102 = ((&V_33)->___y_2);
		Vector2__ctor_m436((&V_11), ((float)((float)((float)((float)(((float)((float)L_91)))*(float)L_93))+(float)((float)((float)(((float)((float)((int32_t)((int32_t)L_94-(int32_t)1)))))*(float)L_96)))), ((float)((float)((float)((float)(((float)((float)L_97)))*(float)L_99))+(float)((float)((float)(((float)((float)((int32_t)((int32_t)L_100-(int32_t)1)))))*(float)L_102)))), /*hidden argument*/NULL);
		float L_103 = ((&V_11)->___x_1);
		float L_104 = LayoutGroup_GetStartOffset_m3349(__this, 0, L_103, /*hidden argument*/NULL);
		float L_105 = ((&V_11)->___y_2);
		float L_106 = LayoutGroup_GetStartOffset_m3349(__this, 1, L_105, /*hidden argument*/NULL);
		Vector2__ctor_m436((&V_12), L_104, L_106, /*hidden argument*/NULL);
		V_13 = 0;
		goto IL_042c;
	}

IL_0336:
	{
		int32_t L_107 = GridLayoutGroup_get_startAxis_m3275(__this, /*hidden argument*/NULL);
		if (L_107)
		{
			goto IL_0354;
		}
	}
	{
		int32_t L_108 = V_13;
		int32_t L_109 = V_8;
		V_14 = ((int32_t)((int32_t)L_108%(int32_t)L_109));
		int32_t L_110 = V_13;
		int32_t L_111 = V_8;
		V_15 = ((int32_t)((int32_t)L_110/(int32_t)L_111));
		goto IL_0362;
	}

IL_0354:
	{
		int32_t L_112 = V_13;
		int32_t L_113 = V_8;
		V_14 = ((int32_t)((int32_t)L_112/(int32_t)L_113));
		int32_t L_114 = V_13;
		int32_t L_115 = V_8;
		V_15 = ((int32_t)((int32_t)L_114%(int32_t)L_115));
	}

IL_0362:
	{
		int32_t L_116 = V_6;
		if ((!(((uint32_t)L_116) == ((uint32_t)1))))
		{
			goto IL_0373;
		}
	}
	{
		int32_t L_117 = V_9;
		int32_t L_118 = V_14;
		V_14 = ((int32_t)((int32_t)((int32_t)((int32_t)L_117-(int32_t)1))-(int32_t)L_118));
	}

IL_0373:
	{
		int32_t L_119 = V_7;
		if ((!(((uint32_t)L_119) == ((uint32_t)1))))
		{
			goto IL_0384;
		}
	}
	{
		int32_t L_120 = V_10;
		int32_t L_121 = V_15;
		V_15 = ((int32_t)((int32_t)((int32_t)((int32_t)L_120-(int32_t)1))-(int32_t)L_121));
	}

IL_0384:
	{
		List_1_t644 * L_122 = LayoutGroup_get_rectChildren_m3334(__this, /*hidden argument*/NULL);
		int32_t L_123 = V_13;
		NullCheck(L_122);
		RectTransform_t242 * L_124 = (RectTransform_t242 *)VirtFuncInvoker1< RectTransform_t242 *, int32_t >::Invoke(31 /* !0 System.Collections.Generic.List`1<UnityEngine.RectTransform>::get_Item(System.Int32) */, L_122, L_123);
		float L_125 = ((&V_12)->___x_1);
		Vector2_t6  L_126 = GridLayoutGroup_get_cellSize_m3277(__this, /*hidden argument*/NULL);
		V_34 = L_126;
		float L_127 = Vector2_get_Item_m943((&V_34), 0, /*hidden argument*/NULL);
		Vector2_t6  L_128 = GridLayoutGroup_get_spacing_m3279(__this, /*hidden argument*/NULL);
		V_35 = L_128;
		float L_129 = Vector2_get_Item_m943((&V_35), 0, /*hidden argument*/NULL);
		int32_t L_130 = V_14;
		Vector2_t6  L_131 = GridLayoutGroup_get_cellSize_m3277(__this, /*hidden argument*/NULL);
		V_36 = L_131;
		float L_132 = Vector2_get_Item_m943((&V_36), 0, /*hidden argument*/NULL);
		LayoutGroup_SetChildAlongAxis_m3351(__this, L_124, 0, ((float)((float)L_125+(float)((float)((float)((float)((float)L_127+(float)L_129))*(float)(((float)((float)L_130))))))), L_132, /*hidden argument*/NULL);
		List_1_t644 * L_133 = LayoutGroup_get_rectChildren_m3334(__this, /*hidden argument*/NULL);
		int32_t L_134 = V_13;
		NullCheck(L_133);
		RectTransform_t242 * L_135 = (RectTransform_t242 *)VirtFuncInvoker1< RectTransform_t242 *, int32_t >::Invoke(31 /* !0 System.Collections.Generic.List`1<UnityEngine.RectTransform>::get_Item(System.Int32) */, L_133, L_134);
		float L_136 = ((&V_12)->___y_2);
		Vector2_t6  L_137 = GridLayoutGroup_get_cellSize_m3277(__this, /*hidden argument*/NULL);
		V_37 = L_137;
		float L_138 = Vector2_get_Item_m943((&V_37), 1, /*hidden argument*/NULL);
		Vector2_t6  L_139 = GridLayoutGroup_get_spacing_m3279(__this, /*hidden argument*/NULL);
		V_38 = L_139;
		float L_140 = Vector2_get_Item_m943((&V_38), 1, /*hidden argument*/NULL);
		int32_t L_141 = V_15;
		Vector2_t6  L_142 = GridLayoutGroup_get_cellSize_m3277(__this, /*hidden argument*/NULL);
		V_39 = L_142;
		float L_143 = Vector2_get_Item_m943((&V_39), 1, /*hidden argument*/NULL);
		LayoutGroup_SetChildAlongAxis_m3351(__this, L_135, 1, ((float)((float)L_136+(float)((float)((float)((float)((float)L_138+(float)L_140))*(float)(((float)((float)L_141))))))), L_143, /*hidden argument*/NULL);
		int32_t L_144 = V_13;
		V_13 = ((int32_t)((int32_t)L_144+(int32_t)1));
	}

IL_042c:
	{
		int32_t L_145 = V_13;
		List_1_t644 * L_146 = LayoutGroup_get_rectChildren_m3334(__this, /*hidden argument*/NULL);
		NullCheck(L_146);
		int32_t L_147 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.RectTransform>::get_Count() */, L_146);
		if ((((int32_t)L_145) < ((int32_t)L_147)))
		{
			goto IL_0336;
		}
	}
	{
		return;
	}
}
// System.Void UnityEngine.UI.HorizontalLayoutGroup::.ctor()
extern "C" void HorizontalLayoutGroup__ctor_m3290 (HorizontalLayoutGroup_t641 * __this, const MethodInfo* method)
{
	{
		HorizontalOrVerticalLayoutGroup__ctor_m3295(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.HorizontalLayoutGroup::CalculateLayoutInputHorizontal()
extern "C" void HorizontalLayoutGroup_CalculateLayoutInputHorizontal_m3291 (HorizontalLayoutGroup_t641 * __this, const MethodInfo* method)
{
	{
		LayoutGroup_CalculateLayoutInputHorizontal_m3335(__this, /*hidden argument*/NULL);
		HorizontalOrVerticalLayoutGroup_CalcAlongAxis_m3302(__this, 0, 0, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.HorizontalLayoutGroup::CalculateLayoutInputVertical()
extern "C" void HorizontalLayoutGroup_CalculateLayoutInputVertical_m3292 (HorizontalLayoutGroup_t641 * __this, const MethodInfo* method)
{
	{
		HorizontalOrVerticalLayoutGroup_CalcAlongAxis_m3302(__this, 1, 0, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.HorizontalLayoutGroup::SetLayoutHorizontal()
extern "C" void HorizontalLayoutGroup_SetLayoutHorizontal_m3293 (HorizontalLayoutGroup_t641 * __this, const MethodInfo* method)
{
	{
		HorizontalOrVerticalLayoutGroup_SetChildrenAlongAxis_m3303(__this, 0, 0, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.HorizontalLayoutGroup::SetLayoutVertical()
extern "C" void HorizontalLayoutGroup_SetLayoutVertical_m3294 (HorizontalLayoutGroup_t641 * __this, const MethodInfo* method)
{
	{
		HorizontalOrVerticalLayoutGroup_SetChildrenAlongAxis_m3303(__this, 1, 0, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.HorizontalOrVerticalLayoutGroup::.ctor()
extern "C" void HorizontalOrVerticalLayoutGroup__ctor_m3295 (HorizontalOrVerticalLayoutGroup_t642 * __this, const MethodInfo* method)
{
	{
		__this->___m_ChildForceExpandWidth_11 = 1;
		__this->___m_ChildForceExpandHeight_12 = 1;
		LayoutGroup__ctor_m3328(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Single UnityEngine.UI.HorizontalOrVerticalLayoutGroup::get_spacing()
extern "C" float HorizontalOrVerticalLayoutGroup_get_spacing_m3296 (HorizontalOrVerticalLayoutGroup_t642 * __this, const MethodInfo* method)
{
	{
		float L_0 = (__this->___m_Spacing_10);
		return L_0;
	}
}
// System.Void UnityEngine.UI.HorizontalOrVerticalLayoutGroup::set_spacing(System.Single)
extern const MethodInfo* LayoutGroup_SetProperty_TisSingle_t165_m3658_MethodInfo_var;
extern "C" void HorizontalOrVerticalLayoutGroup_set_spacing_m3297 (HorizontalOrVerticalLayoutGroup_t642 * __this, float ___value, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		LayoutGroup_SetProperty_TisSingle_t165_m3658_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483928);
		s_Il2CppMethodIntialized = true;
	}
	{
		float* L_0 = &(__this->___m_Spacing_10);
		float L_1 = ___value;
		LayoutGroup_SetProperty_TisSingle_t165_m3658(__this, L_0, L_1, /*hidden argument*/LayoutGroup_SetProperty_TisSingle_t165_m3658_MethodInfo_var);
		return;
	}
}
// System.Boolean UnityEngine.UI.HorizontalOrVerticalLayoutGroup::get_childForceExpandWidth()
extern "C" bool HorizontalOrVerticalLayoutGroup_get_childForceExpandWidth_m3298 (HorizontalOrVerticalLayoutGroup_t642 * __this, const MethodInfo* method)
{
	{
		bool L_0 = (__this->___m_ChildForceExpandWidth_11);
		return L_0;
	}
}
// System.Void UnityEngine.UI.HorizontalOrVerticalLayoutGroup::set_childForceExpandWidth(System.Boolean)
extern const MethodInfo* LayoutGroup_SetProperty_TisBoolean_t448_m3659_MethodInfo_var;
extern "C" void HorizontalOrVerticalLayoutGroup_set_childForceExpandWidth_m3299 (HorizontalOrVerticalLayoutGroup_t642 * __this, bool ___value, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		LayoutGroup_SetProperty_TisBoolean_t448_m3659_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483929);
		s_Il2CppMethodIntialized = true;
	}
	{
		bool* L_0 = &(__this->___m_ChildForceExpandWidth_11);
		bool L_1 = ___value;
		LayoutGroup_SetProperty_TisBoolean_t448_m3659(__this, L_0, L_1, /*hidden argument*/LayoutGroup_SetProperty_TisBoolean_t448_m3659_MethodInfo_var);
		return;
	}
}
// System.Boolean UnityEngine.UI.HorizontalOrVerticalLayoutGroup::get_childForceExpandHeight()
extern "C" bool HorizontalOrVerticalLayoutGroup_get_childForceExpandHeight_m3300 (HorizontalOrVerticalLayoutGroup_t642 * __this, const MethodInfo* method)
{
	{
		bool L_0 = (__this->___m_ChildForceExpandHeight_12);
		return L_0;
	}
}
// System.Void UnityEngine.UI.HorizontalOrVerticalLayoutGroup::set_childForceExpandHeight(System.Boolean)
extern const MethodInfo* LayoutGroup_SetProperty_TisBoolean_t448_m3659_MethodInfo_var;
extern "C" void HorizontalOrVerticalLayoutGroup_set_childForceExpandHeight_m3301 (HorizontalOrVerticalLayoutGroup_t642 * __this, bool ___value, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		LayoutGroup_SetProperty_TisBoolean_t448_m3659_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483929);
		s_Il2CppMethodIntialized = true;
	}
	{
		bool* L_0 = &(__this->___m_ChildForceExpandHeight_12);
		bool L_1 = ___value;
		LayoutGroup_SetProperty_TisBoolean_t448_m3659(__this, L_0, L_1, /*hidden argument*/LayoutGroup_SetProperty_TisBoolean_t448_m3659_MethodInfo_var);
		return;
	}
}
// System.Void UnityEngine.UI.HorizontalOrVerticalLayoutGroup::CalcAlongAxis(System.Int32,System.Boolean)
extern TypeInfo* Mathf_t134_il2cpp_TypeInfo_var;
extern "C" void HorizontalOrVerticalLayoutGroup_CalcAlongAxis_m3302 (HorizontalOrVerticalLayoutGroup_t642 * __this, int32_t ___axis, bool ___isVertical, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		Mathf_t134_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(1);
		s_Il2CppMethodIntialized = true;
	}
	float V_0 = 0.0f;
	float V_1 = 0.0f;
	float V_2 = 0.0f;
	float V_3 = 0.0f;
	bool V_4 = false;
	int32_t V_5 = 0;
	RectTransform_t242 * V_6 = {0};
	float V_7 = 0.0f;
	float V_8 = 0.0f;
	float V_9 = 0.0f;
	int32_t G_B3_0 = 0;
	bool G_B7_0 = false;
	{
		int32_t L_0 = ___axis;
		if (L_0)
		{
			goto IL_0016;
		}
	}
	{
		RectOffset_t333 * L_1 = LayoutGroup_get_padding_m3329(__this, /*hidden argument*/NULL);
		NullCheck(L_1);
		int32_t L_2 = RectOffset_get_horizontal_m1795(L_1, /*hidden argument*/NULL);
		G_B3_0 = L_2;
		goto IL_0021;
	}

IL_0016:
	{
		RectOffset_t333 * L_3 = LayoutGroup_get_padding_m3329(__this, /*hidden argument*/NULL);
		NullCheck(L_3);
		int32_t L_4 = RectOffset_get_vertical_m1796(L_3, /*hidden argument*/NULL);
		G_B3_0 = L_4;
	}

IL_0021:
	{
		V_0 = (((float)((float)G_B3_0)));
		float L_5 = V_0;
		V_1 = L_5;
		float L_6 = V_0;
		V_2 = L_6;
		V_3 = (0.0f);
		bool L_7 = ___isVertical;
		int32_t L_8 = ___axis;
		V_4 = ((int32_t)((int32_t)L_7^(int32_t)((((int32_t)L_8) == ((int32_t)1))? 1 : 0)));
		V_5 = 0;
		goto IL_00e2;
	}

IL_003d:
	{
		List_1_t644 * L_9 = LayoutGroup_get_rectChildren_m3334(__this, /*hidden argument*/NULL);
		int32_t L_10 = V_5;
		NullCheck(L_9);
		RectTransform_t242 * L_11 = (RectTransform_t242 *)VirtFuncInvoker1< RectTransform_t242 *, int32_t >::Invoke(31 /* !0 System.Collections.Generic.List`1<UnityEngine.RectTransform>::get_Item(System.Int32) */, L_9, L_10);
		V_6 = L_11;
		RectTransform_t242 * L_12 = V_6;
		int32_t L_13 = ___axis;
		float L_14 = LayoutUtility_GetMinSize_m3383(NULL /*static, unused*/, L_12, L_13, /*hidden argument*/NULL);
		V_7 = L_14;
		RectTransform_t242 * L_15 = V_6;
		int32_t L_16 = ___axis;
		float L_17 = LayoutUtility_GetPreferredSize_m3384(NULL /*static, unused*/, L_15, L_16, /*hidden argument*/NULL);
		V_8 = L_17;
		RectTransform_t242 * L_18 = V_6;
		int32_t L_19 = ___axis;
		float L_20 = LayoutUtility_GetFlexibleSize_m3385(NULL /*static, unused*/, L_18, L_19, /*hidden argument*/NULL);
		V_9 = L_20;
		int32_t L_21 = ___axis;
		if (L_21)
		{
			goto IL_007b;
		}
	}
	{
		bool L_22 = HorizontalOrVerticalLayoutGroup_get_childForceExpandWidth_m3298(__this, /*hidden argument*/NULL);
		G_B7_0 = L_22;
		goto IL_0081;
	}

IL_007b:
	{
		bool L_23 = HorizontalOrVerticalLayoutGroup_get_childForceExpandHeight_m3300(__this, /*hidden argument*/NULL);
		G_B7_0 = L_23;
	}

IL_0081:
	{
		if (!G_B7_0)
		{
			goto IL_0094;
		}
	}
	{
		float L_24 = V_9;
		IL2CPP_RUNTIME_CLASS_INIT(Mathf_t134_il2cpp_TypeInfo_var);
		float L_25 = Mathf_Max_m682(NULL /*static, unused*/, L_24, (1.0f), /*hidden argument*/NULL);
		V_9 = L_25;
	}

IL_0094:
	{
		bool L_26 = V_4;
		if (!L_26)
		{
			goto IL_00bf;
		}
	}
	{
		float L_27 = V_7;
		float L_28 = V_0;
		float L_29 = V_1;
		IL2CPP_RUNTIME_CLASS_INIT(Mathf_t134_il2cpp_TypeInfo_var);
		float L_30 = Mathf_Max_m682(NULL /*static, unused*/, ((float)((float)L_27+(float)L_28)), L_29, /*hidden argument*/NULL);
		V_1 = L_30;
		float L_31 = V_8;
		float L_32 = V_0;
		float L_33 = V_2;
		float L_34 = Mathf_Max_m682(NULL /*static, unused*/, ((float)((float)L_31+(float)L_32)), L_33, /*hidden argument*/NULL);
		V_2 = L_34;
		float L_35 = V_9;
		float L_36 = V_3;
		float L_37 = Mathf_Max_m682(NULL /*static, unused*/, L_35, L_36, /*hidden argument*/NULL);
		V_3 = L_37;
		goto IL_00dc;
	}

IL_00bf:
	{
		float L_38 = V_1;
		float L_39 = V_7;
		float L_40 = HorizontalOrVerticalLayoutGroup_get_spacing_m3296(__this, /*hidden argument*/NULL);
		V_1 = ((float)((float)L_38+(float)((float)((float)L_39+(float)L_40))));
		float L_41 = V_2;
		float L_42 = V_8;
		float L_43 = HorizontalOrVerticalLayoutGroup_get_spacing_m3296(__this, /*hidden argument*/NULL);
		V_2 = ((float)((float)L_41+(float)((float)((float)L_42+(float)L_43))));
		float L_44 = V_3;
		float L_45 = V_9;
		V_3 = ((float)((float)L_44+(float)L_45));
	}

IL_00dc:
	{
		int32_t L_46 = V_5;
		V_5 = ((int32_t)((int32_t)L_46+(int32_t)1));
	}

IL_00e2:
	{
		int32_t L_47 = V_5;
		List_1_t644 * L_48 = LayoutGroup_get_rectChildren_m3334(__this, /*hidden argument*/NULL);
		NullCheck(L_48);
		int32_t L_49 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.RectTransform>::get_Count() */, L_48);
		if ((((int32_t)L_47) < ((int32_t)L_49)))
		{
			goto IL_003d;
		}
	}
	{
		bool L_50 = V_4;
		if (L_50)
		{
			goto IL_011e;
		}
	}
	{
		List_1_t644 * L_51 = LayoutGroup_get_rectChildren_m3334(__this, /*hidden argument*/NULL);
		NullCheck(L_51);
		int32_t L_52 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.RectTransform>::get_Count() */, L_51);
		if ((((int32_t)L_52) <= ((int32_t)0)))
		{
			goto IL_011e;
		}
	}
	{
		float L_53 = V_1;
		float L_54 = HorizontalOrVerticalLayoutGroup_get_spacing_m3296(__this, /*hidden argument*/NULL);
		V_1 = ((float)((float)L_53-(float)L_54));
		float L_55 = V_2;
		float L_56 = HorizontalOrVerticalLayoutGroup_get_spacing_m3296(__this, /*hidden argument*/NULL);
		V_2 = ((float)((float)L_55-(float)L_56));
	}

IL_011e:
	{
		float L_57 = V_1;
		float L_58 = V_2;
		IL2CPP_RUNTIME_CLASS_INIT(Mathf_t134_il2cpp_TypeInfo_var);
		float L_59 = Mathf_Max_m682(NULL /*static, unused*/, L_57, L_58, /*hidden argument*/NULL);
		V_2 = L_59;
		float L_60 = V_1;
		float L_61 = V_2;
		float L_62 = V_3;
		int32_t L_63 = ___axis;
		LayoutGroup_SetLayoutInputForAxis_m3350(__this, L_60, L_61, L_62, L_63, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.HorizontalOrVerticalLayoutGroup::SetChildrenAlongAxis(System.Int32,System.Boolean)
extern TypeInfo* Mathf_t134_il2cpp_TypeInfo_var;
extern "C" void HorizontalOrVerticalLayoutGroup_SetChildrenAlongAxis_m3303 (HorizontalOrVerticalLayoutGroup_t642 * __this, int32_t ___axis, bool ___isVertical, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		Mathf_t134_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(1);
		s_Il2CppMethodIntialized = true;
	}
	float V_0 = 0.0f;
	bool V_1 = false;
	float V_2 = 0.0f;
	int32_t V_3 = 0;
	RectTransform_t242 * V_4 = {0};
	float V_5 = 0.0f;
	float V_6 = 0.0f;
	float V_7 = 0.0f;
	float V_8 = 0.0f;
	float V_9 = 0.0f;
	float V_10 = 0.0f;
	float V_11 = 0.0f;
	float V_12 = 0.0f;
	int32_t V_13 = 0;
	RectTransform_t242 * V_14 = {0};
	float V_15 = 0.0f;
	float V_16 = 0.0f;
	float V_17 = 0.0f;
	float V_18 = 0.0f;
	Rect_t232  V_19 = {0};
	Vector2_t6  V_20 = {0};
	float G_B3_0 = 0.0f;
	float G_B2_0 = 0.0f;
	int32_t G_B4_0 = 0;
	float G_B4_1 = 0.0f;
	bool G_B8_0 = false;
	float G_B12_0 = 0.0f;
	float G_B12_1 = 0.0f;
	float G_B11_0 = 0.0f;
	float G_B11_1 = 0.0f;
	float G_B13_0 = 0.0f;
	float G_B13_1 = 0.0f;
	float G_B13_2 = 0.0f;
	int32_t G_B19_0 = 0;
	float G_B23_0 = 0.0f;
	int32_t G_B23_1 = 0;
	HorizontalOrVerticalLayoutGroup_t642 * G_B23_2 = {0};
	float G_B22_0 = 0.0f;
	int32_t G_B22_1 = 0;
	HorizontalOrVerticalLayoutGroup_t642 * G_B22_2 = {0};
	int32_t G_B24_0 = 0;
	float G_B24_1 = 0.0f;
	int32_t G_B24_2 = 0;
	HorizontalOrVerticalLayoutGroup_t642 * G_B24_3 = {0};
	bool G_B34_0 = false;
	{
		RectTransform_t242 * L_0 = LayoutGroup_get_rectTransform_m3333(__this, /*hidden argument*/NULL);
		NullCheck(L_0);
		Rect_t232  L_1 = RectTransform_get_rect_m1151(L_0, /*hidden argument*/NULL);
		V_19 = L_1;
		Vector2_t6  L_2 = Rect_get_size_m1020((&V_19), /*hidden argument*/NULL);
		V_20 = L_2;
		int32_t L_3 = ___axis;
		float L_4 = Vector2_get_Item_m943((&V_20), L_3, /*hidden argument*/NULL);
		V_0 = L_4;
		bool L_5 = ___isVertical;
		int32_t L_6 = ___axis;
		V_1 = ((int32_t)((int32_t)L_5^(int32_t)((((int32_t)L_6) == ((int32_t)1))? 1 : 0)));
		bool L_7 = V_1;
		if (!L_7)
		{
			goto IL_00fe;
		}
	}
	{
		float L_8 = V_0;
		int32_t L_9 = ___axis;
		G_B2_0 = L_8;
		if (L_9)
		{
			G_B3_0 = L_8;
			goto IL_0043;
		}
	}
	{
		RectOffset_t333 * L_10 = LayoutGroup_get_padding_m3329(__this, /*hidden argument*/NULL);
		NullCheck(L_10);
		int32_t L_11 = RectOffset_get_horizontal_m1795(L_10, /*hidden argument*/NULL);
		G_B4_0 = L_11;
		G_B4_1 = G_B2_0;
		goto IL_004e;
	}

IL_0043:
	{
		RectOffset_t333 * L_12 = LayoutGroup_get_padding_m3329(__this, /*hidden argument*/NULL);
		NullCheck(L_12);
		int32_t L_13 = RectOffset_get_vertical_m1796(L_12, /*hidden argument*/NULL);
		G_B4_0 = L_13;
		G_B4_1 = G_B3_0;
	}

IL_004e:
	{
		V_2 = ((float)((float)G_B4_1-(float)(((float)((float)G_B4_0)))));
		V_3 = 0;
		goto IL_00e8;
	}

IL_0058:
	{
		List_1_t644 * L_14 = LayoutGroup_get_rectChildren_m3334(__this, /*hidden argument*/NULL);
		int32_t L_15 = V_3;
		NullCheck(L_14);
		RectTransform_t242 * L_16 = (RectTransform_t242 *)VirtFuncInvoker1< RectTransform_t242 *, int32_t >::Invoke(31 /* !0 System.Collections.Generic.List`1<UnityEngine.RectTransform>::get_Item(System.Int32) */, L_14, L_15);
		V_4 = L_16;
		RectTransform_t242 * L_17 = V_4;
		int32_t L_18 = ___axis;
		float L_19 = LayoutUtility_GetMinSize_m3383(NULL /*static, unused*/, L_17, L_18, /*hidden argument*/NULL);
		V_5 = L_19;
		RectTransform_t242 * L_20 = V_4;
		int32_t L_21 = ___axis;
		float L_22 = LayoutUtility_GetPreferredSize_m3384(NULL /*static, unused*/, L_20, L_21, /*hidden argument*/NULL);
		V_6 = L_22;
		RectTransform_t242 * L_23 = V_4;
		int32_t L_24 = ___axis;
		float L_25 = LayoutUtility_GetFlexibleSize_m3385(NULL /*static, unused*/, L_23, L_24, /*hidden argument*/NULL);
		V_7 = L_25;
		int32_t L_26 = ___axis;
		if (L_26)
		{
			goto IL_0095;
		}
	}
	{
		bool L_27 = HorizontalOrVerticalLayoutGroup_get_childForceExpandWidth_m3298(__this, /*hidden argument*/NULL);
		G_B8_0 = L_27;
		goto IL_009b;
	}

IL_0095:
	{
		bool L_28 = HorizontalOrVerticalLayoutGroup_get_childForceExpandHeight_m3300(__this, /*hidden argument*/NULL);
		G_B8_0 = L_28;
	}

IL_009b:
	{
		if (!G_B8_0)
		{
			goto IL_00ae;
		}
	}
	{
		float L_29 = V_7;
		IL2CPP_RUNTIME_CLASS_INIT(Mathf_t134_il2cpp_TypeInfo_var);
		float L_30 = Mathf_Max_m682(NULL /*static, unused*/, L_29, (1.0f), /*hidden argument*/NULL);
		V_7 = L_30;
	}

IL_00ae:
	{
		float L_31 = V_2;
		float L_32 = V_5;
		float L_33 = V_7;
		G_B11_0 = L_32;
		G_B11_1 = L_31;
		if ((!(((float)L_33) > ((float)(0.0f)))))
		{
			G_B12_0 = L_32;
			G_B12_1 = L_31;
			goto IL_00c3;
		}
	}
	{
		float L_34 = V_0;
		G_B13_0 = L_34;
		G_B13_1 = G_B11_0;
		G_B13_2 = G_B11_1;
		goto IL_00c5;
	}

IL_00c3:
	{
		float L_35 = V_6;
		G_B13_0 = L_35;
		G_B13_1 = G_B12_0;
		G_B13_2 = G_B12_1;
	}

IL_00c5:
	{
		IL2CPP_RUNTIME_CLASS_INIT(Mathf_t134_il2cpp_TypeInfo_var);
		float L_36 = Mathf_Clamp_m418(NULL /*static, unused*/, G_B13_2, G_B13_1, G_B13_0, /*hidden argument*/NULL);
		V_8 = L_36;
		int32_t L_37 = ___axis;
		float L_38 = V_8;
		float L_39 = LayoutGroup_GetStartOffset_m3349(__this, L_37, L_38, /*hidden argument*/NULL);
		V_9 = L_39;
		RectTransform_t242 * L_40 = V_4;
		int32_t L_41 = ___axis;
		float L_42 = V_9;
		float L_43 = V_8;
		LayoutGroup_SetChildAlongAxis_m3351(__this, L_40, L_41, L_42, L_43, /*hidden argument*/NULL);
		int32_t L_44 = V_3;
		V_3 = ((int32_t)((int32_t)L_44+(int32_t)1));
	}

IL_00e8:
	{
		int32_t L_45 = V_3;
		List_1_t644 * L_46 = LayoutGroup_get_rectChildren_m3334(__this, /*hidden argument*/NULL);
		NullCheck(L_46);
		int32_t L_47 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.RectTransform>::get_Count() */, L_46);
		if ((((int32_t)L_45) < ((int32_t)L_47)))
		{
			goto IL_0058;
		}
	}
	{
		goto IL_028e;
	}

IL_00fe:
	{
		int32_t L_48 = ___axis;
		if (L_48)
		{
			goto IL_0114;
		}
	}
	{
		RectOffset_t333 * L_49 = LayoutGroup_get_padding_m3329(__this, /*hidden argument*/NULL);
		NullCheck(L_49);
		int32_t L_50 = RectOffset_get_left_m1791(L_49, /*hidden argument*/NULL);
		G_B19_0 = L_50;
		goto IL_011f;
	}

IL_0114:
	{
		RectOffset_t333 * L_51 = LayoutGroup_get_padding_m3329(__this, /*hidden argument*/NULL);
		NullCheck(L_51);
		int32_t L_52 = RectOffset_get_top_m1793(L_51, /*hidden argument*/NULL);
		G_B19_0 = L_52;
	}

IL_011f:
	{
		V_10 = (((float)((float)G_B19_0)));
		int32_t L_53 = ___axis;
		float L_54 = LayoutGroup_GetTotalFlexibleSize_m3348(__this, L_53, /*hidden argument*/NULL);
		if ((!(((float)L_54) == ((float)(0.0f)))))
		{
			goto IL_0173;
		}
	}
	{
		int32_t L_55 = ___axis;
		float L_56 = LayoutGroup_GetTotalPreferredSize_m3347(__this, L_55, /*hidden argument*/NULL);
		float L_57 = V_0;
		if ((!(((float)L_56) < ((float)L_57))))
		{
			goto IL_0173;
		}
	}
	{
		int32_t L_58 = ___axis;
		int32_t L_59 = ___axis;
		float L_60 = LayoutGroup_GetTotalPreferredSize_m3347(__this, L_59, /*hidden argument*/NULL);
		int32_t L_61 = ___axis;
		G_B22_0 = L_60;
		G_B22_1 = L_58;
		G_B22_2 = __this;
		if (L_61)
		{
			G_B23_0 = L_60;
			G_B23_1 = L_58;
			G_B23_2 = __this;
			goto IL_015f;
		}
	}
	{
		RectOffset_t333 * L_62 = LayoutGroup_get_padding_m3329(__this, /*hidden argument*/NULL);
		NullCheck(L_62);
		int32_t L_63 = RectOffset_get_horizontal_m1795(L_62, /*hidden argument*/NULL);
		G_B24_0 = L_63;
		G_B24_1 = G_B22_0;
		G_B24_2 = G_B22_1;
		G_B24_3 = G_B22_2;
		goto IL_016a;
	}

IL_015f:
	{
		RectOffset_t333 * L_64 = LayoutGroup_get_padding_m3329(__this, /*hidden argument*/NULL);
		NullCheck(L_64);
		int32_t L_65 = RectOffset_get_vertical_m1796(L_64, /*hidden argument*/NULL);
		G_B24_0 = L_65;
		G_B24_1 = G_B23_0;
		G_B24_2 = G_B23_1;
		G_B24_3 = G_B23_2;
	}

IL_016a:
	{
		NullCheck(G_B24_3);
		float L_66 = LayoutGroup_GetStartOffset_m3349(G_B24_3, G_B24_2, ((float)((float)G_B24_1-(float)(((float)((float)G_B24_0))))), /*hidden argument*/NULL);
		V_10 = L_66;
	}

IL_0173:
	{
		V_11 = (0.0f);
		int32_t L_67 = ___axis;
		float L_68 = LayoutGroup_GetTotalMinSize_m3346(__this, L_67, /*hidden argument*/NULL);
		int32_t L_69 = ___axis;
		float L_70 = LayoutGroup_GetTotalPreferredSize_m3347(__this, L_69, /*hidden argument*/NULL);
		if ((((float)L_68) == ((float)L_70)))
		{
			goto IL_01ad;
		}
	}
	{
		float L_71 = V_0;
		int32_t L_72 = ___axis;
		float L_73 = LayoutGroup_GetTotalMinSize_m3346(__this, L_72, /*hidden argument*/NULL);
		int32_t L_74 = ___axis;
		float L_75 = LayoutGroup_GetTotalPreferredSize_m3347(__this, L_74, /*hidden argument*/NULL);
		int32_t L_76 = ___axis;
		float L_77 = LayoutGroup_GetTotalMinSize_m3346(__this, L_76, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(Mathf_t134_il2cpp_TypeInfo_var);
		float L_78 = Mathf_Clamp01_m1140(NULL /*static, unused*/, ((float)((float)((float)((float)L_71-(float)L_73))/(float)((float)((float)L_75-(float)L_77)))), /*hidden argument*/NULL);
		V_11 = L_78;
	}

IL_01ad:
	{
		V_12 = (0.0f);
		float L_79 = V_0;
		int32_t L_80 = ___axis;
		float L_81 = LayoutGroup_GetTotalPreferredSize_m3347(__this, L_80, /*hidden argument*/NULL);
		if ((!(((float)L_79) > ((float)L_81))))
		{
			goto IL_01e5;
		}
	}
	{
		int32_t L_82 = ___axis;
		float L_83 = LayoutGroup_GetTotalFlexibleSize_m3348(__this, L_82, /*hidden argument*/NULL);
		if ((!(((float)L_83) > ((float)(0.0f)))))
		{
			goto IL_01e5;
		}
	}
	{
		float L_84 = V_0;
		int32_t L_85 = ___axis;
		float L_86 = LayoutGroup_GetTotalPreferredSize_m3347(__this, L_85, /*hidden argument*/NULL);
		int32_t L_87 = ___axis;
		float L_88 = LayoutGroup_GetTotalFlexibleSize_m3348(__this, L_87, /*hidden argument*/NULL);
		V_12 = ((float)((float)((float)((float)L_84-(float)L_86))/(float)L_88));
	}

IL_01e5:
	{
		V_13 = 0;
		goto IL_027c;
	}

IL_01ed:
	{
		List_1_t644 * L_89 = LayoutGroup_get_rectChildren_m3334(__this, /*hidden argument*/NULL);
		int32_t L_90 = V_13;
		NullCheck(L_89);
		RectTransform_t242 * L_91 = (RectTransform_t242 *)VirtFuncInvoker1< RectTransform_t242 *, int32_t >::Invoke(31 /* !0 System.Collections.Generic.List`1<UnityEngine.RectTransform>::get_Item(System.Int32) */, L_89, L_90);
		V_14 = L_91;
		RectTransform_t242 * L_92 = V_14;
		int32_t L_93 = ___axis;
		float L_94 = LayoutUtility_GetMinSize_m3383(NULL /*static, unused*/, L_92, L_93, /*hidden argument*/NULL);
		V_15 = L_94;
		RectTransform_t242 * L_95 = V_14;
		int32_t L_96 = ___axis;
		float L_97 = LayoutUtility_GetPreferredSize_m3384(NULL /*static, unused*/, L_95, L_96, /*hidden argument*/NULL);
		V_16 = L_97;
		RectTransform_t242 * L_98 = V_14;
		int32_t L_99 = ___axis;
		float L_100 = LayoutUtility_GetFlexibleSize_m3385(NULL /*static, unused*/, L_98, L_99, /*hidden argument*/NULL);
		V_17 = L_100;
		int32_t L_101 = ___axis;
		if (L_101)
		{
			goto IL_022b;
		}
	}
	{
		bool L_102 = HorizontalOrVerticalLayoutGroup_get_childForceExpandWidth_m3298(__this, /*hidden argument*/NULL);
		G_B34_0 = L_102;
		goto IL_0231;
	}

IL_022b:
	{
		bool L_103 = HorizontalOrVerticalLayoutGroup_get_childForceExpandHeight_m3300(__this, /*hidden argument*/NULL);
		G_B34_0 = L_103;
	}

IL_0231:
	{
		if (!G_B34_0)
		{
			goto IL_0244;
		}
	}
	{
		float L_104 = V_17;
		IL2CPP_RUNTIME_CLASS_INIT(Mathf_t134_il2cpp_TypeInfo_var);
		float L_105 = Mathf_Max_m682(NULL /*static, unused*/, L_104, (1.0f), /*hidden argument*/NULL);
		V_17 = L_105;
	}

IL_0244:
	{
		float L_106 = V_15;
		float L_107 = V_16;
		float L_108 = V_11;
		IL2CPP_RUNTIME_CLASS_INIT(Mathf_t134_il2cpp_TypeInfo_var);
		float L_109 = Mathf_Lerp_m417(NULL /*static, unused*/, L_106, L_107, L_108, /*hidden argument*/NULL);
		V_18 = L_109;
		float L_110 = V_18;
		float L_111 = V_17;
		float L_112 = V_12;
		V_18 = ((float)((float)L_110+(float)((float)((float)L_111*(float)L_112))));
		RectTransform_t242 * L_113 = V_14;
		int32_t L_114 = ___axis;
		float L_115 = V_10;
		float L_116 = V_18;
		LayoutGroup_SetChildAlongAxis_m3351(__this, L_113, L_114, L_115, L_116, /*hidden argument*/NULL);
		float L_117 = V_10;
		float L_118 = V_18;
		float L_119 = HorizontalOrVerticalLayoutGroup_get_spacing_m3296(__this, /*hidden argument*/NULL);
		V_10 = ((float)((float)L_117+(float)((float)((float)L_118+(float)L_119))));
		int32_t L_120 = V_13;
		V_13 = ((int32_t)((int32_t)L_120+(int32_t)1));
	}

IL_027c:
	{
		int32_t L_121 = V_13;
		List_1_t644 * L_122 = LayoutGroup_get_rectChildren_m3334(__this, /*hidden argument*/NULL);
		NullCheck(L_122);
		int32_t L_123 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.RectTransform>::get_Count() */, L_122);
		if ((((int32_t)L_121) < ((int32_t)L_123)))
		{
			goto IL_01ed;
		}
	}

IL_028e:
	{
		return;
	}
}
// System.Void UnityEngine.UI.LayoutElement::.ctor()
extern "C" void LayoutElement__ctor_m3304 (LayoutElement_t643 * __this, const MethodInfo* method)
{
	{
		__this->___m_MinWidth_3 = (-1.0f);
		__this->___m_MinHeight_4 = (-1.0f);
		__this->___m_PreferredWidth_5 = (-1.0f);
		__this->___m_PreferredHeight_6 = (-1.0f);
		__this->___m_FlexibleWidth_7 = (-1.0f);
		__this->___m_FlexibleHeight_8 = (-1.0f);
		UIBehaviour__ctor_m2193(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Boolean UnityEngine.UI.LayoutElement::get_ignoreLayout()
extern "C" bool LayoutElement_get_ignoreLayout_m3305 (LayoutElement_t643 * __this, const MethodInfo* method)
{
	{
		bool L_0 = (__this->___m_IgnoreLayout_2);
		return L_0;
	}
}
// System.Void UnityEngine.UI.LayoutElement::set_ignoreLayout(System.Boolean)
extern const MethodInfo* SetPropertyUtility_SetStruct_TisBoolean_t448_m3577_MethodInfo_var;
extern "C" void LayoutElement_set_ignoreLayout_m3306 (LayoutElement_t643 * __this, bool ___value, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		SetPropertyUtility_SetStruct_TisBoolean_t448_m3577_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483866);
		s_Il2CppMethodIntialized = true;
	}
	{
		bool* L_0 = &(__this->___m_IgnoreLayout_2);
		bool L_1 = ___value;
		bool L_2 = SetPropertyUtility_SetStruct_TisBoolean_t448_m3577(NULL /*static, unused*/, L_0, L_1, /*hidden argument*/SetPropertyUtility_SetStruct_TisBoolean_t448_m3577_MethodInfo_var);
		if (!L_2)
		{
			goto IL_0017;
		}
	}
	{
		LayoutElement_SetDirty_m3327(__this, /*hidden argument*/NULL);
	}

IL_0017:
	{
		return;
	}
}
// System.Void UnityEngine.UI.LayoutElement::CalculateLayoutInputHorizontal()
extern "C" void LayoutElement_CalculateLayoutInputHorizontal_m3307 (LayoutElement_t643 * __this, const MethodInfo* method)
{
	{
		return;
	}
}
// System.Void UnityEngine.UI.LayoutElement::CalculateLayoutInputVertical()
extern "C" void LayoutElement_CalculateLayoutInputVertical_m3308 (LayoutElement_t643 * __this, const MethodInfo* method)
{
	{
		return;
	}
}
// System.Single UnityEngine.UI.LayoutElement::get_minWidth()
extern "C" float LayoutElement_get_minWidth_m3309 (LayoutElement_t643 * __this, const MethodInfo* method)
{
	{
		float L_0 = (__this->___m_MinWidth_3);
		return L_0;
	}
}
// System.Void UnityEngine.UI.LayoutElement::set_minWidth(System.Single)
extern const MethodInfo* SetPropertyUtility_SetStruct_TisSingle_t165_m3579_MethodInfo_var;
extern "C" void LayoutElement_set_minWidth_m3310 (LayoutElement_t643 * __this, float ___value, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		SetPropertyUtility_SetStruct_TisSingle_t165_m3579_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483868);
		s_Il2CppMethodIntialized = true;
	}
	{
		float* L_0 = &(__this->___m_MinWidth_3);
		float L_1 = ___value;
		bool L_2 = SetPropertyUtility_SetStruct_TisSingle_t165_m3579(NULL /*static, unused*/, L_0, L_1, /*hidden argument*/SetPropertyUtility_SetStruct_TisSingle_t165_m3579_MethodInfo_var);
		if (!L_2)
		{
			goto IL_0017;
		}
	}
	{
		LayoutElement_SetDirty_m3327(__this, /*hidden argument*/NULL);
	}

IL_0017:
	{
		return;
	}
}
// System.Single UnityEngine.UI.LayoutElement::get_minHeight()
extern "C" float LayoutElement_get_minHeight_m3311 (LayoutElement_t643 * __this, const MethodInfo* method)
{
	{
		float L_0 = (__this->___m_MinHeight_4);
		return L_0;
	}
}
// System.Void UnityEngine.UI.LayoutElement::set_minHeight(System.Single)
extern const MethodInfo* SetPropertyUtility_SetStruct_TisSingle_t165_m3579_MethodInfo_var;
extern "C" void LayoutElement_set_minHeight_m3312 (LayoutElement_t643 * __this, float ___value, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		SetPropertyUtility_SetStruct_TisSingle_t165_m3579_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483868);
		s_Il2CppMethodIntialized = true;
	}
	{
		float* L_0 = &(__this->___m_MinHeight_4);
		float L_1 = ___value;
		bool L_2 = SetPropertyUtility_SetStruct_TisSingle_t165_m3579(NULL /*static, unused*/, L_0, L_1, /*hidden argument*/SetPropertyUtility_SetStruct_TisSingle_t165_m3579_MethodInfo_var);
		if (!L_2)
		{
			goto IL_0017;
		}
	}
	{
		LayoutElement_SetDirty_m3327(__this, /*hidden argument*/NULL);
	}

IL_0017:
	{
		return;
	}
}
// System.Single UnityEngine.UI.LayoutElement::get_preferredWidth()
extern "C" float LayoutElement_get_preferredWidth_m3313 (LayoutElement_t643 * __this, const MethodInfo* method)
{
	{
		float L_0 = (__this->___m_PreferredWidth_5);
		return L_0;
	}
}
// System.Void UnityEngine.UI.LayoutElement::set_preferredWidth(System.Single)
extern const MethodInfo* SetPropertyUtility_SetStruct_TisSingle_t165_m3579_MethodInfo_var;
extern "C" void LayoutElement_set_preferredWidth_m3314 (LayoutElement_t643 * __this, float ___value, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		SetPropertyUtility_SetStruct_TisSingle_t165_m3579_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483868);
		s_Il2CppMethodIntialized = true;
	}
	{
		float* L_0 = &(__this->___m_PreferredWidth_5);
		float L_1 = ___value;
		bool L_2 = SetPropertyUtility_SetStruct_TisSingle_t165_m3579(NULL /*static, unused*/, L_0, L_1, /*hidden argument*/SetPropertyUtility_SetStruct_TisSingle_t165_m3579_MethodInfo_var);
		if (!L_2)
		{
			goto IL_0017;
		}
	}
	{
		LayoutElement_SetDirty_m3327(__this, /*hidden argument*/NULL);
	}

IL_0017:
	{
		return;
	}
}
// System.Single UnityEngine.UI.LayoutElement::get_preferredHeight()
extern "C" float LayoutElement_get_preferredHeight_m3315 (LayoutElement_t643 * __this, const MethodInfo* method)
{
	{
		float L_0 = (__this->___m_PreferredHeight_6);
		return L_0;
	}
}
// System.Void UnityEngine.UI.LayoutElement::set_preferredHeight(System.Single)
extern const MethodInfo* SetPropertyUtility_SetStruct_TisSingle_t165_m3579_MethodInfo_var;
extern "C" void LayoutElement_set_preferredHeight_m3316 (LayoutElement_t643 * __this, float ___value, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		SetPropertyUtility_SetStruct_TisSingle_t165_m3579_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483868);
		s_Il2CppMethodIntialized = true;
	}
	{
		float* L_0 = &(__this->___m_PreferredHeight_6);
		float L_1 = ___value;
		bool L_2 = SetPropertyUtility_SetStruct_TisSingle_t165_m3579(NULL /*static, unused*/, L_0, L_1, /*hidden argument*/SetPropertyUtility_SetStruct_TisSingle_t165_m3579_MethodInfo_var);
		if (!L_2)
		{
			goto IL_0017;
		}
	}
	{
		LayoutElement_SetDirty_m3327(__this, /*hidden argument*/NULL);
	}

IL_0017:
	{
		return;
	}
}
// System.Single UnityEngine.UI.LayoutElement::get_flexibleWidth()
extern "C" float LayoutElement_get_flexibleWidth_m3317 (LayoutElement_t643 * __this, const MethodInfo* method)
{
	{
		float L_0 = (__this->___m_FlexibleWidth_7);
		return L_0;
	}
}
// System.Void UnityEngine.UI.LayoutElement::set_flexibleWidth(System.Single)
extern const MethodInfo* SetPropertyUtility_SetStruct_TisSingle_t165_m3579_MethodInfo_var;
extern "C" void LayoutElement_set_flexibleWidth_m3318 (LayoutElement_t643 * __this, float ___value, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		SetPropertyUtility_SetStruct_TisSingle_t165_m3579_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483868);
		s_Il2CppMethodIntialized = true;
	}
	{
		float* L_0 = &(__this->___m_FlexibleWidth_7);
		float L_1 = ___value;
		bool L_2 = SetPropertyUtility_SetStruct_TisSingle_t165_m3579(NULL /*static, unused*/, L_0, L_1, /*hidden argument*/SetPropertyUtility_SetStruct_TisSingle_t165_m3579_MethodInfo_var);
		if (!L_2)
		{
			goto IL_0017;
		}
	}
	{
		LayoutElement_SetDirty_m3327(__this, /*hidden argument*/NULL);
	}

IL_0017:
	{
		return;
	}
}
// System.Single UnityEngine.UI.LayoutElement::get_flexibleHeight()
extern "C" float LayoutElement_get_flexibleHeight_m3319 (LayoutElement_t643 * __this, const MethodInfo* method)
{
	{
		float L_0 = (__this->___m_FlexibleHeight_8);
		return L_0;
	}
}
// System.Void UnityEngine.UI.LayoutElement::set_flexibleHeight(System.Single)
extern const MethodInfo* SetPropertyUtility_SetStruct_TisSingle_t165_m3579_MethodInfo_var;
extern "C" void LayoutElement_set_flexibleHeight_m3320 (LayoutElement_t643 * __this, float ___value, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		SetPropertyUtility_SetStruct_TisSingle_t165_m3579_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483868);
		s_Il2CppMethodIntialized = true;
	}
	{
		float* L_0 = &(__this->___m_FlexibleHeight_8);
		float L_1 = ___value;
		bool L_2 = SetPropertyUtility_SetStruct_TisSingle_t165_m3579(NULL /*static, unused*/, L_0, L_1, /*hidden argument*/SetPropertyUtility_SetStruct_TisSingle_t165_m3579_MethodInfo_var);
		if (!L_2)
		{
			goto IL_0017;
		}
	}
	{
		LayoutElement_SetDirty_m3327(__this, /*hidden argument*/NULL);
	}

IL_0017:
	{
		return;
	}
}
// System.Int32 UnityEngine.UI.LayoutElement::get_layoutPriority()
extern "C" int32_t LayoutElement_get_layoutPriority_m3321 (LayoutElement_t643 * __this, const MethodInfo* method)
{
	{
		return 1;
	}
}
// System.Void UnityEngine.UI.LayoutElement::OnEnable()
extern "C" void LayoutElement_OnEnable_m3322 (LayoutElement_t643 * __this, const MethodInfo* method)
{
	{
		UIBehaviour_OnEnable_m2195(__this, /*hidden argument*/NULL);
		LayoutElement_SetDirty_m3327(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.LayoutElement::OnTransformParentChanged()
extern "C" void LayoutElement_OnTransformParentChanged_m3323 (LayoutElement_t643 * __this, const MethodInfo* method)
{
	{
		LayoutElement_SetDirty_m3327(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.LayoutElement::OnDisable()
extern "C" void LayoutElement_OnDisable_m3324 (LayoutElement_t643 * __this, const MethodInfo* method)
{
	{
		LayoutElement_SetDirty_m3327(__this, /*hidden argument*/NULL);
		UIBehaviour_OnDisable_m2197(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.LayoutElement::OnDidApplyAnimationProperties()
extern "C" void LayoutElement_OnDidApplyAnimationProperties_m3325 (LayoutElement_t643 * __this, const MethodInfo* method)
{
	{
		LayoutElement_SetDirty_m3327(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.LayoutElement::OnBeforeTransformParentChanged()
extern "C" void LayoutElement_OnBeforeTransformParentChanged_m3326 (LayoutElement_t643 * __this, const MethodInfo* method)
{
	{
		LayoutElement_SetDirty_m3327(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.LayoutElement::SetDirty()
extern TypeInfo* RectTransform_t242_il2cpp_TypeInfo_var;
extern TypeInfo* LayoutRebuilder_t645_il2cpp_TypeInfo_var;
extern "C" void LayoutElement_SetDirty_m3327 (LayoutElement_t643 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		RectTransform_t242_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(131);
		LayoutRebuilder_t645_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(318);
		s_Il2CppMethodIntialized = true;
	}
	{
		bool L_0 = (bool)VirtFuncInvoker0< bool >::Invoke(9 /* System.Boolean UnityEngine.EventSystems.UIBehaviour::IsActive() */, __this);
		if (L_0)
		{
			goto IL_000c;
		}
	}
	{
		return;
	}

IL_000c:
	{
		Transform_t3 * L_1 = Component_get_transform_m401(__this, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		LayoutRebuilder_MarkLayoutForRebuild_m3368(NULL /*static, unused*/, ((RectTransform_t242 *)IsInstSealed(L_1, RectTransform_t242_il2cpp_TypeInfo_var)), /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.LayoutGroup::.ctor()
extern TypeInfo* RectOffset_t333_il2cpp_TypeInfo_var;
extern TypeInfo* List_1_t644_il2cpp_TypeInfo_var;
extern const MethodInfo* List_1__ctor_m3660_MethodInfo_var;
extern "C" void LayoutGroup__ctor_m3328 (LayoutGroup_t640 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		RectOffset_t333_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(400);
		List_1_t644_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(401);
		List_1__ctor_m3660_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483930);
		s_Il2CppMethodIntialized = true;
	}
	{
		RectOffset_t333 * L_0 = (RectOffset_t333 *)il2cpp_codegen_object_new (RectOffset_t333_il2cpp_TypeInfo_var);
		RectOffset__ctor_m1786(L_0, /*hidden argument*/NULL);
		__this->___m_Padding_2 = L_0;
		Vector2_t6  L_1 = Vector2_get_zero_m539(NULL /*static, unused*/, /*hidden argument*/NULL);
		__this->___m_TotalMinSize_6 = L_1;
		Vector2_t6  L_2 = Vector2_get_zero_m539(NULL /*static, unused*/, /*hidden argument*/NULL);
		__this->___m_TotalPreferredSize_7 = L_2;
		Vector2_t6  L_3 = Vector2_get_zero_m539(NULL /*static, unused*/, /*hidden argument*/NULL);
		__this->___m_TotalFlexibleSize_8 = L_3;
		List_1_t644 * L_4 = (List_1_t644 *)il2cpp_codegen_object_new (List_1_t644_il2cpp_TypeInfo_var);
		List_1__ctor_m3660(L_4, /*hidden argument*/List_1__ctor_m3660_MethodInfo_var);
		__this->___m_RectChildren_9 = L_4;
		UIBehaviour__ctor_m2193(__this, /*hidden argument*/NULL);
		RectOffset_t333 * L_5 = (__this->___m_Padding_2);
		if (L_5)
		{
			goto IL_0053;
		}
	}
	{
		RectOffset_t333 * L_6 = (RectOffset_t333 *)il2cpp_codegen_object_new (RectOffset_t333_il2cpp_TypeInfo_var);
		RectOffset__ctor_m1786(L_6, /*hidden argument*/NULL);
		__this->___m_Padding_2 = L_6;
	}

IL_0053:
	{
		return;
	}
}
// UnityEngine.RectOffset UnityEngine.UI.LayoutGroup::get_padding()
extern "C" RectOffset_t333 * LayoutGroup_get_padding_m3329 (LayoutGroup_t640 * __this, const MethodInfo* method)
{
	{
		RectOffset_t333 * L_0 = (__this->___m_Padding_2);
		return L_0;
	}
}
// System.Void UnityEngine.UI.LayoutGroup::set_padding(UnityEngine.RectOffset)
extern const MethodInfo* LayoutGroup_SetProperty_TisRectOffset_t333_m3661_MethodInfo_var;
extern "C" void LayoutGroup_set_padding_m3330 (LayoutGroup_t640 * __this, RectOffset_t333 * ___value, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		LayoutGroup_SetProperty_TisRectOffset_t333_m3661_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483931);
		s_Il2CppMethodIntialized = true;
	}
	{
		RectOffset_t333 ** L_0 = &(__this->___m_Padding_2);
		RectOffset_t333 * L_1 = ___value;
		LayoutGroup_SetProperty_TisRectOffset_t333_m3661(__this, L_0, L_1, /*hidden argument*/LayoutGroup_SetProperty_TisRectOffset_t333_m3661_MethodInfo_var);
		return;
	}
}
// UnityEngine.TextAnchor UnityEngine.UI.LayoutGroup::get_childAlignment()
extern "C" int32_t LayoutGroup_get_childAlignment_m3331 (LayoutGroup_t640 * __this, const MethodInfo* method)
{
	{
		int32_t L_0 = (__this->___m_ChildAlignment_3);
		return L_0;
	}
}
// System.Void UnityEngine.UI.LayoutGroup::set_childAlignment(UnityEngine.TextAnchor)
extern const MethodInfo* LayoutGroup_SetProperty_TisTextAnchor_t305_m3662_MethodInfo_var;
extern "C" void LayoutGroup_set_childAlignment_m3332 (LayoutGroup_t640 * __this, int32_t ___value, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		LayoutGroup_SetProperty_TisTextAnchor_t305_m3662_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483932);
		s_Il2CppMethodIntialized = true;
	}
	{
		int32_t* L_0 = &(__this->___m_ChildAlignment_3);
		int32_t L_1 = ___value;
		LayoutGroup_SetProperty_TisTextAnchor_t305_m3662(__this, L_0, L_1, /*hidden argument*/LayoutGroup_SetProperty_TisTextAnchor_t305_m3662_MethodInfo_var);
		return;
	}
}
// UnityEngine.RectTransform UnityEngine.UI.LayoutGroup::get_rectTransform()
extern const MethodInfo* Component_GetComponent_TisRectTransform_t242_m3562_MethodInfo_var;
extern "C" RectTransform_t242 * LayoutGroup_get_rectTransform_m3333 (LayoutGroup_t640 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		Component_GetComponent_TisRectTransform_t242_m3562_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483849);
		s_Il2CppMethodIntialized = true;
	}
	{
		RectTransform_t242 * L_0 = (__this->___m_Rect_4);
		bool L_1 = Object_op_Equality_m445(NULL /*static, unused*/, L_0, (Object_t76 *)NULL, /*hidden argument*/NULL);
		if (!L_1)
		{
			goto IL_001d;
		}
	}
	{
		RectTransform_t242 * L_2 = Component_GetComponent_TisRectTransform_t242_m3562(__this, /*hidden argument*/Component_GetComponent_TisRectTransform_t242_m3562_MethodInfo_var);
		__this->___m_Rect_4 = L_2;
	}

IL_001d:
	{
		RectTransform_t242 * L_3 = (__this->___m_Rect_4);
		return L_3;
	}
}
// System.Collections.Generic.List`1<UnityEngine.RectTransform> UnityEngine.UI.LayoutGroup::get_rectChildren()
extern "C" List_1_t644 * LayoutGroup_get_rectChildren_m3334 (LayoutGroup_t640 * __this, const MethodInfo* method)
{
	{
		List_1_t644 * L_0 = (__this->___m_RectChildren_9);
		return L_0;
	}
}
// System.Void UnityEngine.UI.LayoutGroup::CalculateLayoutInputHorizontal()
extern const Il2CppType* ILayoutIgnorer_t711_0_0_0_var;
extern TypeInfo* ListPool_1_t694_il2cpp_TypeInfo_var;
extern TypeInfo* RectTransform_t242_il2cpp_TypeInfo_var;
extern TypeInfo* Type_t_il2cpp_TypeInfo_var;
extern TypeInfo* ILayoutIgnorer_t711_il2cpp_TypeInfo_var;
extern const MethodInfo* ListPool_1_Get_m3564_MethodInfo_var;
extern const MethodInfo* ListPool_1_Release_m3565_MethodInfo_var;
extern "C" void LayoutGroup_CalculateLayoutInputHorizontal_m3335 (LayoutGroup_t640 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		ILayoutIgnorer_t711_0_0_0_var = il2cpp_codegen_type_from_index(403);
		ListPool_1_t694_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(323);
		RectTransform_t242_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(131);
		Type_t_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(38);
		ILayoutIgnorer_t711_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(403);
		ListPool_1_Get_m3564_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483851);
		ListPool_1_Release_m3565_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483852);
		s_Il2CppMethodIntialized = true;
	}
	List_1_t422 * V_0 = {0};
	int32_t V_1 = 0;
	RectTransform_t242 * V_2 = {0};
	int32_t V_3 = 0;
	Object_t * V_4 = {0};
	{
		List_1_t644 * L_0 = (__this->___m_RectChildren_9);
		NullCheck(L_0);
		VirtActionInvoker0::Invoke(23 /* System.Void System.Collections.Generic.List`1<UnityEngine.RectTransform>::Clear() */, L_0);
		IL2CPP_RUNTIME_CLASS_INIT(ListPool_1_t694_il2cpp_TypeInfo_var);
		List_1_t422 * L_1 = ListPool_1_Get_m3564(NULL /*static, unused*/, /*hidden argument*/ListPool_1_Get_m3564_MethodInfo_var);
		V_0 = L_1;
		V_1 = 0;
		goto IL_00be;
	}

IL_0018:
	{
		RectTransform_t242 * L_2 = LayoutGroup_get_rectTransform_m3333(__this, /*hidden argument*/NULL);
		int32_t L_3 = V_1;
		NullCheck(L_2);
		Transform_t3 * L_4 = Transform_GetChild_m1402(L_2, L_3, /*hidden argument*/NULL);
		V_2 = ((RectTransform_t242 *)IsInstSealed(L_4, RectTransform_t242_il2cpp_TypeInfo_var));
		RectTransform_t242 * L_5 = V_2;
		bool L_6 = Object_op_Equality_m445(NULL /*static, unused*/, L_5, (Object_t76 *)NULL, /*hidden argument*/NULL);
		if (L_6)
		{
			goto IL_0046;
		}
	}
	{
		RectTransform_t242 * L_7 = V_2;
		NullCheck(L_7);
		GameObject_t77 * L_8 = Component_get_gameObject_m428(L_7, /*hidden argument*/NULL);
		NullCheck(L_8);
		bool L_9 = GameObject_get_activeInHierarchy_m1361(L_8, /*hidden argument*/NULL);
		if (L_9)
		{
			goto IL_004b;
		}
	}

IL_0046:
	{
		goto IL_00ba;
	}

IL_004b:
	{
		RectTransform_t242 * L_10 = V_2;
		IL2CPP_RUNTIME_CLASS_INIT(Type_t_il2cpp_TypeInfo_var);
		Type_t * L_11 = Type_GetTypeFromHandle_m585(NULL /*static, unused*/, LoadTypeToken(ILayoutIgnorer_t711_0_0_0_var), /*hidden argument*/NULL);
		List_1_t422 * L_12 = V_0;
		NullCheck(L_10);
		Component_GetComponents_m1351(L_10, L_11, L_12, /*hidden argument*/NULL);
		List_1_t422 * L_13 = V_0;
		NullCheck(L_13);
		int32_t L_14 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.Component>::get_Count() */, L_13);
		if (L_14)
		{
			goto IL_0078;
		}
	}
	{
		List_1_t644 * L_15 = (__this->___m_RectChildren_9);
		RectTransform_t242 * L_16 = V_2;
		NullCheck(L_15);
		VirtActionInvoker1< RectTransform_t242 * >::Invoke(22 /* System.Void System.Collections.Generic.List`1<UnityEngine.RectTransform>::Add(!0) */, L_15, L_16);
		goto IL_00ba;
	}

IL_0078:
	{
		V_3 = 0;
		goto IL_00ae;
	}

IL_007f:
	{
		List_1_t422 * L_17 = V_0;
		int32_t L_18 = V_3;
		NullCheck(L_17);
		Component_t169 * L_19 = (Component_t169 *)VirtFuncInvoker1< Component_t169 *, int32_t >::Invoke(31 /* !0 System.Collections.Generic.List`1<UnityEngine.Component>::get_Item(System.Int32) */, L_17, L_18);
		V_4 = ((Object_t *)Castclass(L_19, ILayoutIgnorer_t711_il2cpp_TypeInfo_var));
		Object_t * L_20 = V_4;
		NullCheck(L_20);
		bool L_21 = (bool)InterfaceFuncInvoker0< bool >::Invoke(0 /* System.Boolean UnityEngine.UI.ILayoutIgnorer::get_ignoreLayout() */, ILayoutIgnorer_t711_il2cpp_TypeInfo_var, L_20);
		if (L_21)
		{
			goto IL_00aa;
		}
	}
	{
		List_1_t644 * L_22 = (__this->___m_RectChildren_9);
		RectTransform_t242 * L_23 = V_2;
		NullCheck(L_22);
		VirtActionInvoker1< RectTransform_t242 * >::Invoke(22 /* System.Void System.Collections.Generic.List`1<UnityEngine.RectTransform>::Add(!0) */, L_22, L_23);
		goto IL_00ba;
	}

IL_00aa:
	{
		int32_t L_24 = V_3;
		V_3 = ((int32_t)((int32_t)L_24+(int32_t)1));
	}

IL_00ae:
	{
		int32_t L_25 = V_3;
		List_1_t422 * L_26 = V_0;
		NullCheck(L_26);
		int32_t L_27 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.Component>::get_Count() */, L_26);
		if ((((int32_t)L_25) < ((int32_t)L_27)))
		{
			goto IL_007f;
		}
	}

IL_00ba:
	{
		int32_t L_28 = V_1;
		V_1 = ((int32_t)((int32_t)L_28+(int32_t)1));
	}

IL_00be:
	{
		int32_t L_29 = V_1;
		RectTransform_t242 * L_30 = LayoutGroup_get_rectTransform_m3333(__this, /*hidden argument*/NULL);
		NullCheck(L_30);
		int32_t L_31 = Transform_get_childCount_m1398(L_30, /*hidden argument*/NULL);
		if ((((int32_t)L_29) < ((int32_t)L_31)))
		{
			goto IL_0018;
		}
	}
	{
		List_1_t422 * L_32 = V_0;
		IL2CPP_RUNTIME_CLASS_INIT(ListPool_1_t694_il2cpp_TypeInfo_var);
		ListPool_1_Release_m3565(NULL /*static, unused*/, L_32, /*hidden argument*/ListPool_1_Release_m3565_MethodInfo_var);
		DrivenRectTransformTracker_t238 * L_33 = &(__this->___m_Tracker_5);
		DrivenRectTransformTracker_Clear_m1144(L_33, /*hidden argument*/NULL);
		return;
	}
}
// System.Single UnityEngine.UI.LayoutGroup::get_minWidth()
extern "C" float LayoutGroup_get_minWidth_m3336 (LayoutGroup_t640 * __this, const MethodInfo* method)
{
	{
		float L_0 = LayoutGroup_GetTotalMinSize_m3346(__this, 0, /*hidden argument*/NULL);
		return L_0;
	}
}
// System.Single UnityEngine.UI.LayoutGroup::get_preferredWidth()
extern "C" float LayoutGroup_get_preferredWidth_m3337 (LayoutGroup_t640 * __this, const MethodInfo* method)
{
	{
		float L_0 = LayoutGroup_GetTotalPreferredSize_m3347(__this, 0, /*hidden argument*/NULL);
		return L_0;
	}
}
// System.Single UnityEngine.UI.LayoutGroup::get_flexibleWidth()
extern "C" float LayoutGroup_get_flexibleWidth_m3338 (LayoutGroup_t640 * __this, const MethodInfo* method)
{
	{
		float L_0 = LayoutGroup_GetTotalFlexibleSize_m3348(__this, 0, /*hidden argument*/NULL);
		return L_0;
	}
}
// System.Single UnityEngine.UI.LayoutGroup::get_minHeight()
extern "C" float LayoutGroup_get_minHeight_m3339 (LayoutGroup_t640 * __this, const MethodInfo* method)
{
	{
		float L_0 = LayoutGroup_GetTotalMinSize_m3346(__this, 1, /*hidden argument*/NULL);
		return L_0;
	}
}
// System.Single UnityEngine.UI.LayoutGroup::get_preferredHeight()
extern "C" float LayoutGroup_get_preferredHeight_m3340 (LayoutGroup_t640 * __this, const MethodInfo* method)
{
	{
		float L_0 = LayoutGroup_GetTotalPreferredSize_m3347(__this, 1, /*hidden argument*/NULL);
		return L_0;
	}
}
// System.Single UnityEngine.UI.LayoutGroup::get_flexibleHeight()
extern "C" float LayoutGroup_get_flexibleHeight_m3341 (LayoutGroup_t640 * __this, const MethodInfo* method)
{
	{
		float L_0 = LayoutGroup_GetTotalFlexibleSize_m3348(__this, 1, /*hidden argument*/NULL);
		return L_0;
	}
}
// System.Int32 UnityEngine.UI.LayoutGroup::get_layoutPriority()
extern "C" int32_t LayoutGroup_get_layoutPriority_m3342 (LayoutGroup_t640 * __this, const MethodInfo* method)
{
	{
		return 0;
	}
}
// System.Void UnityEngine.UI.LayoutGroup::OnEnable()
extern "C" void LayoutGroup_OnEnable_m3343 (LayoutGroup_t640 * __this, const MethodInfo* method)
{
	{
		UIBehaviour_OnEnable_m2195(__this, /*hidden argument*/NULL);
		LayoutGroup_SetDirty_m3355(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.LayoutGroup::OnDisable()
extern TypeInfo* LayoutRebuilder_t645_il2cpp_TypeInfo_var;
extern "C" void LayoutGroup_OnDisable_m3344 (LayoutGroup_t640 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		LayoutRebuilder_t645_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(318);
		s_Il2CppMethodIntialized = true;
	}
	{
		DrivenRectTransformTracker_t238 * L_0 = &(__this->___m_Tracker_5);
		DrivenRectTransformTracker_Clear_m1144(L_0, /*hidden argument*/NULL);
		RectTransform_t242 * L_1 = LayoutGroup_get_rectTransform_m3333(__this, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		LayoutRebuilder_MarkLayoutForRebuild_m3368(NULL /*static, unused*/, L_1, /*hidden argument*/NULL);
		UIBehaviour_OnDisable_m2197(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.LayoutGroup::OnDidApplyAnimationProperties()
extern "C" void LayoutGroup_OnDidApplyAnimationProperties_m3345 (LayoutGroup_t640 * __this, const MethodInfo* method)
{
	{
		LayoutGroup_SetDirty_m3355(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Single UnityEngine.UI.LayoutGroup::GetTotalMinSize(System.Int32)
extern "C" float LayoutGroup_GetTotalMinSize_m3346 (LayoutGroup_t640 * __this, int32_t ___axis, const MethodInfo* method)
{
	{
		Vector2_t6 * L_0 = &(__this->___m_TotalMinSize_6);
		int32_t L_1 = ___axis;
		float L_2 = Vector2_get_Item_m943(L_0, L_1, /*hidden argument*/NULL);
		return L_2;
	}
}
// System.Single UnityEngine.UI.LayoutGroup::GetTotalPreferredSize(System.Int32)
extern "C" float LayoutGroup_GetTotalPreferredSize_m3347 (LayoutGroup_t640 * __this, int32_t ___axis, const MethodInfo* method)
{
	{
		Vector2_t6 * L_0 = &(__this->___m_TotalPreferredSize_7);
		int32_t L_1 = ___axis;
		float L_2 = Vector2_get_Item_m943(L_0, L_1, /*hidden argument*/NULL);
		return L_2;
	}
}
// System.Single UnityEngine.UI.LayoutGroup::GetTotalFlexibleSize(System.Int32)
extern "C" float LayoutGroup_GetTotalFlexibleSize_m3348 (LayoutGroup_t640 * __this, int32_t ___axis, const MethodInfo* method)
{
	{
		Vector2_t6 * L_0 = &(__this->___m_TotalFlexibleSize_8);
		int32_t L_1 = ___axis;
		float L_2 = Vector2_get_Item_m943(L_0, L_1, /*hidden argument*/NULL);
		return L_2;
	}
}
// System.Single UnityEngine.UI.LayoutGroup::GetStartOffset(System.Int32,System.Single)
extern "C" float LayoutGroup_GetStartOffset_m3349 (LayoutGroup_t640 * __this, int32_t ___axis, float ___requiredSpaceWithoutPadding, const MethodInfo* method)
{
	float V_0 = 0.0f;
	float V_1 = 0.0f;
	float V_2 = 0.0f;
	float V_3 = 0.0f;
	Rect_t232  V_4 = {0};
	Vector2_t6  V_5 = {0};
	float G_B2_0 = 0.0f;
	float G_B1_0 = 0.0f;
	int32_t G_B3_0 = 0;
	float G_B3_1 = 0.0f;
	int32_t G_B9_0 = 0;
	{
		float L_0 = ___requiredSpaceWithoutPadding;
		int32_t L_1 = ___axis;
		G_B1_0 = L_0;
		if (L_1)
		{
			G_B2_0 = L_0;
			goto IL_0017;
		}
	}
	{
		RectOffset_t333 * L_2 = LayoutGroup_get_padding_m3329(__this, /*hidden argument*/NULL);
		NullCheck(L_2);
		int32_t L_3 = RectOffset_get_horizontal_m1795(L_2, /*hidden argument*/NULL);
		G_B3_0 = L_3;
		G_B3_1 = G_B1_0;
		goto IL_0022;
	}

IL_0017:
	{
		RectOffset_t333 * L_4 = LayoutGroup_get_padding_m3329(__this, /*hidden argument*/NULL);
		NullCheck(L_4);
		int32_t L_5 = RectOffset_get_vertical_m1796(L_4, /*hidden argument*/NULL);
		G_B3_0 = L_5;
		G_B3_1 = G_B2_0;
	}

IL_0022:
	{
		V_0 = ((float)((float)G_B3_1+(float)(((float)((float)G_B3_0)))));
		RectTransform_t242 * L_6 = LayoutGroup_get_rectTransform_m3333(__this, /*hidden argument*/NULL);
		NullCheck(L_6);
		Rect_t232  L_7 = RectTransform_get_rect_m1151(L_6, /*hidden argument*/NULL);
		V_4 = L_7;
		Vector2_t6  L_8 = Rect_get_size_m1020((&V_4), /*hidden argument*/NULL);
		V_5 = L_8;
		int32_t L_9 = ___axis;
		float L_10 = Vector2_get_Item_m943((&V_5), L_9, /*hidden argument*/NULL);
		V_1 = L_10;
		float L_11 = V_1;
		float L_12 = V_0;
		V_2 = ((float)((float)L_11-(float)L_12));
		V_3 = (0.0f);
		int32_t L_13 = ___axis;
		if (L_13)
		{
			goto IL_0069;
		}
	}
	{
		int32_t L_14 = LayoutGroup_get_childAlignment_m3331(__this, /*hidden argument*/NULL);
		V_3 = ((float)((float)(((float)((float)((int32_t)((int32_t)L_14%(int32_t)3)))))*(float)(0.5f)));
		goto IL_0079;
	}

IL_0069:
	{
		int32_t L_15 = LayoutGroup_get_childAlignment_m3331(__this, /*hidden argument*/NULL);
		V_3 = ((float)((float)(((float)((float)((int32_t)((int32_t)L_15/(int32_t)3)))))*(float)(0.5f)));
	}

IL_0079:
	{
		int32_t L_16 = ___axis;
		if (L_16)
		{
			goto IL_008f;
		}
	}
	{
		RectOffset_t333 * L_17 = LayoutGroup_get_padding_m3329(__this, /*hidden argument*/NULL);
		NullCheck(L_17);
		int32_t L_18 = RectOffset_get_left_m1791(L_17, /*hidden argument*/NULL);
		G_B9_0 = L_18;
		goto IL_009a;
	}

IL_008f:
	{
		RectOffset_t333 * L_19 = LayoutGroup_get_padding_m3329(__this, /*hidden argument*/NULL);
		NullCheck(L_19);
		int32_t L_20 = RectOffset_get_top_m1793(L_19, /*hidden argument*/NULL);
		G_B9_0 = L_20;
	}

IL_009a:
	{
		float L_21 = V_2;
		float L_22 = V_3;
		return ((float)((float)(((float)((float)G_B9_0)))+(float)((float)((float)L_21*(float)L_22))));
	}
}
// System.Void UnityEngine.UI.LayoutGroup::SetLayoutInputForAxis(System.Single,System.Single,System.Single,System.Int32)
extern "C" void LayoutGroup_SetLayoutInputForAxis_m3350 (LayoutGroup_t640 * __this, float ___totalMin, float ___totalPreferred, float ___totalFlexible, int32_t ___axis, const MethodInfo* method)
{
	{
		Vector2_t6 * L_0 = &(__this->___m_TotalMinSize_6);
		int32_t L_1 = ___axis;
		float L_2 = ___totalMin;
		Vector2_set_Item_m944(L_0, L_1, L_2, /*hidden argument*/NULL);
		Vector2_t6 * L_3 = &(__this->___m_TotalPreferredSize_7);
		int32_t L_4 = ___axis;
		float L_5 = ___totalPreferred;
		Vector2_set_Item_m944(L_3, L_4, L_5, /*hidden argument*/NULL);
		Vector2_t6 * L_6 = &(__this->___m_TotalFlexibleSize_8);
		int32_t L_7 = ___axis;
		float L_8 = ___totalFlexible;
		Vector2_set_Item_m944(L_6, L_7, L_8, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.LayoutGroup::SetChildAlongAxis(UnityEngine.RectTransform,System.Int32,System.Single,System.Single)
extern "C" void LayoutGroup_SetChildAlongAxis_m3351 (LayoutGroup_t640 * __this, RectTransform_t242 * ___rect, int32_t ___axis, float ___pos, float ___size, const MethodInfo* method)
{
	RectTransform_t242 * G_B4_0 = {0};
	RectTransform_t242 * G_B3_0 = {0};
	int32_t G_B5_0 = 0;
	RectTransform_t242 * G_B5_1 = {0};
	{
		RectTransform_t242 * L_0 = ___rect;
		bool L_1 = Object_op_Equality_m445(NULL /*static, unused*/, L_0, (Object_t76 *)NULL, /*hidden argument*/NULL);
		if (!L_1)
		{
			goto IL_000d;
		}
	}
	{
		return;
	}

IL_000d:
	{
		DrivenRectTransformTracker_t238 * L_2 = &(__this->___m_Tracker_5);
		RectTransform_t242 * L_3 = ___rect;
		DrivenRectTransformTracker_Add_m1143(L_2, __this, L_3, ((int32_t)16134), /*hidden argument*/NULL);
		RectTransform_t242 * L_4 = ___rect;
		int32_t L_5 = ___axis;
		G_B3_0 = L_4;
		if (L_5)
		{
			G_B4_0 = L_4;
			goto IL_002c;
		}
	}
	{
		G_B5_0 = 0;
		G_B5_1 = G_B3_0;
		goto IL_002d;
	}

IL_002c:
	{
		G_B5_0 = 2;
		G_B5_1 = G_B4_0;
	}

IL_002d:
	{
		float L_6 = ___pos;
		float L_7 = ___size;
		NullCheck(G_B5_1);
		RectTransform_SetInsetAndSizeFromParentEdge_m1176(G_B5_1, G_B5_0, L_6, L_7, /*hidden argument*/NULL);
		return;
	}
}
// System.Boolean UnityEngine.UI.LayoutGroup::get_isRootLayoutGroup()
extern const Il2CppType* ILayoutGroup_t712_0_0_0_var;
extern TypeInfo* Type_t_il2cpp_TypeInfo_var;
extern "C" bool LayoutGroup_get_isRootLayoutGroup_m3352 (LayoutGroup_t640 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		ILayoutGroup_t712_0_0_0_var = il2cpp_codegen_type_from_index(404);
		Type_t_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(38);
		s_Il2CppMethodIntialized = true;
	}
	Transform_t3 * V_0 = {0};
	{
		Transform_t3 * L_0 = Component_get_transform_m401(__this, /*hidden argument*/NULL);
		NullCheck(L_0);
		Transform_t3 * L_1 = Transform_get_parent_m481(L_0, /*hidden argument*/NULL);
		V_0 = L_1;
		Transform_t3 * L_2 = V_0;
		bool L_3 = Object_op_Equality_m445(NULL /*static, unused*/, L_2, (Object_t76 *)NULL, /*hidden argument*/NULL);
		if (!L_3)
		{
			goto IL_001a;
		}
	}
	{
		return 1;
	}

IL_001a:
	{
		Transform_t3 * L_4 = Component_get_transform_m401(__this, /*hidden argument*/NULL);
		NullCheck(L_4);
		Transform_t3 * L_5 = Transform_get_parent_m481(L_4, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(Type_t_il2cpp_TypeInfo_var);
		Type_t * L_6 = Type_GetTypeFromHandle_m585(NULL /*static, unused*/, LoadTypeToken(ILayoutGroup_t712_0_0_0_var), /*hidden argument*/NULL);
		NullCheck(L_5);
		Component_t169 * L_7 = Component_GetComponent_m1346(L_5, L_6, /*hidden argument*/NULL);
		bool L_8 = Object_op_Equality_m445(NULL /*static, unused*/, L_7, (Object_t76 *)NULL, /*hidden argument*/NULL);
		return L_8;
	}
}
// System.Void UnityEngine.UI.LayoutGroup::OnRectTransformDimensionsChange()
extern "C" void LayoutGroup_OnRectTransformDimensionsChange_m3353 (LayoutGroup_t640 * __this, const MethodInfo* method)
{
	{
		UIBehaviour_OnRectTransformDimensionsChange_m2200(__this, /*hidden argument*/NULL);
		bool L_0 = LayoutGroup_get_isRootLayoutGroup_m3352(__this, /*hidden argument*/NULL);
		if (!L_0)
		{
			goto IL_0017;
		}
	}
	{
		LayoutGroup_SetDirty_m3355(__this, /*hidden argument*/NULL);
	}

IL_0017:
	{
		return;
	}
}
// System.Void UnityEngine.UI.LayoutGroup::OnTransformChildrenChanged()
extern "C" void LayoutGroup_OnTransformChildrenChanged_m3354 (LayoutGroup_t640 * __this, const MethodInfo* method)
{
	{
		LayoutGroup_SetDirty_m3355(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.LayoutGroup::SetDirty()
extern TypeInfo* LayoutRebuilder_t645_il2cpp_TypeInfo_var;
extern "C" void LayoutGroup_SetDirty_m3355 (LayoutGroup_t640 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		LayoutRebuilder_t645_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(318);
		s_Il2CppMethodIntialized = true;
	}
	{
		bool L_0 = (bool)VirtFuncInvoker0< bool >::Invoke(9 /* System.Boolean UnityEngine.EventSystems.UIBehaviour::IsActive() */, __this);
		if (L_0)
		{
			goto IL_000c;
		}
	}
	{
		return;
	}

IL_000c:
	{
		RectTransform_t242 * L_1 = LayoutGroup_get_rectTransform_m3333(__this, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		LayoutRebuilder_MarkLayoutForRebuild_m3368(NULL /*static, unused*/, L_1, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.LayoutRebuilder::.ctor()
extern "C" void LayoutRebuilder__ctor_m3356 (LayoutRebuilder_t645 * __this, const MethodInfo* method)
{
	{
		Object__ctor_m482(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.LayoutRebuilder::.cctor()
extern TypeInfo* LayoutRebuilder_t645_il2cpp_TypeInfo_var;
extern TypeInfo* UnityAction_1_t647_il2cpp_TypeInfo_var;
extern TypeInfo* ObjectPool_1_t646_il2cpp_TypeInfo_var;
extern TypeInfo* ReapplyDrivenProperties_t241_il2cpp_TypeInfo_var;
extern const MethodInfo* LayoutRebuilder_U3Cs_RebuildersU3Em__6_m3377_MethodInfo_var;
extern const MethodInfo* UnityAction_1__ctor_m3663_MethodInfo_var;
extern const MethodInfo* ObjectPool_1__ctor_m3664_MethodInfo_var;
extern const MethodInfo* LayoutRebuilder_ReapplyDrivenProperties_m3360_MethodInfo_var;
extern "C" void LayoutRebuilder__cctor_m3357 (Object_t * __this /* static, unused */, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		LayoutRebuilder_t645_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(318);
		UnityAction_1_t647_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(405);
		ObjectPool_1_t646_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(406);
		ReapplyDrivenProperties_t241_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(132);
		LayoutRebuilder_U3Cs_RebuildersU3Em__6_m3377_MethodInfo_var = il2cpp_codegen_method_info_from_index(285);
		UnityAction_1__ctor_m3663_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483934);
		ObjectPool_1__ctor_m3664_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483935);
		LayoutRebuilder_ReapplyDrivenProperties_m3360_MethodInfo_var = il2cpp_codegen_method_info_from_index(288);
		s_Il2CppMethodIntialized = true;
	}
	Object_t * G_B2_0 = {0};
	Object_t * G_B1_0 = {0};
	{
		UnityAction_1_t647 * L_0 = ((LayoutRebuilder_t645_StaticFields*)LayoutRebuilder_t645_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache3_3;
		G_B1_0 = NULL;
		if (L_0)
		{
			G_B2_0 = NULL;
			goto IL_0019;
		}
	}
	{
		IntPtr_t L_1 = { (void*)LayoutRebuilder_U3Cs_RebuildersU3Em__6_m3377_MethodInfo_var };
		UnityAction_1_t647 * L_2 = (UnityAction_1_t647 *)il2cpp_codegen_object_new (UnityAction_1_t647_il2cpp_TypeInfo_var);
		UnityAction_1__ctor_m3663(L_2, NULL, L_1, /*hidden argument*/UnityAction_1__ctor_m3663_MethodInfo_var);
		((LayoutRebuilder_t645_StaticFields*)LayoutRebuilder_t645_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache3_3 = L_2;
		G_B2_0 = G_B1_0;
	}

IL_0019:
	{
		UnityAction_1_t647 * L_3 = ((LayoutRebuilder_t645_StaticFields*)LayoutRebuilder_t645_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache3_3;
		ObjectPool_1_t646 * L_4 = (ObjectPool_1_t646 *)il2cpp_codegen_object_new (ObjectPool_1_t646_il2cpp_TypeInfo_var);
		ObjectPool_1__ctor_m3664(L_4, (UnityAction_1_t647 *)G_B2_0, L_3, /*hidden argument*/ObjectPool_1__ctor_m3664_MethodInfo_var);
		((LayoutRebuilder_t645_StaticFields*)LayoutRebuilder_t645_il2cpp_TypeInfo_var->static_fields)->___s_Rebuilders_2 = L_4;
		IntPtr_t L_5 = { (void*)LayoutRebuilder_ReapplyDrivenProperties_m3360_MethodInfo_var };
		ReapplyDrivenProperties_t241 * L_6 = (ReapplyDrivenProperties_t241 *)il2cpp_codegen_object_new (ReapplyDrivenProperties_t241_il2cpp_TypeInfo_var);
		ReapplyDrivenProperties__ctor_m1145(L_6, NULL, L_5, /*hidden argument*/NULL);
		RectTransform_add_reapplyDrivenProperties_m1149(NULL /*static, unused*/, L_6, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.LayoutRebuilder::Initialize(UnityEngine.RectTransform)
extern "C" void LayoutRebuilder_Initialize_m3358 (LayoutRebuilder_t645 * __this, RectTransform_t242 * ___controller, const MethodInfo* method)
{
	{
		RectTransform_t242 * L_0 = ___controller;
		__this->___m_ToRebuild_0 = L_0;
		RectTransform_t242 * L_1 = ___controller;
		NullCheck(L_1);
		int32_t L_2 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(2 /* System.Int32 UnityEngine.Object::GetHashCode() */, L_1);
		__this->___m_CachedHashFromTransform_1 = L_2;
		return;
	}
}
// System.Void UnityEngine.UI.LayoutRebuilder::Clear()
extern "C" void LayoutRebuilder_Clear_m3359 (LayoutRebuilder_t645 * __this, const MethodInfo* method)
{
	{
		__this->___m_ToRebuild_0 = (RectTransform_t242 *)NULL;
		__this->___m_CachedHashFromTransform_1 = 0;
		return;
	}
}
// System.Void UnityEngine.UI.LayoutRebuilder::ReapplyDrivenProperties(UnityEngine.RectTransform)
extern TypeInfo* LayoutRebuilder_t645_il2cpp_TypeInfo_var;
extern "C" void LayoutRebuilder_ReapplyDrivenProperties_m3360 (Object_t * __this /* static, unused */, RectTransform_t242 * ___driven, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		LayoutRebuilder_t645_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(318);
		s_Il2CppMethodIntialized = true;
	}
	{
		RectTransform_t242 * L_0 = ___driven;
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		LayoutRebuilder_MarkLayoutForRebuild_m3368(NULL /*static, unused*/, L_0, /*hidden argument*/NULL);
		return;
	}
}
// UnityEngine.Transform UnityEngine.UI.LayoutRebuilder::get_transform()
extern "C" Transform_t3 * LayoutRebuilder_get_transform_m3361 (LayoutRebuilder_t645 * __this, const MethodInfo* method)
{
	{
		RectTransform_t242 * L_0 = (__this->___m_ToRebuild_0);
		return L_0;
	}
}
// System.Boolean UnityEngine.UI.LayoutRebuilder::IsDestroyed()
extern "C" bool LayoutRebuilder_IsDestroyed_m3362 (LayoutRebuilder_t645 * __this, const MethodInfo* method)
{
	{
		RectTransform_t242 * L_0 = (__this->___m_ToRebuild_0);
		bool L_1 = Object_op_Equality_m445(NULL /*static, unused*/, L_0, (Object_t76 *)NULL, /*hidden argument*/NULL);
		return L_1;
	}
}
// System.Void UnityEngine.UI.LayoutRebuilder::StripDisabledBehavioursFromList(System.Collections.Generic.List`1<UnityEngine.Component>)
extern TypeInfo* LayoutRebuilder_t645_il2cpp_TypeInfo_var;
extern TypeInfo* Predicate_1_t648_il2cpp_TypeInfo_var;
extern const MethodInfo* LayoutRebuilder_U3CStripDisabledBehavioursFromListU3Em__7_m3378_MethodInfo_var;
extern const MethodInfo* Predicate_1__ctor_m3665_MethodInfo_var;
extern const MethodInfo* List_1_RemoveAll_m3666_MethodInfo_var;
extern "C" void LayoutRebuilder_StripDisabledBehavioursFromList_m3363 (Object_t * __this /* static, unused */, List_1_t422 * ___components, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		LayoutRebuilder_t645_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(318);
		Predicate_1_t648_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(407);
		LayoutRebuilder_U3CStripDisabledBehavioursFromListU3Em__7_m3378_MethodInfo_var = il2cpp_codegen_method_info_from_index(289);
		Predicate_1__ctor_m3665_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483938);
		List_1_RemoveAll_m3666_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483939);
		s_Il2CppMethodIntialized = true;
	}
	List_1_t422 * G_B2_0 = {0};
	List_1_t422 * G_B1_0 = {0};
	{
		List_1_t422 * L_0 = ___components;
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		Predicate_1_t648 * L_1 = ((LayoutRebuilder_t645_StaticFields*)LayoutRebuilder_t645_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache4_4;
		G_B1_0 = L_0;
		if (L_1)
		{
			G_B2_0 = L_0;
			goto IL_0019;
		}
	}
	{
		IntPtr_t L_2 = { (void*)LayoutRebuilder_U3CStripDisabledBehavioursFromListU3Em__7_m3378_MethodInfo_var };
		Predicate_1_t648 * L_3 = (Predicate_1_t648 *)il2cpp_codegen_object_new (Predicate_1_t648_il2cpp_TypeInfo_var);
		Predicate_1__ctor_m3665(L_3, NULL, L_2, /*hidden argument*/Predicate_1__ctor_m3665_MethodInfo_var);
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		((LayoutRebuilder_t645_StaticFields*)LayoutRebuilder_t645_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache4_4 = L_3;
		G_B2_0 = G_B1_0;
	}

IL_0019:
	{
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		Predicate_1_t648 * L_4 = ((LayoutRebuilder_t645_StaticFields*)LayoutRebuilder_t645_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache4_4;
		NullCheck(G_B2_0);
		List_1_RemoveAll_m3666(G_B2_0, L_4, /*hidden argument*/List_1_RemoveAll_m3666_MethodInfo_var);
		return;
	}
}
// System.Void UnityEngine.UI.LayoutRebuilder::ForceRebuildLayoutImmediate(UnityEngine.RectTransform)
extern TypeInfo* LayoutRebuilder_t645_il2cpp_TypeInfo_var;
extern const MethodInfo* ObjectPool_1_Get_m3667_MethodInfo_var;
extern const MethodInfo* ObjectPool_1_Release_m3668_MethodInfo_var;
extern "C" void LayoutRebuilder_ForceRebuildLayoutImmediate_m3364 (Object_t * __this /* static, unused */, RectTransform_t242 * ___layoutRoot, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		LayoutRebuilder_t645_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(318);
		ObjectPool_1_Get_m3667_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483940);
		ObjectPool_1_Release_m3668_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483941);
		s_Il2CppMethodIntialized = true;
	}
	LayoutRebuilder_t645 * V_0 = {0};
	{
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		ObjectPool_1_t646 * L_0 = ((LayoutRebuilder_t645_StaticFields*)LayoutRebuilder_t645_il2cpp_TypeInfo_var->static_fields)->___s_Rebuilders_2;
		NullCheck(L_0);
		LayoutRebuilder_t645 * L_1 = ObjectPool_1_Get_m3667(L_0, /*hidden argument*/ObjectPool_1_Get_m3667_MethodInfo_var);
		V_0 = L_1;
		LayoutRebuilder_t645 * L_2 = V_0;
		RectTransform_t242 * L_3 = ___layoutRoot;
		NullCheck(L_2);
		LayoutRebuilder_Initialize_m3358(L_2, L_3, /*hidden argument*/NULL);
		LayoutRebuilder_t645 * L_4 = V_0;
		NullCheck(L_4);
		VirtActionInvoker1< int32_t >::Invoke(4 /* System.Void UnityEngine.UI.LayoutRebuilder::Rebuild(UnityEngine.UI.CanvasUpdate) */, L_4, 1);
		ObjectPool_1_t646 * L_5 = ((LayoutRebuilder_t645_StaticFields*)LayoutRebuilder_t645_il2cpp_TypeInfo_var->static_fields)->___s_Rebuilders_2;
		LayoutRebuilder_t645 * L_6 = V_0;
		NullCheck(L_5);
		ObjectPool_1_Release_m3668(L_5, L_6, /*hidden argument*/ObjectPool_1_Release_m3668_MethodInfo_var);
		return;
	}
}
// System.Void UnityEngine.UI.LayoutRebuilder::Rebuild(UnityEngine.UI.CanvasUpdate)
extern TypeInfo* LayoutRebuilder_t645_il2cpp_TypeInfo_var;
extern TypeInfo* UnityAction_1_t649_il2cpp_TypeInfo_var;
extern const MethodInfo* LayoutRebuilder_U3CRebuildU3Em__8_m3379_MethodInfo_var;
extern const MethodInfo* UnityAction_1__ctor_m3669_MethodInfo_var;
extern const MethodInfo* LayoutRebuilder_U3CRebuildU3Em__9_m3380_MethodInfo_var;
extern const MethodInfo* LayoutRebuilder_U3CRebuildU3Em__A_m3381_MethodInfo_var;
extern const MethodInfo* LayoutRebuilder_U3CRebuildU3Em__B_m3382_MethodInfo_var;
extern "C" void LayoutRebuilder_Rebuild_m3365 (LayoutRebuilder_t645 * __this, int32_t ___executing, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		LayoutRebuilder_t645_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(318);
		UnityAction_1_t649_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(408);
		LayoutRebuilder_U3CRebuildU3Em__8_m3379_MethodInfo_var = il2cpp_codegen_method_info_from_index(294);
		UnityAction_1__ctor_m3669_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483943);
		LayoutRebuilder_U3CRebuildU3Em__9_m3380_MethodInfo_var = il2cpp_codegen_method_info_from_index(296);
		LayoutRebuilder_U3CRebuildU3Em__A_m3381_MethodInfo_var = il2cpp_codegen_method_info_from_index(297);
		LayoutRebuilder_U3CRebuildU3Em__B_m3382_MethodInfo_var = il2cpp_codegen_method_info_from_index(298);
		s_Il2CppMethodIntialized = true;
	}
	int32_t V_0 = {0};
	RectTransform_t242 * G_B4_0 = {0};
	LayoutRebuilder_t645 * G_B4_1 = {0};
	RectTransform_t242 * G_B3_0 = {0};
	LayoutRebuilder_t645 * G_B3_1 = {0};
	RectTransform_t242 * G_B6_0 = {0};
	LayoutRebuilder_t645 * G_B6_1 = {0};
	RectTransform_t242 * G_B5_0 = {0};
	LayoutRebuilder_t645 * G_B5_1 = {0};
	RectTransform_t242 * G_B8_0 = {0};
	LayoutRebuilder_t645 * G_B8_1 = {0};
	RectTransform_t242 * G_B7_0 = {0};
	LayoutRebuilder_t645 * G_B7_1 = {0};
	RectTransform_t242 * G_B10_0 = {0};
	LayoutRebuilder_t645 * G_B10_1 = {0};
	RectTransform_t242 * G_B9_0 = {0};
	LayoutRebuilder_t645 * G_B9_1 = {0};
	{
		int32_t L_0 = ___executing;
		V_0 = L_0;
		int32_t L_1 = V_0;
		if ((((int32_t)L_1) == ((int32_t)1)))
		{
			goto IL_000e;
		}
	}
	{
		goto IL_00b7;
	}

IL_000e:
	{
		RectTransform_t242 * L_2 = (__this->___m_ToRebuild_0);
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		UnityAction_1_t649 * L_3 = ((LayoutRebuilder_t645_StaticFields*)LayoutRebuilder_t645_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache5_5;
		G_B3_0 = L_2;
		G_B3_1 = __this;
		if (L_3)
		{
			G_B4_0 = L_2;
			G_B4_1 = __this;
			goto IL_002d;
		}
	}
	{
		IntPtr_t L_4 = { (void*)LayoutRebuilder_U3CRebuildU3Em__8_m3379_MethodInfo_var };
		UnityAction_1_t649 * L_5 = (UnityAction_1_t649 *)il2cpp_codegen_object_new (UnityAction_1_t649_il2cpp_TypeInfo_var);
		UnityAction_1__ctor_m3669(L_5, NULL, L_4, /*hidden argument*/UnityAction_1__ctor_m3669_MethodInfo_var);
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		((LayoutRebuilder_t645_StaticFields*)LayoutRebuilder_t645_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache5_5 = L_5;
		G_B4_0 = G_B3_0;
		G_B4_1 = G_B3_1;
	}

IL_002d:
	{
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		UnityAction_1_t649 * L_6 = ((LayoutRebuilder_t645_StaticFields*)LayoutRebuilder_t645_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache5_5;
		NullCheck(G_B4_1);
		LayoutRebuilder_PerformLayoutCalculation_m3367(G_B4_1, G_B4_0, L_6, /*hidden argument*/NULL);
		RectTransform_t242 * L_7 = (__this->___m_ToRebuild_0);
		UnityAction_1_t649 * L_8 = ((LayoutRebuilder_t645_StaticFields*)LayoutRebuilder_t645_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache6_6;
		G_B5_0 = L_7;
		G_B5_1 = __this;
		if (L_8)
		{
			G_B6_0 = L_7;
			G_B6_1 = __this;
			goto IL_0056;
		}
	}
	{
		IntPtr_t L_9 = { (void*)LayoutRebuilder_U3CRebuildU3Em__9_m3380_MethodInfo_var };
		UnityAction_1_t649 * L_10 = (UnityAction_1_t649 *)il2cpp_codegen_object_new (UnityAction_1_t649_il2cpp_TypeInfo_var);
		UnityAction_1__ctor_m3669(L_10, NULL, L_9, /*hidden argument*/UnityAction_1__ctor_m3669_MethodInfo_var);
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		((LayoutRebuilder_t645_StaticFields*)LayoutRebuilder_t645_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache6_6 = L_10;
		G_B6_0 = G_B5_0;
		G_B6_1 = G_B5_1;
	}

IL_0056:
	{
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		UnityAction_1_t649 * L_11 = ((LayoutRebuilder_t645_StaticFields*)LayoutRebuilder_t645_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache6_6;
		NullCheck(G_B6_1);
		LayoutRebuilder_PerformLayoutControl_m3366(G_B6_1, G_B6_0, L_11, /*hidden argument*/NULL);
		RectTransform_t242 * L_12 = (__this->___m_ToRebuild_0);
		UnityAction_1_t649 * L_13 = ((LayoutRebuilder_t645_StaticFields*)LayoutRebuilder_t645_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache7_7;
		G_B7_0 = L_12;
		G_B7_1 = __this;
		if (L_13)
		{
			G_B8_0 = L_12;
			G_B8_1 = __this;
			goto IL_007f;
		}
	}
	{
		IntPtr_t L_14 = { (void*)LayoutRebuilder_U3CRebuildU3Em__A_m3381_MethodInfo_var };
		UnityAction_1_t649 * L_15 = (UnityAction_1_t649 *)il2cpp_codegen_object_new (UnityAction_1_t649_il2cpp_TypeInfo_var);
		UnityAction_1__ctor_m3669(L_15, NULL, L_14, /*hidden argument*/UnityAction_1__ctor_m3669_MethodInfo_var);
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		((LayoutRebuilder_t645_StaticFields*)LayoutRebuilder_t645_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache7_7 = L_15;
		G_B8_0 = G_B7_0;
		G_B8_1 = G_B7_1;
	}

IL_007f:
	{
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		UnityAction_1_t649 * L_16 = ((LayoutRebuilder_t645_StaticFields*)LayoutRebuilder_t645_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache7_7;
		NullCheck(G_B8_1);
		LayoutRebuilder_PerformLayoutCalculation_m3367(G_B8_1, G_B8_0, L_16, /*hidden argument*/NULL);
		RectTransform_t242 * L_17 = (__this->___m_ToRebuild_0);
		UnityAction_1_t649 * L_18 = ((LayoutRebuilder_t645_StaticFields*)LayoutRebuilder_t645_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache8_8;
		G_B9_0 = L_17;
		G_B9_1 = __this;
		if (L_18)
		{
			G_B10_0 = L_17;
			G_B10_1 = __this;
			goto IL_00a8;
		}
	}
	{
		IntPtr_t L_19 = { (void*)LayoutRebuilder_U3CRebuildU3Em__B_m3382_MethodInfo_var };
		UnityAction_1_t649 * L_20 = (UnityAction_1_t649 *)il2cpp_codegen_object_new (UnityAction_1_t649_il2cpp_TypeInfo_var);
		UnityAction_1__ctor_m3669(L_20, NULL, L_19, /*hidden argument*/UnityAction_1__ctor_m3669_MethodInfo_var);
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		((LayoutRebuilder_t645_StaticFields*)LayoutRebuilder_t645_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache8_8 = L_20;
		G_B10_0 = G_B9_0;
		G_B10_1 = G_B9_1;
	}

IL_00a8:
	{
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		UnityAction_1_t649 * L_21 = ((LayoutRebuilder_t645_StaticFields*)LayoutRebuilder_t645_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache8_8;
		NullCheck(G_B10_1);
		LayoutRebuilder_PerformLayoutControl_m3366(G_B10_1, G_B10_0, L_21, /*hidden argument*/NULL);
		goto IL_00b7;
	}

IL_00b7:
	{
		return;
	}
}
// System.Void UnityEngine.UI.LayoutRebuilder::PerformLayoutControl(UnityEngine.RectTransform,UnityEngine.Events.UnityAction`1<UnityEngine.Component>)
extern const Il2CppType* ILayoutController_t713_0_0_0_var;
extern TypeInfo* ListPool_1_t694_il2cpp_TypeInfo_var;
extern TypeInfo* Type_t_il2cpp_TypeInfo_var;
extern TypeInfo* LayoutRebuilder_t645_il2cpp_TypeInfo_var;
extern TypeInfo* ILayoutSelfController_t714_il2cpp_TypeInfo_var;
extern TypeInfo* RectTransform_t242_il2cpp_TypeInfo_var;
extern const MethodInfo* ListPool_1_Get_m3564_MethodInfo_var;
extern const MethodInfo* UnityAction_1_Invoke_m3670_MethodInfo_var;
extern const MethodInfo* ListPool_1_Release_m3565_MethodInfo_var;
extern "C" void LayoutRebuilder_PerformLayoutControl_m3366 (LayoutRebuilder_t645 * __this, RectTransform_t242 * ___rect, UnityAction_1_t649 * ___action, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		ILayoutController_t713_0_0_0_var = il2cpp_codegen_type_from_index(409);
		ListPool_1_t694_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(323);
		Type_t_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(38);
		LayoutRebuilder_t645_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(318);
		ILayoutSelfController_t714_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(410);
		RectTransform_t242_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(131);
		ListPool_1_Get_m3564_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483851);
		UnityAction_1_Invoke_m3670_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483947);
		ListPool_1_Release_m3565_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483852);
		s_Il2CppMethodIntialized = true;
	}
	List_1_t422 * V_0 = {0};
	int32_t V_1 = 0;
	int32_t V_2 = 0;
	int32_t V_3 = 0;
	{
		RectTransform_t242 * L_0 = ___rect;
		bool L_1 = Object_op_Equality_m445(NULL /*static, unused*/, L_0, (Object_t76 *)NULL, /*hidden argument*/NULL);
		if (!L_1)
		{
			goto IL_000d;
		}
	}
	{
		return;
	}

IL_000d:
	{
		IL2CPP_RUNTIME_CLASS_INIT(ListPool_1_t694_il2cpp_TypeInfo_var);
		List_1_t422 * L_2 = ListPool_1_Get_m3564(NULL /*static, unused*/, /*hidden argument*/ListPool_1_Get_m3564_MethodInfo_var);
		V_0 = L_2;
		RectTransform_t242 * L_3 = ___rect;
		IL2CPP_RUNTIME_CLASS_INIT(Type_t_il2cpp_TypeInfo_var);
		Type_t * L_4 = Type_GetTypeFromHandle_m585(NULL /*static, unused*/, LoadTypeToken(ILayoutController_t713_0_0_0_var), /*hidden argument*/NULL);
		List_1_t422 * L_5 = V_0;
		NullCheck(L_3);
		Component_GetComponents_m1351(L_3, L_4, L_5, /*hidden argument*/NULL);
		List_1_t422 * L_6 = V_0;
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		LayoutRebuilder_StripDisabledBehavioursFromList_m3363(NULL /*static, unused*/, L_6, /*hidden argument*/NULL);
		List_1_t422 * L_7 = V_0;
		NullCheck(L_7);
		int32_t L_8 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.Component>::get_Count() */, L_7);
		if ((((int32_t)L_8) <= ((int32_t)0)))
		{
			goto IL_00ca;
		}
	}
	{
		V_1 = 0;
		goto IL_005f;
	}

IL_003d:
	{
		List_1_t422 * L_9 = V_0;
		int32_t L_10 = V_1;
		NullCheck(L_9);
		Component_t169 * L_11 = (Component_t169 *)VirtFuncInvoker1< Component_t169 *, int32_t >::Invoke(31 /* !0 System.Collections.Generic.List`1<UnityEngine.Component>::get_Item(System.Int32) */, L_9, L_10);
		if (!((Object_t *)IsInst(L_11, ILayoutSelfController_t714_il2cpp_TypeInfo_var)))
		{
			goto IL_005b;
		}
	}
	{
		UnityAction_1_t649 * L_12 = ___action;
		List_1_t422 * L_13 = V_0;
		int32_t L_14 = V_1;
		NullCheck(L_13);
		Component_t169 * L_15 = (Component_t169 *)VirtFuncInvoker1< Component_t169 *, int32_t >::Invoke(31 /* !0 System.Collections.Generic.List`1<UnityEngine.Component>::get_Item(System.Int32) */, L_13, L_14);
		NullCheck(L_12);
		UnityAction_1_Invoke_m3670(L_12, L_15, /*hidden argument*/UnityAction_1_Invoke_m3670_MethodInfo_var);
	}

IL_005b:
	{
		int32_t L_16 = V_1;
		V_1 = ((int32_t)((int32_t)L_16+(int32_t)1));
	}

IL_005f:
	{
		int32_t L_17 = V_1;
		List_1_t422 * L_18 = V_0;
		NullCheck(L_18);
		int32_t L_19 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.Component>::get_Count() */, L_18);
		if ((((int32_t)L_17) < ((int32_t)L_19)))
		{
			goto IL_003d;
		}
	}
	{
		V_2 = 0;
		goto IL_0094;
	}

IL_0072:
	{
		List_1_t422 * L_20 = V_0;
		int32_t L_21 = V_2;
		NullCheck(L_20);
		Component_t169 * L_22 = (Component_t169 *)VirtFuncInvoker1< Component_t169 *, int32_t >::Invoke(31 /* !0 System.Collections.Generic.List`1<UnityEngine.Component>::get_Item(System.Int32) */, L_20, L_21);
		if (((Object_t *)IsInst(L_22, ILayoutSelfController_t714_il2cpp_TypeInfo_var)))
		{
			goto IL_0090;
		}
	}
	{
		UnityAction_1_t649 * L_23 = ___action;
		List_1_t422 * L_24 = V_0;
		int32_t L_25 = V_2;
		NullCheck(L_24);
		Component_t169 * L_26 = (Component_t169 *)VirtFuncInvoker1< Component_t169 *, int32_t >::Invoke(31 /* !0 System.Collections.Generic.List`1<UnityEngine.Component>::get_Item(System.Int32) */, L_24, L_25);
		NullCheck(L_23);
		UnityAction_1_Invoke_m3670(L_23, L_26, /*hidden argument*/UnityAction_1_Invoke_m3670_MethodInfo_var);
	}

IL_0090:
	{
		int32_t L_27 = V_2;
		V_2 = ((int32_t)((int32_t)L_27+(int32_t)1));
	}

IL_0094:
	{
		int32_t L_28 = V_2;
		List_1_t422 * L_29 = V_0;
		NullCheck(L_29);
		int32_t L_30 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.Component>::get_Count() */, L_29);
		if ((((int32_t)L_28) < ((int32_t)L_30)))
		{
			goto IL_0072;
		}
	}
	{
		V_3 = 0;
		goto IL_00be;
	}

IL_00a7:
	{
		RectTransform_t242 * L_31 = ___rect;
		int32_t L_32 = V_3;
		NullCheck(L_31);
		Transform_t3 * L_33 = Transform_GetChild_m1402(L_31, L_32, /*hidden argument*/NULL);
		UnityAction_1_t649 * L_34 = ___action;
		LayoutRebuilder_PerformLayoutControl_m3366(__this, ((RectTransform_t242 *)IsInstSealed(L_33, RectTransform_t242_il2cpp_TypeInfo_var)), L_34, /*hidden argument*/NULL);
		int32_t L_35 = V_3;
		V_3 = ((int32_t)((int32_t)L_35+(int32_t)1));
	}

IL_00be:
	{
		int32_t L_36 = V_3;
		RectTransform_t242 * L_37 = ___rect;
		NullCheck(L_37);
		int32_t L_38 = Transform_get_childCount_m1398(L_37, /*hidden argument*/NULL);
		if ((((int32_t)L_36) < ((int32_t)L_38)))
		{
			goto IL_00a7;
		}
	}

IL_00ca:
	{
		List_1_t422 * L_39 = V_0;
		IL2CPP_RUNTIME_CLASS_INIT(ListPool_1_t694_il2cpp_TypeInfo_var);
		ListPool_1_Release_m3565(NULL /*static, unused*/, L_39, /*hidden argument*/ListPool_1_Release_m3565_MethodInfo_var);
		return;
	}
}
// System.Void UnityEngine.UI.LayoutRebuilder::PerformLayoutCalculation(UnityEngine.RectTransform,UnityEngine.Events.UnityAction`1<UnityEngine.Component>)
extern const Il2CppType* ILayoutElement_t684_0_0_0_var;
extern TypeInfo* ListPool_1_t694_il2cpp_TypeInfo_var;
extern TypeInfo* Type_t_il2cpp_TypeInfo_var;
extern TypeInfo* LayoutRebuilder_t645_il2cpp_TypeInfo_var;
extern TypeInfo* RectTransform_t242_il2cpp_TypeInfo_var;
extern const MethodInfo* ListPool_1_Get_m3564_MethodInfo_var;
extern const MethodInfo* UnityAction_1_Invoke_m3670_MethodInfo_var;
extern const MethodInfo* ListPool_1_Release_m3565_MethodInfo_var;
extern "C" void LayoutRebuilder_PerformLayoutCalculation_m3367 (LayoutRebuilder_t645 * __this, RectTransform_t242 * ___rect, UnityAction_1_t649 * ___action, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		ILayoutElement_t684_0_0_0_var = il2cpp_codegen_type_from_index(411);
		ListPool_1_t694_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(323);
		Type_t_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(38);
		LayoutRebuilder_t645_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(318);
		RectTransform_t242_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(131);
		ListPool_1_Get_m3564_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483851);
		UnityAction_1_Invoke_m3670_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483947);
		ListPool_1_Release_m3565_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483852);
		s_Il2CppMethodIntialized = true;
	}
	List_1_t422 * V_0 = {0};
	int32_t V_1 = 0;
	int32_t V_2 = 0;
	{
		RectTransform_t242 * L_0 = ___rect;
		bool L_1 = Object_op_Equality_m445(NULL /*static, unused*/, L_0, (Object_t76 *)NULL, /*hidden argument*/NULL);
		if (!L_1)
		{
			goto IL_000d;
		}
	}
	{
		return;
	}

IL_000d:
	{
		IL2CPP_RUNTIME_CLASS_INIT(ListPool_1_t694_il2cpp_TypeInfo_var);
		List_1_t422 * L_2 = ListPool_1_Get_m3564(NULL /*static, unused*/, /*hidden argument*/ListPool_1_Get_m3564_MethodInfo_var);
		V_0 = L_2;
		RectTransform_t242 * L_3 = ___rect;
		IL2CPP_RUNTIME_CLASS_INIT(Type_t_il2cpp_TypeInfo_var);
		Type_t * L_4 = Type_GetTypeFromHandle_m585(NULL /*static, unused*/, LoadTypeToken(ILayoutElement_t684_0_0_0_var), /*hidden argument*/NULL);
		List_1_t422 * L_5 = V_0;
		NullCheck(L_3);
		Component_GetComponents_m1351(L_3, L_4, L_5, /*hidden argument*/NULL);
		List_1_t422 * L_6 = V_0;
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		LayoutRebuilder_StripDisabledBehavioursFromList_m3363(NULL /*static, unused*/, L_6, /*hidden argument*/NULL);
		List_1_t422 * L_7 = V_0;
		NullCheck(L_7);
		int32_t L_8 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.Component>::get_Count() */, L_7);
		if ((((int32_t)L_8) <= ((int32_t)0)))
		{
			goto IL_0084;
		}
	}
	{
		V_1 = 0;
		goto IL_0054;
	}

IL_003d:
	{
		RectTransform_t242 * L_9 = ___rect;
		int32_t L_10 = V_1;
		NullCheck(L_9);
		Transform_t3 * L_11 = Transform_GetChild_m1402(L_9, L_10, /*hidden argument*/NULL);
		UnityAction_1_t649 * L_12 = ___action;
		LayoutRebuilder_PerformLayoutCalculation_m3367(__this, ((RectTransform_t242 *)IsInstSealed(L_11, RectTransform_t242_il2cpp_TypeInfo_var)), L_12, /*hidden argument*/NULL);
		int32_t L_13 = V_1;
		V_1 = ((int32_t)((int32_t)L_13+(int32_t)1));
	}

IL_0054:
	{
		int32_t L_14 = V_1;
		RectTransform_t242 * L_15 = ___rect;
		NullCheck(L_15);
		int32_t L_16 = Transform_get_childCount_m1398(L_15, /*hidden argument*/NULL);
		if ((((int32_t)L_14) < ((int32_t)L_16)))
		{
			goto IL_003d;
		}
	}
	{
		V_2 = 0;
		goto IL_0078;
	}

IL_0067:
	{
		UnityAction_1_t649 * L_17 = ___action;
		List_1_t422 * L_18 = V_0;
		int32_t L_19 = V_2;
		NullCheck(L_18);
		Component_t169 * L_20 = (Component_t169 *)VirtFuncInvoker1< Component_t169 *, int32_t >::Invoke(31 /* !0 System.Collections.Generic.List`1<UnityEngine.Component>::get_Item(System.Int32) */, L_18, L_19);
		NullCheck(L_17);
		UnityAction_1_Invoke_m3670(L_17, L_20, /*hidden argument*/UnityAction_1_Invoke_m3670_MethodInfo_var);
		int32_t L_21 = V_2;
		V_2 = ((int32_t)((int32_t)L_21+(int32_t)1));
	}

IL_0078:
	{
		int32_t L_22 = V_2;
		List_1_t422 * L_23 = V_0;
		NullCheck(L_23);
		int32_t L_24 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.Component>::get_Count() */, L_23);
		if ((((int32_t)L_22) < ((int32_t)L_24)))
		{
			goto IL_0067;
		}
	}

IL_0084:
	{
		List_1_t422 * L_25 = V_0;
		IL2CPP_RUNTIME_CLASS_INIT(ListPool_1_t694_il2cpp_TypeInfo_var);
		ListPool_1_Release_m3565(NULL /*static, unused*/, L_25, /*hidden argument*/ListPool_1_Release_m3565_MethodInfo_var);
		return;
	}
}
// System.Void UnityEngine.UI.LayoutRebuilder::MarkLayoutForRebuild(UnityEngine.RectTransform)
extern TypeInfo* RectTransform_t242_il2cpp_TypeInfo_var;
extern TypeInfo* LayoutRebuilder_t645_il2cpp_TypeInfo_var;
extern "C" void LayoutRebuilder_MarkLayoutForRebuild_m3368 (Object_t * __this /* static, unused */, RectTransform_t242 * ___rect, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		RectTransform_t242_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(131);
		LayoutRebuilder_t645_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(318);
		s_Il2CppMethodIntialized = true;
	}
	RectTransform_t242 * V_0 = {0};
	RectTransform_t242 * V_1 = {0};
	{
		RectTransform_t242 * L_0 = ___rect;
		bool L_1 = Object_op_Equality_m445(NULL /*static, unused*/, L_0, (Object_t76 *)NULL, /*hidden argument*/NULL);
		if (!L_1)
		{
			goto IL_000d;
		}
	}
	{
		return;
	}

IL_000d:
	{
		RectTransform_t242 * L_2 = ___rect;
		V_0 = L_2;
	}

IL_000f:
	{
		RectTransform_t242 * L_3 = V_0;
		NullCheck(L_3);
		Transform_t3 * L_4 = Transform_get_parent_m481(L_3, /*hidden argument*/NULL);
		V_1 = ((RectTransform_t242 *)IsInstSealed(L_4, RectTransform_t242_il2cpp_TypeInfo_var));
		RectTransform_t242 * L_5 = V_1;
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		bool L_6 = LayoutRebuilder_ValidLayoutGroup_m3369(NULL /*static, unused*/, L_5, /*hidden argument*/NULL);
		if (L_6)
		{
			goto IL_002b;
		}
	}
	{
		goto IL_0032;
	}

IL_002b:
	{
		RectTransform_t242 * L_7 = V_1;
		V_0 = L_7;
		goto IL_000f;
	}

IL_0032:
	{
		RectTransform_t242 * L_8 = V_0;
		RectTransform_t242 * L_9 = ___rect;
		bool L_10 = Object_op_Equality_m445(NULL /*static, unused*/, L_8, L_9, /*hidden argument*/NULL);
		if (!L_10)
		{
			goto IL_004a;
		}
	}
	{
		RectTransform_t242 * L_11 = V_0;
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		bool L_12 = LayoutRebuilder_ValidController_m3370(NULL /*static, unused*/, L_11, /*hidden argument*/NULL);
		if (L_12)
		{
			goto IL_004a;
		}
	}
	{
		return;
	}

IL_004a:
	{
		RectTransform_t242 * L_13 = V_0;
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		LayoutRebuilder_MarkLayoutRootForRebuild_m3371(NULL /*static, unused*/, L_13, /*hidden argument*/NULL);
		return;
	}
}
// System.Boolean UnityEngine.UI.LayoutRebuilder::ValidLayoutGroup(UnityEngine.RectTransform)
extern const Il2CppType* ILayoutGroup_t712_0_0_0_var;
extern TypeInfo* ListPool_1_t694_il2cpp_TypeInfo_var;
extern TypeInfo* Type_t_il2cpp_TypeInfo_var;
extern TypeInfo* LayoutRebuilder_t645_il2cpp_TypeInfo_var;
extern const MethodInfo* ListPool_1_Get_m3564_MethodInfo_var;
extern const MethodInfo* ListPool_1_Release_m3565_MethodInfo_var;
extern "C" bool LayoutRebuilder_ValidLayoutGroup_m3369 (Object_t * __this /* static, unused */, RectTransform_t242 * ___parent, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		ILayoutGroup_t712_0_0_0_var = il2cpp_codegen_type_from_index(404);
		ListPool_1_t694_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(323);
		Type_t_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(38);
		LayoutRebuilder_t645_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(318);
		ListPool_1_Get_m3564_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483851);
		ListPool_1_Release_m3565_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483852);
		s_Il2CppMethodIntialized = true;
	}
	List_1_t422 * V_0 = {0};
	bool V_1 = false;
	{
		RectTransform_t242 * L_0 = ___parent;
		bool L_1 = Object_op_Equality_m445(NULL /*static, unused*/, L_0, (Object_t76 *)NULL, /*hidden argument*/NULL);
		if (!L_1)
		{
			goto IL_000e;
		}
	}
	{
		return 0;
	}

IL_000e:
	{
		IL2CPP_RUNTIME_CLASS_INIT(ListPool_1_t694_il2cpp_TypeInfo_var);
		List_1_t422 * L_2 = ListPool_1_Get_m3564(NULL /*static, unused*/, /*hidden argument*/ListPool_1_Get_m3564_MethodInfo_var);
		V_0 = L_2;
		RectTransform_t242 * L_3 = ___parent;
		IL2CPP_RUNTIME_CLASS_INIT(Type_t_il2cpp_TypeInfo_var);
		Type_t * L_4 = Type_GetTypeFromHandle_m585(NULL /*static, unused*/, LoadTypeToken(ILayoutGroup_t712_0_0_0_var), /*hidden argument*/NULL);
		List_1_t422 * L_5 = V_0;
		NullCheck(L_3);
		Component_GetComponents_m1351(L_3, L_4, L_5, /*hidden argument*/NULL);
		List_1_t422 * L_6 = V_0;
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		LayoutRebuilder_StripDisabledBehavioursFromList_m3363(NULL /*static, unused*/, L_6, /*hidden argument*/NULL);
		List_1_t422 * L_7 = V_0;
		NullCheck(L_7);
		int32_t L_8 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.Component>::get_Count() */, L_7);
		V_1 = ((((int32_t)L_8) > ((int32_t)0))? 1 : 0);
		List_1_t422 * L_9 = V_0;
		ListPool_1_Release_m3565(NULL /*static, unused*/, L_9, /*hidden argument*/ListPool_1_Release_m3565_MethodInfo_var);
		bool L_10 = V_1;
		return L_10;
	}
}
// System.Boolean UnityEngine.UI.LayoutRebuilder::ValidController(UnityEngine.RectTransform)
extern const Il2CppType* ILayoutController_t713_0_0_0_var;
extern TypeInfo* ListPool_1_t694_il2cpp_TypeInfo_var;
extern TypeInfo* Type_t_il2cpp_TypeInfo_var;
extern TypeInfo* LayoutRebuilder_t645_il2cpp_TypeInfo_var;
extern const MethodInfo* ListPool_1_Get_m3564_MethodInfo_var;
extern const MethodInfo* ListPool_1_Release_m3565_MethodInfo_var;
extern "C" bool LayoutRebuilder_ValidController_m3370 (Object_t * __this /* static, unused */, RectTransform_t242 * ___layoutRoot, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		ILayoutController_t713_0_0_0_var = il2cpp_codegen_type_from_index(409);
		ListPool_1_t694_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(323);
		Type_t_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(38);
		LayoutRebuilder_t645_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(318);
		ListPool_1_Get_m3564_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483851);
		ListPool_1_Release_m3565_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483852);
		s_Il2CppMethodIntialized = true;
	}
	List_1_t422 * V_0 = {0};
	bool V_1 = false;
	{
		RectTransform_t242 * L_0 = ___layoutRoot;
		bool L_1 = Object_op_Equality_m445(NULL /*static, unused*/, L_0, (Object_t76 *)NULL, /*hidden argument*/NULL);
		if (!L_1)
		{
			goto IL_000e;
		}
	}
	{
		return 0;
	}

IL_000e:
	{
		IL2CPP_RUNTIME_CLASS_INIT(ListPool_1_t694_il2cpp_TypeInfo_var);
		List_1_t422 * L_2 = ListPool_1_Get_m3564(NULL /*static, unused*/, /*hidden argument*/ListPool_1_Get_m3564_MethodInfo_var);
		V_0 = L_2;
		RectTransform_t242 * L_3 = ___layoutRoot;
		IL2CPP_RUNTIME_CLASS_INIT(Type_t_il2cpp_TypeInfo_var);
		Type_t * L_4 = Type_GetTypeFromHandle_m585(NULL /*static, unused*/, LoadTypeToken(ILayoutController_t713_0_0_0_var), /*hidden argument*/NULL);
		List_1_t422 * L_5 = V_0;
		NullCheck(L_3);
		Component_GetComponents_m1351(L_3, L_4, L_5, /*hidden argument*/NULL);
		List_1_t422 * L_6 = V_0;
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		LayoutRebuilder_StripDisabledBehavioursFromList_m3363(NULL /*static, unused*/, L_6, /*hidden argument*/NULL);
		List_1_t422 * L_7 = V_0;
		NullCheck(L_7);
		int32_t L_8 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.Component>::get_Count() */, L_7);
		V_1 = ((((int32_t)L_8) > ((int32_t)0))? 1 : 0);
		List_1_t422 * L_9 = V_0;
		ListPool_1_Release_m3565(NULL /*static, unused*/, L_9, /*hidden argument*/ListPool_1_Release_m3565_MethodInfo_var);
		bool L_10 = V_1;
		return L_10;
	}
}
// System.Void UnityEngine.UI.LayoutRebuilder::MarkLayoutRootForRebuild(UnityEngine.RectTransform)
extern TypeInfo* LayoutRebuilder_t645_il2cpp_TypeInfo_var;
extern TypeInfo* CanvasUpdateRegistry_t540_il2cpp_TypeInfo_var;
extern const MethodInfo* ObjectPool_1_Get_m3667_MethodInfo_var;
extern const MethodInfo* ObjectPool_1_Release_m3668_MethodInfo_var;
extern "C" void LayoutRebuilder_MarkLayoutRootForRebuild_m3371 (Object_t * __this /* static, unused */, RectTransform_t242 * ___controller, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		LayoutRebuilder_t645_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(318);
		CanvasUpdateRegistry_t540_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(289);
		ObjectPool_1_Get_m3667_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483940);
		ObjectPool_1_Release_m3668_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483941);
		s_Il2CppMethodIntialized = true;
	}
	LayoutRebuilder_t645 * V_0 = {0};
	{
		RectTransform_t242 * L_0 = ___controller;
		bool L_1 = Object_op_Equality_m445(NULL /*static, unused*/, L_0, (Object_t76 *)NULL, /*hidden argument*/NULL);
		if (!L_1)
		{
			goto IL_000d;
		}
	}
	{
		return;
	}

IL_000d:
	{
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		ObjectPool_1_t646 * L_2 = ((LayoutRebuilder_t645_StaticFields*)LayoutRebuilder_t645_il2cpp_TypeInfo_var->static_fields)->___s_Rebuilders_2;
		NullCheck(L_2);
		LayoutRebuilder_t645 * L_3 = ObjectPool_1_Get_m3667(L_2, /*hidden argument*/ObjectPool_1_Get_m3667_MethodInfo_var);
		V_0 = L_3;
		LayoutRebuilder_t645 * L_4 = V_0;
		RectTransform_t242 * L_5 = ___controller;
		NullCheck(L_4);
		LayoutRebuilder_Initialize_m3358(L_4, L_5, /*hidden argument*/NULL);
		LayoutRebuilder_t645 * L_6 = V_0;
		IL2CPP_RUNTIME_CLASS_INIT(CanvasUpdateRegistry_t540_il2cpp_TypeInfo_var);
		bool L_7 = CanvasUpdateRegistry_TryRegisterCanvasElementForLayoutRebuild_m2419(NULL /*static, unused*/, L_6, /*hidden argument*/NULL);
		if (L_7)
		{
			goto IL_0035;
		}
	}
	{
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		ObjectPool_1_t646 * L_8 = ((LayoutRebuilder_t645_StaticFields*)LayoutRebuilder_t645_il2cpp_TypeInfo_var->static_fields)->___s_Rebuilders_2;
		LayoutRebuilder_t645 * L_9 = V_0;
		NullCheck(L_8);
		ObjectPool_1_Release_m3668(L_8, L_9, /*hidden argument*/ObjectPool_1_Release_m3668_MethodInfo_var);
	}

IL_0035:
	{
		return;
	}
}
// System.Void UnityEngine.UI.LayoutRebuilder::LayoutComplete()
extern TypeInfo* LayoutRebuilder_t645_il2cpp_TypeInfo_var;
extern const MethodInfo* ObjectPool_1_Release_m3668_MethodInfo_var;
extern "C" void LayoutRebuilder_LayoutComplete_m3372 (LayoutRebuilder_t645 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		LayoutRebuilder_t645_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(318);
		ObjectPool_1_Release_m3668_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483941);
		s_Il2CppMethodIntialized = true;
	}
	{
		IL2CPP_RUNTIME_CLASS_INIT(LayoutRebuilder_t645_il2cpp_TypeInfo_var);
		ObjectPool_1_t646 * L_0 = ((LayoutRebuilder_t645_StaticFields*)LayoutRebuilder_t645_il2cpp_TypeInfo_var->static_fields)->___s_Rebuilders_2;
		NullCheck(L_0);
		ObjectPool_1_Release_m3668(L_0, __this, /*hidden argument*/ObjectPool_1_Release_m3668_MethodInfo_var);
		return;
	}
}
// System.Void UnityEngine.UI.LayoutRebuilder::GraphicUpdateComplete()
extern "C" void LayoutRebuilder_GraphicUpdateComplete_m3373 (LayoutRebuilder_t645 * __this, const MethodInfo* method)
{
	{
		return;
	}
}
// System.Int32 UnityEngine.UI.LayoutRebuilder::GetHashCode()
extern "C" int32_t LayoutRebuilder_GetHashCode_m3374 (LayoutRebuilder_t645 * __this, const MethodInfo* method)
{
	{
		int32_t L_0 = (__this->___m_CachedHashFromTransform_1);
		return L_0;
	}
}
// System.Boolean UnityEngine.UI.LayoutRebuilder::Equals(System.Object)
extern "C" bool LayoutRebuilder_Equals_m3375 (LayoutRebuilder_t645 * __this, Object_t * ___obj, const MethodInfo* method)
{
	{
		Object_t * L_0 = ___obj;
		NullCheck(L_0);
		int32_t L_1 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(2 /* System.Int32 System.Object::GetHashCode() */, L_0);
		int32_t L_2 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(2 /* System.Int32 UnityEngine.UI.LayoutRebuilder::GetHashCode() */, __this);
		return ((((int32_t)L_1) == ((int32_t)L_2))? 1 : 0);
	}
}
// System.String UnityEngine.UI.LayoutRebuilder::ToString()
extern TypeInfo* String_t_il2cpp_TypeInfo_var;
extern Il2CppCodeGenString* _stringLiteral241;
extern "C" String_t* LayoutRebuilder_ToString_m3376 (LayoutRebuilder_t645 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		String_t_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(8);
		_stringLiteral241 = il2cpp_codegen_string_literal_from_index(241);
		s_Il2CppMethodIntialized = true;
	}
	{
		RectTransform_t242 * L_0 = (__this->___m_ToRebuild_0);
		IL2CPP_RUNTIME_CLASS_INIT(String_t_il2cpp_TypeInfo_var);
		String_t* L_1 = String_Concat_m622(NULL /*static, unused*/, _stringLiteral241, L_0, /*hidden argument*/NULL);
		return L_1;
	}
}
// System.Void UnityEngine.UI.LayoutRebuilder::<s_Rebuilders>m__6(UnityEngine.UI.LayoutRebuilder)
extern "C" void LayoutRebuilder_U3Cs_RebuildersU3Em__6_m3377 (Object_t * __this /* static, unused */, LayoutRebuilder_t645 * ___x, const MethodInfo* method)
{
	{
		LayoutRebuilder_t645 * L_0 = ___x;
		NullCheck(L_0);
		LayoutRebuilder_Clear_m3359(L_0, /*hidden argument*/NULL);
		return;
	}
}
// System.Boolean UnityEngine.UI.LayoutRebuilder::<StripDisabledBehavioursFromList>m__7(UnityEngine.Component)
extern TypeInfo* Behaviour_t156_il2cpp_TypeInfo_var;
extern "C" bool LayoutRebuilder_U3CStripDisabledBehavioursFromListU3Em__7_m3378 (Object_t * __this /* static, unused */, Component_t169 * ___e, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		Behaviour_t156_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(53);
		s_Il2CppMethodIntialized = true;
	}
	int32_t G_B3_0 = 0;
	{
		Component_t169 * L_0 = ___e;
		if (!((Behaviour_t156 *)IsInstClass(L_0, Behaviour_t156_il2cpp_TypeInfo_var)))
		{
			goto IL_001b;
		}
	}
	{
		Component_t169 * L_1 = ___e;
		NullCheck(((Behaviour_t156 *)CastclassClass(L_1, Behaviour_t156_il2cpp_TypeInfo_var)));
		bool L_2 = Behaviour_get_isActiveAndEnabled_m1241(((Behaviour_t156 *)CastclassClass(L_1, Behaviour_t156_il2cpp_TypeInfo_var)), /*hidden argument*/NULL);
		G_B3_0 = ((((int32_t)L_2) == ((int32_t)0))? 1 : 0);
		goto IL_001c;
	}

IL_001b:
	{
		G_B3_0 = 0;
	}

IL_001c:
	{
		return G_B3_0;
	}
}
// System.Void UnityEngine.UI.LayoutRebuilder::<Rebuild>m__8(UnityEngine.Component)
extern TypeInfo* ILayoutElement_t684_il2cpp_TypeInfo_var;
extern "C" void LayoutRebuilder_U3CRebuildU3Em__8_m3379 (Object_t * __this /* static, unused */, Component_t169 * ___e, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		ILayoutElement_t684_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(411);
		s_Il2CppMethodIntialized = true;
	}
	{
		Component_t169 * L_0 = ___e;
		NullCheck(((Object_t *)IsInst(L_0, ILayoutElement_t684_il2cpp_TypeInfo_var)));
		InterfaceActionInvoker0::Invoke(0 /* System.Void UnityEngine.UI.ILayoutElement::CalculateLayoutInputHorizontal() */, ILayoutElement_t684_il2cpp_TypeInfo_var, ((Object_t *)IsInst(L_0, ILayoutElement_t684_il2cpp_TypeInfo_var)));
		return;
	}
}
// System.Void UnityEngine.UI.LayoutRebuilder::<Rebuild>m__9(UnityEngine.Component)
extern TypeInfo* ILayoutController_t713_il2cpp_TypeInfo_var;
extern "C" void LayoutRebuilder_U3CRebuildU3Em__9_m3380 (Object_t * __this /* static, unused */, Component_t169 * ___e, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		ILayoutController_t713_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(409);
		s_Il2CppMethodIntialized = true;
	}
	{
		Component_t169 * L_0 = ___e;
		NullCheck(((Object_t *)IsInst(L_0, ILayoutController_t713_il2cpp_TypeInfo_var)));
		InterfaceActionInvoker0::Invoke(0 /* System.Void UnityEngine.UI.ILayoutController::SetLayoutHorizontal() */, ILayoutController_t713_il2cpp_TypeInfo_var, ((Object_t *)IsInst(L_0, ILayoutController_t713_il2cpp_TypeInfo_var)));
		return;
	}
}
// System.Void UnityEngine.UI.LayoutRebuilder::<Rebuild>m__A(UnityEngine.Component)
extern TypeInfo* ILayoutElement_t684_il2cpp_TypeInfo_var;
extern "C" void LayoutRebuilder_U3CRebuildU3Em__A_m3381 (Object_t * __this /* static, unused */, Component_t169 * ___e, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		ILayoutElement_t684_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(411);
		s_Il2CppMethodIntialized = true;
	}
	{
		Component_t169 * L_0 = ___e;
		NullCheck(((Object_t *)IsInst(L_0, ILayoutElement_t684_il2cpp_TypeInfo_var)));
		InterfaceActionInvoker0::Invoke(1 /* System.Void UnityEngine.UI.ILayoutElement::CalculateLayoutInputVertical() */, ILayoutElement_t684_il2cpp_TypeInfo_var, ((Object_t *)IsInst(L_0, ILayoutElement_t684_il2cpp_TypeInfo_var)));
		return;
	}
}
// System.Void UnityEngine.UI.LayoutRebuilder::<Rebuild>m__B(UnityEngine.Component)
extern TypeInfo* ILayoutController_t713_il2cpp_TypeInfo_var;
extern "C" void LayoutRebuilder_U3CRebuildU3Em__B_m3382 (Object_t * __this /* static, unused */, Component_t169 * ___e, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		ILayoutController_t713_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(409);
		s_Il2CppMethodIntialized = true;
	}
	{
		Component_t169 * L_0 = ___e;
		NullCheck(((Object_t *)IsInst(L_0, ILayoutController_t713_il2cpp_TypeInfo_var)));
		InterfaceActionInvoker0::Invoke(1 /* System.Void UnityEngine.UI.ILayoutController::SetLayoutVertical() */, ILayoutController_t713_il2cpp_TypeInfo_var, ((Object_t *)IsInst(L_0, ILayoutController_t713_il2cpp_TypeInfo_var)));
		return;
	}
}
// System.Single UnityEngine.UI.LayoutUtility::GetMinSize(UnityEngine.RectTransform,System.Int32)
extern "C" float LayoutUtility_GetMinSize_m3383 (Object_t * __this /* static, unused */, RectTransform_t242 * ___rect, int32_t ___axis, const MethodInfo* method)
{
	{
		int32_t L_0 = ___axis;
		if (L_0)
		{
			goto IL_000d;
		}
	}
	{
		RectTransform_t242 * L_1 = ___rect;
		float L_2 = LayoutUtility_GetMinWidth_m3386(NULL /*static, unused*/, L_1, /*hidden argument*/NULL);
		return L_2;
	}

IL_000d:
	{
		RectTransform_t242 * L_3 = ___rect;
		float L_4 = LayoutUtility_GetMinHeight_m3389(NULL /*static, unused*/, L_3, /*hidden argument*/NULL);
		return L_4;
	}
}
// System.Single UnityEngine.UI.LayoutUtility::GetPreferredSize(UnityEngine.RectTransform,System.Int32)
extern "C" float LayoutUtility_GetPreferredSize_m3384 (Object_t * __this /* static, unused */, RectTransform_t242 * ___rect, int32_t ___axis, const MethodInfo* method)
{
	{
		int32_t L_0 = ___axis;
		if (L_0)
		{
			goto IL_000d;
		}
	}
	{
		RectTransform_t242 * L_1 = ___rect;
		float L_2 = LayoutUtility_GetPreferredWidth_m3387(NULL /*static, unused*/, L_1, /*hidden argument*/NULL);
		return L_2;
	}

IL_000d:
	{
		RectTransform_t242 * L_3 = ___rect;
		float L_4 = LayoutUtility_GetPreferredHeight_m3390(NULL /*static, unused*/, L_3, /*hidden argument*/NULL);
		return L_4;
	}
}
// System.Single UnityEngine.UI.LayoutUtility::GetFlexibleSize(UnityEngine.RectTransform,System.Int32)
extern "C" float LayoutUtility_GetFlexibleSize_m3385 (Object_t * __this /* static, unused */, RectTransform_t242 * ___rect, int32_t ___axis, const MethodInfo* method)
{
	{
		int32_t L_0 = ___axis;
		if (L_0)
		{
			goto IL_000d;
		}
	}
	{
		RectTransform_t242 * L_1 = ___rect;
		float L_2 = LayoutUtility_GetFlexibleWidth_m3388(NULL /*static, unused*/, L_1, /*hidden argument*/NULL);
		return L_2;
	}

IL_000d:
	{
		RectTransform_t242 * L_3 = ___rect;
		float L_4 = LayoutUtility_GetFlexibleHeight_m3391(NULL /*static, unused*/, L_3, /*hidden argument*/NULL);
		return L_4;
	}
}
// System.Single UnityEngine.UI.LayoutUtility::GetMinWidth(UnityEngine.RectTransform)
extern TypeInfo* LayoutUtility_t650_il2cpp_TypeInfo_var;
extern TypeInfo* Func_2_t651_il2cpp_TypeInfo_var;
extern const MethodInfo* LayoutUtility_U3CGetMinWidthU3Em__C_m3394_MethodInfo_var;
extern const MethodInfo* Func_2__ctor_m3671_MethodInfo_var;
extern "C" float LayoutUtility_GetMinWidth_m3386 (Object_t * __this /* static, unused */, RectTransform_t242 * ___rect, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		LayoutUtility_t650_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(412);
		Func_2_t651_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(413);
		LayoutUtility_U3CGetMinWidthU3Em__C_m3394_MethodInfo_var = il2cpp_codegen_method_info_from_index(300);
		Func_2__ctor_m3671_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483949);
		s_Il2CppMethodIntialized = true;
	}
	RectTransform_t242 * G_B2_0 = {0};
	RectTransform_t242 * G_B1_0 = {0};
	{
		RectTransform_t242 * L_0 = ___rect;
		Func_2_t651 * L_1 = ((LayoutUtility_t650_StaticFields*)LayoutUtility_t650_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache0_0;
		G_B1_0 = L_0;
		if (L_1)
		{
			G_B2_0 = L_0;
			goto IL_0019;
		}
	}
	{
		IntPtr_t L_2 = { (void*)LayoutUtility_U3CGetMinWidthU3Em__C_m3394_MethodInfo_var };
		Func_2_t651 * L_3 = (Func_2_t651 *)il2cpp_codegen_object_new (Func_2_t651_il2cpp_TypeInfo_var);
		Func_2__ctor_m3671(L_3, NULL, L_2, /*hidden argument*/Func_2__ctor_m3671_MethodInfo_var);
		((LayoutUtility_t650_StaticFields*)LayoutUtility_t650_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache0_0 = L_3;
		G_B2_0 = G_B1_0;
	}

IL_0019:
	{
		Func_2_t651 * L_4 = ((LayoutUtility_t650_StaticFields*)LayoutUtility_t650_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache0_0;
		float L_5 = LayoutUtility_GetLayoutProperty_m3392(NULL /*static, unused*/, G_B2_0, L_4, (0.0f), /*hidden argument*/NULL);
		return L_5;
	}
}
// System.Single UnityEngine.UI.LayoutUtility::GetPreferredWidth(UnityEngine.RectTransform)
extern TypeInfo* LayoutUtility_t650_il2cpp_TypeInfo_var;
extern TypeInfo* Func_2_t651_il2cpp_TypeInfo_var;
extern TypeInfo* Mathf_t134_il2cpp_TypeInfo_var;
extern const MethodInfo* LayoutUtility_U3CGetPreferredWidthU3Em__D_m3395_MethodInfo_var;
extern const MethodInfo* Func_2__ctor_m3671_MethodInfo_var;
extern const MethodInfo* LayoutUtility_U3CGetPreferredWidthU3Em__E_m3396_MethodInfo_var;
extern "C" float LayoutUtility_GetPreferredWidth_m3387 (Object_t * __this /* static, unused */, RectTransform_t242 * ___rect, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		LayoutUtility_t650_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(412);
		Func_2_t651_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(413);
		Mathf_t134_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(1);
		LayoutUtility_U3CGetPreferredWidthU3Em__D_m3395_MethodInfo_var = il2cpp_codegen_method_info_from_index(302);
		Func_2__ctor_m3671_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483949);
		LayoutUtility_U3CGetPreferredWidthU3Em__E_m3396_MethodInfo_var = il2cpp_codegen_method_info_from_index(303);
		s_Il2CppMethodIntialized = true;
	}
	RectTransform_t242 * G_B2_0 = {0};
	RectTransform_t242 * G_B1_0 = {0};
	RectTransform_t242 * G_B4_0 = {0};
	float G_B4_1 = 0.0f;
	RectTransform_t242 * G_B3_0 = {0};
	float G_B3_1 = 0.0f;
	{
		RectTransform_t242 * L_0 = ___rect;
		Func_2_t651 * L_1 = ((LayoutUtility_t650_StaticFields*)LayoutUtility_t650_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache1_1;
		G_B1_0 = L_0;
		if (L_1)
		{
			G_B2_0 = L_0;
			goto IL_0019;
		}
	}
	{
		IntPtr_t L_2 = { (void*)LayoutUtility_U3CGetPreferredWidthU3Em__D_m3395_MethodInfo_var };
		Func_2_t651 * L_3 = (Func_2_t651 *)il2cpp_codegen_object_new (Func_2_t651_il2cpp_TypeInfo_var);
		Func_2__ctor_m3671(L_3, NULL, L_2, /*hidden argument*/Func_2__ctor_m3671_MethodInfo_var);
		((LayoutUtility_t650_StaticFields*)LayoutUtility_t650_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache1_1 = L_3;
		G_B2_0 = G_B1_0;
	}

IL_0019:
	{
		Func_2_t651 * L_4 = ((LayoutUtility_t650_StaticFields*)LayoutUtility_t650_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache1_1;
		float L_5 = LayoutUtility_GetLayoutProperty_m3392(NULL /*static, unused*/, G_B2_0, L_4, (0.0f), /*hidden argument*/NULL);
		RectTransform_t242 * L_6 = ___rect;
		Func_2_t651 * L_7 = ((LayoutUtility_t650_StaticFields*)LayoutUtility_t650_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache2_2;
		G_B3_0 = L_6;
		G_B3_1 = L_5;
		if (L_7)
		{
			G_B4_0 = L_6;
			G_B4_1 = L_5;
			goto IL_0041;
		}
	}
	{
		IntPtr_t L_8 = { (void*)LayoutUtility_U3CGetPreferredWidthU3Em__E_m3396_MethodInfo_var };
		Func_2_t651 * L_9 = (Func_2_t651 *)il2cpp_codegen_object_new (Func_2_t651_il2cpp_TypeInfo_var);
		Func_2__ctor_m3671(L_9, NULL, L_8, /*hidden argument*/Func_2__ctor_m3671_MethodInfo_var);
		((LayoutUtility_t650_StaticFields*)LayoutUtility_t650_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache2_2 = L_9;
		G_B4_0 = G_B3_0;
		G_B4_1 = G_B3_1;
	}

IL_0041:
	{
		Func_2_t651 * L_10 = ((LayoutUtility_t650_StaticFields*)LayoutUtility_t650_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache2_2;
		float L_11 = LayoutUtility_GetLayoutProperty_m3392(NULL /*static, unused*/, G_B4_0, L_10, (0.0f), /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(Mathf_t134_il2cpp_TypeInfo_var);
		float L_12 = Mathf_Max_m682(NULL /*static, unused*/, G_B4_1, L_11, /*hidden argument*/NULL);
		return L_12;
	}
}
// System.Single UnityEngine.UI.LayoutUtility::GetFlexibleWidth(UnityEngine.RectTransform)
extern TypeInfo* LayoutUtility_t650_il2cpp_TypeInfo_var;
extern TypeInfo* Func_2_t651_il2cpp_TypeInfo_var;
extern const MethodInfo* LayoutUtility_U3CGetFlexibleWidthU3Em__F_m3397_MethodInfo_var;
extern const MethodInfo* Func_2__ctor_m3671_MethodInfo_var;
extern "C" float LayoutUtility_GetFlexibleWidth_m3388 (Object_t * __this /* static, unused */, RectTransform_t242 * ___rect, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		LayoutUtility_t650_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(412);
		Func_2_t651_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(413);
		LayoutUtility_U3CGetFlexibleWidthU3Em__F_m3397_MethodInfo_var = il2cpp_codegen_method_info_from_index(304);
		Func_2__ctor_m3671_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483949);
		s_Il2CppMethodIntialized = true;
	}
	RectTransform_t242 * G_B2_0 = {0};
	RectTransform_t242 * G_B1_0 = {0};
	{
		RectTransform_t242 * L_0 = ___rect;
		Func_2_t651 * L_1 = ((LayoutUtility_t650_StaticFields*)LayoutUtility_t650_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache3_3;
		G_B1_0 = L_0;
		if (L_1)
		{
			G_B2_0 = L_0;
			goto IL_0019;
		}
	}
	{
		IntPtr_t L_2 = { (void*)LayoutUtility_U3CGetFlexibleWidthU3Em__F_m3397_MethodInfo_var };
		Func_2_t651 * L_3 = (Func_2_t651 *)il2cpp_codegen_object_new (Func_2_t651_il2cpp_TypeInfo_var);
		Func_2__ctor_m3671(L_3, NULL, L_2, /*hidden argument*/Func_2__ctor_m3671_MethodInfo_var);
		((LayoutUtility_t650_StaticFields*)LayoutUtility_t650_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache3_3 = L_3;
		G_B2_0 = G_B1_0;
	}

IL_0019:
	{
		Func_2_t651 * L_4 = ((LayoutUtility_t650_StaticFields*)LayoutUtility_t650_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache3_3;
		float L_5 = LayoutUtility_GetLayoutProperty_m3392(NULL /*static, unused*/, G_B2_0, L_4, (0.0f), /*hidden argument*/NULL);
		return L_5;
	}
}
// System.Single UnityEngine.UI.LayoutUtility::GetMinHeight(UnityEngine.RectTransform)
extern TypeInfo* LayoutUtility_t650_il2cpp_TypeInfo_var;
extern TypeInfo* Func_2_t651_il2cpp_TypeInfo_var;
extern const MethodInfo* LayoutUtility_U3CGetMinHeightU3Em__10_m3398_MethodInfo_var;
extern const MethodInfo* Func_2__ctor_m3671_MethodInfo_var;
extern "C" float LayoutUtility_GetMinHeight_m3389 (Object_t * __this /* static, unused */, RectTransform_t242 * ___rect, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		LayoutUtility_t650_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(412);
		Func_2_t651_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(413);
		LayoutUtility_U3CGetMinHeightU3Em__10_m3398_MethodInfo_var = il2cpp_codegen_method_info_from_index(305);
		Func_2__ctor_m3671_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483949);
		s_Il2CppMethodIntialized = true;
	}
	RectTransform_t242 * G_B2_0 = {0};
	RectTransform_t242 * G_B1_0 = {0};
	{
		RectTransform_t242 * L_0 = ___rect;
		Func_2_t651 * L_1 = ((LayoutUtility_t650_StaticFields*)LayoutUtility_t650_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache4_4;
		G_B1_0 = L_0;
		if (L_1)
		{
			G_B2_0 = L_0;
			goto IL_0019;
		}
	}
	{
		IntPtr_t L_2 = { (void*)LayoutUtility_U3CGetMinHeightU3Em__10_m3398_MethodInfo_var };
		Func_2_t651 * L_3 = (Func_2_t651 *)il2cpp_codegen_object_new (Func_2_t651_il2cpp_TypeInfo_var);
		Func_2__ctor_m3671(L_3, NULL, L_2, /*hidden argument*/Func_2__ctor_m3671_MethodInfo_var);
		((LayoutUtility_t650_StaticFields*)LayoutUtility_t650_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache4_4 = L_3;
		G_B2_0 = G_B1_0;
	}

IL_0019:
	{
		Func_2_t651 * L_4 = ((LayoutUtility_t650_StaticFields*)LayoutUtility_t650_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache4_4;
		float L_5 = LayoutUtility_GetLayoutProperty_m3392(NULL /*static, unused*/, G_B2_0, L_4, (0.0f), /*hidden argument*/NULL);
		return L_5;
	}
}
// System.Single UnityEngine.UI.LayoutUtility::GetPreferredHeight(UnityEngine.RectTransform)
extern TypeInfo* LayoutUtility_t650_il2cpp_TypeInfo_var;
extern TypeInfo* Func_2_t651_il2cpp_TypeInfo_var;
extern TypeInfo* Mathf_t134_il2cpp_TypeInfo_var;
extern const MethodInfo* LayoutUtility_U3CGetPreferredHeightU3Em__11_m3399_MethodInfo_var;
extern const MethodInfo* Func_2__ctor_m3671_MethodInfo_var;
extern const MethodInfo* LayoutUtility_U3CGetPreferredHeightU3Em__12_m3400_MethodInfo_var;
extern "C" float LayoutUtility_GetPreferredHeight_m3390 (Object_t * __this /* static, unused */, RectTransform_t242 * ___rect, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		LayoutUtility_t650_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(412);
		Func_2_t651_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(413);
		Mathf_t134_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(1);
		LayoutUtility_U3CGetPreferredHeightU3Em__11_m3399_MethodInfo_var = il2cpp_codegen_method_info_from_index(306);
		Func_2__ctor_m3671_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483949);
		LayoutUtility_U3CGetPreferredHeightU3Em__12_m3400_MethodInfo_var = il2cpp_codegen_method_info_from_index(307);
		s_Il2CppMethodIntialized = true;
	}
	RectTransform_t242 * G_B2_0 = {0};
	RectTransform_t242 * G_B1_0 = {0};
	RectTransform_t242 * G_B4_0 = {0};
	float G_B4_1 = 0.0f;
	RectTransform_t242 * G_B3_0 = {0};
	float G_B3_1 = 0.0f;
	{
		RectTransform_t242 * L_0 = ___rect;
		Func_2_t651 * L_1 = ((LayoutUtility_t650_StaticFields*)LayoutUtility_t650_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache5_5;
		G_B1_0 = L_0;
		if (L_1)
		{
			G_B2_0 = L_0;
			goto IL_0019;
		}
	}
	{
		IntPtr_t L_2 = { (void*)LayoutUtility_U3CGetPreferredHeightU3Em__11_m3399_MethodInfo_var };
		Func_2_t651 * L_3 = (Func_2_t651 *)il2cpp_codegen_object_new (Func_2_t651_il2cpp_TypeInfo_var);
		Func_2__ctor_m3671(L_3, NULL, L_2, /*hidden argument*/Func_2__ctor_m3671_MethodInfo_var);
		((LayoutUtility_t650_StaticFields*)LayoutUtility_t650_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache5_5 = L_3;
		G_B2_0 = G_B1_0;
	}

IL_0019:
	{
		Func_2_t651 * L_4 = ((LayoutUtility_t650_StaticFields*)LayoutUtility_t650_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache5_5;
		float L_5 = LayoutUtility_GetLayoutProperty_m3392(NULL /*static, unused*/, G_B2_0, L_4, (0.0f), /*hidden argument*/NULL);
		RectTransform_t242 * L_6 = ___rect;
		Func_2_t651 * L_7 = ((LayoutUtility_t650_StaticFields*)LayoutUtility_t650_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache6_6;
		G_B3_0 = L_6;
		G_B3_1 = L_5;
		if (L_7)
		{
			G_B4_0 = L_6;
			G_B4_1 = L_5;
			goto IL_0041;
		}
	}
	{
		IntPtr_t L_8 = { (void*)LayoutUtility_U3CGetPreferredHeightU3Em__12_m3400_MethodInfo_var };
		Func_2_t651 * L_9 = (Func_2_t651 *)il2cpp_codegen_object_new (Func_2_t651_il2cpp_TypeInfo_var);
		Func_2__ctor_m3671(L_9, NULL, L_8, /*hidden argument*/Func_2__ctor_m3671_MethodInfo_var);
		((LayoutUtility_t650_StaticFields*)LayoutUtility_t650_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache6_6 = L_9;
		G_B4_0 = G_B3_0;
		G_B4_1 = G_B3_1;
	}

IL_0041:
	{
		Func_2_t651 * L_10 = ((LayoutUtility_t650_StaticFields*)LayoutUtility_t650_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache6_6;
		float L_11 = LayoutUtility_GetLayoutProperty_m3392(NULL /*static, unused*/, G_B4_0, L_10, (0.0f), /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(Mathf_t134_il2cpp_TypeInfo_var);
		float L_12 = Mathf_Max_m682(NULL /*static, unused*/, G_B4_1, L_11, /*hidden argument*/NULL);
		return L_12;
	}
}
// System.Single UnityEngine.UI.LayoutUtility::GetFlexibleHeight(UnityEngine.RectTransform)
extern TypeInfo* LayoutUtility_t650_il2cpp_TypeInfo_var;
extern TypeInfo* Func_2_t651_il2cpp_TypeInfo_var;
extern const MethodInfo* LayoutUtility_U3CGetFlexibleHeightU3Em__13_m3401_MethodInfo_var;
extern const MethodInfo* Func_2__ctor_m3671_MethodInfo_var;
extern "C" float LayoutUtility_GetFlexibleHeight_m3391 (Object_t * __this /* static, unused */, RectTransform_t242 * ___rect, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		LayoutUtility_t650_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(412);
		Func_2_t651_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(413);
		LayoutUtility_U3CGetFlexibleHeightU3Em__13_m3401_MethodInfo_var = il2cpp_codegen_method_info_from_index(308);
		Func_2__ctor_m3671_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483949);
		s_Il2CppMethodIntialized = true;
	}
	RectTransform_t242 * G_B2_0 = {0};
	RectTransform_t242 * G_B1_0 = {0};
	{
		RectTransform_t242 * L_0 = ___rect;
		Func_2_t651 * L_1 = ((LayoutUtility_t650_StaticFields*)LayoutUtility_t650_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache7_7;
		G_B1_0 = L_0;
		if (L_1)
		{
			G_B2_0 = L_0;
			goto IL_0019;
		}
	}
	{
		IntPtr_t L_2 = { (void*)LayoutUtility_U3CGetFlexibleHeightU3Em__13_m3401_MethodInfo_var };
		Func_2_t651 * L_3 = (Func_2_t651 *)il2cpp_codegen_object_new (Func_2_t651_il2cpp_TypeInfo_var);
		Func_2__ctor_m3671(L_3, NULL, L_2, /*hidden argument*/Func_2__ctor_m3671_MethodInfo_var);
		((LayoutUtility_t650_StaticFields*)LayoutUtility_t650_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache7_7 = L_3;
		G_B2_0 = G_B1_0;
	}

IL_0019:
	{
		Func_2_t651 * L_4 = ((LayoutUtility_t650_StaticFields*)LayoutUtility_t650_il2cpp_TypeInfo_var->static_fields)->___U3CU3Ef__amU24cache7_7;
		float L_5 = LayoutUtility_GetLayoutProperty_m3392(NULL /*static, unused*/, G_B2_0, L_4, (0.0f), /*hidden argument*/NULL);
		return L_5;
	}
}
// System.Single UnityEngine.UI.LayoutUtility::GetLayoutProperty(UnityEngine.RectTransform,System.Func`2<UnityEngine.UI.ILayoutElement,System.Single>,System.Single)
extern "C" float LayoutUtility_GetLayoutProperty_m3392 (Object_t * __this /* static, unused */, RectTransform_t242 * ___rect, Func_2_t651 * ___property, float ___defaultValue, const MethodInfo* method)
{
	Object_t * V_0 = {0};
	{
		RectTransform_t242 * L_0 = ___rect;
		Func_2_t651 * L_1 = ___property;
		float L_2 = ___defaultValue;
		float L_3 = LayoutUtility_GetLayoutProperty_m3393(NULL /*static, unused*/, L_0, L_1, L_2, (&V_0), /*hidden argument*/NULL);
		return L_3;
	}
}
// System.Single UnityEngine.UI.LayoutUtility::GetLayoutProperty(UnityEngine.RectTransform,System.Func`2<UnityEngine.UI.ILayoutElement,System.Single>,System.Single,UnityEngine.UI.ILayoutElement&)
extern const Il2CppType* ILayoutElement_t684_0_0_0_var;
extern TypeInfo* ListPool_1_t694_il2cpp_TypeInfo_var;
extern TypeInfo* Type_t_il2cpp_TypeInfo_var;
extern TypeInfo* ILayoutElement_t684_il2cpp_TypeInfo_var;
extern TypeInfo* Behaviour_t156_il2cpp_TypeInfo_var;
extern const MethodInfo* ListPool_1_Get_m3564_MethodInfo_var;
extern const MethodInfo* Func_2_Invoke_m3672_MethodInfo_var;
extern const MethodInfo* ListPool_1_Release_m3565_MethodInfo_var;
extern "C" float LayoutUtility_GetLayoutProperty_m3393 (Object_t * __this /* static, unused */, RectTransform_t242 * ___rect, Func_2_t651 * ___property, float ___defaultValue, Object_t ** ___source, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		ILayoutElement_t684_0_0_0_var = il2cpp_codegen_type_from_index(411);
		ListPool_1_t694_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(323);
		Type_t_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(38);
		ILayoutElement_t684_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(411);
		Behaviour_t156_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(53);
		ListPool_1_Get_m3564_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483851);
		Func_2_Invoke_m3672_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483957);
		ListPool_1_Release_m3565_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483852);
		s_Il2CppMethodIntialized = true;
	}
	float V_0 = 0.0f;
	int32_t V_1 = 0;
	List_1_t422 * V_2 = {0};
	int32_t V_3 = 0;
	Object_t * V_4 = {0};
	int32_t V_5 = 0;
	float V_6 = 0.0f;
	{
		Object_t ** L_0 = ___source;
		*((Object_t **)(L_0)) = (Object_t *)NULL;
		RectTransform_t242 * L_1 = ___rect;
		bool L_2 = Object_op_Equality_m445(NULL /*static, unused*/, L_1, (Object_t76 *)NULL, /*hidden argument*/NULL);
		if (!L_2)
		{
			goto IL_0015;
		}
	}
	{
		return (0.0f);
	}

IL_0015:
	{
		float L_3 = ___defaultValue;
		V_0 = L_3;
		V_1 = ((int32_t)-2147483648);
		IL2CPP_RUNTIME_CLASS_INIT(ListPool_1_t694_il2cpp_TypeInfo_var);
		List_1_t422 * L_4 = ListPool_1_Get_m3564(NULL /*static, unused*/, /*hidden argument*/ListPool_1_Get_m3564_MethodInfo_var);
		V_2 = L_4;
		RectTransform_t242 * L_5 = ___rect;
		IL2CPP_RUNTIME_CLASS_INIT(Type_t_il2cpp_TypeInfo_var);
		Type_t * L_6 = Type_GetTypeFromHandle_m585(NULL /*static, unused*/, LoadTypeToken(ILayoutElement_t684_0_0_0_var), /*hidden argument*/NULL);
		List_1_t422 * L_7 = V_2;
		NullCheck(L_5);
		Component_GetComponents_m1351(L_5, L_6, L_7, /*hidden argument*/NULL);
		V_3 = 0;
		goto IL_00c6;
	}

IL_003b:
	{
		List_1_t422 * L_8 = V_2;
		int32_t L_9 = V_3;
		NullCheck(L_8);
		Component_t169 * L_10 = (Component_t169 *)VirtFuncInvoker1< Component_t169 *, int32_t >::Invoke(31 /* !0 System.Collections.Generic.List`1<UnityEngine.Component>::get_Item(System.Int32) */, L_8, L_9);
		V_4 = ((Object_t *)IsInst(L_10, ILayoutElement_t684_il2cpp_TypeInfo_var));
		Object_t * L_11 = V_4;
		if (!((Behaviour_t156 *)IsInstClass(L_11, Behaviour_t156_il2cpp_TypeInfo_var)))
		{
			goto IL_006b;
		}
	}
	{
		Object_t * L_12 = V_4;
		NullCheck(((Behaviour_t156 *)CastclassClass(L_12, Behaviour_t156_il2cpp_TypeInfo_var)));
		bool L_13 = Behaviour_get_isActiveAndEnabled_m1241(((Behaviour_t156 *)CastclassClass(L_12, Behaviour_t156_il2cpp_TypeInfo_var)), /*hidden argument*/NULL);
		if (L_13)
		{
			goto IL_006b;
		}
	}
	{
		goto IL_00c2;
	}

IL_006b:
	{
		Object_t * L_14 = V_4;
		NullCheck(L_14);
		int32_t L_15 = (int32_t)InterfaceFuncInvoker0< int32_t >::Invoke(8 /* System.Int32 UnityEngine.UI.ILayoutElement::get_layoutPriority() */, ILayoutElement_t684_il2cpp_TypeInfo_var, L_14);
		V_5 = L_15;
		int32_t L_16 = V_5;
		int32_t L_17 = V_1;
		if ((((int32_t)L_16) >= ((int32_t)L_17)))
		{
			goto IL_0081;
		}
	}
	{
		goto IL_00c2;
	}

IL_0081:
	{
		Func_2_t651 * L_18 = ___property;
		Object_t * L_19 = V_4;
		NullCheck(L_18);
		float L_20 = Func_2_Invoke_m3672(L_18, L_19, /*hidden argument*/Func_2_Invoke_m3672_MethodInfo_var);
		V_6 = L_20;
		float L_21 = V_6;
		if ((!(((float)L_21) < ((float)(0.0f)))))
		{
			goto IL_009c;
		}
	}
	{
		goto IL_00c2;
	}

IL_009c:
	{
		int32_t L_22 = V_5;
		int32_t L_23 = V_1;
		if ((((int32_t)L_22) <= ((int32_t)L_23)))
		{
			goto IL_00b3;
		}
	}
	{
		float L_24 = V_6;
		V_0 = L_24;
		int32_t L_25 = V_5;
		V_1 = L_25;
		Object_t ** L_26 = ___source;
		Object_t * L_27 = V_4;
		*((Object_t **)(L_26)) = (Object_t *)L_27;
		goto IL_00c2;
	}

IL_00b3:
	{
		float L_28 = V_6;
		float L_29 = V_0;
		if ((!(((float)L_28) > ((float)L_29))))
		{
			goto IL_00c2;
		}
	}
	{
		float L_30 = V_6;
		V_0 = L_30;
		Object_t ** L_31 = ___source;
		Object_t * L_32 = V_4;
		*((Object_t **)(L_31)) = (Object_t *)L_32;
	}

IL_00c2:
	{
		int32_t L_33 = V_3;
		V_3 = ((int32_t)((int32_t)L_33+(int32_t)1));
	}

IL_00c6:
	{
		int32_t L_34 = V_3;
		List_1_t422 * L_35 = V_2;
		NullCheck(L_35);
		int32_t L_36 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.Component>::get_Count() */, L_35);
		if ((((int32_t)L_34) < ((int32_t)L_36)))
		{
			goto IL_003b;
		}
	}
	{
		List_1_t422 * L_37 = V_2;
		IL2CPP_RUNTIME_CLASS_INIT(ListPool_1_t694_il2cpp_TypeInfo_var);
		ListPool_1_Release_m3565(NULL /*static, unused*/, L_37, /*hidden argument*/ListPool_1_Release_m3565_MethodInfo_var);
		float L_38 = V_0;
		return L_38;
	}
}
// System.Single UnityEngine.UI.LayoutUtility::<GetMinWidth>m__C(UnityEngine.UI.ILayoutElement)
extern TypeInfo* ILayoutElement_t684_il2cpp_TypeInfo_var;
extern "C" float LayoutUtility_U3CGetMinWidthU3Em__C_m3394 (Object_t * __this /* static, unused */, Object_t * ___e, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		ILayoutElement_t684_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(411);
		s_Il2CppMethodIntialized = true;
	}
	{
		Object_t * L_0 = ___e;
		NullCheck(L_0);
		float L_1 = (float)InterfaceFuncInvoker0< float >::Invoke(2 /* System.Single UnityEngine.UI.ILayoutElement::get_minWidth() */, ILayoutElement_t684_il2cpp_TypeInfo_var, L_0);
		return L_1;
	}
}
// System.Single UnityEngine.UI.LayoutUtility::<GetPreferredWidth>m__D(UnityEngine.UI.ILayoutElement)
extern TypeInfo* ILayoutElement_t684_il2cpp_TypeInfo_var;
extern "C" float LayoutUtility_U3CGetPreferredWidthU3Em__D_m3395 (Object_t * __this /* static, unused */, Object_t * ___e, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		ILayoutElement_t684_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(411);
		s_Il2CppMethodIntialized = true;
	}
	{
		Object_t * L_0 = ___e;
		NullCheck(L_0);
		float L_1 = (float)InterfaceFuncInvoker0< float >::Invoke(2 /* System.Single UnityEngine.UI.ILayoutElement::get_minWidth() */, ILayoutElement_t684_il2cpp_TypeInfo_var, L_0);
		return L_1;
	}
}
// System.Single UnityEngine.UI.LayoutUtility::<GetPreferredWidth>m__E(UnityEngine.UI.ILayoutElement)
extern TypeInfo* ILayoutElement_t684_il2cpp_TypeInfo_var;
extern "C" float LayoutUtility_U3CGetPreferredWidthU3Em__E_m3396 (Object_t * __this /* static, unused */, Object_t * ___e, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		ILayoutElement_t684_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(411);
		s_Il2CppMethodIntialized = true;
	}
	{
		Object_t * L_0 = ___e;
		NullCheck(L_0);
		float L_1 = (float)InterfaceFuncInvoker0< float >::Invoke(3 /* System.Single UnityEngine.UI.ILayoutElement::get_preferredWidth() */, ILayoutElement_t684_il2cpp_TypeInfo_var, L_0);
		return L_1;
	}
}
// System.Single UnityEngine.UI.LayoutUtility::<GetFlexibleWidth>m__F(UnityEngine.UI.ILayoutElement)
extern TypeInfo* ILayoutElement_t684_il2cpp_TypeInfo_var;
extern "C" float LayoutUtility_U3CGetFlexibleWidthU3Em__F_m3397 (Object_t * __this /* static, unused */, Object_t * ___e, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		ILayoutElement_t684_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(411);
		s_Il2CppMethodIntialized = true;
	}
	{
		Object_t * L_0 = ___e;
		NullCheck(L_0);
		float L_1 = (float)InterfaceFuncInvoker0< float >::Invoke(4 /* System.Single UnityEngine.UI.ILayoutElement::get_flexibleWidth() */, ILayoutElement_t684_il2cpp_TypeInfo_var, L_0);
		return L_1;
	}
}
// System.Single UnityEngine.UI.LayoutUtility::<GetMinHeight>m__10(UnityEngine.UI.ILayoutElement)
extern TypeInfo* ILayoutElement_t684_il2cpp_TypeInfo_var;
extern "C" float LayoutUtility_U3CGetMinHeightU3Em__10_m3398 (Object_t * __this /* static, unused */, Object_t * ___e, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		ILayoutElement_t684_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(411);
		s_Il2CppMethodIntialized = true;
	}
	{
		Object_t * L_0 = ___e;
		NullCheck(L_0);
		float L_1 = (float)InterfaceFuncInvoker0< float >::Invoke(5 /* System.Single UnityEngine.UI.ILayoutElement::get_minHeight() */, ILayoutElement_t684_il2cpp_TypeInfo_var, L_0);
		return L_1;
	}
}
// System.Single UnityEngine.UI.LayoutUtility::<GetPreferredHeight>m__11(UnityEngine.UI.ILayoutElement)
extern TypeInfo* ILayoutElement_t684_il2cpp_TypeInfo_var;
extern "C" float LayoutUtility_U3CGetPreferredHeightU3Em__11_m3399 (Object_t * __this /* static, unused */, Object_t * ___e, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		ILayoutElement_t684_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(411);
		s_Il2CppMethodIntialized = true;
	}
	{
		Object_t * L_0 = ___e;
		NullCheck(L_0);
		float L_1 = (float)InterfaceFuncInvoker0< float >::Invoke(5 /* System.Single UnityEngine.UI.ILayoutElement::get_minHeight() */, ILayoutElement_t684_il2cpp_TypeInfo_var, L_0);
		return L_1;
	}
}
// System.Single UnityEngine.UI.LayoutUtility::<GetPreferredHeight>m__12(UnityEngine.UI.ILayoutElement)
extern TypeInfo* ILayoutElement_t684_il2cpp_TypeInfo_var;
extern "C" float LayoutUtility_U3CGetPreferredHeightU3Em__12_m3400 (Object_t * __this /* static, unused */, Object_t * ___e, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		ILayoutElement_t684_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(411);
		s_Il2CppMethodIntialized = true;
	}
	{
		Object_t * L_0 = ___e;
		NullCheck(L_0);
		float L_1 = (float)InterfaceFuncInvoker0< float >::Invoke(6 /* System.Single UnityEngine.UI.ILayoutElement::get_preferredHeight() */, ILayoutElement_t684_il2cpp_TypeInfo_var, L_0);
		return L_1;
	}
}
// System.Single UnityEngine.UI.LayoutUtility::<GetFlexibleHeight>m__13(UnityEngine.UI.ILayoutElement)
extern TypeInfo* ILayoutElement_t684_il2cpp_TypeInfo_var;
extern "C" float LayoutUtility_U3CGetFlexibleHeightU3Em__13_m3401 (Object_t * __this /* static, unused */, Object_t * ___e, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		ILayoutElement_t684_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(411);
		s_Il2CppMethodIntialized = true;
	}
	{
		Object_t * L_0 = ___e;
		NullCheck(L_0);
		float L_1 = (float)InterfaceFuncInvoker0< float >::Invoke(7 /* System.Single UnityEngine.UI.ILayoutElement::get_flexibleHeight() */, ILayoutElement_t684_il2cpp_TypeInfo_var, L_0);
		return L_1;
	}
}
// System.Void UnityEngine.UI.VerticalLayoutGroup::.ctor()
extern "C" void VerticalLayoutGroup__ctor_m3402 (VerticalLayoutGroup_t652 * __this, const MethodInfo* method)
{
	{
		HorizontalOrVerticalLayoutGroup__ctor_m3295(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.VerticalLayoutGroup::CalculateLayoutInputHorizontal()
extern "C" void VerticalLayoutGroup_CalculateLayoutInputHorizontal_m3403 (VerticalLayoutGroup_t652 * __this, const MethodInfo* method)
{
	{
		LayoutGroup_CalculateLayoutInputHorizontal_m3335(__this, /*hidden argument*/NULL);
		HorizontalOrVerticalLayoutGroup_CalcAlongAxis_m3302(__this, 0, 1, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.VerticalLayoutGroup::CalculateLayoutInputVertical()
extern "C" void VerticalLayoutGroup_CalculateLayoutInputVertical_m3404 (VerticalLayoutGroup_t652 * __this, const MethodInfo* method)
{
	{
		HorizontalOrVerticalLayoutGroup_CalcAlongAxis_m3302(__this, 1, 1, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.VerticalLayoutGroup::SetLayoutHorizontal()
extern "C" void VerticalLayoutGroup_SetLayoutHorizontal_m3405 (VerticalLayoutGroup_t652 * __this, const MethodInfo* method)
{
	{
		HorizontalOrVerticalLayoutGroup_SetChildrenAlongAxis_m3303(__this, 0, 1, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.VerticalLayoutGroup::SetLayoutVertical()
extern "C" void VerticalLayoutGroup_SetLayoutVertical_m3406 (VerticalLayoutGroup_t652 * __this, const MethodInfo* method)
{
	{
		HorizontalOrVerticalLayoutGroup_SetChildrenAlongAxis_m3303(__this, 1, 1, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.VertexHelper::.ctor()
extern TypeInfo* ListPool_1_t715_il2cpp_TypeInfo_var;
extern TypeInfo* ListPool_1_t716_il2cpp_TypeInfo_var;
extern TypeInfo* ListPool_1_t717_il2cpp_TypeInfo_var;
extern TypeInfo* ListPool_1_t718_il2cpp_TypeInfo_var;
extern TypeInfo* ListPool_1_t719_il2cpp_TypeInfo_var;
extern const MethodInfo* ListPool_1_Get_m3673_MethodInfo_var;
extern const MethodInfo* ListPool_1_Get_m3674_MethodInfo_var;
extern const MethodInfo* ListPool_1_Get_m3675_MethodInfo_var;
extern const MethodInfo* ListPool_1_Get_m3676_MethodInfo_var;
extern const MethodInfo* ListPool_1_Get_m3677_MethodInfo_var;
extern "C" void VertexHelper__ctor_m3407 (VertexHelper_t562 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		ListPool_1_t715_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(415);
		ListPool_1_t716_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(416);
		ListPool_1_t717_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(417);
		ListPool_1_t718_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(418);
		ListPool_1_t719_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(419);
		ListPool_1_Get_m3673_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483958);
		ListPool_1_Get_m3674_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483959);
		ListPool_1_Get_m3675_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483960);
		ListPool_1_Get_m3676_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483961);
		ListPool_1_Get_m3677_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483962);
		s_Il2CppMethodIntialized = true;
	}
	{
		IL2CPP_RUNTIME_CLASS_INIT(ListPool_1_t715_il2cpp_TypeInfo_var);
		List_1_t412 * L_0 = ListPool_1_Get_m3673(NULL /*static, unused*/, /*hidden argument*/ListPool_1_Get_m3673_MethodInfo_var);
		__this->___m_Positions_0 = L_0;
		IL2CPP_RUNTIME_CLASS_INIT(ListPool_1_t716_il2cpp_TypeInfo_var);
		List_1_t418 * L_1 = ListPool_1_Get_m3674(NULL /*static, unused*/, /*hidden argument*/ListPool_1_Get_m3674_MethodInfo_var);
		__this->___m_Colors_1 = L_1;
		IL2CPP_RUNTIME_CLASS_INIT(ListPool_1_t717_il2cpp_TypeInfo_var);
		List_1_t416 * L_2 = ListPool_1_Get_m3675(NULL /*static, unused*/, /*hidden argument*/ListPool_1_Get_m3675_MethodInfo_var);
		__this->___m_Uv0S_2 = L_2;
		List_1_t416 * L_3 = ListPool_1_Get_m3675(NULL /*static, unused*/, /*hidden argument*/ListPool_1_Get_m3675_MethodInfo_var);
		__this->___m_Uv1S_3 = L_3;
		List_1_t412 * L_4 = ListPool_1_Get_m3673(NULL /*static, unused*/, /*hidden argument*/ListPool_1_Get_m3673_MethodInfo_var);
		__this->___m_Normals_4 = L_4;
		IL2CPP_RUNTIME_CLASS_INIT(ListPool_1_t718_il2cpp_TypeInfo_var);
		List_1_t414 * L_5 = ListPool_1_Get_m3676(NULL /*static, unused*/, /*hidden argument*/ListPool_1_Get_m3676_MethodInfo_var);
		__this->___m_Tangents_5 = L_5;
		IL2CPP_RUNTIME_CLASS_INIT(ListPool_1_t719_il2cpp_TypeInfo_var);
		List_1_t419 * L_6 = ListPool_1_Get_m3677(NULL /*static, unused*/, /*hidden argument*/ListPool_1_Get_m3677_MethodInfo_var);
		__this->___m_Indicies_6 = L_6;
		Object__ctor_m482(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.VertexHelper::.ctor(UnityEngine.Mesh)
extern TypeInfo* ListPool_1_t715_il2cpp_TypeInfo_var;
extern TypeInfo* ListPool_1_t716_il2cpp_TypeInfo_var;
extern TypeInfo* ListPool_1_t717_il2cpp_TypeInfo_var;
extern TypeInfo* ListPool_1_t718_il2cpp_TypeInfo_var;
extern TypeInfo* ListPool_1_t719_il2cpp_TypeInfo_var;
extern const MethodInfo* ListPool_1_Get_m3673_MethodInfo_var;
extern const MethodInfo* ListPool_1_Get_m3674_MethodInfo_var;
extern const MethodInfo* ListPool_1_Get_m3675_MethodInfo_var;
extern const MethodInfo* ListPool_1_Get_m3676_MethodInfo_var;
extern const MethodInfo* ListPool_1_Get_m3677_MethodInfo_var;
extern const MethodInfo* List_1_AddRange_m3678_MethodInfo_var;
extern const MethodInfo* List_1_AddRange_m3679_MethodInfo_var;
extern const MethodInfo* List_1_AddRange_m3680_MethodInfo_var;
extern const MethodInfo* List_1_AddRange_m3681_MethodInfo_var;
extern const MethodInfo* List_1_AddRange_m3682_MethodInfo_var;
extern "C" void VertexHelper__ctor_m3408 (VertexHelper_t562 * __this, Mesh_t208 * ___m, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		ListPool_1_t715_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(415);
		ListPool_1_t716_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(416);
		ListPool_1_t717_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(417);
		ListPool_1_t718_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(418);
		ListPool_1_t719_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(419);
		ListPool_1_Get_m3673_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483958);
		ListPool_1_Get_m3674_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483959);
		ListPool_1_Get_m3675_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483960);
		ListPool_1_Get_m3676_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483961);
		ListPool_1_Get_m3677_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483962);
		List_1_AddRange_m3678_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483963);
		List_1_AddRange_m3679_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483964);
		List_1_AddRange_m3680_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483965);
		List_1_AddRange_m3681_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483966);
		List_1_AddRange_m3682_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483967);
		s_Il2CppMethodIntialized = true;
	}
	{
		IL2CPP_RUNTIME_CLASS_INIT(ListPool_1_t715_il2cpp_TypeInfo_var);
		List_1_t412 * L_0 = ListPool_1_Get_m3673(NULL /*static, unused*/, /*hidden argument*/ListPool_1_Get_m3673_MethodInfo_var);
		__this->___m_Positions_0 = L_0;
		IL2CPP_RUNTIME_CLASS_INIT(ListPool_1_t716_il2cpp_TypeInfo_var);
		List_1_t418 * L_1 = ListPool_1_Get_m3674(NULL /*static, unused*/, /*hidden argument*/ListPool_1_Get_m3674_MethodInfo_var);
		__this->___m_Colors_1 = L_1;
		IL2CPP_RUNTIME_CLASS_INIT(ListPool_1_t717_il2cpp_TypeInfo_var);
		List_1_t416 * L_2 = ListPool_1_Get_m3675(NULL /*static, unused*/, /*hidden argument*/ListPool_1_Get_m3675_MethodInfo_var);
		__this->___m_Uv0S_2 = L_2;
		List_1_t416 * L_3 = ListPool_1_Get_m3675(NULL /*static, unused*/, /*hidden argument*/ListPool_1_Get_m3675_MethodInfo_var);
		__this->___m_Uv1S_3 = L_3;
		List_1_t412 * L_4 = ListPool_1_Get_m3673(NULL /*static, unused*/, /*hidden argument*/ListPool_1_Get_m3673_MethodInfo_var);
		__this->___m_Normals_4 = L_4;
		IL2CPP_RUNTIME_CLASS_INIT(ListPool_1_t718_il2cpp_TypeInfo_var);
		List_1_t414 * L_5 = ListPool_1_Get_m3676(NULL /*static, unused*/, /*hidden argument*/ListPool_1_Get_m3676_MethodInfo_var);
		__this->___m_Tangents_5 = L_5;
		IL2CPP_RUNTIME_CLASS_INIT(ListPool_1_t719_il2cpp_TypeInfo_var);
		List_1_t419 * L_6 = ListPool_1_Get_m3677(NULL /*static, unused*/, /*hidden argument*/ListPool_1_Get_m3677_MethodInfo_var);
		__this->___m_Indicies_6 = L_6;
		Object__ctor_m482(__this, /*hidden argument*/NULL);
		List_1_t412 * L_7 = (__this->___m_Positions_0);
		Mesh_t208 * L_8 = ___m;
		NullCheck(L_8);
		Vector3U5BU5D_t125* L_9 = Mesh_get_vertices_m846(L_8, /*hidden argument*/NULL);
		NullCheck(L_7);
		List_1_AddRange_m3678(L_7, (Object_t*)(Object_t*)L_9, /*hidden argument*/List_1_AddRange_m3678_MethodInfo_var);
		List_1_t418 * L_10 = (__this->___m_Colors_1);
		Mesh_t208 * L_11 = ___m;
		NullCheck(L_11);
		Color32U5BU5D_t417* L_12 = Mesh_get_colors32_m859(L_11, /*hidden argument*/NULL);
		NullCheck(L_10);
		List_1_AddRange_m3679(L_10, (Object_t*)(Object_t*)L_12, /*hidden argument*/List_1_AddRange_m3679_MethodInfo_var);
		List_1_t416 * L_13 = (__this->___m_Uv0S_2);
		Mesh_t208 * L_14 = ___m;
		NullCheck(L_14);
		Vector2U5BU5D_t415* L_15 = Mesh_get_uv_m855(L_14, /*hidden argument*/NULL);
		NullCheck(L_13);
		List_1_AddRange_m3680(L_13, (Object_t*)(Object_t*)L_15, /*hidden argument*/List_1_AddRange_m3680_MethodInfo_var);
		List_1_t416 * L_16 = (__this->___m_Uv1S_3);
		Mesh_t208 * L_17 = ___m;
		NullCheck(L_17);
		Vector2U5BU5D_t415* L_18 = Mesh_get_uv2_m856(L_17, /*hidden argument*/NULL);
		NullCheck(L_16);
		List_1_AddRange_m3680(L_16, (Object_t*)(Object_t*)L_18, /*hidden argument*/List_1_AddRange_m3680_MethodInfo_var);
		List_1_t412 * L_19 = (__this->___m_Normals_4);
		Mesh_t208 * L_20 = ___m;
		NullCheck(L_20);
		Vector3U5BU5D_t125* L_21 = Mesh_get_normals_m849(L_20, /*hidden argument*/NULL);
		NullCheck(L_19);
		List_1_AddRange_m3678(L_19, (Object_t*)(Object_t*)L_21, /*hidden argument*/List_1_AddRange_m3678_MethodInfo_var);
		List_1_t414 * L_22 = (__this->___m_Tangents_5);
		Mesh_t208 * L_23 = ___m;
		NullCheck(L_23);
		Vector4U5BU5D_t413* L_24 = Mesh_get_tangents_m852(L_23, /*hidden argument*/NULL);
		NullCheck(L_22);
		List_1_AddRange_m3681(L_22, (Object_t*)(Object_t*)L_24, /*hidden argument*/List_1_AddRange_m3681_MethodInfo_var);
		List_1_t419 * L_25 = (__this->___m_Indicies_6);
		Mesh_t208 * L_26 = ___m;
		NullCheck(L_26);
		Int32U5BU5D_t420* L_27 = Mesh_GetIndices_m865(L_26, 0, /*hidden argument*/NULL);
		NullCheck(L_25);
		List_1_AddRange_m3682(L_25, (Object_t*)(Object_t*)L_27, /*hidden argument*/List_1_AddRange_m3682_MethodInfo_var);
		return;
	}
}
// System.Void UnityEngine.UI.VertexHelper::.cctor()
extern TypeInfo* VertexHelper_t562_il2cpp_TypeInfo_var;
extern "C" void VertexHelper__cctor_m3409 (Object_t * __this /* static, unused */, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		VertexHelper_t562_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(317);
		s_Il2CppMethodIntialized = true;
	}
	{
		Vector4_t234  L_0 = {0};
		Vector4__ctor_m1102(&L_0, (1.0f), (0.0f), (0.0f), (-1.0f), /*hidden argument*/NULL);
		((VertexHelper_t562_StaticFields*)VertexHelper_t562_il2cpp_TypeInfo_var->static_fields)->___s_DefaultTangent_7 = L_0;
		Vector3_t4  L_1 = Vector3_get_back_m976(NULL /*static, unused*/, /*hidden argument*/NULL);
		((VertexHelper_t562_StaticFields*)VertexHelper_t562_il2cpp_TypeInfo_var->static_fields)->___s_DefaultNormal_8 = L_1;
		return;
	}
}
// System.Void UnityEngine.UI.VertexHelper::Clear()
extern "C" void VertexHelper_Clear_m3410 (VertexHelper_t562 * __this, const MethodInfo* method)
{
	{
		List_1_t412 * L_0 = (__this->___m_Positions_0);
		NullCheck(L_0);
		VirtActionInvoker0::Invoke(23 /* System.Void System.Collections.Generic.List`1<UnityEngine.Vector3>::Clear() */, L_0);
		List_1_t418 * L_1 = (__this->___m_Colors_1);
		NullCheck(L_1);
		VirtActionInvoker0::Invoke(23 /* System.Void System.Collections.Generic.List`1<UnityEngine.Color32>::Clear() */, L_1);
		List_1_t416 * L_2 = (__this->___m_Uv0S_2);
		NullCheck(L_2);
		VirtActionInvoker0::Invoke(23 /* System.Void System.Collections.Generic.List`1<UnityEngine.Vector2>::Clear() */, L_2);
		List_1_t416 * L_3 = (__this->___m_Uv1S_3);
		NullCheck(L_3);
		VirtActionInvoker0::Invoke(23 /* System.Void System.Collections.Generic.List`1<UnityEngine.Vector2>::Clear() */, L_3);
		List_1_t412 * L_4 = (__this->___m_Normals_4);
		NullCheck(L_4);
		VirtActionInvoker0::Invoke(23 /* System.Void System.Collections.Generic.List`1<UnityEngine.Vector3>::Clear() */, L_4);
		List_1_t414 * L_5 = (__this->___m_Tangents_5);
		NullCheck(L_5);
		VirtActionInvoker0::Invoke(23 /* System.Void System.Collections.Generic.List`1<UnityEngine.Vector4>::Clear() */, L_5);
		List_1_t419 * L_6 = (__this->___m_Indicies_6);
		NullCheck(L_6);
		VirtActionInvoker0::Invoke(23 /* System.Void System.Collections.Generic.List`1<System.Int32>::Clear() */, L_6);
		return;
	}
}
// System.Int32 UnityEngine.UI.VertexHelper::get_currentVertCount()
extern "C" int32_t VertexHelper_get_currentVertCount_m3411 (VertexHelper_t562 * __this, const MethodInfo* method)
{
	{
		List_1_t412 * L_0 = (__this->___m_Positions_0);
		NullCheck(L_0);
		int32_t L_1 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.Vector3>::get_Count() */, L_0);
		return L_1;
	}
}
// System.Void UnityEngine.UI.VertexHelper::PopulateUIVertex(UnityEngine.UIVertex&,System.Int32)
extern "C" void VertexHelper_PopulateUIVertex_m3412 (VertexHelper_t562 * __this, UIVertex_t323 * ___vertex, int32_t ___i, const MethodInfo* method)
{
	{
		UIVertex_t323 * L_0 = ___vertex;
		List_1_t412 * L_1 = (__this->___m_Positions_0);
		int32_t L_2 = ___i;
		NullCheck(L_1);
		Vector3_t4  L_3 = (Vector3_t4 )VirtFuncInvoker1< Vector3_t4 , int32_t >::Invoke(31 /* !0 System.Collections.Generic.List`1<UnityEngine.Vector3>::get_Item(System.Int32) */, L_1, L_2);
		L_0->___position_0 = L_3;
		UIVertex_t323 * L_4 = ___vertex;
		List_1_t418 * L_5 = (__this->___m_Colors_1);
		int32_t L_6 = ___i;
		NullCheck(L_5);
		Color32_t231  L_7 = (Color32_t231 )VirtFuncInvoker1< Color32_t231 , int32_t >::Invoke(31 /* !0 System.Collections.Generic.List`1<UnityEngine.Color32>::get_Item(System.Int32) */, L_5, L_6);
		L_4->___color_2 = L_7;
		UIVertex_t323 * L_8 = ___vertex;
		List_1_t416 * L_9 = (__this->___m_Uv0S_2);
		int32_t L_10 = ___i;
		NullCheck(L_9);
		Vector2_t6  L_11 = (Vector2_t6 )VirtFuncInvoker1< Vector2_t6 , int32_t >::Invoke(31 /* !0 System.Collections.Generic.List`1<UnityEngine.Vector2>::get_Item(System.Int32) */, L_9, L_10);
		L_8->___uv0_3 = L_11;
		UIVertex_t323 * L_12 = ___vertex;
		List_1_t416 * L_13 = (__this->___m_Uv1S_3);
		int32_t L_14 = ___i;
		NullCheck(L_13);
		Vector2_t6  L_15 = (Vector2_t6 )VirtFuncInvoker1< Vector2_t6 , int32_t >::Invoke(31 /* !0 System.Collections.Generic.List`1<UnityEngine.Vector2>::get_Item(System.Int32) */, L_13, L_14);
		L_12->___uv1_4 = L_15;
		UIVertex_t323 * L_16 = ___vertex;
		List_1_t412 * L_17 = (__this->___m_Normals_4);
		int32_t L_18 = ___i;
		NullCheck(L_17);
		Vector3_t4  L_19 = (Vector3_t4 )VirtFuncInvoker1< Vector3_t4 , int32_t >::Invoke(31 /* !0 System.Collections.Generic.List`1<UnityEngine.Vector3>::get_Item(System.Int32) */, L_17, L_18);
		L_16->___normal_1 = L_19;
		UIVertex_t323 * L_20 = ___vertex;
		List_1_t414 * L_21 = (__this->___m_Tangents_5);
		int32_t L_22 = ___i;
		NullCheck(L_21);
		Vector4_t234  L_23 = (Vector4_t234 )VirtFuncInvoker1< Vector4_t234 , int32_t >::Invoke(31 /* !0 System.Collections.Generic.List`1<UnityEngine.Vector4>::get_Item(System.Int32) */, L_21, L_22);
		L_20->___tangent_5 = L_23;
		return;
	}
}
// System.Void UnityEngine.UI.VertexHelper::SetUIVertex(UnityEngine.UIVertex,System.Int32)
extern "C" void VertexHelper_SetUIVertex_m3413 (VertexHelper_t562 * __this, UIVertex_t323  ___vertex, int32_t ___i, const MethodInfo* method)
{
	{
		List_1_t412 * L_0 = (__this->___m_Positions_0);
		int32_t L_1 = ___i;
		Vector3_t4  L_2 = ((&___vertex)->___position_0);
		NullCheck(L_0);
		VirtActionInvoker2< int32_t, Vector3_t4  >::Invoke(32 /* System.Void System.Collections.Generic.List`1<UnityEngine.Vector3>::set_Item(System.Int32,!0) */, L_0, L_1, L_2);
		List_1_t418 * L_3 = (__this->___m_Colors_1);
		int32_t L_4 = ___i;
		Color32_t231  L_5 = ((&___vertex)->___color_2);
		NullCheck(L_3);
		VirtActionInvoker2< int32_t, Color32_t231  >::Invoke(32 /* System.Void System.Collections.Generic.List`1<UnityEngine.Color32>::set_Item(System.Int32,!0) */, L_3, L_4, L_5);
		List_1_t416 * L_6 = (__this->___m_Uv0S_2);
		int32_t L_7 = ___i;
		Vector2_t6  L_8 = ((&___vertex)->___uv0_3);
		NullCheck(L_6);
		VirtActionInvoker2< int32_t, Vector2_t6  >::Invoke(32 /* System.Void System.Collections.Generic.List`1<UnityEngine.Vector2>::set_Item(System.Int32,!0) */, L_6, L_7, L_8);
		List_1_t416 * L_9 = (__this->___m_Uv1S_3);
		int32_t L_10 = ___i;
		Vector2_t6  L_11 = ((&___vertex)->___uv1_4);
		NullCheck(L_9);
		VirtActionInvoker2< int32_t, Vector2_t6  >::Invoke(32 /* System.Void System.Collections.Generic.List`1<UnityEngine.Vector2>::set_Item(System.Int32,!0) */, L_9, L_10, L_11);
		List_1_t412 * L_12 = (__this->___m_Normals_4);
		int32_t L_13 = ___i;
		Vector3_t4  L_14 = ((&___vertex)->___normal_1);
		NullCheck(L_12);
		VirtActionInvoker2< int32_t, Vector3_t4  >::Invoke(32 /* System.Void System.Collections.Generic.List`1<UnityEngine.Vector3>::set_Item(System.Int32,!0) */, L_12, L_13, L_14);
		List_1_t414 * L_15 = (__this->___m_Tangents_5);
		int32_t L_16 = ___i;
		Vector4_t234  L_17 = ((&___vertex)->___tangent_5);
		NullCheck(L_15);
		VirtActionInvoker2< int32_t, Vector4_t234  >::Invoke(32 /* System.Void System.Collections.Generic.List`1<UnityEngine.Vector4>::set_Item(System.Int32,!0) */, L_15, L_16, L_17);
		return;
	}
}
// System.Void UnityEngine.UI.VertexHelper::FillMesh(UnityEngine.Mesh)
extern TypeInfo* ArgumentException_t437_il2cpp_TypeInfo_var;
extern Il2CppCodeGenString* _stringLiteral242;
extern "C" void VertexHelper_FillMesh_m3414 (VertexHelper_t562 * __this, Mesh_t208 * ___mesh, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		ArgumentException_t437_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(88);
		_stringLiteral242 = il2cpp_codegen_string_literal_from_index(242);
		s_Il2CppMethodIntialized = true;
	}
	{
		Mesh_t208 * L_0 = ___mesh;
		NullCheck(L_0);
		Mesh_Clear_m845(L_0, /*hidden argument*/NULL);
		List_1_t412 * L_1 = (__this->___m_Positions_0);
		NullCheck(L_1);
		int32_t L_2 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.Vector3>::get_Count() */, L_1);
		if ((((int32_t)L_2) < ((int32_t)((int32_t)65000))))
		{
			goto IL_0026;
		}
	}
	{
		ArgumentException_t437 * L_3 = (ArgumentException_t437 *)il2cpp_codegen_object_new (ArgumentException_t437_il2cpp_TypeInfo_var);
		ArgumentException__ctor_m2001(L_3, _stringLiteral242, /*hidden argument*/NULL);
		il2cpp_codegen_raise_exception((Il2CppCodeGenException*)L_3);
	}

IL_0026:
	{
		Mesh_t208 * L_4 = ___mesh;
		List_1_t412 * L_5 = (__this->___m_Positions_0);
		NullCheck(L_4);
		Mesh_SetVertices_m847(L_4, L_5, /*hidden argument*/NULL);
		Mesh_t208 * L_6 = ___mesh;
		List_1_t418 * L_7 = (__this->___m_Colors_1);
		NullCheck(L_6);
		Mesh_SetColors_m860(L_6, L_7, /*hidden argument*/NULL);
		Mesh_t208 * L_8 = ___mesh;
		List_1_t416 * L_9 = (__this->___m_Uv0S_2);
		NullCheck(L_8);
		Mesh_SetUVs_m857(L_8, 0, L_9, /*hidden argument*/NULL);
		Mesh_t208 * L_10 = ___mesh;
		List_1_t416 * L_11 = (__this->___m_Uv1S_3);
		NullCheck(L_10);
		Mesh_SetUVs_m857(L_10, 1, L_11, /*hidden argument*/NULL);
		Mesh_t208 * L_12 = ___mesh;
		List_1_t412 * L_13 = (__this->___m_Normals_4);
		NullCheck(L_12);
		Mesh_SetNormals_m850(L_12, L_13, /*hidden argument*/NULL);
		Mesh_t208 * L_14 = ___mesh;
		List_1_t414 * L_15 = (__this->___m_Tangents_5);
		NullCheck(L_14);
		Mesh_SetTangents_m853(L_14, L_15, /*hidden argument*/NULL);
		Mesh_t208 * L_16 = ___mesh;
		List_1_t419 * L_17 = (__this->___m_Indicies_6);
		NullCheck(L_16);
		Mesh_SetTriangles_m863(L_16, L_17, 0, /*hidden argument*/NULL);
		Mesh_t208 * L_18 = ___mesh;
		NullCheck(L_18);
		Mesh_RecalculateBounds_m862(L_18, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.VertexHelper::Dispose()
extern TypeInfo* ListPool_1_t715_il2cpp_TypeInfo_var;
extern TypeInfo* ListPool_1_t716_il2cpp_TypeInfo_var;
extern TypeInfo* ListPool_1_t717_il2cpp_TypeInfo_var;
extern TypeInfo* ListPool_1_t718_il2cpp_TypeInfo_var;
extern TypeInfo* ListPool_1_t719_il2cpp_TypeInfo_var;
extern const MethodInfo* ListPool_1_Release_m3683_MethodInfo_var;
extern const MethodInfo* ListPool_1_Release_m3684_MethodInfo_var;
extern const MethodInfo* ListPool_1_Release_m3685_MethodInfo_var;
extern const MethodInfo* ListPool_1_Release_m3686_MethodInfo_var;
extern const MethodInfo* ListPool_1_Release_m3687_MethodInfo_var;
extern "C" void VertexHelper_Dispose_m3415 (VertexHelper_t562 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		ListPool_1_t715_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(415);
		ListPool_1_t716_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(416);
		ListPool_1_t717_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(417);
		ListPool_1_t718_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(418);
		ListPool_1_t719_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(419);
		ListPool_1_Release_m3683_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483968);
		ListPool_1_Release_m3684_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483969);
		ListPool_1_Release_m3685_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483970);
		ListPool_1_Release_m3686_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483971);
		ListPool_1_Release_m3687_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483972);
		s_Il2CppMethodIntialized = true;
	}
	{
		List_1_t412 * L_0 = (__this->___m_Positions_0);
		IL2CPP_RUNTIME_CLASS_INIT(ListPool_1_t715_il2cpp_TypeInfo_var);
		ListPool_1_Release_m3683(NULL /*static, unused*/, L_0, /*hidden argument*/ListPool_1_Release_m3683_MethodInfo_var);
		List_1_t418 * L_1 = (__this->___m_Colors_1);
		IL2CPP_RUNTIME_CLASS_INIT(ListPool_1_t716_il2cpp_TypeInfo_var);
		ListPool_1_Release_m3684(NULL /*static, unused*/, L_1, /*hidden argument*/ListPool_1_Release_m3684_MethodInfo_var);
		List_1_t416 * L_2 = (__this->___m_Uv0S_2);
		IL2CPP_RUNTIME_CLASS_INIT(ListPool_1_t717_il2cpp_TypeInfo_var);
		ListPool_1_Release_m3685(NULL /*static, unused*/, L_2, /*hidden argument*/ListPool_1_Release_m3685_MethodInfo_var);
		List_1_t416 * L_3 = (__this->___m_Uv1S_3);
		ListPool_1_Release_m3685(NULL /*static, unused*/, L_3, /*hidden argument*/ListPool_1_Release_m3685_MethodInfo_var);
		List_1_t412 * L_4 = (__this->___m_Normals_4);
		ListPool_1_Release_m3683(NULL /*static, unused*/, L_4, /*hidden argument*/ListPool_1_Release_m3683_MethodInfo_var);
		List_1_t414 * L_5 = (__this->___m_Tangents_5);
		IL2CPP_RUNTIME_CLASS_INIT(ListPool_1_t718_il2cpp_TypeInfo_var);
		ListPool_1_Release_m3686(NULL /*static, unused*/, L_5, /*hidden argument*/ListPool_1_Release_m3686_MethodInfo_var);
		List_1_t419 * L_6 = (__this->___m_Indicies_6);
		IL2CPP_RUNTIME_CLASS_INIT(ListPool_1_t719_il2cpp_TypeInfo_var);
		ListPool_1_Release_m3687(NULL /*static, unused*/, L_6, /*hidden argument*/ListPool_1_Release_m3687_MethodInfo_var);
		__this->___m_Positions_0 = (List_1_t412 *)NULL;
		__this->___m_Colors_1 = (List_1_t418 *)NULL;
		__this->___m_Uv0S_2 = (List_1_t416 *)NULL;
		__this->___m_Uv1S_3 = (List_1_t416 *)NULL;
		__this->___m_Normals_4 = (List_1_t412 *)NULL;
		__this->___m_Tangents_5 = (List_1_t414 *)NULL;
		__this->___m_Indicies_6 = (List_1_t419 *)NULL;
		return;
	}
}
// System.Void UnityEngine.UI.VertexHelper::AddVert(UnityEngine.Vector3,UnityEngine.Color32,UnityEngine.Vector2,UnityEngine.Vector2,UnityEngine.Vector3,UnityEngine.Vector4)
extern "C" void VertexHelper_AddVert_m3416 (VertexHelper_t562 * __this, Vector3_t4  ___position, Color32_t231  ___color, Vector2_t6  ___uv0, Vector2_t6  ___uv1, Vector3_t4  ___normal, Vector4_t234  ___tangent, const MethodInfo* method)
{
	{
		List_1_t412 * L_0 = (__this->___m_Positions_0);
		Vector3_t4  L_1 = ___position;
		NullCheck(L_0);
		VirtActionInvoker1< Vector3_t4  >::Invoke(22 /* System.Void System.Collections.Generic.List`1<UnityEngine.Vector3>::Add(!0) */, L_0, L_1);
		List_1_t418 * L_2 = (__this->___m_Colors_1);
		Color32_t231  L_3 = ___color;
		NullCheck(L_2);
		VirtActionInvoker1< Color32_t231  >::Invoke(22 /* System.Void System.Collections.Generic.List`1<UnityEngine.Color32>::Add(!0) */, L_2, L_3);
		List_1_t416 * L_4 = (__this->___m_Uv0S_2);
		Vector2_t6  L_5 = ___uv0;
		NullCheck(L_4);
		VirtActionInvoker1< Vector2_t6  >::Invoke(22 /* System.Void System.Collections.Generic.List`1<UnityEngine.Vector2>::Add(!0) */, L_4, L_5);
		List_1_t416 * L_6 = (__this->___m_Uv1S_3);
		Vector2_t6  L_7 = ___uv1;
		NullCheck(L_6);
		VirtActionInvoker1< Vector2_t6  >::Invoke(22 /* System.Void System.Collections.Generic.List`1<UnityEngine.Vector2>::Add(!0) */, L_6, L_7);
		List_1_t412 * L_8 = (__this->___m_Normals_4);
		Vector3_t4  L_9 = ___normal;
		NullCheck(L_8);
		VirtActionInvoker1< Vector3_t4  >::Invoke(22 /* System.Void System.Collections.Generic.List`1<UnityEngine.Vector3>::Add(!0) */, L_8, L_9);
		List_1_t414 * L_10 = (__this->___m_Tangents_5);
		Vector4_t234  L_11 = ___tangent;
		NullCheck(L_10);
		VirtActionInvoker1< Vector4_t234  >::Invoke(22 /* System.Void System.Collections.Generic.List`1<UnityEngine.Vector4>::Add(!0) */, L_10, L_11);
		return;
	}
}
// System.Void UnityEngine.UI.VertexHelper::AddVert(UnityEngine.Vector3,UnityEngine.Color32,UnityEngine.Vector2)
extern TypeInfo* VertexHelper_t562_il2cpp_TypeInfo_var;
extern "C" void VertexHelper_AddVert_m3417 (VertexHelper_t562 * __this, Vector3_t4  ___position, Color32_t231  ___color, Vector2_t6  ___uv0, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		VertexHelper_t562_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(317);
		s_Il2CppMethodIntialized = true;
	}
	{
		Vector3_t4  L_0 = ___position;
		Color32_t231  L_1 = ___color;
		Vector2_t6  L_2 = ___uv0;
		Vector2_t6  L_3 = Vector2_get_zero_m539(NULL /*static, unused*/, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(VertexHelper_t562_il2cpp_TypeInfo_var);
		Vector3_t4  L_4 = ((VertexHelper_t562_StaticFields*)VertexHelper_t562_il2cpp_TypeInfo_var->static_fields)->___s_DefaultNormal_8;
		Vector4_t234  L_5 = ((VertexHelper_t562_StaticFields*)VertexHelper_t562_il2cpp_TypeInfo_var->static_fields)->___s_DefaultTangent_7;
		VertexHelper_AddVert_m3416(__this, L_0, L_1, L_2, L_3, L_4, L_5, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.VertexHelper::AddVert(UnityEngine.UIVertex)
extern "C" void VertexHelper_AddVert_m3418 (VertexHelper_t562 * __this, UIVertex_t323  ___v, const MethodInfo* method)
{
	{
		Vector3_t4  L_0 = ((&___v)->___position_0);
		Color32_t231  L_1 = ((&___v)->___color_2);
		Vector2_t6  L_2 = ((&___v)->___uv0_3);
		Vector2_t6  L_3 = ((&___v)->___uv1_4);
		Vector3_t4  L_4 = ((&___v)->___normal_1);
		Vector4_t234  L_5 = ((&___v)->___tangent_5);
		VertexHelper_AddVert_m3416(__this, L_0, L_1, L_2, L_3, L_4, L_5, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.VertexHelper::AddTriangle(System.Int32,System.Int32,System.Int32)
extern "C" void VertexHelper_AddTriangle_m3419 (VertexHelper_t562 * __this, int32_t ___idx0, int32_t ___idx1, int32_t ___idx2, const MethodInfo* method)
{
	{
		List_1_t419 * L_0 = (__this->___m_Indicies_6);
		int32_t L_1 = ___idx0;
		NullCheck(L_0);
		VirtActionInvoker1< int32_t >::Invoke(22 /* System.Void System.Collections.Generic.List`1<System.Int32>::Add(!0) */, L_0, L_1);
		List_1_t419 * L_2 = (__this->___m_Indicies_6);
		int32_t L_3 = ___idx1;
		NullCheck(L_2);
		VirtActionInvoker1< int32_t >::Invoke(22 /* System.Void System.Collections.Generic.List`1<System.Int32>::Add(!0) */, L_2, L_3);
		List_1_t419 * L_4 = (__this->___m_Indicies_6);
		int32_t L_5 = ___idx2;
		NullCheck(L_4);
		VirtActionInvoker1< int32_t >::Invoke(22 /* System.Void System.Collections.Generic.List`1<System.Int32>::Add(!0) */, L_4, L_5);
		return;
	}
}
// System.Void UnityEngine.UI.VertexHelper::AddUIVertexQuad(UnityEngine.UIVertex[])
extern "C" void VertexHelper_AddUIVertexQuad_m3420 (VertexHelper_t562 * __this, UIVertexU5BU5D_t425* ___verts, const MethodInfo* method)
{
	int32_t V_0 = 0;
	int32_t V_1 = 0;
	{
		int32_t L_0 = VertexHelper_get_currentVertCount_m3411(__this, /*hidden argument*/NULL);
		V_0 = L_0;
		V_1 = 0;
		goto IL_0060;
	}

IL_000e:
	{
		UIVertexU5BU5D_t425* L_1 = ___verts;
		int32_t L_2 = V_1;
		NullCheck(L_1);
		IL2CPP_ARRAY_BOUNDS_CHECK(L_1, L_2);
		Vector3_t4  L_3 = (((UIVertex_t323 *)(UIVertex_t323 *)SZArrayLdElema(L_1, L_2, sizeof(UIVertex_t323 )))->___position_0);
		UIVertexU5BU5D_t425* L_4 = ___verts;
		int32_t L_5 = V_1;
		NullCheck(L_4);
		IL2CPP_ARRAY_BOUNDS_CHECK(L_4, L_5);
		Color32_t231  L_6 = (((UIVertex_t323 *)(UIVertex_t323 *)SZArrayLdElema(L_4, L_5, sizeof(UIVertex_t323 )))->___color_2);
		UIVertexU5BU5D_t425* L_7 = ___verts;
		int32_t L_8 = V_1;
		NullCheck(L_7);
		IL2CPP_ARRAY_BOUNDS_CHECK(L_7, L_8);
		Vector2_t6  L_9 = (((UIVertex_t323 *)(UIVertex_t323 *)SZArrayLdElema(L_7, L_8, sizeof(UIVertex_t323 )))->___uv0_3);
		UIVertexU5BU5D_t425* L_10 = ___verts;
		int32_t L_11 = V_1;
		NullCheck(L_10);
		IL2CPP_ARRAY_BOUNDS_CHECK(L_10, L_11);
		Vector2_t6  L_12 = (((UIVertex_t323 *)(UIVertex_t323 *)SZArrayLdElema(L_10, L_11, sizeof(UIVertex_t323 )))->___uv1_4);
		UIVertexU5BU5D_t425* L_13 = ___verts;
		int32_t L_14 = V_1;
		NullCheck(L_13);
		IL2CPP_ARRAY_BOUNDS_CHECK(L_13, L_14);
		Vector3_t4  L_15 = (((UIVertex_t323 *)(UIVertex_t323 *)SZArrayLdElema(L_13, L_14, sizeof(UIVertex_t323 )))->___normal_1);
		UIVertexU5BU5D_t425* L_16 = ___verts;
		int32_t L_17 = V_1;
		NullCheck(L_16);
		IL2CPP_ARRAY_BOUNDS_CHECK(L_16, L_17);
		Vector4_t234  L_18 = (((UIVertex_t323 *)(UIVertex_t323 *)SZArrayLdElema(L_16, L_17, sizeof(UIVertex_t323 )))->___tangent_5);
		VertexHelper_AddVert_m3416(__this, L_3, L_6, L_9, L_12, L_15, L_18, /*hidden argument*/NULL);
		int32_t L_19 = V_1;
		V_1 = ((int32_t)((int32_t)L_19+(int32_t)1));
	}

IL_0060:
	{
		int32_t L_20 = V_1;
		if ((((int32_t)L_20) < ((int32_t)4)))
		{
			goto IL_000e;
		}
	}
	{
		int32_t L_21 = V_0;
		int32_t L_22 = V_0;
		int32_t L_23 = V_0;
		VertexHelper_AddTriangle_m3419(__this, L_21, ((int32_t)((int32_t)L_22+(int32_t)1)), ((int32_t)((int32_t)L_23+(int32_t)2)), /*hidden argument*/NULL);
		int32_t L_24 = V_0;
		int32_t L_25 = V_0;
		int32_t L_26 = V_0;
		VertexHelper_AddTriangle_m3419(__this, ((int32_t)((int32_t)L_24+(int32_t)2)), ((int32_t)((int32_t)L_25+(int32_t)3)), L_26, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.VertexHelper::AddUIVertexTriangleStream(System.Collections.Generic.List`1<UnityEngine.UIVertex>)
extern "C" void VertexHelper_AddUIVertexTriangleStream_m3421 (VertexHelper_t562 * __this, List_1_t316 * ___verts, const MethodInfo* method)
{
	{
		List_1_t316 * L_0 = ___verts;
		List_1_t412 * L_1 = (__this->___m_Positions_0);
		List_1_t418 * L_2 = (__this->___m_Colors_1);
		List_1_t416 * L_3 = (__this->___m_Uv0S_2);
		List_1_t416 * L_4 = (__this->___m_Uv1S_3);
		List_1_t412 * L_5 = (__this->___m_Normals_4);
		List_1_t414 * L_6 = (__this->___m_Tangents_5);
		List_1_t419 * L_7 = (__this->___m_Indicies_6);
		CanvasRenderer_SplitUIVertexStreams_m1742(NULL /*static, unused*/, L_0, L_1, L_2, L_3, L_4, L_5, L_6, L_7, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.VertexHelper::GetUIVertexStream(System.Collections.Generic.List`1<UnityEngine.UIVertex>)
extern "C" void VertexHelper_GetUIVertexStream_m3422 (VertexHelper_t562 * __this, List_1_t316 * ___stream, const MethodInfo* method)
{
	{
		List_1_t316 * L_0 = ___stream;
		List_1_t412 * L_1 = (__this->___m_Positions_0);
		List_1_t418 * L_2 = (__this->___m_Colors_1);
		List_1_t416 * L_3 = (__this->___m_Uv0S_2);
		List_1_t416 * L_4 = (__this->___m_Uv1S_3);
		List_1_t412 * L_5 = (__this->___m_Normals_4);
		List_1_t414 * L_6 = (__this->___m_Tangents_5);
		List_1_t419 * L_7 = (__this->___m_Indicies_6);
		CanvasRenderer_CreateUIVertexStream_m1745(NULL /*static, unused*/, L_0, L_1, L_2, L_3, L_4, L_5, L_6, L_7, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.BaseMeshEffect::.ctor()
extern "C" void BaseMeshEffect__ctor_m3423 (BaseMeshEffect_t653 * __this, const MethodInfo* method)
{
	{
		UIBehaviour__ctor_m2193(__this, /*hidden argument*/NULL);
		return;
	}
}
// UnityEngine.UI.Graphic UnityEngine.UI.BaseMeshEffect::get_graphic()
extern const MethodInfo* Component_GetComponent_TisGraphic_t560_m3610_MethodInfo_var;
extern "C" Graphic_t560 * BaseMeshEffect_get_graphic_m3424 (BaseMeshEffect_t653 * __this, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		Component_GetComponent_TisGraphic_t560_m3610_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483888);
		s_Il2CppMethodIntialized = true;
	}
	{
		Graphic_t560 * L_0 = (__this->___m_Graphic_2);
		bool L_1 = Object_op_Equality_m445(NULL /*static, unused*/, L_0, (Object_t76 *)NULL, /*hidden argument*/NULL);
		if (!L_1)
		{
			goto IL_001d;
		}
	}
	{
		Graphic_t560 * L_2 = Component_GetComponent_TisGraphic_t560_m3610(__this, /*hidden argument*/Component_GetComponent_TisGraphic_t560_m3610_MethodInfo_var);
		__this->___m_Graphic_2 = L_2;
	}

IL_001d:
	{
		Graphic_t560 * L_3 = (__this->___m_Graphic_2);
		return L_3;
	}
}
// System.Void UnityEngine.UI.BaseMeshEffect::OnEnable()
extern "C" void BaseMeshEffect_OnEnable_m3425 (BaseMeshEffect_t653 * __this, const MethodInfo* method)
{
	{
		UIBehaviour_OnEnable_m2195(__this, /*hidden argument*/NULL);
		Graphic_t560 * L_0 = BaseMeshEffect_get_graphic_m3424(__this, /*hidden argument*/NULL);
		bool L_1 = Object_op_Inequality_m429(NULL /*static, unused*/, L_0, (Object_t76 *)NULL, /*hidden argument*/NULL);
		if (!L_1)
		{
			goto IL_0022;
		}
	}
	{
		Graphic_t560 * L_2 = BaseMeshEffect_get_graphic_m3424(__this, /*hidden argument*/NULL);
		NullCheck(L_2);
		VirtActionInvoker0::Invoke(23 /* System.Void UnityEngine.UI.Graphic::SetVerticesDirty() */, L_2);
	}

IL_0022:
	{
		return;
	}
}
// System.Void UnityEngine.UI.BaseMeshEffect::OnDisable()
extern "C" void BaseMeshEffect_OnDisable_m3426 (BaseMeshEffect_t653 * __this, const MethodInfo* method)
{
	{
		Graphic_t560 * L_0 = BaseMeshEffect_get_graphic_m3424(__this, /*hidden argument*/NULL);
		bool L_1 = Object_op_Inequality_m429(NULL /*static, unused*/, L_0, (Object_t76 *)NULL, /*hidden argument*/NULL);
		if (!L_1)
		{
			goto IL_001c;
		}
	}
	{
		Graphic_t560 * L_2 = BaseMeshEffect_get_graphic_m3424(__this, /*hidden argument*/NULL);
		NullCheck(L_2);
		VirtActionInvoker0::Invoke(23 /* System.Void UnityEngine.UI.Graphic::SetVerticesDirty() */, L_2);
	}

IL_001c:
	{
		UIBehaviour_OnDisable_m2197(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.BaseMeshEffect::OnDidApplyAnimationProperties()
extern "C" void BaseMeshEffect_OnDidApplyAnimationProperties_m3427 (BaseMeshEffect_t653 * __this, const MethodInfo* method)
{
	{
		Graphic_t560 * L_0 = BaseMeshEffect_get_graphic_m3424(__this, /*hidden argument*/NULL);
		bool L_1 = Object_op_Inequality_m429(NULL /*static, unused*/, L_0, (Object_t76 *)NULL, /*hidden argument*/NULL);
		if (!L_1)
		{
			goto IL_001c;
		}
	}
	{
		Graphic_t560 * L_2 = BaseMeshEffect_get_graphic_m3424(__this, /*hidden argument*/NULL);
		NullCheck(L_2);
		VirtActionInvoker0::Invoke(23 /* System.Void UnityEngine.UI.Graphic::SetVerticesDirty() */, L_2);
	}

IL_001c:
	{
		UIBehaviour_OnDidApplyAnimationProperties_m2203(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.BaseMeshEffect::ModifyMesh(UnityEngine.Mesh)
extern TypeInfo* VertexHelper_t562_il2cpp_TypeInfo_var;
extern TypeInfo* IDisposable_t153_il2cpp_TypeInfo_var;
extern "C" void BaseMeshEffect_ModifyMesh_m3428 (BaseMeshEffect_t653 * __this, Mesh_t208 * ___mesh, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		VertexHelper_t562_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(317);
		IDisposable_t153_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(45);
		s_Il2CppMethodIntialized = true;
	}
	VertexHelper_t562 * V_0 = {0};
	Exception_t152 * __last_unhandled_exception = 0;
	NO_UNUSED_WARNING (__last_unhandled_exception);
	Exception_t152 * __exception_local = 0;
	NO_UNUSED_WARNING (__exception_local);
	int32_t __leave_target = 0;
	NO_UNUSED_WARNING (__leave_target);
	{
		Mesh_t208 * L_0 = ___mesh;
		VertexHelper_t562 * L_1 = (VertexHelper_t562 *)il2cpp_codegen_object_new (VertexHelper_t562_il2cpp_TypeInfo_var);
		VertexHelper__ctor_m3408(L_1, L_0, /*hidden argument*/NULL);
		V_0 = L_1;
	}

IL_0007:
	try
	{ // begin try (depth: 1)
		VertexHelper_t562 * L_2 = V_0;
		VirtActionInvoker1< VertexHelper_t562 * >::Invoke(19 /* System.Void UnityEngine.UI.BaseMeshEffect::ModifyMesh(UnityEngine.UI.VertexHelper) */, __this, L_2);
		VertexHelper_t562 * L_3 = V_0;
		Mesh_t208 * L_4 = ___mesh;
		NullCheck(L_3);
		VertexHelper_FillMesh_m3414(L_3, L_4, /*hidden argument*/NULL);
		IL2CPP_LEAVE(0x27, FINALLY_001a);
	} // end try (depth: 1)
	catch(Il2CppExceptionWrapper& e)
	{
		__last_unhandled_exception = (Exception_t152 *)e.ex;
		goto FINALLY_001a;
	}

FINALLY_001a:
	{ // begin finally (depth: 1)
		{
			VertexHelper_t562 * L_5 = V_0;
			if (!L_5)
			{
				goto IL_0026;
			}
		}

IL_0020:
		{
			VertexHelper_t562 * L_6 = V_0;
			NullCheck(L_6);
			InterfaceActionInvoker0::Invoke(0 /* System.Void System.IDisposable::Dispose() */, IDisposable_t153_il2cpp_TypeInfo_var, L_6);
		}

IL_0026:
		{
			IL2CPP_END_FINALLY(26)
		}
	} // end finally (depth: 1)
	IL2CPP_CLEANUP(26)
	{
		IL2CPP_JUMP_TBL(0x27, IL_0027)
		IL2CPP_RETHROW_IF_UNHANDLED(Exception_t152 *)
	}

IL_0027:
	{
		return;
	}
}
// System.Void UnityEngine.UI.Outline::.ctor()
extern "C" void Outline__ctor_m3429 (Outline_t654 * __this, const MethodInfo* method)
{
	{
		Shadow__ctor_m3433(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.Outline::ModifyMesh(UnityEngine.UI.VertexHelper)
extern TypeInfo* ListPool_1_t720_il2cpp_TypeInfo_var;
extern const MethodInfo* ListPool_1_Get_m3688_MethodInfo_var;
extern const MethodInfo* List_1_get_Capacity_m3689_MethodInfo_var;
extern const MethodInfo* List_1_set_Capacity_m3690_MethodInfo_var;
extern const MethodInfo* ListPool_1_Release_m3691_MethodInfo_var;
extern "C" void Outline_ModifyMesh_m3430 (Outline_t654 * __this, VertexHelper_t562 * ___vh, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		ListPool_1_t720_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(420);
		ListPool_1_Get_m3688_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483973);
		List_1_get_Capacity_m3689_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483974);
		List_1_set_Capacity_m3690_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483975);
		ListPool_1_Release_m3691_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483976);
		s_Il2CppMethodIntialized = true;
	}
	List_1_t316 * V_0 = {0};
	int32_t V_1 = 0;
	int32_t V_2 = 0;
	int32_t V_3 = 0;
	Vector2_t6  V_4 = {0};
	Vector2_t6  V_5 = {0};
	Vector2_t6  V_6 = {0};
	Vector2_t6  V_7 = {0};
	Vector2_t6  V_8 = {0};
	Vector2_t6  V_9 = {0};
	Vector2_t6  V_10 = {0};
	Vector2_t6  V_11 = {0};
	{
		bool L_0 = (bool)VirtFuncInvoker0< bool >::Invoke(9 /* System.Boolean UnityEngine.EventSystems.UIBehaviour::IsActive() */, __this);
		if (L_0)
		{
			goto IL_000c;
		}
	}
	{
		return;
	}

IL_000c:
	{
		IL2CPP_RUNTIME_CLASS_INIT(ListPool_1_t720_il2cpp_TypeInfo_var);
		List_1_t316 * L_1 = ListPool_1_Get_m3688(NULL /*static, unused*/, /*hidden argument*/ListPool_1_Get_m3688_MethodInfo_var);
		V_0 = L_1;
		VertexHelper_t562 * L_2 = ___vh;
		List_1_t316 * L_3 = V_0;
		NullCheck(L_2);
		VertexHelper_GetUIVertexStream_m3422(L_2, L_3, /*hidden argument*/NULL);
		List_1_t316 * L_4 = V_0;
		NullCheck(L_4);
		int32_t L_5 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.UIVertex>::get_Count() */, L_4);
		V_1 = ((int32_t)((int32_t)L_5*(int32_t)5));
		List_1_t316 * L_6 = V_0;
		NullCheck(L_6);
		int32_t L_7 = List_1_get_Capacity_m3689(L_6, /*hidden argument*/List_1_get_Capacity_m3689_MethodInfo_var);
		int32_t L_8 = V_1;
		if ((((int32_t)L_7) >= ((int32_t)L_8)))
		{
			goto IL_0035;
		}
	}
	{
		List_1_t316 * L_9 = V_0;
		int32_t L_10 = V_1;
		NullCheck(L_9);
		List_1_set_Capacity_m3690(L_9, L_10, /*hidden argument*/List_1_set_Capacity_m3690_MethodInfo_var);
	}

IL_0035:
	{
		V_2 = 0;
		List_1_t316 * L_11 = V_0;
		NullCheck(L_11);
		int32_t L_12 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.UIVertex>::get_Count() */, L_11);
		V_3 = L_12;
		List_1_t316 * L_13 = V_0;
		Color_t139  L_14 = Shadow_get_effectColor_m3434(__this, /*hidden argument*/NULL);
		Color32_t231  L_15 = Color32_op_Implicit_m989(NULL /*static, unused*/, L_14, /*hidden argument*/NULL);
		int32_t L_16 = V_2;
		List_1_t316 * L_17 = V_0;
		NullCheck(L_17);
		int32_t L_18 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.UIVertex>::get_Count() */, L_17);
		Vector2_t6  L_19 = Shadow_get_effectDistance_m3436(__this, /*hidden argument*/NULL);
		V_4 = L_19;
		float L_20 = ((&V_4)->___x_1);
		Vector2_t6  L_21 = Shadow_get_effectDistance_m3436(__this, /*hidden argument*/NULL);
		V_5 = L_21;
		float L_22 = ((&V_5)->___y_2);
		Shadow_ApplyShadowZeroAlloc_m3440(__this, L_13, L_15, L_16, L_18, L_20, L_22, /*hidden argument*/NULL);
		int32_t L_23 = V_3;
		V_2 = L_23;
		List_1_t316 * L_24 = V_0;
		NullCheck(L_24);
		int32_t L_25 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.UIVertex>::get_Count() */, L_24);
		V_3 = L_25;
		List_1_t316 * L_26 = V_0;
		Color_t139  L_27 = Shadow_get_effectColor_m3434(__this, /*hidden argument*/NULL);
		Color32_t231  L_28 = Color32_op_Implicit_m989(NULL /*static, unused*/, L_27, /*hidden argument*/NULL);
		int32_t L_29 = V_2;
		List_1_t316 * L_30 = V_0;
		NullCheck(L_30);
		int32_t L_31 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.UIVertex>::get_Count() */, L_30);
		Vector2_t6  L_32 = Shadow_get_effectDistance_m3436(__this, /*hidden argument*/NULL);
		V_6 = L_32;
		float L_33 = ((&V_6)->___x_1);
		Vector2_t6  L_34 = Shadow_get_effectDistance_m3436(__this, /*hidden argument*/NULL);
		V_7 = L_34;
		float L_35 = ((&V_7)->___y_2);
		Shadow_ApplyShadowZeroAlloc_m3440(__this, L_26, L_28, L_29, L_31, L_33, ((-L_35)), /*hidden argument*/NULL);
		int32_t L_36 = V_3;
		V_2 = L_36;
		List_1_t316 * L_37 = V_0;
		NullCheck(L_37);
		int32_t L_38 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.UIVertex>::get_Count() */, L_37);
		V_3 = L_38;
		List_1_t316 * L_39 = V_0;
		Color_t139  L_40 = Shadow_get_effectColor_m3434(__this, /*hidden argument*/NULL);
		Color32_t231  L_41 = Color32_op_Implicit_m989(NULL /*static, unused*/, L_40, /*hidden argument*/NULL);
		int32_t L_42 = V_2;
		List_1_t316 * L_43 = V_0;
		NullCheck(L_43);
		int32_t L_44 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.UIVertex>::get_Count() */, L_43);
		Vector2_t6  L_45 = Shadow_get_effectDistance_m3436(__this, /*hidden argument*/NULL);
		V_8 = L_45;
		float L_46 = ((&V_8)->___x_1);
		Vector2_t6  L_47 = Shadow_get_effectDistance_m3436(__this, /*hidden argument*/NULL);
		V_9 = L_47;
		float L_48 = ((&V_9)->___y_2);
		Shadow_ApplyShadowZeroAlloc_m3440(__this, L_39, L_41, L_42, L_44, ((-L_46)), L_48, /*hidden argument*/NULL);
		int32_t L_49 = V_3;
		V_2 = L_49;
		List_1_t316 * L_50 = V_0;
		NullCheck(L_50);
		int32_t L_51 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.UIVertex>::get_Count() */, L_50);
		V_3 = L_51;
		List_1_t316 * L_52 = V_0;
		Color_t139  L_53 = Shadow_get_effectColor_m3434(__this, /*hidden argument*/NULL);
		Color32_t231  L_54 = Color32_op_Implicit_m989(NULL /*static, unused*/, L_53, /*hidden argument*/NULL);
		int32_t L_55 = V_2;
		List_1_t316 * L_56 = V_0;
		NullCheck(L_56);
		int32_t L_57 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.UIVertex>::get_Count() */, L_56);
		Vector2_t6  L_58 = Shadow_get_effectDistance_m3436(__this, /*hidden argument*/NULL);
		V_10 = L_58;
		float L_59 = ((&V_10)->___x_1);
		Vector2_t6  L_60 = Shadow_get_effectDistance_m3436(__this, /*hidden argument*/NULL);
		V_11 = L_60;
		float L_61 = ((&V_11)->___y_2);
		Shadow_ApplyShadowZeroAlloc_m3440(__this, L_52, L_54, L_55, L_57, ((-L_59)), ((-L_61)), /*hidden argument*/NULL);
		VertexHelper_t562 * L_62 = ___vh;
		NullCheck(L_62);
		VertexHelper_Clear_m3410(L_62, /*hidden argument*/NULL);
		VertexHelper_t562 * L_63 = ___vh;
		List_1_t316 * L_64 = V_0;
		NullCheck(L_63);
		VertexHelper_AddUIVertexTriangleStream_m3421(L_63, L_64, /*hidden argument*/NULL);
		List_1_t316 * L_65 = V_0;
		IL2CPP_RUNTIME_CLASS_INIT(ListPool_1_t720_il2cpp_TypeInfo_var);
		ListPool_1_Release_m3691(NULL /*static, unused*/, L_65, /*hidden argument*/ListPool_1_Release_m3691_MethodInfo_var);
		return;
	}
}
// System.Void UnityEngine.UI.PositionAsUV1::.ctor()
extern "C" void PositionAsUV1__ctor_m3431 (PositionAsUV1_t656 * __this, const MethodInfo* method)
{
	{
		BaseMeshEffect__ctor_m3423(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.PositionAsUV1::ModifyMesh(UnityEngine.UI.VertexHelper)
extern TypeInfo* UIVertex_t323_il2cpp_TypeInfo_var;
extern "C" void PositionAsUV1_ModifyMesh_m3432 (PositionAsUV1_t656 * __this, VertexHelper_t562 * ___vh, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		UIVertex_t323_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(152);
		s_Il2CppMethodIntialized = true;
	}
	UIVertex_t323  V_0 = {0};
	int32_t V_1 = 0;
	{
		Initobj (UIVertex_t323_il2cpp_TypeInfo_var, (&V_0));
		V_1 = 0;
		goto IL_0048;
	}

IL_000f:
	{
		VertexHelper_t562 * L_0 = ___vh;
		int32_t L_1 = V_1;
		NullCheck(L_0);
		VertexHelper_PopulateUIVertex_m3412(L_0, (&V_0), L_1, /*hidden argument*/NULL);
		Vector3_t4 * L_2 = &((&V_0)->___position_0);
		float L_3 = (L_2->___x_1);
		Vector3_t4 * L_4 = &((&V_0)->___position_0);
		float L_5 = (L_4->___y_2);
		Vector2_t6  L_6 = {0};
		Vector2__ctor_m436(&L_6, L_3, L_5, /*hidden argument*/NULL);
		(&V_0)->___uv1_4 = L_6;
		VertexHelper_t562 * L_7 = ___vh;
		UIVertex_t323  L_8 = V_0;
		int32_t L_9 = V_1;
		NullCheck(L_7);
		VertexHelper_SetUIVertex_m3413(L_7, L_8, L_9, /*hidden argument*/NULL);
		int32_t L_10 = V_1;
		V_1 = ((int32_t)((int32_t)L_10+(int32_t)1));
	}

IL_0048:
	{
		int32_t L_11 = V_1;
		VertexHelper_t562 * L_12 = ___vh;
		NullCheck(L_12);
		int32_t L_13 = VertexHelper_get_currentVertCount_m3411(L_12, /*hidden argument*/NULL);
		if ((((int32_t)L_11) < ((int32_t)L_13)))
		{
			goto IL_000f;
		}
	}
	{
		return;
	}
}
// System.Void UnityEngine.UI.Shadow::.ctor()
extern "C" void Shadow__ctor_m3433 (Shadow_t655 * __this, const MethodInfo* method)
{
	{
		Color_t139  L_0 = {0};
		Color__ctor_m697(&L_0, (0.0f), (0.0f), (0.0f), (0.5f), /*hidden argument*/NULL);
		__this->___m_EffectColor_3 = L_0;
		Vector2_t6  L_1 = {0};
		Vector2__ctor_m436(&L_1, (1.0f), (-1.0f), /*hidden argument*/NULL);
		__this->___m_EffectDistance_4 = L_1;
		__this->___m_UseGraphicAlpha_5 = 1;
		BaseMeshEffect__ctor_m3423(__this, /*hidden argument*/NULL);
		return;
	}
}
// UnityEngine.Color UnityEngine.UI.Shadow::get_effectColor()
extern "C" Color_t139  Shadow_get_effectColor_m3434 (Shadow_t655 * __this, const MethodInfo* method)
{
	{
		Color_t139  L_0 = (__this->___m_EffectColor_3);
		return L_0;
	}
}
// System.Void UnityEngine.UI.Shadow::set_effectColor(UnityEngine.Color)
extern "C" void Shadow_set_effectColor_m3435 (Shadow_t655 * __this, Color_t139  ___value, const MethodInfo* method)
{
	{
		Color_t139  L_0 = ___value;
		__this->___m_EffectColor_3 = L_0;
		Graphic_t560 * L_1 = BaseMeshEffect_get_graphic_m3424(__this, /*hidden argument*/NULL);
		bool L_2 = Object_op_Inequality_m429(NULL /*static, unused*/, L_1, (Object_t76 *)NULL, /*hidden argument*/NULL);
		if (!L_2)
		{
			goto IL_0023;
		}
	}
	{
		Graphic_t560 * L_3 = BaseMeshEffect_get_graphic_m3424(__this, /*hidden argument*/NULL);
		NullCheck(L_3);
		VirtActionInvoker0::Invoke(23 /* System.Void UnityEngine.UI.Graphic::SetVerticesDirty() */, L_3);
	}

IL_0023:
	{
		return;
	}
}
// UnityEngine.Vector2 UnityEngine.UI.Shadow::get_effectDistance()
extern "C" Vector2_t6  Shadow_get_effectDistance_m3436 (Shadow_t655 * __this, const MethodInfo* method)
{
	{
		Vector2_t6  L_0 = (__this->___m_EffectDistance_4);
		return L_0;
	}
}
// System.Void UnityEngine.UI.Shadow::set_effectDistance(UnityEngine.Vector2)
extern "C" void Shadow_set_effectDistance_m3437 (Shadow_t655 * __this, Vector2_t6  ___value, const MethodInfo* method)
{
	{
		float L_0 = ((&___value)->___x_1);
		if ((!(((float)L_0) > ((float)(600.0f)))))
		{
			goto IL_001d;
		}
	}
	{
		(&___value)->___x_1 = (600.0f);
	}

IL_001d:
	{
		float L_1 = ((&___value)->___x_1);
		if ((!(((float)L_1) < ((float)(-600.0f)))))
		{
			goto IL_003a;
		}
	}
	{
		(&___value)->___x_1 = (-600.0f);
	}

IL_003a:
	{
		float L_2 = ((&___value)->___y_2);
		if ((!(((float)L_2) > ((float)(600.0f)))))
		{
			goto IL_0057;
		}
	}
	{
		(&___value)->___y_2 = (600.0f);
	}

IL_0057:
	{
		float L_3 = ((&___value)->___y_2);
		if ((!(((float)L_3) < ((float)(-600.0f)))))
		{
			goto IL_0074;
		}
	}
	{
		(&___value)->___y_2 = (-600.0f);
	}

IL_0074:
	{
		Vector2_t6  L_4 = (__this->___m_EffectDistance_4);
		Vector2_t6  L_5 = ___value;
		bool L_6 = Vector2_op_Equality_m540(NULL /*static, unused*/, L_4, L_5, /*hidden argument*/NULL);
		if (!L_6)
		{
			goto IL_0086;
		}
	}
	{
		return;
	}

IL_0086:
	{
		Vector2_t6  L_7 = ___value;
		__this->___m_EffectDistance_4 = L_7;
		Graphic_t560 * L_8 = BaseMeshEffect_get_graphic_m3424(__this, /*hidden argument*/NULL);
		bool L_9 = Object_op_Inequality_m429(NULL /*static, unused*/, L_8, (Object_t76 *)NULL, /*hidden argument*/NULL);
		if (!L_9)
		{
			goto IL_00a9;
		}
	}
	{
		Graphic_t560 * L_10 = BaseMeshEffect_get_graphic_m3424(__this, /*hidden argument*/NULL);
		NullCheck(L_10);
		VirtActionInvoker0::Invoke(23 /* System.Void UnityEngine.UI.Graphic::SetVerticesDirty() */, L_10);
	}

IL_00a9:
	{
		return;
	}
}
// System.Boolean UnityEngine.UI.Shadow::get_useGraphicAlpha()
extern "C" bool Shadow_get_useGraphicAlpha_m3438 (Shadow_t655 * __this, const MethodInfo* method)
{
	{
		bool L_0 = (__this->___m_UseGraphicAlpha_5);
		return L_0;
	}
}
// System.Void UnityEngine.UI.Shadow::set_useGraphicAlpha(System.Boolean)
extern "C" void Shadow_set_useGraphicAlpha_m3439 (Shadow_t655 * __this, bool ___value, const MethodInfo* method)
{
	{
		bool L_0 = ___value;
		__this->___m_UseGraphicAlpha_5 = L_0;
		Graphic_t560 * L_1 = BaseMeshEffect_get_graphic_m3424(__this, /*hidden argument*/NULL);
		bool L_2 = Object_op_Inequality_m429(NULL /*static, unused*/, L_1, (Object_t76 *)NULL, /*hidden argument*/NULL);
		if (!L_2)
		{
			goto IL_0023;
		}
	}
	{
		Graphic_t560 * L_3 = BaseMeshEffect_get_graphic_m3424(__this, /*hidden argument*/NULL);
		NullCheck(L_3);
		VirtActionInvoker0::Invoke(23 /* System.Void UnityEngine.UI.Graphic::SetVerticesDirty() */, L_3);
	}

IL_0023:
	{
		return;
	}
}
// System.Void UnityEngine.UI.Shadow::ApplyShadowZeroAlloc(System.Collections.Generic.List`1<UnityEngine.UIVertex>,UnityEngine.Color32,System.Int32,System.Int32,System.Single,System.Single)
extern const MethodInfo* List_1_get_Capacity_m3689_MethodInfo_var;
extern const MethodInfo* List_1_set_Capacity_m3690_MethodInfo_var;
extern "C" void Shadow_ApplyShadowZeroAlloc_m3440 (Shadow_t655 * __this, List_1_t316 * ___verts, Color32_t231  ___color, int32_t ___start, int32_t ___end, float ___x, float ___y, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		List_1_get_Capacity_m3689_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483974);
		List_1_set_Capacity_m3690_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483975);
		s_Il2CppMethodIntialized = true;
	}
	UIVertex_t323  V_0 = {0};
	int32_t V_1 = 0;
	int32_t V_2 = 0;
	Vector3_t4  V_3 = {0};
	Color32_t231  V_4 = {0};
	UIVertex_t323  V_5 = {0};
	{
		List_1_t316 * L_0 = ___verts;
		NullCheck(L_0);
		int32_t L_1 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.UIVertex>::get_Count() */, L_0);
		V_1 = ((int32_t)((int32_t)L_1*(int32_t)2));
		List_1_t316 * L_2 = ___verts;
		NullCheck(L_2);
		int32_t L_3 = List_1_get_Capacity_m3689(L_2, /*hidden argument*/List_1_get_Capacity_m3689_MethodInfo_var);
		int32_t L_4 = V_1;
		if ((((int32_t)L_3) >= ((int32_t)L_4)))
		{
			goto IL_001c;
		}
	}
	{
		List_1_t316 * L_5 = ___verts;
		int32_t L_6 = V_1;
		NullCheck(L_5);
		List_1_set_Capacity_m3690(L_5, L_6, /*hidden argument*/List_1_set_Capacity_m3690_MethodInfo_var);
	}

IL_001c:
	{
		int32_t L_7 = ___start;
		V_2 = L_7;
		goto IL_00b0;
	}

IL_0023:
	{
		List_1_t316 * L_8 = ___verts;
		int32_t L_9 = V_2;
		NullCheck(L_8);
		UIVertex_t323  L_10 = (UIVertex_t323 )VirtFuncInvoker1< UIVertex_t323 , int32_t >::Invoke(31 /* !0 System.Collections.Generic.List`1<UnityEngine.UIVertex>::get_Item(System.Int32) */, L_8, L_9);
		V_0 = L_10;
		List_1_t316 * L_11 = ___verts;
		UIVertex_t323  L_12 = V_0;
		NullCheck(L_11);
		VirtActionInvoker1< UIVertex_t323  >::Invoke(22 /* System.Void System.Collections.Generic.List`1<UnityEngine.UIVertex>::Add(!0) */, L_11, L_12);
		Vector3_t4  L_13 = ((&V_0)->___position_0);
		V_3 = L_13;
		Vector3_t4 * L_14 = (&V_3);
		float L_15 = (L_14->___x_1);
		float L_16 = ___x;
		L_14->___x_1 = ((float)((float)L_15+(float)L_16));
		Vector3_t4 * L_17 = (&V_3);
		float L_18 = (L_17->___y_2);
		float L_19 = ___y;
		L_17->___y_2 = ((float)((float)L_18+(float)L_19));
		Vector3_t4  L_20 = V_3;
		(&V_0)->___position_0 = L_20;
		Color32_t231  L_21 = ___color;
		V_4 = L_21;
		bool L_22 = (__this->___m_UseGraphicAlpha_5);
		if (!L_22)
		{
			goto IL_009b;
		}
	}
	{
		uint8_t L_23 = ((&V_4)->___a_3);
		List_1_t316 * L_24 = ___verts;
		int32_t L_25 = V_2;
		NullCheck(L_24);
		UIVertex_t323  L_26 = (UIVertex_t323 )VirtFuncInvoker1< UIVertex_t323 , int32_t >::Invoke(31 /* !0 System.Collections.Generic.List`1<UnityEngine.UIVertex>::get_Item(System.Int32) */, L_24, L_25);
		V_5 = L_26;
		Color32_t231 * L_27 = &((&V_5)->___color_2);
		uint8_t L_28 = (L_27->___a_3);
		(&V_4)->___a_3 = (((int32_t)((uint8_t)((int32_t)((int32_t)((int32_t)((int32_t)L_23*(int32_t)L_28))/(int32_t)((int32_t)255))))));
	}

IL_009b:
	{
		Color32_t231  L_29 = V_4;
		(&V_0)->___color_2 = L_29;
		List_1_t316 * L_30 = ___verts;
		int32_t L_31 = V_2;
		UIVertex_t323  L_32 = V_0;
		NullCheck(L_30);
		VirtActionInvoker2< int32_t, UIVertex_t323  >::Invoke(32 /* System.Void System.Collections.Generic.List`1<UnityEngine.UIVertex>::set_Item(System.Int32,!0) */, L_30, L_31, L_32);
		int32_t L_33 = V_2;
		V_2 = ((int32_t)((int32_t)L_33+(int32_t)1));
	}

IL_00b0:
	{
		int32_t L_34 = V_2;
		int32_t L_35 = ___end;
		if ((((int32_t)L_34) < ((int32_t)L_35)))
		{
			goto IL_0023;
		}
	}
	{
		return;
	}
}
// System.Void UnityEngine.UI.Shadow::ApplyShadow(System.Collections.Generic.List`1<UnityEngine.UIVertex>,UnityEngine.Color32,System.Int32,System.Int32,System.Single,System.Single)
extern const MethodInfo* List_1_get_Capacity_m3689_MethodInfo_var;
extern const MethodInfo* List_1_set_Capacity_m3690_MethodInfo_var;
extern "C" void Shadow_ApplyShadow_m3441 (Shadow_t655 * __this, List_1_t316 * ___verts, Color32_t231  ___color, int32_t ___start, int32_t ___end, float ___x, float ___y, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		List_1_get_Capacity_m3689_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483974);
		List_1_set_Capacity_m3690_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483975);
		s_Il2CppMethodIntialized = true;
	}
	int32_t V_0 = 0;
	{
		List_1_t316 * L_0 = ___verts;
		NullCheck(L_0);
		int32_t L_1 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.UIVertex>::get_Count() */, L_0);
		V_0 = ((int32_t)((int32_t)L_1*(int32_t)2));
		List_1_t316 * L_2 = ___verts;
		NullCheck(L_2);
		int32_t L_3 = List_1_get_Capacity_m3689(L_2, /*hidden argument*/List_1_get_Capacity_m3689_MethodInfo_var);
		int32_t L_4 = V_0;
		if ((((int32_t)L_3) >= ((int32_t)L_4)))
		{
			goto IL_001c;
		}
	}
	{
		List_1_t316 * L_5 = ___verts;
		int32_t L_6 = V_0;
		NullCheck(L_5);
		List_1_set_Capacity_m3690(L_5, L_6, /*hidden argument*/List_1_set_Capacity_m3690_MethodInfo_var);
	}

IL_001c:
	{
		List_1_t316 * L_7 = ___verts;
		Color32_t231  L_8 = ___color;
		int32_t L_9 = ___start;
		int32_t L_10 = ___end;
		float L_11 = ___x;
		float L_12 = ___y;
		Shadow_ApplyShadowZeroAlloc_m3440(__this, L_7, L_8, L_9, L_10, L_11, L_12, /*hidden argument*/NULL);
		return;
	}
}
// System.Void UnityEngine.UI.Shadow::ModifyMesh(UnityEngine.UI.VertexHelper)
extern TypeInfo* ListPool_1_t720_il2cpp_TypeInfo_var;
extern const MethodInfo* ListPool_1_Get_m3688_MethodInfo_var;
extern const MethodInfo* ListPool_1_Release_m3691_MethodInfo_var;
extern "C" void Shadow_ModifyMesh_m3442 (Shadow_t655 * __this, VertexHelper_t562 * ___vh, const MethodInfo* method)
{
	static bool s_Il2CppMethodIntialized;
	if (!s_Il2CppMethodIntialized)
	{
		ListPool_1_t720_il2cpp_TypeInfo_var = il2cpp_codegen_type_info_from_index(420);
		ListPool_1_Get_m3688_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483973);
		ListPool_1_Release_m3691_MethodInfo_var = il2cpp_codegen_method_info_from_index(2147483976);
		s_Il2CppMethodIntialized = true;
	}
	List_1_t316 * V_0 = {0};
	Vector2_t6  V_1 = {0};
	Vector2_t6  V_2 = {0};
	{
		bool L_0 = (bool)VirtFuncInvoker0< bool >::Invoke(9 /* System.Boolean UnityEngine.EventSystems.UIBehaviour::IsActive() */, __this);
		if (L_0)
		{
			goto IL_000c;
		}
	}
	{
		return;
	}

IL_000c:
	{
		IL2CPP_RUNTIME_CLASS_INIT(ListPool_1_t720_il2cpp_TypeInfo_var);
		List_1_t316 * L_1 = ListPool_1_Get_m3688(NULL /*static, unused*/, /*hidden argument*/ListPool_1_Get_m3688_MethodInfo_var);
		V_0 = L_1;
		VertexHelper_t562 * L_2 = ___vh;
		List_1_t316 * L_3 = V_0;
		NullCheck(L_2);
		VertexHelper_GetUIVertexStream_m3422(L_2, L_3, /*hidden argument*/NULL);
		List_1_t316 * L_4 = V_0;
		Color_t139  L_5 = Shadow_get_effectColor_m3434(__this, /*hidden argument*/NULL);
		Color32_t231  L_6 = Color32_op_Implicit_m989(NULL /*static, unused*/, L_5, /*hidden argument*/NULL);
		List_1_t316 * L_7 = V_0;
		NullCheck(L_7);
		int32_t L_8 = (int32_t)VirtFuncInvoker0< int32_t >::Invoke(20 /* System.Int32 System.Collections.Generic.List`1<UnityEngine.UIVertex>::get_Count() */, L_7);
		Vector2_t6  L_9 = Shadow_get_effectDistance_m3436(__this, /*hidden argument*/NULL);
		V_1 = L_9;
		float L_10 = ((&V_1)->___x_1);
		Vector2_t6  L_11 = Shadow_get_effectDistance_m3436(__this, /*hidden argument*/NULL);
		V_2 = L_11;
		float L_12 = ((&V_2)->___y_2);
		Shadow_ApplyShadow_m3441(__this, L_4, L_6, 0, L_8, L_10, L_12, /*hidden argument*/NULL);
		VertexHelper_t562 * L_13 = ___vh;
		NullCheck(L_13);
		VertexHelper_Clear_m3410(L_13, /*hidden argument*/NULL);
		VertexHelper_t562 * L_14 = ___vh;
		List_1_t316 * L_15 = V_0;
		NullCheck(L_14);
		VertexHelper_AddUIVertexTriangleStream_m3421(L_14, L_15, /*hidden argument*/NULL);
		List_1_t316 * L_16 = V_0;
		ListPool_1_Release_m3691(NULL /*static, unused*/, L_16, /*hidden argument*/ListPool_1_Release_m3691_MethodInfo_var);
		return;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
