require 'rubygems'
require 'bundler'
Bundler.setup

require 'sinatra'
require 'pdfkit'
require 'uri'

PDFKit.configure do |config|
  config.wkhtmltopdf = '/usr/local/bin/wkhtmltopdf'
  config.verbose = true
end

get '/pdf' do
  raw_url = params[:url]
  if raw_url && URI.parse(raw_url)
    url = URI.unescape raw_url
    content_type 'application/pdf' # escaped URL for filename
    PDFKit.new(url, :page_size => 'Letter', :load_error_handling => 'ignore').to_pdf
  else
    444
  end
end
