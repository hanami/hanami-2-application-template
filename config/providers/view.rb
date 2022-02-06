# frozen_string_literal: true

Hanami.application.register_provider :view do
  start do
    register "view.context", AppPrototype::View::Context.new
  end
end
