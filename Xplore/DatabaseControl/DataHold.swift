import Foundation

class DataHold{
    
    static let userDetails : [UserDetail] = getUserDetail()
    static let travelPlaceDetails : [TravelPlaceDetail] = getTravelPlaceDetails()
    
    static let currencyPreference : [(String,String)] = getCurrencyPreference()
    static let bookedTrips = getBookedTrips()
    
    static let currencyList = getCurrencyDetail()
    
    private static let imagesList = [
        ["https://cdn.pixabay.com/photo/2017/03/30/00/24/villa-2186906__480.jpg",
         "https://cdn.pixabay.com/photo/2017/11/24/21/49/bali-2975787__480.jpg",
         "https://cdn.pixabay.com/photo/2014/07/21/19/20/lobby-398845__480.jpg",
         "https://cdn.pixabay.com/photo/2014/08/05/22/01/lobby-411029__480.jpg",
         "https://cdn.pixabay.com/photo/2016/09/18/03/28/travel-1677347__480.jpg"
        ],//1
        
        [
        "https://cdn.pixabay.com/photo/2016/10/18/09/02/hotel-1749602__480.jpg",
         "https://cdn.pixabay.com/photo/2016/03/05/09/51/home-1237469__480.jpg",
         "https://cdn.pixabay.com/photo/2019/10/17/02/39/villa-4555818__480.jpg",
         "https://cdn.pixabay.com/photo/2020/04/17/12/28/pool-5055009_1280.jpg",
         "https://cdn.pixabay.com/photo/2019/05/28/00/15/indoors-4234071__480.jpg"
        ],//2
        
        [
         "https://cdn.pixabay.com/photo/2023/03/29/10/27/hotel-7885138__480.jpg",
         "https://cdn.pixabay.com/photo/2013/10/12/18/05/villa-194671__480.jpg",
         "https://cdn.pixabay.com/photo/2016/06/10/01/05/hotel-room-1447201__480.jpg",
         "https://cdn.pixabay.com/photo/2020/03/21/20/03/real-estate-4955086__480.jpg",
         "https://cdn.pixabay.com/photo/2021/08/27/01/33/bedroom-6577523__480.jpg"
        ],//3
        
        [
            "https://cdn.pixabay.com/photo/2020/03/07/15/20/rugen-4910056__480.jpg",
            "https://cdn.pixabay.com/photo/2016/08/26/15/06/home-1622401__480.jpg",
            "https://cdn.pixabay.com/photo/2015/06/12/12/10/castle-park-806854__480.jpg",
            "https://cdn.pixabay.com/photo/2015/01/15/10/55/villa-600176__480.jpg",
            "https://cdn.pixabay.com/photo/2017/01/07/17/48/interior-1961070__480.jpg"
           ],//4
        
        [
         "https://cdn.pixabay.com/photo/2017/01/14/12/48/hotel-1979406__480.jpg",
         "https://cdn.pixabay.com/photo/2017/04/18/12/57/residence-2238987__480.jpg",
         "https://cdn.pixabay.com/photo/2016/03/28/09/34/bedroom-1285156__480.jpg",
         "https://cdn.pixabay.com/photo/2013/07/19/00/18/water-165219__480.jpg",
         "https://cdn.pixabay.com/photo/2016/04/15/11/45/hotel-1330841__480.jpg"
        ],//5
        
        [
         "https://cdn.pixabay.com/photo/2021/12/11/07/59/hotel-6862159__480.jpg",
         "https://cdn.pixabay.com/photo/2018/02/24/17/17/window-3178666__480.jpg",
         "https://cdn.pixabay.com/photo/2017/03/09/06/30/pool-2128578__480.jpg",
         "https://cdn.pixabay.com/photo/2017/05/31/10/23/manor-house-2359884__480.jpg",
         "https://cdn.pixabay.com/photo/2020/03/21/20/03/real-estate-4955087__480.jpg"
        ],//6
        
        [
         "https://cdn.pixabay.com/photo/2014/08/11/21/40/bedroom-416062__480.jpg",
         "https://cdn.pixabay.com/photo/2020/10/18/09/16/bedroom-5664221__480.jpg",
         "https://cdn.pixabay.com/photo/2013/10/09/02/27/lake-192990__480.jpg",
         "https://cdn.pixabay.com/photo/2022/05/02/10/12/window-7169327__480.jpg",
         "https://cdn.pixabay.com/photo/2020/09/13/04/13/coffee-5567269__480.jpg"
        ],//7
        
        [
         "https://cdn.pixabay.com/photo/2016/01/02/01/53/seat-1117599__480.jpg",
         "https://cdn.pixabay.com/photo/2014/10/23/21/01/building-500295__480.jpg",
         "https://cdn.pixabay.com/photo/2012/08/06/01/08/garden-terrace-53785__480.jpg",
         "https://cdn.pixabay.com/photo/2019/10/10/18/03/balcony-4540183__480.jpg",
         "https://cdn.pixabay.com/photo/2012/11/06/20/51/holiday-house-64393__480.jpg"
        ],//8
        
        [
            "https://cdn.pixabay.com/photo/2016/09/19/20/12/hotel-1681081__480.jpg",
            "https://cdn.pixabay.com/photo/2021/04/19/18/02/room-6192065__480.jpg",
            "https://cdn.pixabay.com/photo/2014/10/03/22/11/pool-472261__480.jpg",
            "https://cdn.pixabay.com/photo/2020/04/21/06/23/maldives-5071311__480.jpg",
            "https://cdn.pixabay.com/photo/2022/04/07/07/57/cruise-ship-7117043__480.jpg"
           ],//9
        
        [
         "https://cdn.pixabay.com/photo/2021/06/23/14/53/sunset-6358971__480.jpg",
         "https://cdn.pixabay.com/photo/2021/09/25/00/14/vacation-6653755__480.jpg",
         "https://cdn.pixabay.com/photo/2017/10/20/05/36/beach-2870185__480.jpg",
         "https://cdn.pixabay.com/photo/2015/09/22/23/48/swimming-pool-952694__480.jpg",
         "https://cdn.pixabay.com/photo/2015/08/10/03/34/cherating-882406__480.jpg"
        ],//10
        
        [
         "https://cdn.pixabay.com/photo/2014/06/07/13/55/swimming-pool-364254__480.jpg",
         "https://cdn.pixabay.com/photo/2015/09/04/11/10/resort-921915__480.jpg",
         "https://cdn.pixabay.com/photo/2016/04/22/04/05/hotel-1345078__480.jpg",
         "https://cdn.pixabay.com/photo/2015/11/01/23/19/adirondack-chair-1017702__480.jpg",
         "https://cdn.pixabay.com/photo/2013/04/07/04/23/erbeskopf-101384__480.jpg"
        ],//11
        
        [
         "https://cdn.pixabay.com/photo/2022/04/26/13/14/background-7158357__480.jpg",
         "https://cdn.pixabay.com/photo/2021/10/09/03/39/resort-6692925__480.jpg",
         "https://cdn.pixabay.com/photo/2015/03/20/15/53/cafe-682424__480.jpg",
         "https://cdn.pixabay.com/photo/2014/02/09/05/25/resort-262505__480.jpg",
         "https://cdn.pixabay.com/photo/2015/02/08/13/45/pool-628509__480.jpg"
        ],//12
        
        [
         "https://cdn.pixabay.com/photo/2019/10/07/16/58/ilha-do-mel-4533071__480.jpg",
         "https://cdn.pixabay.com/photo/2018/12/18/15/31/ooty-3882538__480.jpg",
         "https://cdn.pixabay.com/photo/2019/09/12/15/21/resort-4471852__480.jpg",
         "https://cdn.pixabay.com/photo/2020/06/30/03/23/lake-5355044__480.jpg",
         "https://cdn.pixabay.com/photo/2021/06/24/08/32/pool-6360522__480.jpg"
        ],//13
        
        [
            "https://cdn.pixabay.com/photo/2022/02/22/15/58/hotel-7029124__480.jpg",
            "https://cdn.pixabay.com/photo/2019/01/27/20/12/pool-3958904__480.jpg",
            "https://cdn.pixabay.com/photo/2014/07/05/08/21/pool-384573__480.jpg",
            "https://cdn.pixabay.com/photo/2014/02/07/04/07/maldives-260686__480.jpg",
            "https://cdn.pixabay.com/photo/2018/02/22/08/05/palma-3172367__480.jpg"
           ],//14
        
        [
         "https://cdn.pixabay.com/photo/2017/05/14/13/02/maldives-2312009__480.jpg",
         "https://cdn.pixabay.com/photo/2017/05/09/03/47/and-2297209__480.jpg",
         "https://cdn.pixabay.com/photo/2019/11/28/19/19/landscape-4659922__480.jpg",
         "https://cdn.pixabay.com/photo/2016/11/18/17/41/summer-1836046__480.jpg",
         "https://cdn.pixabay.com/photo/2014/02/09/05/38/maldives-262515__480.jpg"
        ],//15
        
        [
         "https://cdn.pixabay.com/photo/2019/02/19/21/02/architecture-4007755__480.jpg",
         "https://cdn.pixabay.com/photo/2016/08/21/12/45/hall-1609571__480.jpg",
         "https://cdn.pixabay.com/photo/2014/02/09/05/45/maldives-262523__480.jpg",
         "https://cdn.pixabay.com/photo/2015/10/03/17/34/terrace-970050__480.jpg",
         "https://cdn.pixabay.com/photo/2017/08/31/10/39/hawaii-2700190__480.jpg"
        ],//16
        
        [
         "https://cdn.pixabay.com/photo/2018/09/04/02/13/pool-bar-3652849__480.jpg",
         "https://cdn.pixabay.com/photo/2018/04/09/13/17/garden-3304063__480.jpg",
         "https://cdn.pixabay.com/photo/2017/01/28/19/31/landscape-2016308__480.jpg",
         "https://cdn.pixabay.com/photo/2013/11/19/09/42/samoa-213161__480.jpg",
         "https://cdn.pixabay.com/photo/2014/02/09/05/32/maldives-262507__480.jpg"
        ],//17
        
        [
         "https://cdn.pixabay.com/photo/2016/10/06/16/35/summer-1719401__480.jpg",
         "https://cdn.pixabay.com/photo/2016/03/27/17/22/sea-1283190__480.jpg",
         "https://cdn.pixabay.com/photo/2020/01/18/18/35/landscape-4776073__480.jpg",
         "https://cdn.pixabay.com/photo/2018/03/14/21/45/sunset-3226467__480.jpg",
         "https://cdn.pixabay.com/photo/2015/10/27/04/56/pool-1008338__480.jpg"
        ],//18
        
        [
            "https://cdn.pixabay.com/photo/2016/05/16/06/17/pool-1395071__480.jpg",
            "https://cdn.pixabay.com/photo/2016/05/07/05/12/thailand-1377066__480.jpg",
            "https://cdn.pixabay.com/photo/2015/09/12/21/11/sand-937387__480.jpg",
            "https://cdn.pixabay.com/photo/2015/06/21/15/03/jamaica-816669__480.jpg",
            "https://cdn.pixabay.com/photo/2016/05/16/06/16/pool-1395069__480.jpg"
           ],//19
        
        [
         "https://cdn.pixabay.com/photo/2018/10/01/00/52/roof-top-pool-3715118__480.jpg",
         "https://cdn.pixabay.com/photo/2016/07/26/11/12/ahlbeck-1542568__480.jpg",
         "https://cdn.pixabay.com/photo/2013/11/19/09/30/resort-213151__480.jpg",
         "https://cdn.pixabay.com/photo/2014/02/09/05/45/maldives-sea-262524__480.jpg",
         "https://cdn.pixabay.com/photo/2017/08/17/22/49/beach-2653182__480.jpg"
        ],//20
        
        [
         "https://cdn.pixabay.com/photo/2015/01/26/11/05/beach-612553__480.jpg",
         "https://cdn.pixabay.com/photo/2016/05/18/08/12/resort-1400082__480.jpg",
         "https://cdn.pixabay.com/photo/2016/09/17/14/34/cabo-1676271__480.jpg",
         "https://cdn.pixabay.com/photo/2016/06/14/05/17/beach-1455815__480.jpg",
         "https://cdn.pixabay.com/photo/2017/02/18/08/50/phang-nga-bay-2076834__480.jpg"
        ],//21
        
        [
         "https://cdn.pixabay.com/photo/2015/04/01/01/56/bora-bora-701862__480.jpg",
         "https://cdn.pixabay.com/photo/2014/02/08/04/54/maldives-261504__480.jpg",
         "https://cdn.pixabay.com/photo/2015/09/20/10/36/villa-cortine-palace-948115__480.jpg",
         "https://cdn.pixabay.com/photo/2015/06/21/15/04/jamaica-816673__480.jpg",
         "https://cdn.pixabay.com/photo/2017/02/04/00/12/beach-2036446__480.jpg"
        ],//22
        
        [
         "https://cdn.pixabay.com/photo/2015/09/28/14/20/sunset-962156__480.jpg",
         "https://cdn.pixabay.com/photo/2017/04/07/01/02/italy-2209816__480.jpg",
         "https://cdn.pixabay.com/photo/2018/03/19/22/05/panorama-3241426__480.jpg",
         "https://cdn.pixabay.com/photo/2017/01/17/10/39/italy-1986425__480.jpg",
         "https://cdn.pixabay.com/photo/2018/02/10/15/03/snow-3143778__480.jpg"
        ],//23
        
        [
            "https://cdn.pixabay.com/photo/2018/01/23/06/06/travel-3100741__480.jpg",
            "https://cdn.pixabay.com/photo/2019/07/29/05/56/resort-4369984__480.jpg",
            "https://cdn.pixabay.com/photo/2016/11/21/12/46/tourism-1845203__480.jpg",
            "https://cdn.pixabay.com/photo/2016/11/21/12/01/beach-1844919__480.jpg",
            "https://cdn.pixabay.com/photo/2015/06/24/16/46/greece-820415__480.jpg"
           ],//24
        
        [
         "https://cdn.pixabay.com/photo/2015/11/10/14/36/hawaii-1037043__480.jpg",
         "https://cdn.pixabay.com/photo/2016/10/13/09/08/travel-1737172__480.jpg",
         "https://cdn.pixabay.com/photo/2017/05/30/13/01/relax-2356858__480.jpg",
         "https://cdn.pixabay.com/photo/2016/07/08/23/49/palmetto-bay-1505478__480.jpg",
         ""
        ],//25
        
        [
         "https://cdn.pixabay.com/photo/2015/08/25/03/28/resort-906109__480.jpg",
         "https://cdn.pixabay.com/photo/2016/11/23/17/56/flowers-1854075__480.jpg",
         "https://cdn.pixabay.com/photo/2018/03/12/19/57/maldives-3220681__480.jpg",
         "https://cdn.pixabay.com/photo/2018/10/01/00/51/luxury-hotel-3715115__480.jpg",
         "https://cdn.pixabay.com/photo/2019/07/10/22/41/zinnowitz-4329714__480.jpg"
        ],//26
        
        [
         "https://cdn.pixabay.com/photo/2013/11/19/09/41/samoa-213160__480.jpg",
         "https://cdn.pixabay.com/photo/2013/08/23/22/56/palau-beach-175138__480.jpg",
         "https://cdn.pixabay.com/photo/2017/08/07/13/21/tree-2603792__480.jpg",
         "https://cdn.pixabay.com/photo/2017/01/12/19/43/oahu-1975486__480.jpg",
         "https://cdn.pixabay.com/photo/2020/04/26/02/12/maupiti-5093261__480.jpg"
        ],//27
        
        [
         "https://cdn.pixabay.com/photo/2014/04/05/11/19/hotel-315122__480.jpg",
         "https://cdn.pixabay.com/photo/2017/04/01/10/44/sea-2193341__480.jpg",
         "https://cdn.pixabay.com/photo/2018/09/16/11/44/sunset-3681293__480.jpg",
         "https://cdn.pixabay.com/photo/2019/11/02/05/31/sun-4595682__480.jpg",
         "https://cdn.pixabay.com/photo/2021/09/10/13/56/deck-chairs-6613331__480.jpg"
        ],//28
        
        [
            "https://cdn.pixabay.com/photo/2015/10/27/04/55/pond-resort-1008326__480.jpg",
            "https://cdn.pixabay.com/photo/2018/03/14/03/17/water-3224286__480.jpg",
            "https://cdn.pixabay.com/photo/2018/04/07/10/57/water-3298213__480.jpg",
            "https://cdn.pixabay.com/photo/2014/07/02/20/32/beach-382488__480.jpg",
            "https://cdn.pixabay.com/photo/2018/04/18/15/23/wellness-3330688__480.jpg"
           ],//29
        
        [
         "https://cdn.pixabay.com/photo/2016/09/17/14/35/mexico-1676273__480.jpg",
         "https://cdn.pixabay.com/photo/2017/03/17/04/46/beach-2150917__480.jpg",
         "https://cdn.pixabay.com/photo/2010/12/13/10/07/beach-2342__480.jpg",
         "https://cdn.pixabay.com/photo/2016/02/19/00/51/bungalow-1208505__480.jpg",
         "https://cdn.pixabay.com/photo/2018/01/05/02/40/background-3062008__480.jpg"
        ],//30
        
        [
         "https://cdn.pixabay.com/photo/2015/08/16/22/48/south-beach-891778__480.jpg",
         "https://cdn.pixabay.com/photo/2015/01/13/14/53/trees-598311__480.jpg",
         "https://cdn.pixabay.com/photo/2017/07/11/22/13/resort-2495217__480.jpg",
         "https://cdn.pixabay.com/photo/2016/10/13/09/06/cyprus-villas-1737166__480.jpg",
         "https://cdn.pixabay.com/photo/2015/04/29/09/13/warnemunde-745037__480.jpg"
        ],//31
        
        [
         "https://cdn.pixabay.com/photo/2014/02/09/05/40/maldives-262516__480.jpg",
         "https://cdn.pixabay.com/photo/2016/08/13/17/19/dominican-republic-1591106__480.jpg",
         "https://cdn.pixabay.com/photo/2018/03/06/19/40/pool-3204359__480.jpg",
         "https://cdn.pixabay.com/photo/2015/11/27/10/38/hotel-swimming-pool-1065275__480.jpg",
         "https://cdn.pixabay.com/photo/2015/10/11/03/04/resort-981750__480.jpg"
        ],//32
        
        [
         "https://cdn.pixabay.com/photo/2014/08/05/17/31/pool-410772__480.jpg",
         "https://cdn.pixabay.com/photo/2015/09/04/05/56/sunset-921630__480.jpg",
         "https://cdn.pixabay.com/photo/2018/09/03/23/55/sea-3652693__480.jpg",
         "https://cdn.pixabay.com/photo/2015/09/23/09/51/peace-953285__480.jpg",
         "https://cdn.pixabay.com/photo/2017/02/28/13/17/sea-2105702__480.jpg"
        ],//33
        
        [
            "https://cdn.pixabay.com/photo/2015/08/25/03/27/resort-906104__480.jpg",
            "https://cdn.pixabay.com/photo/2018/03/14/20/20/basket-3226301__480.jpg",
            "https://cdn.pixabay.com/photo/2016/09/22/09/25/beautiful-1686737__480.jpg",
            "https://cdn.pixabay.com/photo/2015/08/25/03/27/resort-906102__480.jpg",
            "https://cdn.pixabay.com/photo/2015/10/27/04/55/lagoon-1008320__480.jpg"
           ],//34
        
        [
         "https://cdn.pixabay.com/photo/2015/09/23/09/51/swimming-pool-953286__480.jpg",
         "https://cdn.pixabay.com/photo/2012/12/13/11/48/blue-69764__480.jpg",
         "https://cdn.pixabay.com/photo/2015/09/17/12/37/sirmione-944038__480.jpg",
         "https://cdn.pixabay.com/photo/2019/04/17/13/53/foroglio-4134277__480.jpg",
         "https://cdn.pixabay.com/photo/2016/08/12/06/13/pool-1587786__480.jpg"
        ],//35
        
        [
         "https://cdn.pixabay.com/photo/2014/02/23/21/13/boardwalk-273259__480.jpg",
         "https://cdn.pixabay.com/photo/2016/08/10/19/13/indian-canyon-golf-resort-1584095__480.jpg",
         "https://cdn.pixabay.com/photo/2018/02/18/17/52/snow-3162950__480.jpg",
         "https://cdn.pixabay.com/photo/2012/12/19/18/13/architecture-70920__480.jpg",
         "https://cdn.pixabay.com/photo/2017/06/16/03/03/island-2407521__480.jpg"
        ],//36
        
        [
         "https://cdn.pixabay.com/photo/2017/07/26/19/42/bora-bora-2542917__480.jpg",
         "https://cdn.pixabay.com/photo/2014/02/09/05/33/maldives-262509__480.jpg",
         "https://cdn.pixabay.com/photo/2021/02/07/10/06/beach-5990648__480.jpg",
         "https://cdn.pixabay.com/photo/2016/10/19/00/06/sea-bridge-1751862__480.jpg",
         "https://cdn.pixabay.com/photo/2015/11/09/02/17/hawaii-1034558__480.jpg"
        ],//37
        
        [
         "https://cdn.pixabay.com/photo/2016/03/10/21/46/hotel-1249348__480.jpg",
         "https://cdn.pixabay.com/photo/2020/01/05/08/33/waterfalls-4742551__480.jpg",
         "https://cdn.pixabay.com/photo/2017/09/05/06/57/hotel-2716635__480.jpg",
         "https://cdn.pixabay.com/photo/2014/04/05/11/29/health-spa-315849__480.jpg",
         "https://cdn.pixabay.com/photo/2015/02/08/13/44/wood-628508__480.jpg"
        ],//38
        
        [
            "https://cdn.pixabay.com/photo/2018/08/01/18/43/sveti-stefan-3577827__480.jpg",
            "https://cdn.pixabay.com/photo/2022/06/19/07/41/deck-chairs-7271249__480.jpg",
            "https://cdn.pixabay.com/photo/2019/09/11/10/14/sea-bridge-4468440__480.jpg",
            "https://cdn.pixabay.com/photo/2018/04/21/11/23/sunset-3338242__480.jpg",
            "https://cdn.pixabay.com/photo/2015/10/19/17/07/honolulu-996344__480.jpg"
           ],//39
        
        [
         "https://cdn.pixabay.com/photo/2015/10/01/13/08/beach-966994__480.jpg",
         "https://cdn.pixabay.com/photo/2017/03/27/13/37/atoll-2178782__480.jpg",
         "https://cdn.pixabay.com/photo/2020/06/14/10/47/architecture-5297373__480.jpg",
         "https://cdn.pixabay.com/photo/2014/03/08/18/23/las-vegas-283265__480.jpg",
         "https://cdn.pixabay.com/photo/2015/10/11/00/27/resort-981656__480.jpg"
        ],//40
        
        [
         "https://cdn.pixabay.com/photo/2023/01/01/06/36/starry-sky-7689676__480.jpg",
         "https://cdn.pixabay.com/photo/2022/12/22/20/18/oil-candles-7672890__480.jpg",
         "https://cdn.pixabay.com/photo/2014/09/17/22/12/pool-450170__480.jpg",
         "https://cdn.pixabay.com/photo/2014/09/19/07/39/sunset-451772__480.jpg",
         "https://cdn.pixabay.com/photo/2018/01/03/17/06/background-3058729__480.jpg"
        ],//41
        
        [
         "https://cdn.pixabay.com/photo/2016/10/13/09/07/travel-1737170__480.jpg",
         "https://cdn.pixabay.com/photo/2015/07/15/16/19/outdoor-swimming-pool-846473__480.jpg",
         "https://cdn.pixabay.com/photo/2019/12/10/15/50/sea-bridge-4686061__480.jpg",
         "https://cdn.pixabay.com/photo/2014/01/12/02/56/pool-242580__480.jpg",
         "https://cdn.pixabay.com/photo/2017/04/25/09/13/sea-2259070__480.jpg"
        ],//42
        
        [
         "https://cdn.pixabay.com/photo/2015/09/26/14/48/resort-959194__480.jpg",
         "https://cdn.pixabay.com/photo/2015/09/23/12/57/le-pondy-953655__480.jpg",
         "https://cdn.pixabay.com/photo/2019/04/17/13/54/foroglio-4134279__480.jpg",
         "https://cdn.pixabay.com/photo/2017/06/16/05/37/seminyak-2407835__480.jpg",
         "https://cdn.pixabay.com/photo/2017/02/19/13/47/beach-bag-and-towel-2079846__480.jpg"
        ],//43
        
        [
            "https://cdn.pixabay.com/photo/2016/06/11/15/02/phuket-1450234__480.jpg",
            "https://cdn.pixabay.com/photo/2014/08/05/17/25/resort-410676__480.jpg",
            "https://cdn.pixabay.com/photo/2019/03/31/22/31/pool-4094230__480.jpg",
            "https://cdn.pixabay.com/photo/2015/10/08/12/37/sunrise-977644__480.jpg",
            "https://cdn.pixabay.com/photo/2017/07/03/18/37/relax-2468611__480.jpg"
           ],//44
        
        [
         "https://cdn.pixabay.com/photo/2014/02/05/09/41/sea-258859__480.jpg",
         "https://cdn.pixabay.com/photo/2017/09/04/22/39/germany-2715799__480.jpg",
         "https://cdn.pixabay.com/photo/2017/03/09/15/17/sea-2129972__480.jpg",
         "https://cdn.pixabay.com/photo/2013/02/04/02/40/hammock-77718__480.jpg",
         "https://cdn.pixabay.com/photo/2017/02/27/09/40/sea-2102592__480.jpg"
        ],//45
        
        [
         "https://cdn.pixabay.com/photo/2014/09/26/04/59/holiday-complex-461633__480.jpg",
         "https://cdn.pixabay.com/photo/2017/07/03/15/12/thailand-2468035__480.jpg",
         "https://cdn.pixabay.com/photo/2017/05/14/13/01/maldives-2312008__480.jpg",
         "https://cdn.pixabay.com/photo/2017/06/24/14/05/tropical-2437847__480.jpg",
         "https://cdn.pixabay.com/photo/2012/03/06/05/36/lodge-22355__480.jpg"
        ],//46
        
        [
         "https://cdn.pixabay.com/photo/2016/06/03/06/24/phuket-1432891__480.jpg",
         "https://cdn.pixabay.com/photo/2019/07/23/09/49/hotel-4357159__480.jpg",
         "https://cdn.pixabay.com/photo/2019/11/20/02/11/hotel-4638955__480.jpg",
         "https://media.istockphoto.com/id/655220978/photo/modern-living-room-interior-minimal-style-3d-rendering-image.jpg",
         "https://media.istockphoto.com/id/516541942/photo/architecture-sunshine-open-decoration-room.jpg"
        ],//47
        
        [
         "https://cdn.pixabay.com/photo/2023/01/06/14/36/senegal-7701385__480.jpg",
         "https://cdn.pixabay.com/photo/2015/10/27/04/56/pool-1008333__480.jpg",
         "https://cdn.pixabay.com/photo/2022/04/14/13/36/bedroom-7132435__480.jpg",
         "https://cdn.pixabay.com/photo/2017/04/28/22/16/room-2269594__480.jpg",
         "https://cdn.pixabay.com/photo/2015/02/05/20/36/bed-625386__480.jpg"
        ],//48
        
        [
            "https://cdn.pixabay.com/photo/2012/03/04/00/26/blue-21926__480.jpg",
            "https://cdn.pixabay.com/photo/2016/12/30/14/51/night-1940712__480.jpg",
            "https://cdn.pixabay.com/photo/2020/11/24/11/36/bedroom-5772286__480.jpg",
            "https://cdn.pixabay.com/photo/2017/08/08/00/27/home-2609600__480.jpg",
            "https://cdn.pixabay.com/photo/2015/03/18/22/34/food-680180__480.jpg"
           ],//49
        
        [
         "https://cdn.pixabay.com/photo/2012/03/01/15/53/background-20477__480.jpg",
         "https://cdn.pixabay.com/photo/2017/08/31/12/11/alcohol-2700529__480.jpg",
         "https://cdn.pixabay.com/photo/2013/11/28/12/15/life-belt-220483__480.jpg",
         "https://cdn.pixabay.com/photo/2021/11/08/00/30/bedroom-6778193__480.jpg",
         "https://cdn.pixabay.com/photo/2019/08/19/13/58/bed-4416515__480.jpg"
        ]//50
    
    ]
    
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
                            Amenity.Hot_Tub,
                            Amenity.First_Aid_Kit,
                            Amenity.Fire_Extinguisher,
                            Amenity.Pool,
                            Amenity.Free_Parking,
                            Amenity.Pets_Allowed,
                            Amenity.Smoke_Alarm,
                            Amenity.Self_CheckIn,
                            Amenity.Washing_Machine,
                            Amenity.Wifi,
                            Amenity.Kitchen
                           ],
                location: Location(city: "Chennai", state: "TN", country: "India", address: "23/24 big map street"),
                images: imagesList[0],
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
                reviewDetail: [
                    Review(userID: "UD1102", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1103", userName: "Yogi", review: "Nice Place Must Visit.")
                ],
                ratingDetail : [Rating(userID: "1102", rating: 5.0)],
                amenities: [Amenity.Air_Conditioning,Amenity.CarbonMonoxide_Alarm,Amenity.First_Aid_Kit],
                location: Location(city: "Chennai", state: "Kerala", country: "India", address: "475, Raily watson street, Vadakalaur"),
                images: imagesList[1],
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
                images: imagesList[2],
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
                images: imagesList[3],
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
                images: imagesList[4],
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
                images: imagesList[5],
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
                images: imagesList[6],
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
                images: imagesList[7],
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
                images: imagesList[8],
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
                images: imagesList[9],
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
                images: imagesList[10],
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
                images: imagesList[11],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1113",
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
                images: imagesList[12],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1114",
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
                images: imagesList[13],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1115",
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
                images: imagesList[14],
                isWishListed: true
            )
        )
        
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1116",
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
                images: imagesList[15],
                isWishListed: true
            )
        )
        
        
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1117",
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
                images: imagesList[16],
                isWishListed: true
            )
        )
        
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1118",
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
                images: imagesList[17],
                isWishListed: true
            )
        )
        
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1119",
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
                images: imagesList[18],
                isWishListed: true
            )
        )
        
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1120",
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
                images: imagesList[19],
                isWishListed: true
            )
        )
        
      
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1121",
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
                images: imagesList[20],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1122",
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
                images: imagesList[21],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1123",
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
                images: imagesList[22],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1124",
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
                images: imagesList[23],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1125",
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
                images: imagesList[24],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1126",
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
                images: imagesList[25],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1127",
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
                images: imagesList[26],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1128",
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
                images: imagesList[27],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1129",
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
                images: imagesList[28],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1130",
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
                images: imagesList[29],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1131",
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
                images: imagesList[30],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1132",
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
                images: imagesList[31],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1133",
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
                images: imagesList[32],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1134",
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
                images: imagesList[33],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1135",
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
                images: imagesList[34],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1136",
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
                images: imagesList[35],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1137",
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
                images: imagesList[36],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1138",
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
                images: imagesList[37],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1139",
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
                images: imagesList[38],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1140",
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
                images: imagesList[39],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1141",
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
                images: imagesList[40],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1142",
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
                images: imagesList[41],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1143",
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
                images: imagesList[42],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1144",
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
                images: imagesList[43],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1145",
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
                images: imagesList[44],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1146",
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
                images: imagesList[45],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1147",
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
                images: imagesList[46],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1148",
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
                images: imagesList[47],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1149",
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
                images: imagesList[48],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1150",
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
                images: imagesList[49],
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

