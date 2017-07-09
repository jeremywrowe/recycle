module Recycle
  class Util < BasicObject
    class << self
      def header(label, padding: 80, token: "=")
        divider = token * padding
        <<~HEADER
        #{divider}
        #{label.center(padding).rstrip}
        #{divider}
        HEADER
      end
    end
  end
end
