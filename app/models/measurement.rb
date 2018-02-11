class Measurement < ApplicationRecord
  belongs_to :image
  belongs_to :feature

  def self.search(params)
    measurement_ids = params.map do |feature_id, p|
      Measurement.
        select(:id).
        where(:feature_id => feature_id).
        where(:metric => p[:min]...p[:max]).
        map(&:id)
    end.flatten.uniq

    Measurement.includes(:image).where(:id => measurement_ids)
  end
end
