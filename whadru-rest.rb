require 'sinatra'
require 'sinatra/json'
require 'nokogiri'
require 'open-uri'

set :json_content_type, :js

sites = { 
  "Earthdata" => { 
    :name => "NASA Earthdata",
    :url => "https://earthdata.nasa.gov"
  },
  "Element84" => {
    :name => "Element 84",
    :url => "http://www.element84.com"
  },
  "Sinatra" => {
    :name => "Sinatra REST Framework",
    :url => "http://www.sinatrarb.com"
  },
  "Reverb" => {
    :name => "NASA ECHO Reverb",
    :url => "http://reverb.echo.nasa.gov/"
  },
  "EROS" => {
    :name => "EROS Data Center",
    :url => "https://eros.usgs.gov"
  }, 
  "Marvel" => {
    :name => "Marvel Comics",
    :url => "http://marvel.com"
  },
  "TaekwonDo" => {
    :name => "ITF TaeKwon-Do",
    :url => "http://www.itftkd.org"
  },
  "DiveIntoHTML5" => {
    :name => "Dive Into HTML 5 Informational Site",
    :url => "http://diveintohtml5.info"
  },
  "PennyArcade" => {
    :name => "Penny Arcade",
    :url => "http://www.penny-arcade.com"
  }
}

get '/' do
  "Welcome to Whad-R-U-Lookin\'-At. All our datas is for you."
end

get '/sites' do
  json :sites => sites
end

get '/site/:site_key' do |site_key|
  "Top-level statistics for #{sites[site_key][:name]}"
end

get '/site/:site_key/name' do |site_key|
  "#{sites[site_key][:name]}"
end

get '/site/:site_key/url' do |site_key|
  "#{sites[site_key][:url]}"
end

get '/site/:site_key/visitors' do |site_key|
  numIps = 25 + rand(500) + rand(500)
  visitors = numIps.times.map { [Array.new(4){rand(256)}.join('.'), 1 + rand(100)] }
  "#{visitors}"
end

get '/site/:site_key/urls' do |site_key|
  "#{links sites[site_key][:url]}"
end

get '/site/:site_key/visits' do |site_key|
  site_links = links sites[site_key][:url]
  "#{ site_links.keys.map { |url| [ "#{url}", rand(100) ]} }"
end

def links(url)
  doc = Nokogiri::HTML(open("#{url}"))
  Hash[
    *doc.search('a').map { |a| 
        [
          a['href'],
          a.content
        ]
      }.flatten
    ]
end