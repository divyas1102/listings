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
1. address = street, city, state and zipcode
2. if a listing has less than 3 photos, the listing is NOT saved in the database
3. xml file is valid
