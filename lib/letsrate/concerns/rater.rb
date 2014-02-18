require 'active_support/concern'

module Letsrate

  module Rater
    extend ActiveSupport::Concern

    included do
      has_many :ratings_given, :class_name => "Rate", :foreign_key => :rater_id
    end

  end
end

