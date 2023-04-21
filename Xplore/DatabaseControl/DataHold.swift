import Foundation

class DataHold{
    static let userDetails : [UserDetail] = getUserDetail()
    static let travelPlaceDetails : [TravelPlaceDetail] = getTravelPlaceDetails()
    
    static let currencyPreference : [(String,String)] = getCurrencyPreference()
    static let bookedTrips = getBookedTrips()
    
    static let currencyList = getCurrencyDetail()
    
    static private func getBookedTrips() -> [BookedTrip]{
        var bookedTrips : [BookedTrip] = []
        
        let fromDate = DateComponents(calendar: .current,timeZone: .current,era: 1,year: 2023,month: 4, day: 12)
        let toDate = DateComponents(calendar: .current,timeZone: .current,era: 1,year: 2023,month: 5, day: 10)
        
        bookedTrips.append(
            BookedTrip(
                userId: "UD1102",
                placeId: "PD1101",
                BookedDateFrom: fromDate,
                BookedDateTo: toDate,
                pricePerDay: 14500,
                taxPercentage: 12.5,
                currencyCode: "INR",
                isVisited: true,
                numberOfGuests: 5,
                cleaningFee: 550,
                serviceFee: 1000,
                reservationId: "ABCDEFGHIJ"
            )
        )
        
        bookedTrips.append(
            BookedTrip(
                userId: "UD1102",
                placeId: "PD1102",
                BookedDateFrom: fromDate,
                BookedDateTo: toDate,
                pricePerDay: 14500,
                taxPercentage: 12.5,
                currencyCode: "INR",
                isVisited: false,
                numberOfGuests: 5,
                cleaningFee: 550,
                serviceFee: 1000,
                reservationId: "JIHGFEDCBA"
            )
        )
        
        return bookedTrips
    }
    
    static private func getUserDetail() -> [UserDetail]{
        var userDetails : [UserDetail] = []
        
        userDetails.append(
            UserDetail(
                userId: "UD1101",
                userName: "Johny",
                email: "john@gmail.com",
                mobile: "+91987654321",
                password: "123"
            )
        )
        
        userDetails.append(
            UserDetail(
                userId: "UD1102",
                userName: "Yogi",
                email: "yogi@gmail.com",
                mobile: "+91987654332",
                password: "123"
            )
        )
        
        userDetails.append(
            UserDetail(
                userId: "UD1103",
                userName: "Avi",
                email: "avi@gmail.com",
                mobile: "+91987654323",
                password: "123"
            )
        )
        
        userDetails.append(
            UserDetail(
                userId: "UD1104",
                userName: "DD",
                email: "dd@gmail.com",
                mobile: "+91987654324",
                password: "123"
            )
        )
        
        
        userDetails.append(
            UserDetail(
                userId: "UD1105",
                userName: "Surya",
                email: "surya@gmail.com",
                mobile: "+91987654325",
                password: "123"
            )
        )
        
        userDetails.append(
            UserDetail(
                userId: "UD1106",
                userName: "Arnab Shandy",
                email: "arnab.s@gmail.com",
                mobile: "+91987654326",
                password: "123"
            )
        )
        
        return userDetails
    }
    
