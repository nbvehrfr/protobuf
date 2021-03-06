require 'spec_helper'

RSpec.describe ::Protobuf do
  it "correctly encodes extreme values" do
    message = GoogleUnittest::TestExtremeDefaultValues.new(
      :escaped_bytes => "\0\001\a\b\f\n\r\t\v\\\'\"\xfe",
      :large_uint32 => 4294967295,
      :large_uint64 => 18446744073709551615,
      :small_int32 => -2147483647,
      :small_int64 => -9223372036854775807,
      :utf8_string => "\u1234",
      :zero_float => 0,
      :one_float => 1,
      :small_float => 1.5,
      :negative_one_float => -1,
      :negative_float => -1.5,
      :large_float => 2e+08,
      :small_negative_float => -8e-28,
      :inf_double => Float::INFINITY,
      :neg_inf_double => -Float::INFINITY,
      :nan_double => Float::NAN,
      :inf_float => Float::INFINITY,
      :neg_inf_float => -Float::INFINITY,
      :nan_float => Float::NAN,
      :cpp_trigraph => "? ? ?? ?? ??? ??/ ??-",
      :really_small_int32 => -2147483648,
      :really_small_int64 => -9223372036854775808,
      :string_with_zero => "hel lo",
      :bytes_with_zero => "wor ld",
      :string_piece_with_zero => "ab c",
      :cord_with_zero => "12 3",
    )

    data_file_path = File.expand_path('../../support/test/extreme_values.data.bin', __FILE__)
    data = File.open(data_file_path, 'rb') do |file|
      file.read
    end

    expect(data).to eq(message.serialize_to_string)
  end
end
