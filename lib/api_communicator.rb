require 'rest-client'
require 'json'
require 'pry'
require 'pp'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)


        film_url_responses = []
          response_hash["results"].each do |n|
            if n["name"] == character_name
              n["films"].each do |film_url|
                url_response = RestClient.get(film_url)
                film_url_responses << JSON.parse(url_response)
            end
        end
      end



  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
  film_url_responses
    end

    def print_movies(films)
      nice_film_list = []
    films.each do |film|
      nice_film_list << film["title"]
    end
    nice_film_list

      # some iteration magic and puts out the movies in a nice list
    end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  p print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?