    static private func getTravelPlaceDetails() -> [TravelPlaceDetail]{
        var travelPlaceDetails : [TravelPlaceDetail] = []
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1101",
                placeName: "The Taj Restraunt with Sea View",
                description: "This upscale contemporary Japanese dining room in a hotel serves classics, sushi and rare sakes.",
                hostId: "UD1103",
                noOfRooms: 10,
                noOfBedRooms: 3,
                noOfBathRooms: 2,
                noOfBeds: 4,
                noOfPeopleAccomodate: 12,
                isAvailable: true,
                price: Price(pricePerDay: 20000, taxPercentage: 12.0, currencyCode: "INR"),
                reviewDetail: [
                    Review(userID: "UD1103", userName: "Varani", review: "Nice Place Must Visit."),
                    Review(userID: "UD1104", userName: "Mageshesh", review: "We had a wonderful time at this place. The host was very friendly and accommodating, and the space was beautiful and well-maintained. The views from the balcony were breathtaking, and we enjoyed relaxing in the hot tub after a long day of exploring. Highly recommend!"),
                    Review(userID: "UD1105", userName: "Arvind", review: "We had a fantastic stay at this place. The host was extremely helpful and responsive, and the space itself was beautiful and immaculately clean. We appreciated all the little touches that made it feel like home, such as the fully-stocked kitchen and comfortable bedding. Highly recommend to anyone visiting the area!"),
                    Review(userID: "UD1106", userName: "Aniram", review: "The place was amazing! It was clean, cozy, and had everything we needed for a comfortable stay. The location was perfect too, with lots of great restaurants and shops within walking distance. We can't wait to come back!"),
                    Review(userID: "UD1105", userName: "Pranb Goyal", review: "We had a bit of a rocky start when we arrived, as the place wasn't quite ready for us. However, the host was very apologetic and quickly resolved the issue. Once we settled in, we found the place to be very comfortable and well-appointed. The location was great, with easy access to public transportation and lots of nearby attractions. Overall, a good experience."),
                    Review(userID: "UD1104", userName: "Mary Ulu", review: "I would definitely recommend this place to anyone looking for a stylish and comfortable stay in the city."),
                    Review(userID: "UD1103", userName: "Watson Peter", review: "I had a wonderful stay at this place - the views were stunning and the amenities were top-notch.")
                ],
                ratingDetail: [Rating(userID: "1102", rating: 5.0)],
                amenities: [Amenity.Air_Conditioning,
                            Amenity.CarbonMonoxide_Alarm,
                            Amenity.First_Aid_Kit,
                            Amenity.Fire_Extinguisher,
                            Amenity.Pool,
                            Amenity.Free_Parking,
                            Amenity.Pets_Allowed,
                            Amenity.Smoke_Alarm
                           ],
                location: Location(city: "Chennai", state: "TN", country: "India", address: "23/24 big map street"),
                images: [
                    "https://cdn.pixabay.com/photo/2013/10/12/18/05/villa-194671__480.jpg",
                    "https://cdn.pixabay.com/photo/2017/03/30/00/24/villa-2186906__480.jpg",
                   
                    "https://cdn.pixabay.com/photo/2016/04/15/11/45/hotel-1330841__480.jpg",
                    
                    "https://cdn.pixabay.com/photo/2019/10/17/02/39/villa-4555818__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/03/05/09/51/home-1237469__480.jpg",
                    "https://cdn.pixabay.com/photo/2017/04/18/12/57/residence-2238987__480.jpg",
                    "https://cdn.pixabay.com/photo/2020/04/17/12/28/pool-5055009_1280.jpg",
                ],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1102",
                placeName: "The Hotel Madeer Restraunt The New Exp",
                description: "This upscale contemporary Japanese dining room in a hotel serves classics, sushi and rare sakes.",
                hostId: "UD1103",
                noOfRooms: 10,
                noOfBedRooms: 3,
                noOfBathRooms: 2,
                noOfBeds: 4,
                noOfPeopleAccomodate: 12,
                isAvailable: true,
                price: Price(pricePerDay: 20000, taxPercentage: 12.0, currencyCode: "USD"),
                reviewDetail: [Review(userID: "UD1102", userName: "Yogi", review: "Nice Place Must Visit.")],
                ratingDetail : [Rating(userID: "1102", rating: 5.0)],
                amenities: [Amenity.Air_Conditioning,Amenity.CarbonMonoxide_Alarm,Amenity.First_Aid_Kit],
                location: Location(city: "Chennai", state: "Kerala", country: "India", address: "475, Raily watson street, Vadakalaur"),
                images: [
                    "https://cdn.pixabay.com/photo/2014/08/11/21/40/bedroom-416062__480.jpg",
                    "https://cdn.pixabay.com/photo/2015/01/15/10/55/villa-600176__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/09/18/03/28/travel-1677347__480.jpg",
                    "https://cdn.pixabay.com/photo/2020/03/21/20/03/real-estate-4955087__480.jpg",
                    "https://cdn.pixabay.com/photo/2020/03/21/20/03/real-estate-4955086__480.jpg",
                   
                    "https://cdn.pixabay.com/photo/2017/01/07/17/48/interior-1961070__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/08/26/15/06/home-1622401__480.jpg",
                   
                ],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1103",
                placeName: "Taj Falaknuma Palace, Hyderabad",
                description: "Undoubtedly, Taj Falaknuma Palace makes its place among the most noted 7-star hotels in India and abroad with its world-class appeal, facilities, service and so on.",
                hostId: "UD1103",
                noOfRooms: 10,
                noOfBedRooms: 3,
                noOfBathRooms: 2,
                noOfBeds: 4,
                noOfPeopleAccomodate: 12,
                isAvailable: true,
                price: Price(pricePerDay: 20000, taxPercentage: 12.0, currencyCode: "INR"),
                reviewDetail: [
                    Review(userID: "UD1108", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1103", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1104", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1102", userName: "Yogi", review: "Nice Place Must Visit.I wouldn’t recommend hosting this guest. The guest broke the locks of the off-limit storage area of the house, which was explicitly stated in the welcome book that the storage room was not for guest use.Guests disrespected our Airbnb rules by throwing a house party and having five additional visitors stay in the Airbnb. When we issued an additional cleaning fee for the mess, the guest left a one-star review. Do not host this guest."),
                    Review(userID: "UD1105", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1106", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1107", userName: "Yogi", review: "Nice Place Must Visit.")
                ],
                ratingDetail: [Rating(userID: "1102", rating: 5.0)],
                amenities: [Amenity.Air_Conditioning,
                            Amenity.CarbonMonoxide_Alarm,
                            Amenity.First_Aid_Kit,
                            Amenity.Fire_Extinguisher,
                            Amenity.Pool,
                            Amenity.Free_Parking,
                            Amenity.Pets_Allowed,
                            Amenity.Smoke_Alarm
                           ],
                location: Location(city: "Chennai", state: "TN", country: "India", address: "23/24 big map street"),
                images: [
                    "https://cdn.pixabay.com/photo/2014/07/21/19/20/lobby-398845__480.jpg",
                    "https://cdn.pixabay.com/photo/2017/11/24/21/49/bali-2975787__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/03/28/09/34/bedroom-1285156__480.jpg",
                    "https://cdn.pixabay.com/photo/2012/11/21/10/24/building-66789__480.jpg",
                    
                    "https://cdn.pixabay.com/photo/2016/04/15/11/45/hotel-1330841__480.jpg",
                   
                ],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1104",
                placeName: "Taj Holiday Village Resort & Spa",
                description: "At this 28-acre resort, charming, well-equipped beachfront cottages with terra-cotta roofs overlook the Arabian Sea. A tranquil spa, multiple restaurants, and a golf course round out the on-site offerings. ",
                hostId: "UD1103",
                noOfRooms: 10,
                noOfBedRooms: 3,
                noOfBathRooms: 2,
                noOfBeds: 4,
                noOfPeopleAccomodate: 12,
                isAvailable: true,
                price: Price(pricePerDay: 20000, taxPercentage: 12.0, currencyCode: "INR"),
                reviewDetail: [
                    Review(userID: "UD1108", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1103", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1104", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1102", userName: "Yogi", review: "Nice Place Must Visit.I wouldn’t recommend hosting this guest. The guest broke the locks of the off-limit storage area of the house, which was explicitly stated in the welcome book that the storage room was not for guest use.Guests disrespected our Airbnb rules by throwing a house party and having five additional visitors stay in the Airbnb. When we issued an additional cleaning fee for the mess, the guest left a one-star review. Do not host this guest."),
                    Review(userID: "UD1105", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1106", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1107", userName: "Yogi", review: "Nice Place Must Visit.")
                ],
                ratingDetail: [Rating(userID: "1102", rating: 5.0)],
                amenities: [Amenity.Air_Conditioning,
                            Amenity.CarbonMonoxide_Alarm,
                            Amenity.First_Aid_Kit,
                            Amenity.Fire_Extinguisher,
                            Amenity.Pool,
                            Amenity.Free_Parking,
                            Amenity.Pets_Allowed,
                            Amenity.Smoke_Alarm
                           ],
                location: Location(city: "Goa", state: "Goa", country: "India", address: "23/24 big map street"),
                images: [
                    "https://cdn.pixabay.com/photo/2023/03/29/10/27/hotel-7885138__480.jpg",
                    "https://cdn.pixabay.com/photo/2020/10/18/09/16/bedroom-5664221__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/10/18/09/02/hotel-1749602__480.jpg",
                    "https://cdn.pixabay.com/photo/2019/08/19/13/58/bed-4416515__480.jpg",
                   
                    "https://cdn.pixabay.com/photo/2019/05/28/00/15/indoors-4234071__480.jpg",
                    "https://cdn.pixabay.com/photo/2020/10/18/09/16/bedroom-5664221__480.jpg",
                   
                ],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1105",
                placeName: "Savute Elephant Lodge, a Belmond Safari",
                description: "In the heart of Chobe National Park along the Savute Channel, this 12-room oasis puts the savannah at guests' fingertips. The tented accommodations are on raised wooden decks with thatched roofs and feature four-poster beds, hammocks, and spacious bathrooms with outdoor showers.",
                hostId: "UD1103",
                noOfRooms: 10,
                noOfBedRooms: 3,
                noOfBathRooms: 2,
                noOfBeds: 4,
                noOfPeopleAccomodate: 12,
                isAvailable: true,
                price: Price(pricePerDay: 20000, taxPercentage: 12.0, currencyCode: "INR"),
                reviewDetail: [
                    Review(userID: "UD1108", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1103", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1104", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1102", userName: "Yogi", review: "Nice Place Must Visit.I wouldn’t recommend hosting this guest. The guest broke the locks of the off-limit storage area of the house, which was explicitly stated in the welcome book that the storage room was not for guest use.Guests disrespected our Airbnb rules by throwing a house party and having five additional visitors stay in the Airbnb. When we issued an additional cleaning fee for the mess, the guest left a one-star review. Do not host this guest."),
                    Review(userID: "UD1105", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1106", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1107", userName: "Yogi", review: "Nice Place Must Visit.")
                ],
                ratingDetail: [Rating(userID: "1102", rating: 5.0)],
                amenities: [Amenity.Air_Conditioning,
                            Amenity.CarbonMonoxide_Alarm,
                            Amenity.First_Aid_Kit,
                            Amenity.Fire_Extinguisher,
                            Amenity.Pool,
                            Amenity.Free_Parking,
                            Amenity.Pets_Allowed,
                            Amenity.Smoke_Alarm
                           ],
                location: Location(city: "Chobe National Park", state: "Botswana", country: "South Africa", address: "23/24 big map street"),
                images: [
                    "https://cdn.pixabay.com/photo/2021/12/11/07/59/hotel-6862159__480.jpg",
                    "https://cdn.pixabay.com/photo/2021/08/27/01/33/bedroom-6577523__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/06/10/01/05/hotel-room-1447201__480.jpg",
                    "https://cdn.pixabay.com/photo/2017/01/14/12/48/hotel-1979406__480.jpg",
                    "https://cdn.pixabay.com/photo/2013/07/19/00/18/water-165219__480.jpg"
                ],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1106",
                placeName: "The Oberoi Vanyavilas Wildlife Resort",
                description: "Inspired by the royal camps of yesteryear, the safari-style tents at this property feature canopy beds, lush lounge chairs, teak floors, and claw-foot tubs — and all guests have a personal butler. The big draw here is wildlife, so days are spent in the surrounding jungle searching for tigers and other creatures. ",
                hostId: "UD1103",
                noOfRooms: 10,
                noOfBedRooms: 3,
                noOfBathRooms: 2,
                noOfBeds: 4,
                noOfPeopleAccomodate: 12,
                isAvailable: true,
                price: Price(pricePerDay: 20000, taxPercentage: 12.0, currencyCode: "INR"),
                reviewDetail: [
                    Review(userID: "UD1108", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1103", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1104", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1102", userName: "Yogi", review: "Nice Place Must Visit.I wouldn’t recommend hosting this guest. The guest broke the locks of the off-limit storage area of the house, which was explicitly stated in the welcome book that the storage room was not for guest use.Guests disrespected our Airbnb rules by throwing a house party and having five additional visitors stay in the Airbnb. When we issued an additional cleaning fee for the mess, the guest left a one-star review. Do not host this guest."),
                    Review(userID: "UD1105", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1106", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1107", userName: "Yogi", review: "Nice Place Must Visit.")
                ],
                ratingDetail: [Rating(userID: "1102", rating: 5.0)],
                amenities: [Amenity.Air_Conditioning,
                            Amenity.CarbonMonoxide_Alarm,
                            Amenity.First_Aid_Kit,
                            Amenity.Fire_Extinguisher,
                            Amenity.Pool,
                            Amenity.Free_Parking,
                            Amenity.Pets_Allowed,
                            Amenity.Smoke_Alarm
                           ],
                location: Location(city: "Ranthambhore", state: "Rajasthan", country: "India", address: "23/24 big map street"),
                images: [
                    "https://cdn.pixabay.com/photo/2018/02/24/17/17/window-3178666__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/09/18/03/28/travel-1677347__480.jpg",
                    "https://cdn.pixabay.com/photo/2017/05/31/10/23/manor-house-2359884__480.jpg",
                    "https://cdn.pixabay.com/photo/2017/03/09/06/30/pool-2128578__480.jpg",
                    "https://cdn.pixabay.com/photo/2015/06/12/12/10/castle-park-806854__480.jpg"
                ],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1107",
                placeName: "Phinda Vlei Lodge, Phinda Private Game Reserve",
                description: "Known for incredibly knowledgeable and engaging safari guides, andBeyond is also famous for well-appointed lodges in ideal locations for wildlife spotting. Phinda Vlei is intimate and romantic, with just six suites overlooking wetlands and a grassy meadow on the edge of a rare sand forest that attracts a variety of game at all hours. ",
                hostId: "UD1103",
                noOfRooms: 10,
                noOfBedRooms: 3,
                noOfBathRooms: 2,
                noOfBeds: 4,
                noOfPeopleAccomodate: 12,
                isAvailable: true,
                price: Price(pricePerDay: 20000, taxPercentage: 12.0, currencyCode: "INR"),
                reviewDetail: [
                    Review(userID: "UD1108", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1103", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1104", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1102", userName: "Yogi", review: "Nice Place Must Visit.I wouldn’t recommend hosting this guest. The guest broke the locks of the off-limit storage area of the house, which was explicitly stated in the welcome book that the storage room was not for guest use.Guests disrespected our Airbnb rules by throwing a house party and having five additional visitors stay in the Airbnb. When we issued an additional cleaning fee for the mess, the guest left a one-star review. Do not host this guest."),
                    Review(userID: "UD1105", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1106", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1107", userName: "Yogi", review: "Nice Place Must Visit.")
                ],
                ratingDetail: [Rating(userID: "1102", rating: 5.0)],
                amenities: [Amenity.Air_Conditioning,
                            Amenity.CarbonMonoxide_Alarm,
                            Amenity.First_Aid_Kit,
                            Amenity.Fire_Extinguisher,
                            Amenity.Pool,
                            Amenity.Free_Parking,
                            Amenity.Pets_Allowed,
                            Amenity.Smoke_Alarm
                           ],
                location: Location(city: " KwaZulu Nata", state: " KwaZulu Natal", country: "South Africa", address: "23/24 big map street"),
                images: [
                    "https://cdn.pixabay.com/photo/2020/04/17/12/28/pool-5055009_1280.jpg",
                    "https://cdn.pixabay.com/photo/2016/04/15/11/45/hotel-1330841__480.jpg",
                    "https://cdn.pixabay.com/photo/2013/10/12/18/05/villa-194671__480.jpg",
                    "https://cdn.pixabay.com/photo/2017/03/30/00/24/villa-2186906__480.jpg",
                    "https://cdn.pixabay.com/photo/2019/10/17/02/39/villa-4555818__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/03/05/09/51/home-1237469__480.jpg",
                    "https://cdn.pixabay.com/photo/2017/04/18/12/57/residence-2238987__480.jpg",
                   
                ],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1108",
                placeName: "Il Sereno Lago di Como",
                description: "An all-suite hotel on the eastern side of Lake Como near the village of Torno, this sparkling resort features 30 suites, each with its own waterfront terrace overlooking the lake. Designed by Milan architect and designer Patricia Urquiola, rooms feature custom furnishings complemented by fixtures in earth tones of gray and walnut and pops of blue and green. ",
                hostId: "UD1103",
                noOfRooms: 10,
                noOfBedRooms: 3,
                noOfBathRooms: 2,
                noOfBeds: 4,
                noOfPeopleAccomodate: 12,
                isAvailable: true,
                price: Price(pricePerDay: 20000, taxPercentage: 12.0, currencyCode: "USD"),
                reviewDetail: [Review(userID: "UD1102", userName: "Yogi", review: "Nice Place Must Visit.")],
                ratingDetail : [Rating(userID: "1102", rating: 5.0)],
                amenities: [Amenity.Air_Conditioning,Amenity.CarbonMonoxide_Alarm,Amenity.First_Aid_Kit],
                location: Location(city: "Via Torrazza", state: "Torno", country: "Italy", address: "475, Raily watson street, Vadakalaur"),
                images: [
                    
                    "https://cdn.pixabay.com/photo/2016/09/18/03/28/travel-1677347__480.jpg",
                    "https://cdn.pixabay.com/photo/2020/03/21/20/03/real-estate-4955087__480.jpg",
                    "https://cdn.pixabay.com/photo/2020/03/21/20/03/real-estate-4955086__480.jpg",
                    "https://cdn.pixabay.com/photo/2015/01/15/10/55/villa-600176__480.jpg",
                    "https://cdn.pixabay.com/photo/2017/01/07/17/48/interior-1961070__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/08/26/15/06/home-1622401__480.jpg",
                    "https://cdn.pixabay.com/photo/2014/08/11/21/40/bedroom-416062__480.jpg"
                ],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1109",
                placeName: "Manoir Hovey",
                description: "Housed inside a 19th-century mansion modelled after George Washington's Mount Vernon, this Relais & Châteaux property has 36 rooms and suites. Well-placed antiques, rich textiles, and curated art give the hotel an elegant country vibe. The restaurant and bar feature seasonal dishes that highlight the local bounty. ",
                hostId: "UD1103",
                noOfRooms: 10,
                noOfBedRooms: 3,
                noOfBathRooms: 2,
                noOfBeds: 4,
                noOfPeopleAccomodate: 12,
                isAvailable: true,
                price: Price(pricePerDay: 20000, taxPercentage: 12.0, currencyCode: "INR"),
                reviewDetail: [
                    Review(userID: "UD1108", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1103", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1104", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1102", userName: "Yogi", review: "Nice Place Must Visit.I wouldn’t recommend hosting this guest. The guest broke the locks of the off-limit storage area of the house, which was explicitly stated in the welcome book that the storage room was not for guest use.Guests disrespected our Airbnb rules by throwing a house party and having five additional visitors stay in the Airbnb. When we issued an additional cleaning fee for the mess, the guest left a one-star review. Do not host this guest."),
                    Review(userID: "UD1105", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1106", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1107", userName: "Yogi", review: "Nice Place Must Visit.")
                ],
                ratingDetail: [Rating(userID: "1102", rating: 5.0)],
                amenities: [Amenity.Air_Conditioning,
                            Amenity.CarbonMonoxide_Alarm,
                            Amenity.First_Aid_Kit,
                            Amenity.Fire_Extinguisher,
                            Amenity.Pool,
                            Amenity.Free_Parking,
                            Amenity.Pets_Allowed,
                            Amenity.Smoke_Alarm
                           ],
                location: Location(city: "North Hatley", state: "Quebec", country: "Canada", address: "23/24 big map street"),
                images: [
            
                    "https://cdn.pixabay.com/photo/2017/11/24/21/49/bali-2975787__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/04/15/11/45/hotel-1330841__480.jpg",
                    "https://cdn.pixabay.com/photo/2012/11/21/10/24/building-66789__480.jpg",
                    "https://cdn.pixabay.com/photo/2014/07/21/19/20/lobby-398845__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/03/28/09/34/bedroom-1285156__480.jpg",
                    
                ],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1110",
                placeName: "Hotel Fasano Boa Vista",
                description: "Two thousand acres of sprawling farmland are the setting for this luxe countryside hotel, located about 45 minutes from São Paulo. Guests can enjoy an 18-hole golf course, horseback riding, relaxing at the heavenly spa, numerous lakes and natural pools, and dining on the bounty of the Boa Vista Ranch. ",
                hostId: "UD1103",
                noOfRooms: 10,
                noOfBedRooms: 3,
                noOfBathRooms: 2,
                noOfBeds: 4,
                noOfPeopleAccomodate: 12,
                isAvailable: true,
                price: Price(pricePerDay: 20000, taxPercentage: 12.0, currencyCode: "INR"),
                reviewDetail: [
                    Review(userID: "UD1108", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1103", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1104", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1102", userName: "Yogi", review: "Nice Place Must Visit.I wouldn’t recommend hosting this guest. The guest broke the locks of the off-limit storage area of the house, which was explicitly stated in the welcome book that the storage room was not for guest use.Guests disrespected our Airbnb rules by throwing a house party and having five additional visitors stay in the Airbnb. When we issued an additional cleaning fee for the mess, the guest left a one-star review. Do not host this guest."),
                    Review(userID: "UD1105", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1106", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1107", userName: "Yogi", review: "Nice Place Must Visit.")
                ],
                ratingDetail: [Rating(userID: "1102", rating: 5.0)],
                amenities: [Amenity.Air_Conditioning,
                            Amenity.CarbonMonoxide_Alarm,
                            Amenity.First_Aid_Kit,
                            Amenity.Fire_Extinguisher,
                            Amenity.Pool,
                            Amenity.Free_Parking,
                            Amenity.Pets_Allowed,
                            Amenity.Smoke_Alarm
                           ],
                location: Location(city: "Porto Feliz", state: "Brazil", country: "South Africa", address: "23/24 big map street"),
                images: [
                    
                    "https://cdn.pixabay.com/photo/2016/10/18/09/02/hotel-1749602__480.jpg",
                    "https://cdn.pixabay.com/photo/2019/08/19/13/58/bed-4416515__480.jpg",
                    "https://cdn.pixabay.com/photo/2020/10/18/09/16/bedroom-5664221__480.jpg",
                    "https://cdn.pixabay.com/photo/2019/05/28/00/15/indoors-4234071__480.jpg",
                    "https://cdn.pixabay.com/photo/2020/10/18/09/16/bedroom-5664221__480.jpg",
                    "https://cdn.pixabay.com/photo/2023/03/29/10/27/hotel-7885138__480.jpg"
                ],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1111",
                placeName: "Grand Hotel Excelsior Vittoria",
                description: "A grande dame in Sorrento, this historic resort has classic rooms overlooking the Bay of Naples and Mount Vesuvius in the distance. Breakfast is included, and there's a Michelin one-starred restaurant to indulge in. ",
                hostId: "UD1103",
                noOfRooms: 10,
                noOfBedRooms: 3,
                noOfBathRooms: 2,
                noOfBeds: 4,
                noOfPeopleAccomodate: 12,
                isAvailable: true,
                price: Price(pricePerDay: 20000, taxPercentage: 12.0, currencyCode: "INR"),
                reviewDetail: [
                    Review(userID: "UD1108", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1103", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1104", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1102", userName: "Yogi", review: "Nice Place Must Visit.I wouldn’t recommend hosting this guest. The guest broke the locks of the off-limit storage area of the house, which was explicitly stated in the welcome book that the storage room was not for guest use.Guests disrespected our Airbnb rules by throwing a house party and having five additional visitors stay in the Airbnb. When we issued an additional cleaning fee for the mess, the guest left a one-star review. Do not host this guest."),
                    Review(userID: "UD1105", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1106", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1107", userName: "Yogi", review: "Nice Place Must Visit.")
                ],
                ratingDetail: [Rating(userID: "1102", rating: 5.0)],
                amenities: [Amenity.Air_Conditioning,
                            Amenity.CarbonMonoxide_Alarm,
                            Amenity.First_Aid_Kit,
                            Amenity.Fire_Extinguisher,
                            Amenity.Pool,
                            Amenity.Free_Parking,
                            Amenity.Pets_Allowed,
                            Amenity.Smoke_Alarm
                           ],
                location: Location(city: "Sorrento", state: "Sorrento", country: "Italy", address: "23/24 big map street"),
                images: [
                    
                    "https://cdn.pixabay.com/photo/2021/12/11/07/59/hotel-6862159__480.jpg",
                    "https://cdn.pixabay.com/photo/2021/08/27/01/33/bedroom-6577523__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/06/10/01/05/hotel-room-1447201__480.jpg",
                    "https://cdn.pixabay.com/photo/2017/01/14/12/48/hotel-1979406__480.jpg",
                    "https://cdn.pixabay.com/photo/2013/07/19/00/18/water-165219__480.jpg"
                ],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1112",
                placeName: "Las Ventanas al Paraíso, a Rosewood Resort",
                description: "Guests here can enjoy extensive dining options (from upscale authentic Mexican to temaris sushi and Indonesian noodles), a lavish spa, and activities that include deep-sea fishing, world-class golf, and whale watching. Rooms have panoramic views of the Sea of Cortés, romantic fireplaces, and bowls of fresh fruit replenished daily by the personal butlers. ",
                hostId: "UD1103",
                noOfRooms: 10,
                noOfBedRooms: 3,
                noOfBathRooms: 2,
                noOfBeds: 4,
                noOfPeopleAccomodate: 12,
                isAvailable: true,
                price: Price(pricePerDay: 20000, taxPercentage: 12.0, currencyCode: "INR"),
                reviewDetail: [
                    Review(userID: "UD1108", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1103", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1104", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1102", userName: "Yogi", review: "Nice Place Must Visit.I wouldn’t recommend hosting this guest. The guest broke the locks of the off-limit storage area of the house, which was explicitly stated in the welcome book that the storage room was not for guest use.Guests disrespected our Airbnb rules by throwing a house party and having five additional visitors stay in the Airbnb. When we issued an additional cleaning fee for the mess, the guest left a one-star review. Do not host this guest."),
                    Review(userID: "UD1105", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1106", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1107", userName: "Yogi", review: "Nice Place Must Visit.")
                ],
                ratingDetail: [Rating(userID: "1102", rating: 5.0)],
                amenities: [Amenity.Air_Conditioning,
                            Amenity.CarbonMonoxide_Alarm,
                            Amenity.First_Aid_Kit,
                            Amenity.Fire_Extinguisher,
                            Amenity.Pool,
                            Amenity.Free_Parking,
                            Amenity.Pets_Allowed,
                            Amenity.Smoke_Alarm
                           ],
                location: Location(city: "San José del Cabo", state: "Mexico", country: "North America", address: "23/24 big map street"),
                images: [
                    
                    "https://cdn.pixabay.com/photo/2018/02/24/17/17/window-3178666__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/09/18/03/28/travel-1677347__480.jpg",
                    "https://cdn.pixabay.com/photo/2017/05/31/10/23/manor-house-2359884__480.jpg",
                    "https://cdn.pixabay.com/photo/2017/03/09/06/30/pool-2128578__480.jpg",
                    "https://cdn.pixabay.com/photo/2015/06/12/12/10/castle-park-806854__480.jpg"
                ],
                isWishListed: true
            )
        )
        
        return travelPlaceDetails
    }
    
    static private func getCurrencyDetail() -> [Currency]{
        var currencyList : [Currency] = []
        
        currencyList.append(contentsOf: [
            Currency(currencyName: "Indian Rupee", currencyCode: "INR", currencyValue: 81.819519),
            Currency(currencyName: "US dollar", currencyCode: "USD", currencyValue: 1.0),
            Currency(currencyName: "Euro", currencyCode: "EUR", currencyValue: 0.907997),
            Currency(currencyName: "British Pound", currencyCode: "GBP", currencyValue: 0.805522),
            Currency(currencyName: "Japanese Yen", currencyCode: "YEN", currencyValue: 133.793843),
            Currency(currencyName: "Russian Ruble", currencyCode: "RUB", currencyValue: 82.275405),
            Currency(currencyName: "Saudi Arabian Riyal", currencyCode: "SAR", currencyValue: 3.750000),
            Currency(currencyName: "Australian Dollar", currencyCode: "AUD", currencyValue: 1.484417),
            Currency(currencyName: "Singapore Dollar", currencyCode: "SGD", currencyValue: 1.329990),
            Currency(currencyName: "Malaysian Ringgit", currencyCode: "MYR", currencyValue: 4.401353),
        ]
        )
            
        return currencyList
    }
    static private func getCurrencyPreference() -> [(String,String)]{
        return [
        ("UD1101","USD"),
        ("UD1102","USD"),
        ("UD1103","USD"),
        ("UD1104","USD"),
        ("UD1105","USD"),
        ("UD1106","USD"),
        ]
    }
    
    static func getImagesList(placeId : String) -> [String]?{
        for detail in travelPlaceDetails {
            if detail.placeId == placeId{
                return detail.images
            }
        }
        return nil
    }
}

