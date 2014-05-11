require 'rubygems'
require 'bundler'
Bundler.setup

require 'sinatra'
require 'pdfkit'
require 'uri'

PDFKit.configure do |config|
  config.default_options = {
    :page_size => 'Letter',
    :load_error_handling => 'ignore',
    :print_media_type => true
  }
  config.verbose = true
end

set :bind, '0.0.0.0'

get '/pdf' do
  raw_url = params[:url]
  if raw_url && URI.parse(raw_url)
    url = URI.unescape raw_url
    content_type 'application/pdf' # escaped URL for filename
    PDFKit.new(url).to_pdf
  else
    444
  end
end

get '/' do
  "Working!"
end
