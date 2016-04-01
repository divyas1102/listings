# listings
A rails app that processes property listing information from an xml feed.

#####Requirements:#####
1. Rails App
2. XML processor to parse given xml feed
3. Entities: Listings, Photos, Landlords
4. Landlords - have contact information (phone - formatted to 10-digit int, email)
5. Landord to Listings (one to many)
6. Each listing has to have atleast 3 photos. Discard listing if it has less than 3 photos
7. running the feed multiple times should update the existing listing (same listing = same source url and/or address)

#####Nice to have:#####
1. user page to view listings
2. user page to upload an xml file with listing information
3. user page to edit existing listing information (based on specific user type)

#####Assumptions made:#####
1. address is called a duplicate if latitude and longitude are the same
2. if a listing has less than 3 photos, the listing is NOT saved in the database
3. xml file is valid and has all required elements
4. zipcode is valid and only US based (can be made a string to support other countries)
5. landlord = agent

#####Possible alterations:#####
1. phone number can be stored as an integer (to add additional validation to the expected format), but the preferred practice is to use string types, since no mathematical actions will be performed on it.

2. email and phone numbers could be in a different table (landord_details) by itself to allow multiple emails and phone numbers to be stored for each landlord.

####Future Updates####
1. UI to upload new xml file with list of properties

2. user profiles for logging in as viewer, landlord and admin

3. UI to allow editing and updating information for landlords and admins

#####Steps to install locally#####
1. Clone repo
2. set up DB
  - rake db:create db:migrate db:seed db:test:prepare
3. start up the rails server
4. localhost:3000 should take you to the main listings page

##### Database #####
![database diagram](https://github.com/divyas1102/listings/blob/master/listings_web/resources/database_diagram.jpg)

##### screenshots of ui #####
![listings](https://github.com/divyas1102/listings/blob/master/listings_web/resources/listings.jpg)

![address](https://github.com/divyas1102/listings/blob/master/listings_web/resources/address_list.jpg)
