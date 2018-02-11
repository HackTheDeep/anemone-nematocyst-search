class MainController < ApplicationController

  # GET /search
  #
  # params = {
  #   1 => {
  #     :min => 20,
  #     :max => 50,
  #   },
  #   2 => {
  #     :min => 20,
  #     :max => 50,
  #   },
  #   ...
  # }
  #
  # GET /search
  def search
    query = params.to_unsafe_h
    query.delete(:action)
    query.delete(:controller)
    results = Measurement.search(query)
    presented_results = results.map do |meas|
      {
        :feature_id => meas.feature_id,
        :metric => meas.metric,
        :image_url => meas.image.url,
      }
    end

    render :json => presented_results
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
