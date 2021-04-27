# FetchRewards_Project

This application was a coding exercise given to me from FetchRewards. The exercise was given as an exercise to test iOS application skills using APIs and UIKit. 

As stated in the description of the coding exercise, clients were to be able to use the application and browse through events that have been provided by the SeatGeek API. 
Shown in a UITableView, these events were able to be queried and favorited by the user. These events were shown with their titles, venue names, venue address, and event time. 
These details allow the user to effortlessly use the application and to keep it user friendly by allowing them to keep the events they would like to attend.

# How to Run

1. Clone the repo and open file 'FetchRewards_Project.xcworkspace' on XCode.
2. Build and run the application on a simulation of iPhone 11.
3. Once downloaded and installed on the simulation, browse through events.

# Errors

Although the application works fine, there was an error that keep showing in the console output: 'nw_protocol_get_quic_image_block_invoke dlopen libquic failed'.
This error tended to show up when fetching images from the API (and occassionally when fetching events themselves).
This hindered the application from fetching from the API and displaying on the UITableView. 

I eventually removed the fetching of images and replaced UIImageView with a ticket, to showcase events on the view. 
Unfortunately, the error persists but the events are fetched correctly from SeatGeekAPI. 
