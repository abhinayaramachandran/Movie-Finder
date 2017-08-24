require 'movie'

# Controller class 
class Guide
	@@commands = ['list', 'add', 'search', 'quit']


	def initialize (filepath = null)
		Movie.filepath = filepath
		if Movie.file_exists?
			puts "Movies File Found"
		elsif Movie.create_if_absent
			puts "Created file"
		else
			exit!
		end
	end

	# Starts the application
	def launch!
		greeting
		result = nil
		until result == :quit do 
			print '>>'
			user_input = gets.chomp.downcase.strip.split(' ')
			result = respond_to_request(user_input)
		end
		goodbye
	end


	def respond_to_request(user_input)
		case user_input[0]
		when 'list'
			list_movies
		when 'search'
			search_movies(user_input[1])
		when 'add'
			add_movie
		when 'quit'
			return :quit
		else
			puts "Actions available are  "
			for c in @@commands 
				puts "--> " + c
			end
		end
	end

	def greeting
		puts  "\n\n <<<< Welcome to the Movie Finder >>>>"
		puts "<<<< This is an interactive application that helps you find a movie to binge on !!!  >>>>\n\n"
		puts "<<<< Commands : add, list, search, quit movies >>>>"
	end

	def goodbye
		puts "\n\n <<<< Goodbye , Enjoy your movie !!! >>>>\n\n"
	end


	def add_movie
		puts "Adding a Movie:"

		m = Movie.add_from_user

		if m.save_movie
			puts "Saved successfully."
		else
			puts "Something went wrong. Movie not saved."
		end
	end

	def list_movies
		puts "List of movies available:".upcase
		movies = Movie.list_all_movies
		print_movies(movies)
	end

	# Based on the search keyword given, all the four fields are checked .
	def search_movies(keyword = "")
		if keyword
			movies = Movie.list_all_movies
			found = movies.select do |m| 
				m.name.downcase.include?(keyword.downcase) || 
				m.genre.downcase.include?(keyword.downcase) ||
				m.year.to_s == keyword.to_s || 
				(check_float(keyword) &&  keyword.to_f <= 10 && m.imdb.to_f >= keyword.to_f)
			end
			puts "Search results:".upcase
			print_movies(found)
		else
			puts "Please provide a keyword"
			puts "For example : search Godfather, search 1994 , search 9.2"
		end

	end

	# Helper methood for search_movies method 
	# returns true if string can be converted to float
	def check_float(string)
		return true if Float(string) rescue false 
	end



	# Prints the list of movies after reverse sorting them according to IMDb
	def print_movies(movies)
		movies.sort!{ |v1, v2| v2.imdb.to_f <=> v1.imdb.to_f}
		puts 'Name '.ljust(33)   + 'Genre '.ljust(40) + 'Year'.ljust(16) + 'IMDb'.ljust(4) 
		puts "-"*93
		for m in movies
			puts "#{m.name.ljust(30)} \t #{m.genre.ljust(30)} \t #{m.year.ljust(6)} \t #{m.imdb.ljust(4)}"
		end
		puts "-"*93
	end

end