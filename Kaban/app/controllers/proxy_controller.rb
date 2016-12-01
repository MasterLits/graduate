class ProxyController < ApplicationController

  def index
    connection = Faraday.new(:url => 'http://someservice') do |f|
      f.adapter Faraday.default_adapter
      f.use     Errors::RaiseError       # Include custom middleware
    end

    response = connection.get('/some/resource')

    render :text => response.body
  end
