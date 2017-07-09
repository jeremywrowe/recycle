module Recycle
  class List < BasicObject
    class << self
      def render_section(title, content)
        key_width = content.keys.map(&:length).max
        sorted_content = content.sort_by { |key, _value| key }
        entries = sorted_content.map do |content|
          "#{content.first.ljust(key_width)} => #{content.last}"
        end.join("\n")

        <<~OUTPUT
        #{Util.header(title)}
        #{entries}
        OUTPUT
      end
    end
  end
end
