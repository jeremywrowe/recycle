require 'test_helper'
require 'recycle/list'

module Recycle
  class ListTest < MiniTest::Test
    def test_rendering_a_section_with_content
      title   = 'Foo'
      content = { 'baz' => 'foo', 'longthing' => 'bar' }

      assert_equal List.render_section(title, content).strip, <<~DOC.strip
      ================================================================================
                                            Foo
      ================================================================================

      baz       => foo
      longthing => bar
      DOC
    end
  end
end
