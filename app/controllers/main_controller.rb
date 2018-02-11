class MainController < ApplicationController

  # GET /search
  #
  # {
  #   :features => [
  #     {
  #       :id => 1
  #       :min => 20,
  #       :max => 50,
  #     },
  #     {
  #       :id => 2
  #       :min => 30,
  #       :max => 90,
  #     },
  #     ...
  #   ]
  # }
  #
  # ?features[][id]=1
  # &features[][max]=50
  # &features[][min]=20
  # &features[][id]=2
  # &features[][max]=90
  # &features[][min]=30
  #
  def search
    results = Measurement.search(params)

    render :json => results.map(&:metric)
  end

  def features
    features = Feature.all
    attr_whitelist = [:id, :desc]

    render :json => present(features, attr_whitelist)
  end

  private

  def present(items, whitelist)
    items.map do |item|
      {}.tap do |item_hash|
        whitelist.each do |attr|
          item_hash[attr] = item.send(attr)
        end
      end
    end
  end
end
