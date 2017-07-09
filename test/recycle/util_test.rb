require 'test_helper'
require 'recycle/util'

module Recycle
  class UtilTest < MiniTest::Test
    def test_header_rendering_with_defaults
      expected = <<~EXPECTED
      ================================================================================
                                      THIS IS AWESOME
      ================================================================================
      EXPECTED

      assert_equal expected, Recycle::Util.header('THIS IS AWESOME')
    end

    def test_header_rendering_with_a_specified_padding
      expected = <<~EXPECTED
      ==========================================
                   THIS IS AWESOME
      ==========================================
      EXPECTED

      assert_equal expected, Recycle::Util.header('THIS IS AWESOME', padding: 42)
    end

    def test_header_rendering_with_a_specified_token
      expected = <<~EXPECTED
      ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                                      THIS IS AWESOME
      ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      EXPECTED

      assert_equal expected, Recycle::Util.header('THIS IS AWESOME', token: '+')
    end
  end
end
