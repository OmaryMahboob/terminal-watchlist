class Router
  def initialize(movies_controller)
    @movies_controller = movies_controller
    # @watchlist_controller = watchlist_controller
    @running = true
  end

  def run
    while @running
      initial_route_action
    end
    print `clear`
  end

  private

  # Initial navigation menu
  def initial_route_action
    print_initial_navigation_menu
    choice = gets.chomp.to_i
    print `clear`
    initial_navigation_action(choice)
  end

  def print_initial_navigation_menu
    puts "--------------------"
    puts "------- Menu -------"
    puts "--------------------"
    # puts "1. Watchlists Menu"
    puts "2. Movies Menu"
    puts "3. Exit"
    print "> "
  end

  def initial_navigation_action(choice)
    case choice
    # when 1 then watchlist_menu
    when 2 then movies_menu
    when 3 then stop!
    else puts "Please put a number between 1 and 3"
    end
  end

  # Watchlsit
  def watchlist_menu
    print_watchlist_navigation_menu
    choice = gets.chomp.to_i
    print `clear`
    user_watchlist_action(choice)
  end

  def print_watchlist_navigation_menu
    puts "--------------------"
    puts "------- Wathclist Menu -------"
    puts "--------------------"
    puts "1. List Watchlists"
    puts "2. Create Watchlist"
    puts "3. Add to existing Watchlist"
    # puts "4. Update Watchlist"
    # puts "5. Delete Watchlist"
    puts "6. Back to main menu"
    puts "7. Exit"
    print "> "
  end

  def user_watchlist_action(choice)
    case choice
    when 1 then @watchlist_controller.list
    when 2 then @watchlist_controller.create
    when 3 then @watchlist_controller.add_movie
    when 4 then @watchlist_controller.update
    when 5 then @watchlist_controller.delete
    when 6 then initial_route_action
    when 7 then stop!
    else puts "Please put a number between 1 and 7"
    end
  end

  # Movies
  def movies_menu
    print_movie_navigation_menu
    choice = gets.chomp.to_i
    print `clear`
    user_movie_action(choice)
  end

  def print_movie_navigation_menu
    puts "--------------------"
    puts "------- Movie Menu -------"
    puts "--------------------"
    puts "1. List Movies"
    puts "2. Create Movie"
    puts "3. Import movie from web"
    # puts "4. Delete Movie"
    puts "5. Back to main menu"
    puts "6. Exit"
    print "> "
  end

  def user_movie_action(choice)
    case choice
    when 1 then @movies_controller.list
    when 2 then @movies_controller.add
    when 3 then @movies_controller.import
    when 4 then @movies_controller.delete
    when 5 then initial_route_action
    when 6 then stop!
    else puts "Please put a number between 1 and 6"
    end
  end

  def stop!
    @running = false
  end
end
