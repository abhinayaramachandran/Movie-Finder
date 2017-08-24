class Movie

	# File that contains the movies
	@@filepath = nil
	attr_accessor :name, :imdb, :genre, :year

	def self.filepath=(file = nil)
		@@filepath = File.join(APP_ROOT, file)
	end


	# Check if the input file exists
	def self.file_exists?
		if @@filepath && File.exist?(@@filepath)
			return true
		else
			return false
		end
	end


	# Check if we can read from and write to the input file
	def self.file_usable?
		return false unless @@filepath
		return false unless File.exist?(@@filepath)
		return false unless File.readable?(@@filepath)
		return false unless File.writable?(@@filepath)
		return true
	end

	#Create a new file if it does not exist
	def self.create_if_absent
		File.open(@@filepath,'w') unless file_exists?
		return file_usable?
	end

	# All the movies in the file are fetched and 
	# populated into objects, an array of which is returned
	def self.list_all_movies
		if file_usable?
			movies = []
			File.open(@@filepath, 'r') do |file|
				file.each_line{ |line| movies << Movie.new.populate(line.chomp) }
			end
			return movies
		end
	end

	# Gets user input and creates a new movie object 
	def self.add_from_user
		attr = {}

		print "Movie name : "
		attr[0] = gets.chomp.strip

		print "\nMovie genre : "
		attr[1] = gets.chomp.strip

		print "\nMovie year : "
		attr[2] = gets.chomp.strip

		print "\nMovie IMDb ratings : "
		attr[3] = gets.chomp.strip

		m = Movie.new(attr)
		return m
	end

	# Initializes the movie object with nil or given value
	def initialize (attr={})
		@name = attr[0] || ""
		@genre = attr[1] || ""
		@year = attr[2] || ""
		@imdb = attr[3] || ""
	end

	# Movies are stored into a file as tab seperated values
	def save_movie 
		return false unless Movie.file_usable?
		File.open(@@filepath,'a') do |file|
			file.puts "#{[@name,@genre,@year, @imdb].join("\t")}"
		end
		return true
	end

	# Repopulates the movie object based on the input provided
	def populate(line)
		@name , @genre, @year, @imdb = line.split("\t")
		return self
	end


end
