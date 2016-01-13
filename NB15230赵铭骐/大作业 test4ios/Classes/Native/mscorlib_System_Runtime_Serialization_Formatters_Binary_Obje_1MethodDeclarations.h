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

// System.Runtime.Serialization.Formatters.Binary.ObjectReader
struct ObjectReader_t1536;
// System.Runtime.Serialization.Formatters.Binary.BinaryFormatter
struct BinaryFormatter_t1516;
// System.IO.BinaryReader
struct BinaryReader_t1262;
// System.Object
struct Object_t;
// System.Runtime.Remoting.Messaging.Header[]
struct HeaderU5BU5D_t1745;
// System.Runtime.Serialization.SerializationInfo
struct SerializationInfo_t433;
// System.Runtime.Serialization.Formatters.Binary.ObjectReader/TypeMetadata
struct TypeMetadata_t1533;
// System.Reflection.MemberInfo
struct MemberInfo_t;
// System.Int32[]
struct Int32U5BU5D_t420;
// System.Array
struct Array_t;
// System.Type
struct Type_t;
// System.String
struct String_t;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_Runtime_Serialization_Formatters_Binary_Bina_0.h"
#include "mscorlib_System_Runtime_Serialization_Formatters_Binary_Type.h"

// System.Void System.Runtime.Serialization.Formatters.Binary.ObjectReader::.ctor(System.Runtime.Serialization.Formatters.Binary.BinaryFormatter)
extern "C" void ObjectReader__ctor_m9117 (ObjectReader_t1536 * __this, BinaryFormatter_t1516 * ___formatter, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Serialization.Formatters.Binary.ObjectReader::ReadObjectGraph(System.IO.BinaryReader,System.Boolean,System.Object&,System.Runtime.Remoting.Messaging.Header[]&)
extern "C" void ObjectReader_ReadObjectGraph_m9118 (ObjectReader_t1536 * __this, BinaryReader_t1262 * ___reader, bool ___readHeaders, Object_t ** ___result, HeaderU5BU5D_t1745** ___headers, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Serialization.Formatters.Binary.ObjectReader::ReadObjectGraph(System.Runtime.Serialization.Formatters.Binary.BinaryElement,System.IO.BinaryReader,System.Boolean,System.Object&,System.Runtime.Remoting.Messaging.Header[]&)
extern "C" void ObjectReader_ReadObjectGraph_m9119 (ObjectReader_t1536 * __this, uint8_t ___elem, BinaryReader_t1262 * ___reader, bool ___readHeaders, Object_t ** ___result, HeaderU5BU5D_t1745** ___headers, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.Runtime.Serialization.Formatters.Binary.ObjectReader::ReadNextObject(System.Runtime.Serialization.Formatters.Binary.BinaryElement,System.IO.BinaryReader)
extern "C" bool ObjectReader_ReadNextObject_m9120 (ObjectReader_t1536 * __this, uint8_t ___element, BinaryReader_t1262 * ___reader, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.Runtime.Serialization.Formatters.Binary.ObjectReader::ReadNextObject(System.IO.BinaryReader)
extern "C" bool ObjectReader_ReadNextObject_m9121 (ObjectReader_t1536 * __this, BinaryReader_t1262 * ___reader, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Object System.Runtime.Serialization.Formatters.Binary.ObjectReader::get_CurrentObject()
extern "C" Object_t * ObjectReader_get_CurrentObject_m9122 (ObjectReader_t1536 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Serialization.Formatters.Binary.ObjectReader::ReadObject(System.Runtime.Serialization.Formatters.Binary.BinaryElement,System.IO.BinaryReader,System.Int64&,System.Object&,System.Runtime.Serialization.SerializationInfo&)
extern "C" void ObjectReader_ReadObject_m9123 (ObjectReader_t1536 * __this, uint8_t ___element, BinaryReader_t1262 * ___reader, int64_t* ___objectId, Object_t ** ___value, SerializationInfo_t433 ** ___info, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Serialization.Formatters.Binary.ObjectReader::ReadAssembly(System.IO.BinaryReader)
extern "C" void ObjectReader_ReadAssembly_m9124 (ObjectReader_t1536 * __this, BinaryReader_t1262 * ___reader, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Serialization.Formatters.Binary.ObjectReader::ReadObjectInstance(System.IO.BinaryReader,System.Boolean,System.Boolean,System.Int64&,System.Object&,System.Runtime.Serialization.SerializationInfo&)
extern "C" void ObjectReader_ReadObjectInstance_m9125 (ObjectReader_t1536 * __this, BinaryReader_t1262 * ___reader, bool ___isRuntimeObject, bool ___hasTypeInfo, int64_t* ___objectId, Object_t ** ___value, SerializationInfo_t433 ** ___info, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Serialization.Formatters.Binary.ObjectReader::ReadRefTypeObjectInstance(System.IO.BinaryReader,System.Int64&,System.Object&,System.Runtime.Serialization.SerializationInfo&)
extern "C" void ObjectReader_ReadRefTypeObjectInstance_m9126 (ObjectReader_t1536 * __this, BinaryReader_t1262 * ___reader, int64_t* ___objectId, Object_t ** ___value, SerializationInfo_t433 ** ___info, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Serialization.Formatters.Binary.ObjectReader::ReadObjectContent(System.IO.BinaryReader,System.Runtime.Serialization.Formatters.Binary.ObjectReader/TypeMetadata,System.Int64,System.Object&,System.Runtime.Serialization.SerializationInfo&)
extern "C" void ObjectReader_ReadObjectContent_m9127 (ObjectReader_t1536 * __this, BinaryReader_t1262 * ___reader, TypeMetadata_t1533 * ___metadata, int64_t ___objectId, Object_t ** ___objectInstance, SerializationInfo_t433 ** ___info, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Serialization.Formatters.Binary.ObjectReader::RegisterObject(System.Int64,System.Object,System.Runtime.Serialization.SerializationInfo,System.Int64,System.Reflection.MemberInfo,System.Int32[])
extern "C" void ObjectReader_RegisterObject_m9128 (ObjectReader_t1536 * __this, int64_t ___objectId, Object_t * ___objectInstance, SerializationInfo_t433 * ___info, int64_t ___parentObjectId, MemberInfo_t * ___parentObjectMemeber, Int32U5BU5D_t420* ___indices, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Serialization.Formatters.Binary.ObjectReader::ReadStringIntance(System.IO.BinaryReader,System.Int64&,System.Object&)
extern "C" void ObjectReader_ReadStringIntance_m9129 (ObjectReader_t1536 * __this, BinaryReader_t1262 * ___reader, int64_t* ___objectId, Object_t ** ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Serialization.Formatters.Binary.ObjectReader::ReadGenericArray(System.IO.BinaryReader,System.Int64&,System.Object&)
extern "C" void ObjectReader_ReadGenericArray_m9130 (ObjectReader_t1536 * __this, BinaryReader_t1262 * ___reader, int64_t* ___objectId, Object_t ** ___val, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Object System.Runtime.Serialization.Formatters.Binary.ObjectReader::ReadBoxedPrimitiveTypeValue(System.IO.BinaryReader)
extern "C" Object_t * ObjectReader_ReadBoxedPrimitiveTypeValue_m9131 (ObjectReader_t1536 * __this, BinaryReader_t1262 * ___reader, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Serialization.Formatters.Binary.ObjectReader::ReadArrayOfPrimitiveType(System.IO.BinaryReader,System.Int64&,System.Object&)
extern "C" void ObjectReader_ReadArrayOfPrimitiveType_m9132 (ObjectReader_t1536 * __this, BinaryReader_t1262 * ___reader, int64_t* ___objectId, Object_t ** ___val, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Serialization.Formatters.Binary.ObjectReader::BlockRead(System.IO.BinaryReader,System.Array,System.Int32)
extern "C" void ObjectReader_BlockRead_m9133 (ObjectReader_t1536 * __this, BinaryReader_t1262 * ___reader, Array_t * ___array, int32_t ___dataSize, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Serialization.Formatters.Binary.ObjectReader::ReadArrayOfObject(System.IO.BinaryReader,System.Int64&,System.Object&)
extern "C" void ObjectReader_ReadArrayOfObject_m9134 (ObjectReader_t1536 * __this, BinaryReader_t1262 * ___reader, int64_t* ___objectId, Object_t ** ___array, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Serialization.Formatters.Binary.ObjectReader::ReadArrayOfString(System.IO.BinaryReader,System.Int64&,System.Object&)
extern "C" void ObjectReader_ReadArrayOfString_m9135 (ObjectReader_t1536 * __this, BinaryReader_t1262 * ___reader, int64_t* ___objectId, Object_t ** ___array, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Serialization.Formatters.Binary.ObjectReader::ReadSimpleArray(System.IO.BinaryReader,System.Type,System.Int64&,System.Object&)
extern "C" void ObjectReader_ReadSimpleArray_m9136 (ObjectReader_t1536 * __this, BinaryReader_t1262 * ___reader, Type_t * ___elementType, int64_t* ___objectId, Object_t ** ___val, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Runtime.Serialization.Formatters.Binary.ObjectReader/TypeMetadata System.Runtime.Serialization.Formatters.Binary.ObjectReader::ReadTypeMetadata(System.IO.BinaryReader,System.Boolean,System.Boolean)
extern "C" TypeMetadata_t1533 * ObjectReader_ReadTypeMetadata_m9137 (ObjectReader_t1536 * __this, BinaryReader_t1262 * ___reader, bool ___isRuntimeObject, bool ___hasTypeInfo, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Serialization.Formatters.Binary.ObjectReader::ReadValue(System.IO.BinaryReader,System.Object,System.Int64,System.Runtime.Serialization.SerializationInfo,System.Type,System.String,System.Reflection.MemberInfo,System.Int32[])
extern "C" void ObjectReader_ReadValue_m9138 (ObjectReader_t1536 * __this, BinaryReader_t1262 * ___reader, Object_t * ___parentObject, int64_t ___parentObjectId, SerializationInfo_t433 * ___info, Type_t * ___valueType, String_t* ___fieldName, MemberInfo_t * ___memberInfo, Int32U5BU5D_t420* ___indices, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Serialization.Formatters.Binary.ObjectReader::SetObjectValue(System.Object,System.String,System.Reflection.MemberInfo,System.Runtime.Serialization.SerializationInfo,System.Object,System.Type,System.Int32[])
extern "C" void ObjectReader_SetObjectValue_m9139 (ObjectReader_t1536 * __this, Object_t * ___parentObject, String_t* ___fieldName, MemberInfo_t * ___memberInfo, SerializationInfo_t433 * ___info, Object_t * ___value, Type_t * ___valueType, Int32U5BU5D_t420* ___indices, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Serialization.Formatters.Binary.ObjectReader::RecordFixup(System.Int64,System.Int64,System.Object,System.Runtime.Serialization.SerializationInfo,System.String,System.Reflection.MemberInfo,System.Int32[])
extern "C" void ObjectReader_RecordFixup_m9140 (ObjectReader_t1536 * __this, int64_t ___parentObjectId, int64_t ___childObjectId, Object_t * ___parentObject, SerializationInfo_t433 * ___info, String_t* ___fieldName, MemberInfo_t * ___memberInfo, Int32U5BU5D_t420* ___indices, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Type System.Runtime.Serialization.Formatters.Binary.ObjectReader::GetDeserializationType(System.Int64,System.String)
extern "C" Type_t * ObjectReader_GetDeserializationType_m9141 (ObjectReader_t1536 * __this, int64_t ___assemblyId, String_t* ___className, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Type System.Runtime.Serialization.Formatters.Binary.ObjectReader::ReadType(System.IO.BinaryReader,System.Runtime.Serialization.Formatters.Binary.TypeTag)
extern "C" Type_t * ObjectReader_ReadType_m9142 (ObjectReader_t1536 * __this, BinaryReader_t1262 * ___reader, uint8_t ___code, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Object System.Runtime.Serialization.Formatters.Binary.ObjectReader::ReadPrimitiveTypeValue(System.IO.BinaryReader,System.Type)
extern "C" Object_t * ObjectReader_ReadPrimitiveTypeValue_m9143 (Object_t * __this /* static, unused */, BinaryReader_t1262 * ___reader, Type_t * ___type, const MethodInfo* method) IL2CPP_METHOD_ATTR;
