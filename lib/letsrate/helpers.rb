module Letsrate

  module Helpers

    # Renders a rating for the given rateable_obj and dimension
    #
    # @param [ActiveRecord::Base]   rateable_obj
    # @param [String]               dimension
    # @param [Hash]                 options
    #
    # @return [String]  HTML represention for the rating
    def rating_for(rateable_obj, dimension = nil, options = {})
      star_count = options[:star] || 5

      cached_average = rateable_obj.average(dimension)
      avg  = ((cached_average) ? cached_average.avg : 0)

      render_rating(rateable_obj, avg, star_count, dimension)
    end

    # Renders a rating for the given user, rateable_obj and dimension
    #
    # @param [ActiveRecord::Base] rateable_obj
    # @param [ActiveRecord::Base] user
    # @param [String]             dimension
    # @param [Hash]               options
    #
    # @return [String] HTML represention for the rating
    def user_rating_for(rateable_obj, user, dimension = nil, options = {})
      star_count         = options[:star]                || 5
      disable_after_rate = options[:disable_after_rate]  || false

      user_rating = Rate.find_by_rater_id_and_rateable_id_and_dimension(user.id, rateable_obj.id, dimension)

      readonly = user_rating.present?
      rating   = ((readonly) ? user_rating.stars : 0)

      render_rating(rateable_obj, rating, star_count, dimension, readonly, disable_after_rate)
    end
    alias :rating_for_user :user_rating_for

    # Renders a rating based on the JQuery raty plugin
    #
    # @param [ActiveRecord::Base] rateable_obj
    # @param [Integer]            rating
    # @param [Integer]            star_count
    # @param [String]             dimension
    # @param [Boolean]            readonly
    # @param [Boolean]            disable_after_rate
    #
    # @return [String] HTML represention for the rating
    def render_rating(rateable_obj, rating, star_count, dimension = nil, readonly = true, disable_after_rate = true )
      content_tag(
        :div,
        '',
        :class                    => "star",
        "data-dimension"          => dimension,
        "data-rating"             => rating,
        "data-id"                 => rateable_obj.id,
        "data-classname"          => rateable_obj.class.name,
        "data-disable-after-rate" => disable_after_rate,
        "data-readonly"           => readonly,
        "data-star-count"         => star_count
      )
    end

  end

end