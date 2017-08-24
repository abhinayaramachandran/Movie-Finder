####    Movie Finder ####

# Launch this file from the command line to start 


APP_ROOT = File.dirname(__FILE__)

$: .unshift( File.join( APP_ROOT,'lib ') )
require 'guide'

guide = Guide.new('movies.txt')
guide.launch!