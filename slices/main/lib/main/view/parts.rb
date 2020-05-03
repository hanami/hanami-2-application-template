# auto_register: false
# frozen_string_literal: true

module Main
  module View
    module Parts
    end
  end
end

Dir[File.join(__dir__, "parts", "*.rb")].sort.each do |part|
  require part
end
