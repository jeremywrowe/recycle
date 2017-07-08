require 'erb'

module Recycle
  class List < BasicObject
    TMPL = <<-DATA.freeze
<%= "=" * 80 %>
<%= title.center(80).rstrip %>
<%= "=" * 80 %>
<% sorted_content.each do |content| %>
<%= render_row(key_width, content.first, content.last) -%>
<% end %>

    DATA

    class << self
      def render_section(title, content)
        key_width = content.keys.map(&:length).max
        sorted_content = content.sort_by { |key, _value| key }
        ::ERB.new(TMPL, nil, '-').result(binding)
      end

      private

      def render_row(key_width, key, value)
        "#{key.ljust(key_width)} => #{value}"
      end
    end
  end
end
