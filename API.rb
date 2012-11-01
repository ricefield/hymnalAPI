require 'rubygems'
require 'sinatra'
require 'nokogiri'
require 'sanitize'
require 'jbuilder'
# require 'haml'
# require 'builder'

get '/' do
	"welcome to hymnal.net (unofficial) API"
    
    # HAML ? documentation page
    
end

# classic hymns
get '/hymn/:id' do
    
    # {id} must be an int between 1-1348
    unless :id < 1 or :id > 1348
        hymnURL = "http://hymnal.net/hymn.php/h/#:id"
        page = Nokogiri::HTML(open(hymnURL))
        
        # extract hymn details
        # i.e. category, meter, composer, etc.
        details = Hash.new
        for element in page.css("ul#category") do
            case(element.css("strong").text)
                # when "Lead Sheets:"
                when "Category:"
                    details['category'] = element.css("a").text
                when "Subcategory:"
                    details['subcategory'] = element.css("a").text
                when "Music:"
                    details['composer'] = element.css("a").text
                when "Lyrics:"
                    details['author'] = element.css("a").text
                when "Time:"
                    details['time'] = element.css("a").text
                when "Key:"
                    details['key'] = element.css("a").text
                when "Meter:"
                    details['meter'] = element.css("a").text
                when "Reference:"
                    details['verse'] = element.css("a").text
            end
        end
        
        # extract lyrics
        lyrics = Hash.new
        i = 1
        page.css("div#lyrics")

        
        # build JSON
        
    else
        # throw error in JSON


end

# only for new songs
# shouldn't expect this too much as new song "ids" are arbitrary
get '/hymn/ns/:id' do
    
end

# search results
get '/search/:string' do

end

###################
###   DETAILS   ###
###################

# category or sub-category
get 'category/:category' do
    
end

# sort hymns by key
get '/key/:key' do

end

# composer
get '/composer/:composer' do

end

# author
get 'author/:author' do

end

# meter
get 'author/:meter' do
    
end

# scripture reference
get 'verse/:referece' do
    
end

