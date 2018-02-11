require 'rails_helper'

describe Measurement do
  describe '.search' do
    let(:f1) { Feature.create! }
    let(:f2) { Feature.create! }

    it "adheres to bounds" do
      m1 = Measurement.create!(
        :feature => f1,
        :metric => 3,
        :image => Image.create!,
      )
      m2 = Measurement.create!(
        :feature => f1,
        :metric => 20,
        :image => Image.create!,
      )
      m3 = Measurement.create!(
        :feature => f2,
        :metric => 3,
        :image => Image.create!,
      )
      m4 = Measurement.create!(
        :feature => f2,
        :metric => 20,
        :image => Image.create!,
      )

      params = {
        :features => [
          {
            :id => f1.id,
            :min => 2,
            :max => 10,
          },
          {
            :id => f2.id,
            :min => 2,
            :max => 10,
          }
        ]
      }

      results = Measurement.search(params)
      expect(results.count).to eq(2)
      expect(results.map(&:id)).to include(m1.id)
      expect(results.map(&:id)).to include(m3.id)
    end

    it "excludes out of bounds" do
    end
  end
end
