# README

You have one day to complete this task. You will use a web application framework to achieve this task.

You need to create an application where a user can update any map and see information regarding markers which he has added onto these maps.

The application will allows users to sign up and login using name and a password. You should be able to create new users.

Once signed in each user will have access a main view, the view will have the following functionality

1. Ability to look at existing maps if he has any
2. Ability to add new maps
3. Ability to delete the map or edit the map (i.e. change it's lat long extends)

## Adding new maps
To create a map, the user will simply have to enter the bounds of the map i.e. the map will have upper right latitude, upper right longitude, lower left latitude, lower left longitude (extents of the map, you can change this to UL and LR if you wish to, just stay consistent)

If the user clicks on a map, he will be taken to a view which has the following functionality:
1. View the map
2. View markers on the map if any
3. Hover over marker on map to see information
4. Add marker on map by clicking on the map

To add information on the map:
1. User can click within the map to add a marker to the map.
2. Along with the marker user can add additional information regarding the marker (Name, Description and No of residents)

## Bonus
Allow the user to have an extra ability
1. Show a list of markers where we can sort the markers based on Name, Description or No of residents and Map id. We should also have an ability to show all markers and markers from only a particular map

## We recommend you use Mapbox to achieve map related stuff
Useful links:
Hover on popup: https://www.mapbox.com/mapbox-gl-js/example/popup-on-hover/
Create map using bounds: https://www.mapbox.com/mapbox-gl-js/example/fitbounds/
Onclick example: https://www.mapbox.com/mapbox-gl-js/example/polygon-popup-on-click/

## What we are testing you
Ability to go through external API (even if it is pretty bad)
MVC structure
Spec testing
Documentation, if required
How you structure your AJAX/JS to talk with the back end

Do send us a git link with your commits once done.
Make sure you commit your thought process. We look through commits. 