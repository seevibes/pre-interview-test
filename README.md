# Seevibes Pre-Interview Test

![Seevibes Logo](http://www.seevibes.com/assets/corpo/logo-small.png) 

Welcome to Seevibes! Thank you for thinking about our company.

Before we do an interview, we want to see a bit of code, and see how you work. This repository has the basic information you need to complete the task.

Please use any programming language, one your are comfortable with. We are Linux-centric, but you may submit a Windows program if that is easier for you.


## Installation

  All gems used ship with Ruby; no need to install anything.
  
  From the command line, `cd ` into to repository's root directory. 
  
  Ensure that `seevibes.rb:1` points correctly to your Ruby interpreter, and that the file is executable:
  
  	`chmod u+x seevibes.rb`
  	
  Search for movies by partial name, as shown in the sample session.
  
  The first result from IMDB's API will be displayed.
  

## Sample Session

    $./seevibes.rb batman
    Title: Batman
    Year: 1989

    $./seevibes.rb avengers
    Title: The Avengers
    Year: 2012

    $./seevibes.rb days of wine
    Title: Days of Wine and Roses
    Year: 1962

    $./seevibes.rb guess who
    Title: Guess Who's Coming to Dinner
    Year: 1967

    $ ./seevibes.rb harry met sal
    Title: When Harry Met Sally...
    Year: 1989
