require 'rubygems'
require 'sinatra'
require 'nokogiri'
require 'open-uri'
require 'sanitize'
require 'json'
# require 'haml'
# require 'builder'

get '/' do
	"welcome to hymnal.net (unofficial) API"
    
    # HAML ? documentation page
    
end

# classic hymns
get '/hymn/:id' do

    content_type :json
    
    # {id} must be an int between 1-1348
    unless :id < 1 or :id > 1348
        hymnURL = "http://hymnal.net/hymn.php/h/#:id"
        page = Nokogiri::HTML(open(hymnURL))
        # this will be exported to JSON
        hymn = Hash.new
        
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
        # external site redirect - scrape witness-lee-hymns.org
        if page.css("div.lyrics p[class=info]").text == "View Lyrics (external site)"

        end
        
        # scrape hymnal.net
        # cases:
        #   - 1 stanza only
        #   - numbered stanza
        #   - numbered stanza w/ chorus
        #   - numbered stanza w/ variable choruses
        for 



        # build JSON
        hymn['details'] = details
        hymn['lyrics'] = lyrics
        hymn.to_json
        
    else
        # throw error in JSON
    end

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

