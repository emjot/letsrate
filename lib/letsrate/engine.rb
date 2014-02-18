module Letsrate

  class Engine < ::Rails::Engine

    initializer "letsrate.configure_rails_initialization" do |_|
      ActiveSupport.on_load(:action_view) do
        include Letsrate::Helpers
      end
    end

  end

end