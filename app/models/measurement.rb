class Measurement < ApplicationRecord
  belongs_to :image
  belongs_to :feature

  def self.search(params)
    measurement_ids = params[:features].map do |fp|
      Measurement.
        select(:id).
        where(:feature_id => fp[:id]).
        where(:metric => fp[:min]...fp[:max]).
        map(&:id)
    end.flatten.uniq

    Measurement.where(:id => measurement_ids)
  end
end
