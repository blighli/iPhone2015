#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.Byte[]
struct ByteU5BU5D_t789;
// System.Char[]
struct CharU5BU5D_t458;
// System.Text.Encoding
struct Encoding_t931;
// System.Text.Decoder
struct Decoder_t1263;
// System.IO.Stream
struct Stream_t1039;
// System.Text.StringBuilder
struct StringBuilder_t457;
// System.IO.StreamReader
struct StreamReader_t1288;

#include "mscorlib_System_IO_TextReader.h"

// System.IO.StreamReader
struct  StreamReader_t1288  : public TextReader_t1210
{
	// System.Byte[] System.IO.StreamReader::input_buffer
	ByteU5BU5D_t789* ___input_buffer_1;
	// System.Char[] System.IO.StreamReader::decoded_buffer
	CharU5BU5D_t458* ___decoded_buffer_2;
	// System.Int32 System.IO.StreamReader::decoded_count
	int32_t ___decoded_count_3;
	// System.Int32 System.IO.StreamReader::pos
	int32_t ___pos_4;
	// System.Int32 System.IO.StreamReader::buffer_size
	int32_t ___buffer_size_5;
	// System.Int32 System.IO.StreamReader::do_checks
	int32_t ___do_checks_6;
	// System.Text.Encoding System.IO.StreamReader::encoding
	Encoding_t931 * ___encoding_7;
	// System.Text.Decoder System.IO.StreamReader::decoder
	Decoder_t1263 * ___decoder_8;
	// System.IO.Stream System.IO.StreamReader::base_stream
	Stream_t1039 * ___base_stream_9;
	// System.Boolean System.IO.StreamReader::mayBlock
	bool ___mayBlock_10;
	// System.Text.StringBuilder System.IO.StreamReader::line_builder
	StringBuilder_t457 * ___line_builder_11;
	// System.Boolean System.IO.StreamReader::foundCR
	bool ___foundCR_13;
};
struct StreamReader_t1288_StaticFields{
	// System.IO.StreamReader System.IO.StreamReader::Null
	StreamReader_t1288 * ___Null_12;
};
