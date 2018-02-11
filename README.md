# anemone-nematocyst-search

https://anemone-nematocyst-search.herokuapp.com/


- What approaches you decided to try

Our Group tackled the 'Search' solution for Luciana Gusmao’s Stinger Inspector challange. The  other three projects were solving for variation of applying methods of finding, isolating and measuring the nematocyst organelle and capsules. Our aim was to create a single interface for the stakeholders to pull up their required information from a data base that would include files from as many teams solutions as fit the database structure.



- What technologies you applied to the problem


The Database:
Using python scripts we isolated data by parse the folders and XML data of the supplied tiff files. Columns were created with intent of creating ID’s for each file. All through the project we communicated with various teams to discuss common nomenclature. The last task was to collect images from the various groups working toward image processing solutions.

The interface:
The greatest differentiators of the specimen are organized by width and length of the organelle and capsule.  Our team created a Ruby on rails app with an HTMl/jQuery interface consisting of  four sliders. The sliders present the user with minimum and maximum values for width and height of both the cell and capsule.  Once selected the user can click the search button the parameters of organelles are isolated. A query brings up a list of visual thumbnails on the righthand side for further analysis and selection.



- What worked and what didn't work

Questions arose how to parse the data for the database and how to pull the data in the app.  Thoughts were discussed about hashing all of the ID’s to create unique identifiers for each file and then later deduplicating if needed.



- What other paths future work on this project could take

The data base and search can increase in feature which would add to the columns and associated sliders. These features that go beyond width and height could include curvatures, roundness of cells and number of barbs in the harpoon.


## How to set up for local development
1. install https://postgresapp.com/
2. install ruby 2.4.0 https://www.ruby-lang.org/en/documentation/installation/
3. install bundler http://bundler.io/
4. clone this repo `git clone git@github.com:HackTheDeep/anemone-nematocyst-search.git`
5. install dependencies `bundle install`
6. create database `rake db:create`
7. migrate that database `rake db:migrate`
8. then seed that database `rake db:seed`

Keep in mind, adding new images to the csv requires the imagemagick transform to be applied.  This will bring in those tif images as jpg thumbnails
