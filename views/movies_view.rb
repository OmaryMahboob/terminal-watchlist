class MoviesView
  def ask_for(something)
    puts something
    print "> "
    gets.chomp
  end

  def display(movies)
    movies.each_with_index do |movie, i|
      puts "#{movie.id ? movie.id : i + 1}. #{movie.name} (#{movie.year}) [rating: #{movie.rating}]"
    end
  end
end
