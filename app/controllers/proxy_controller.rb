class ProxyController < ApplicationController

  def index
    connection = Faraday.new(:url => '') do |f|
      f.adapter Faraday.default_adapter
      f.use     Errors::RaiseError       # Include custom middleware
    end

    response = connection.get('')

    render :text => response.body
  end
  end
