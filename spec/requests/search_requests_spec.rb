require 'rails_helper'

describe 'Main search', :type => :request do
  describe 'search' do
    it 'works' do
      get "/search?1%5Bmin%5D=2&1%5Bmax%5D=100&2%5Bmin%5D=5&2%5Bmax%5D=10&3%5Bmin%5D=15&3%5Bmax%5D=35&4%5Bmin%5D=6&4%5Bmax%5D=12"
      expect(response.success?).to be(true)
    end
  end
end

