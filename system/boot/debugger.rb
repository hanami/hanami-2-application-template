# frozen_string_literal: true

Hanami.application.register_bootable :debugger do |container|
  init do
    require "pry" if Hanami.env?(:development) || Hanami.env?(:test)
  end
end
