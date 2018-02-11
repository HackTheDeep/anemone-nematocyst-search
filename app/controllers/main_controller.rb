class MainController < ApplicationController

  def index
    @features = Feature.all
  end

  # GET /search
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
  def search
    query = params.to_unsafe_h
    query.delete(:action)
    query.delete(:controller)
    measurements = Measurement.search(query)
    presented_results = { :images => {} }
    measurements.each do |meas|
      presented_results[:images][meas.image.id] ||= {}
      presented_results[:images][meas.image.id][:url] ||= meas.image.url
      presented_results[:images][meas.image.id][:measurements] ||= []
      presented_results[:images][meas.image.id][:measurements] << { :feature_id => meas.feature_id, :metric => meas.metric }
    end

    # such a hack
    presented_results[:images].each do |img_id, img_data|
      if img_data[:measurements].count < 4
        presented_results[:images].delete(img_id)
      end
    end

    render :json => presented_results
  rescue StandardError => e
    render :json => { :message => e.message, :class => e.class }, :status => 500
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
