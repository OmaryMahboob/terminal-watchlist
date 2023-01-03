require_relative 'repositories/movie_repository'
# require_relative 'repositories/watchlist_repository'
require_relative 'controllers/movies_controller'
# require_relative 'controllers/watchlists_controller'
require_relative "router"
require 'pry-byebug'

MOVIES_JSON = File.join(__dir__, "data/movies.json")
WATCHLIST_JSON = File.join(__dir__, "data/watchlist.json")

movie_repository = MovieRepository.new(MOVIES_JSON)
movies_controller = MoviesController.new(movie_repository)

# watchlist_repository = WatchlistRepository.new(WATCHLIST_JSON)
# watchlist_controller = WatchlistsController.new(watchlist_repository)

router = Router.new(movies_controller)

router.run
