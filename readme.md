********************************************************************************************************
A simple movie finder application in ruby
********************************************************************************************************
An interactive application that takes commands from the user 
and performs respective actions

Commands:
	- list : lists all the movies.
	
	- add : adds a new movie to the list.
	
	- search : searches by a keyword, the user can pass a part of the movie name, genre, IMDb or year as the argument.
	
	- quit : exits the application.
	
Sample Input and Ouput:

~~~
> ruby init.rb

 <<<< Welcome to the Movie Finder >>>>
<<<< This is an interactive application that helps you find a movie to binge on !!!  >>>>

<<<< Commands : add, list, search, quit movies >>>>
>>add
Adding a Movie:
Movie name : La La Land

Movie genre : Comedy, Drama, Music

Movie year : 2016

Movie IMDb ratings : 8.2
Saved successfully.
>>list
LIST OF MOVIES AVAILABLE:
Name                             Genre                                   Year            IMDb
---------------------------------------------------------------------------------------------
The Godfather                    Crime, Drama                            1972            9.2
The Shawshank Redemption         Crime, Drama                            1994            9.2
The Dark Knight                  Action,Crime, Drama                     2008            9.0
The Godfather :Part 2            Crime, drama                            1974            9.0
Inception                        Sci-Fi                                  2010            8.8
Interstellar                     Sci-fi                                  2014            8.5
Wall-e                           Sci-fi                                  2008            8.4
Die Hard                         Action                                  1988            8.2
La La Land                       Comedy, Drama, Music                    2016            8.2
---------------------------------------------------------------------------------------------
>>search sci-fi
SEARCH RESULTS:
Name                             Genre                                   Year            IMDb
---------------------------------------------------------------------------------------------
Inception                        Sci-Fi                                  2010            8.8
Interstellar                     Sci-fi                                  2014            8.5
Wall-e                           Sci-fi                                  2008            8.4
---------------------------------------------------------------------------------------------
>>search 9
SEARCH RESULTS:
Name                             Genre                                   Year            IMDb
---------------------------------------------------------------------------------------------
The Godfather                    Crime, Drama                            1972            9.2
The Shawshank Redemption         Crime, Drama                            1994            9.2
The Dark Knight                  Action,Crime, Drama                     2008            9.0
The Godfather :Part 2            Crime, drama                            1974            9.0
---------------------------------------------------------------------------------------------
>>search 2010
SEARCH RESULTS:
Name                             Genre                                   Year            IMDb
---------------------------------------------------------------------------------------------
Inception                        Sci-Fi                                  2010            8.8
---------------------------------------------------------------------------------------------
>>search drama
SEARCH RESULTS:
Name                             Genre                                   Year            IMDb
---------------------------------------------------------------------------------------------
The Godfather                    Crime, Drama                            1972            9.2
The Shawshank Redemption         Crime, Drama                            1994            9.2
The Godfather :Part 2            Crime, drama                            1974            9.0
The Dark Knight                  Action,Crime, Drama                     2008            9.0
La La Land                       Comedy, Drama, Music                    2016            8.2
---------------------------------------------------------------------------------------------
~~~
