class MainController < ApplicationController

  # GET /search
  #
  # params should equal -> {
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
  #
  # GET /search
  def search
    results = Measurement.search(params)
    attr_whitelist = [:feature_id, :metric]

    render :json => present(results, attr_whitelist)
  end

  # GET /features
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
