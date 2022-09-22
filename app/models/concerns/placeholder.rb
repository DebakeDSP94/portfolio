module Placeholder
  extend ActiveSupport::Concern

  def self.image_generator(width:, height:)
    "https://unsplash.it/#{width}/#{height}?image=#{rand(0..1084)}"
  end
end