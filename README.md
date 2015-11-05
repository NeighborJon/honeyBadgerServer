# honeyBadgerServer
-Requests to code for

-Map/Home Page
  1.Send all event information for the events where the X & Y coordinates are within the coords sent in the request
  
-Profile Page
  1. Send all data on a single profile, whether it is the actual user, or someone that they are browsing, search by user_ID
  2. Send all messages that the reciever ID is matched with the actual user. Only send if actual user is browsing their own profile
  3. Send all messages that the sender ID matches the actual user. Same situation as #2

-Events
  1. Send all events, specifically send the :id, :title, :datetime, :description

-View Event
  1. Send all event information that matches the :id of the event being viewed

