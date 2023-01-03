require_relative '../models/movie'
require_relative '../views/movies_view'
require_relative '../api/movies_api'

class MoviesController
  def initialize(movie_repository)
    @movie_repository = movie_repository
    @movie_view = MoviesView.new
    @movies_api = MoviesApi.new
  end

  def add
    #ask user for name of the movie and save it in @name variable
    name = @movie_view.ask_for("What is the name of the movie?")
    #ask user for descrition and save it in @description variable
    description = @movie_view.ask_for("What is the movie about?")
    #ask user for rating and save it in @rating variable .to_i
    rating = @movie_view.ask_for("How would you rate the movie out of 10?").to_f
    #ask user for year and save it in @year variable .to_i
    year = @movie_view.ask_for("What is the year that the movie was released?")
    #create a new movie variable with the above values
    movie = Movie.new({
      name: name,
      description: description,
      rating: rating,
      year: year
    })
    #add this new movie to the movie repository
    @movie_repository.create(movie)
    #display movies
    display_movies
  end

  def import
    # Get the name of a film to search the API save to variable called query
    query = @movies_view.ask_user_for("What is the name of the movie?")
    # query the api and capture the response.
    results = @movies_api.query(query)
    # display the response to the user.
    @movies_view.display(results)
    # Give the user a message about selecting the data.
    finish = false
    puts "Please select a movie you would like to save?"
    puts "Once you have selected all of the movies you would like to save, type exit"
    # use an until loop to allow the user to select multiple movies.
    until finish
      print "> "
      selection = gets.chomp
      finish = true if selection == "exit"

      film = results[selection.to_i - 1]
      @movie_repository.create(film)

      puts "You have saved: #{film.name}"
      puts "Please select another film to save or 'exit'"
    end
  end

  def list
    display_movies
  end

  private

  def display_movies
    movies = @movie_repository.all
    @movies_view.display(movies)
  end
end
