import Foundation

class DataHold{
    
    static let userDetails : [UserDetail] = getUserDetail()
    static let travelPlaceDetails : [TravelPlaceDetail] = getTravelPlaceDetails()
    
    static let currencyPreference : [(String,String)] = getCurrencyPreference()
    static let bookedTrips = getBookedTrips()
    
    static let currencyList = getCurrencyDetail()
    
    static private let hostList = ["UD1103","UD1107","UD1105","UD1112","UD1109"]
    
    private static let imagesList = [
        ["https://cdn.pixabay.com/photo/2017/03/30/00/24/villa-2186906__480.jpg",
         "https://cdn.pixabay.com/photo/2017/11/24/21/49/bali-2975787__480.jpg",
         "https://cdn.pixabay.com/photo/2014/07/21/19/20/lobby-398845__480.jpg",
         "https://cdn.pixabay.com/photo/2014/08/05/22/01/lobby-411029__480.jpg",
         "https://cdn.pixabay.com/photo/2016/09/18/03/28/travel-1677347__480.jpg"
        ],//1
        
        [
         "https://cdn.pixabay.com/photo/2018/01/23/06/06/travel-3100741__480.jpg",
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
            "https://cdn.pixabay.com/photo/2016/08/26/15/06/home-1622401__480.jpg",
            "https://cdn.pixabay.com/photo/2020/03/07/15/20/rugen-4910056__480.jpg",
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
        "https://cdn.pixabay.com/photo/2020/10/18/09/16/bedroom-5664221__480.jpg",
         "https://cdn.pixabay.com/photo/2014/08/11/21/40/bedroom-416062__480.jpg",
         "https://cdn.pixabay.com/photo/2013/10/09/02/27/lake-192990__480.jpg",
         "https://cdn.pixabay.com/photo/2022/05/02/10/12/window-7169327__480.jpg",
         "https://cdn.pixabay.com/photo/2020/09/13/04/13/coffee-5567269__480.jpg"
        ],//7
        
        [
        "https://cdn.pixabay.com/photo/2014/10/23/21/01/building-500295__480.jpg",
         "https://cdn.pixabay.com/photo/2016/01/02/01/53/seat-1117599__480.jpg",
         "https://cdn.pixabay.com/photo/2012/08/06/01/08/garden-terrace-53785__480.jpg",
         "https://cdn.pixabay.com/photo/2019/10/10/18/03/balcony-4540183__480.jpg",
         "https://cdn.pixabay.com/photo/2012/11/06/20/51/holiday-house-64393__480.jpg"
        ],//8
        
        [
            "https://cdn.pixabay.com/photo/2021/04/19/18/02/room-6192065__480.jpg",
            "https://cdn.pixabay.com/photo/2016/09/19/20/12/hotel-1681081__480.jpg",
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
         "https://cdn.pixabay.com/photo/2015/09/04/11/10/resort-921915__480.jpg",
         "https://cdn.pixabay.com/photo/2014/06/07/13/55/swimming-pool-364254__480.jpg",
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
        "https://cdn.pixabay.com/photo/2017/05/09/03/47/and-2297209__480.jpg",
         "https://cdn.pixabay.com/photo/2017/05/14/13/02/maldives-2312009__480.jpg",
         "https://cdn.pixabay.com/photo/2019/11/28/19/19/landscape-4659922__480.jpg",
         "https://cdn.pixabay.com/photo/2016/11/18/17/41/summer-1836046__480.jpg",
         "https://cdn.pixabay.com/photo/2014/02/09/05/38/maldives-262515__480.jpg"
        ],//15
        
        [
        "https://cdn.pixabay.com/photo/2016/08/21/12/45/hall-1609571__480.jpg",
         "https://cdn.pixabay.com/photo/2019/02/19/21/02/architecture-4007755__480.jpg",
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
         "https://cdn.pixabay.com/photo/2013/11/19/09/30/resort-213151__480.jpg",
         "https://cdn.pixabay.com/photo/2016/07/26/11/12/ahlbeck-1542568__480.jpg",
         "https://cdn.pixabay.com/photo/2018/10/01/00/52/roof-top-pool-3715118__480.jpg",
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
            "https://cdn.pixabay.com/photo/2016/10/18/09/02/hotel-1749602__480.jpg",
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
         "https://cdn.pixabay.com/photo/2013/08/23/22/56/palau-beach-175138__480.jpg",
         "https://cdn.pixabay.com/photo/2013/11/19/09/41/samoa-213160__480.jpg",
         "https://cdn.pixabay.com/photo/2017/08/07/13/21/tree-2603792__480.jpg",
         "https://cdn.pixabay.com/photo/2017/01/12/19/43/oahu-1975486__480.jpg",
         "https://cdn.pixabay.com/photo/2020/04/26/02/12/maupiti-5093261__480.jpg"
        ],//27
        
        [
         "https://cdn.pixabay.com/photo/2018/09/16/11/44/sunset-3681293__480.jpg",
         "https://cdn.pixabay.com/photo/2017/04/01/10/44/sea-2193341__480.jpg",
         "https://cdn.pixabay.com/photo/2014/04/05/11/19/hotel-315122__480.jpg",

         "https://cdn.pixabay.com/photo/2019/11/02/05/31/sun-4595682__480.jpg",
         "https://cdn.pixabay.com/photo/2021/09/10/13/56/deck-chairs-6613331__480.jpg"
        ],//28
        
        [
            "https://cdn.pixabay.com/photo/2018/03/14/03/17/water-3224286__480.jpg",
            "https://cdn.pixabay.com/photo/2015/10/27/04/55/pond-resort-1008326__480.jpg",
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
         "https://cdn.pixabay.com/photo/2015/09/04/05/56/sunset-921630__480.jpg",
         "https://cdn.pixabay.com/photo/2014/08/05/17/31/pool-410772__480.jpg",
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
            "https://cdn.pixabay.com/photo/2012/12/19/18/13/architecture-70920__480.jpg",
             "https://cdn.pixabay.com/photo/2018/02/18/17/52/snow-3162950__480.jpg",
            "https://cdn.pixabay.com/photo/2016/08/10/19/13/indian-canyon-golf-resort-1584095__480.jpg",
         "https://cdn.pixabay.com/photo/2014/02/23/21/13/boardwalk-273259__480.jpg",
        
         "https://cdn.pixabay.com/photo/2017/06/16/03/03/island-2407521__480.jpg"
        ],//36
        
        [
            "https://cdn.pixabay.com/photo/2014/02/09/05/33/maldives-262509__480.jpg",
         "https://cdn.pixabay.com/photo/2017/07/26/19/42/bora-bora-2542917__480.jpg",
         
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
            "https://cdn.pixabay.com/photo/2022/06/19/07/41/deck-chairs-7271249__480.jpg",
            "https://cdn.pixabay.com/photo/2018/08/01/18/43/sveti-stefan-3577827__480.jpg",
           
            "https://cdn.pixabay.com/photo/2019/09/11/10/14/sea-bridge-4468440__480.jpg",
            "https://cdn.pixabay.com/photo/2018/04/21/11/23/sunset-3338242__480.jpg",
            "https://cdn.pixabay.com/photo/2015/10/19/17/07/honolulu-996344__480.jpg"
           ],//39
        
        [
            "https://cdn.pixabay.com/photo/2020/06/14/10/47/architecture-5297373__480.jpg",
        "https://cdn.pixabay.com/photo/2017/03/27/13/37/atoll-2178782__480.jpg",
         "https://cdn.pixabay.com/photo/2015/10/01/13/08/beach-966994__480.jpg",
        
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
        "https://cdn.pixabay.com/photo/2015/07/15/16/19/outdoor-swimming-pool-846473__480.jpg",
         "https://cdn.pixabay.com/photo/2016/10/13/09/07/travel-1737170__480.jpg",
         
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
            "https://cdn.pixabay.com/photo/2014/08/05/17/25/resort-410676__480.jpg",
            "https://cdn.pixabay.com/photo/2016/06/11/15/02/phuket-1450234__480.jpg",
            
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
            "https://cdn.pixabay.com/photo/2019/07/23/09/49/hotel-4357159__480.jpg",
         "https://cdn.pixabay.com/photo/2016/06/03/06/24/phuket-1432891__480.jpg",
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
        
        let fromDate1 = DateComponents(calendar: .current,timeZone: .current,era: 1,year: 2023,month: 5, day: 1)
        let fromDate2 = DateComponents(calendar: .current,timeZone: .current,era: 1,year: 2023,month: 4, day: 29)
        let fromDate3 = DateComponents(calendar: .current,timeZone: .current,era: 1,year: 2023,month: 5, day: 4)
        let fromDate4 = DateComponents(calendar: .current,timeZone: .current,era: 1,year: 2023,month: 6, day: 15)
        
        let toDate1 = DateComponents(calendar: .current,timeZone: .current,era: 1,year: 2023,month: 5, day: 5)
        let toDate2 = DateComponents(calendar: .current,timeZone: .current,era: 1,year: 2023,month: 5, day: 1)
        let toDate3 = DateComponents(calendar: .current,timeZone: .current,era: 1,year: 2023,month: 5, day: 8)
        let toDate4 = DateComponents(calendar: .current,timeZone: .current,era: 1,year: 2023,month: 6, day: 20)
        
        bookedTrips.append(
            BookedTrip(
                userId: "UD1102",
                placeId: "PD1101",
                BookedDateFrom: fromDate1,
                BookedDateTo: toDate1,
                pricePerDay: 14500,
                taxPercentage: 12.5,
                currencyCode: "INR",
                isVisited: true,
                numberOfGuests: 5,
                cleaningFee: 550,
                serviceFee: 1000,
                reservationId: "ABCDFEGHIJ"
            )
        )
        
        bookedTrips.append(
            BookedTrip(
                userId: "UD1103",
                placeId: "PD1101",
                BookedDateFrom: fromDate3,
                BookedDateTo: toDate3,
                pricePerDay: 14500,
                taxPercentage: 12.5,
                currencyCode: "INR",
                isVisited: true,
                numberOfGuests: 5,
                cleaningFee: 550,
                serviceFee: 1000,
                reservationId: "ABCDEFHGIJ"
            )
        )
        
        bookedTrips.append(
            BookedTrip(
                userId: "UD1102",
                placeId: "PD1103",
                BookedDateFrom: fromDate1,
                BookedDateTo: toDate3,
                pricePerDay: 13400,
                taxPercentage: 13,
                currencyCode: "INR",
                isVisited: true,
                numberOfGuests: 10,
                cleaningFee: 550,
                serviceFee: 1000,
                reservationId: "ABCDEFGHJI"
            )
        )
        
        bookedTrips.append(
            BookedTrip(
                userId: "UD1102",
                placeId: "PD1102",
                BookedDateFrom: fromDate2,
                BookedDateTo: toDate2,
                pricePerDay: 1320,
                taxPercentage: 10,
                currencyCode: "INR",
                isVisited: true,
                numberOfGuests: 2,
                cleaningFee: 600,
                serviceFee: 1030,
                reservationId: "ABCDEFGHJI"
            )
        )
        
        bookedTrips.append(
            BookedTrip(
                userId: "UD1102",
                placeId: "PD1102",
                BookedDateFrom: fromDate2,
                BookedDateTo: toDate2,
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
                userName: "Sofia Rodriguez",
                email: "sofia@gmail.com",
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
                password: "Zoho123"
            )
        )
        
        userDetails.append(
            UserDetail(
                userId: "UD1103",
                userName: "Max Thompson",
                email: "max@gmail.com",
                mobile: "+91987654323",
                password: "Zoho123"
            )
        )
        
        userDetails.append(
            UserDetail(
                userId: "UD1104",
                userName: "Lily Chen",
                email: "lily@gmail.com",
                mobile: "+91987654324",
                password: "Zoho123"
            )
        )
        
        
        userDetails.append(
            UserDetail(
                userId: "UD1105",
                userName: "Surya",
                email: "surya@gmail.com",
                mobile: "+91987654325",
                password: "Zoho123"
            )
        )
        
        userDetails.append(
            UserDetail(
                userId: "UD1106",
                userName: "Arnab Shandy",
                email: "arnab.s@gmail.com",
                mobile: "+91987654326",
                password: "Zoho123"
            )
        )
        
        userDetails.append(
            UserDetail(
                userId: "UD1107",
                userName: "Daniel Kim",
                email: "daniel@gmail.com",
                mobile: "+91987654326",
                password: "Zoho123"
            )
        )
        
        userDetails.append(
            UserDetail(
                userId: "UD1108",
                userName: "Ava Patel",
                email: "ava@gmail.com",
                mobile: "+91987654326",
                password: "Zoho123"
            )
        )
        
        userDetails.append(
            UserDetail(
                userId: "UD1109",
                userName: "Ethan Nguyen",
                email: "ethan@gmail.com",
                mobile: "+91987654326",
                password: "Zoho123"
            )
        )
        
        userDetails.append(
            UserDetail(
                userId: "UD1110",
                userName: "Emma Williams",
                email: "emma@gmail.com",
                mobile: "+91987654326",
                password: "Zoho123"
            )
        )
        
        userDetails.append(
            UserDetail(
                userId: "UD1111",
                userName: "Lucas Garcia",
                email: "lucas@gmail.com",
                mobile: "+91987654326",
                password: "Zoho123"
            )
        )
        
        
        userDetails.append(
            UserDetail(
                userId: "UD1112",
                userName: "Mia Johnson",
                email: "johnson.s@gmail.com",
                mobile: "+91987654326",
                password: "Zoho123"
            )
        )
        
        userDetails.append(
            UserDetail(
                userId: "UD1113",
                userName: "Caleb Davis",
                email: "calab@gmail.com",
                mobile: "+91987654326",
                password: "Zoho123"
            )
        )
        
        userDetails.append(
            UserDetail(
                userId: "UD1114",
                userName: "Udin Ruther",
                email: "ruther@gmail.com",
                mobile: "+91987654326",
                password: "Zoho123"
            )
        )
        
        userDetails.append(
            UserDetail(
                userId: "UD1115",
                userName: "Nobita Auther",
                email: "nobi@gmail.com",
                mobile: "+91987654326",
                password: "Zoho123"
            )
        )
        
        
        return userDetails
    }
    
    static private var cityList = ["Paris","New York City","Tokyo","London","Istanbul","Rio de Janeiro","Sydney","Cape Town","Barcelona","Bangkok","Dubai","Mumbai","Amsterdam","Buenos Aires","Vancouver","Rome","Hong Kong","Singapore","Toronto","Los Angeles"]
    
    static private var stateList = ["California","Texas","New York","Florida","Illinois","Pennsylvania","Ohio","Michigan","Georgia","Carolina"]
    static private var countryList = ["United States","Canada","Mexico","Brazil","France","Germany","United Kingdom","India","Japan","Australia"]
    static private var addressList = [
        "1234 Maple Street, Suite 567, Anytown",
        "5678 Elm Avenue, Apt. 9101, Smallville",
        "9101 Oak Boulevard, Unit 2345, Big City",
        "2345 Pine Lane, Suite 6789, Countryside",
        "6789 Cedar Road, Apt. 1234, Coastal Town",
        "1234 Birch Drive, Unit 5678, Suburbia",
        "5678 Spruce Court, Suite 9101, Mountain Town",
        "9101 Ash Street, Apt. 2345, River City",
        "2345 Poplar Lane, Unit 6789, Desert City",
        "6789 Willow Road, Suite 1234, Lakeview",
        "4567 Oak Street, Apt. 123, Anytown",
        "8901 Elm Road, Unit 234, Smallville",
        "2345 Pine Avenue, Suite 567, Big City",
        "6789 Cedar Drive, Apt. 910, Countryside",
        "1234 Birch Lane, Unit 567, Coastal Town",
        "5678 Spruce Boulevard, Suite 910, Suburbia",
        "9101 Ash Court, Apt. 234, Mountain Town",
        "2345 Poplar Road, Unit 678, River City",
        "6789 Willow Lane, Suite 123, Desert City",
        "1234 Maple Avenue, Suite 567, Lakeview"
    ]
    
    static private func getRandomReview() -> [Review]{
        let reviewList = [
            "This place was amazing - great location, beautiful decor, and friendly hosts!",
            "I had a wonderful stay at this place - the views were stunning and the amenities were top-notch.",
            "The apartment was cozy and comfortable, and the location couldn't be beat!",
            "I would definitely recommend this place to anyone looking for a stylish and comfortable stay in the city.",
            "The hosts were incredibly hospitable and went above and beyond to make our stay memorable.",
            "The place was clean and well-maintained, and had everything we needed for a relaxing getaway.",
            "I loved staying at this place - it was like a home away from home, with all the comforts and conveniences we needed.",
            "The location was perfect for exploring the city, and the apartment itself was spacious and well-appointed.",
            "The place exceeded our expectations - it was even better than the photos, and the hosts were so welcoming and friendly.",
            "I couldn't have asked for a better place to stay - it was comfortable, convenient, and had everything we needed.",
            "Absolutely loved my stay here! The views were breathtaking and the staff was incredibly friendly and helpful.",
            "The cleanliness was outstanding, everything was spotless and well-maintained."+" The experience was unforgettable, a memory that will stay with me for a lifetime."+" The ambiance was perfect, creating a warm and welcoming atmosphere.",
            "The decor was stylish and elegant, with attention to every detail."+" The garden was a beautiful oasis, filled with color and fragrant blooms."+" The history of the place was fascinating, a unique glimpse into the past.",
            "The location was perfect, with easy access to all the attractions and amenities we wanted to explore."+" The room was cozy and comfortable, a home away from home."+" The spa was heavenly, the perfect way to relax and unwind.",
            "The architecture was breathtaking, a true masterpiece that left me in awe."+" The service was exceptional, the staff were friendly and went above and beyond to make our stay comfortable."
        ]
        
        let userList = ["UD1101","UD1103","UD1104","UD1105","UD1106","UD1107","UD1108","UD1109","UD1110","UD1111","UD1112","UD1113","UD1114","UD1115"]
        
        let reviewCount = Int.random(in: 3..<14)
        
        let randomList = GeneralUtils.getRandomList(from: 0, to: reviewCount)
        
        var reviews : [Review] = []

        for i in 0 ..< reviewCount{
            reviews.append(
                Review(userID: userList[randomList[i]],
                       userName: nil,
                       review: reviewList[randomList[i]]))
        }
        
        return reviews
    }
    
    static private func getRandomRating() -> [Rating]{
        
        let ratingCount = Int.random(in: 3...27)
        
        let userList = ["UD1101","UD1103","UD1104","UD1105","UD1106","UD1107","UD1108","UD1109","UD1110","UD1111","UD1112","UD1113","UD1114","UD1115"]
        
        var ratingList : [Rating] = []
        
        for i in 1...ratingCount{
            ratingList.append(
                Rating(userID: userList[i%14], rating: Double(Int.random(in: 3...5)))
            )
        }
        
        return ratingList
    }
    
    static private func getRandomAmenity(row : Int) -> [Amenity]{
        var amenties : [Amenity] = []
        switch row%5{
        case 0:
            amenties = [
                Amenity.Air_Conditioning,
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
            ]
        case 1:
            amenties = [
                Amenity.Air_Conditioning,
                Amenity.CarbonMonoxide_Alarm,
                Amenity.First_Aid_Kit,
                Amenity.Fire_Extinguisher,
                Amenity.Pool,
                Amenity.Smoke_Alarm,
                Amenity.Self_CheckIn,
                Amenity.Wifi,
                Amenity.Kitchen
            ]
        case 2:
            amenties = [
                Amenity.Air_Conditioning,
                Amenity.Hot_Tub,
                Amenity.Fire_Extinguisher,
                Amenity.Pool,
                Amenity.Free_Parking,
                Amenity.Pets_Allowed,
                Amenity.Smoke_Alarm,
                Amenity.Washing_Machine,
                Amenity.Wifi,
            ]
        case 3:
            amenties = [
                Amenity.Air_Conditioning,
                Amenity.First_Aid_Kit,
                Amenity.Fire_Extinguisher,
                Amenity.Wifi
            ]
        case 4:
            amenties = [
                Amenity.Air_Conditioning,
                Amenity.CarbonMonoxide_Alarm,
                Amenity.Hot_Tub,
                Amenity.Fire_Extinguisher,
                Amenity.Pool,
                Amenity.Free_Parking,
                Amenity.Pets_Allowed,
                Amenity.Self_CheckIn,
                Amenity.Washing_Machine,
                Amenity.Kitchen
            ]
        default:
            break
        }
        return amenties
    }
    
    static private let placeNamesList = [
        "Seaside Paradise Resort",
        "Garden Oasis Hotel",
        "Azure Bay Resort",
        "Riverside Lodge",
        "Mountain View Inn",
        "Tropical Breeze Resort",
        "Harbor View Hotel",
        "Island Retreat Resort",
        "Sunset Haven Inn",
        "Coastal Escape Hotel",
        "Lakeside Resort",
        "Mountain Peaks Lodge",
        "Palm Grove Resort",
        "Sapphire Sky Hotel",
        "Wilderness Hideaway Lodge",
        "Mystic Pines Resort",
        "Ocean View Inn",
        "Desert Oasis Hotel",
        "Prairie Inn",
        "Redwood Forest Lodge",
        "Golden Sands Resort",
        "Silver Lake Hotel",
        "Cherry Blossom Inn",
        "Riverfront Resort",
        "Sunrise Lodge",
        "Rainforest Retreat Hotel",
        "Meadowview Inn",
        "Canyon View Resort",
        "Rustic Charm Lodge",
        "Highland Heights Hotel",
        "Majestic View Inn",
        "Luxury Heights Hotel",
        "Golden Horizon Resort",
        "Diamond Cove Lodge",
        "Crystal Waters Hotel",
        "Heavenly Retreat Resort",
        "Sea Spray Inn",
        "Mountain Vista Hotel",
        "Sunny Hill Resort",
        "Garden View Inn",
        "Pacific Palms Resort",
        "Tropical Oasis Lodge",
        "Countryside Manor Hotel",
        "Seashell Suites",
        "Bayside Breeze Inn",
        "Sandy Shores Resort",
        "Harmony Haven Lodge",
        "Vista del Mar Hotel",
        "Blue Horizon Resort",
        "Moonlight Bay Inn",
        "Serenity Cove Lodge",
        "Coral Reef Resort",
    ]

    static private let descriptionList = [
        "An oceanfront haven with unparalleled views and luxurious amenities.",
        "A lush retreat with stunning gardens and modern comforts.",
        "A tropical escape with white sandy beaches and crystal clear waters.",
        "A peaceful retreat nestled alongside a tranquil river.",
        "A cozy lodge with breathtaking views of snow-capped mountains.",
        "A relaxing getaway with swaying palm trees and warm tropical breezes.",
        "A charming coastal retreat with stunning harbor views.",
        "A secluded paradise with pristine beaches and untouched nature.",
        "A serene haven with picturesque sunset views and cozy accommodations.",
        "A modern hotel with prime oceanfront location and beach access.",
        "A tranquil oasis with peaceful lake views and plenty of outdoor activities.",
        "A luxurious resort with world-class amenities and unmatched hospitality.",
        "An intimate boutique hotel with unique decor and personalized service.",
        "A grand hotel with opulent design and sophisticated atmosphere.",
        "A family-friendly resort with endless activities and entertainment options.",
        "A historic hotel with rich cultural heritage and elegant architecture.",
        "A trendy boutique hotel with stylish design and trendy vibe.",
        "A modern hotel with sleek design and state-of-the-art amenities.",
        "A rustic lodge with cozy cabins and authentic mountain charm.",
        "A contemporary hotel with stunning city views and vibrant atmosphere.",
        "A secluded retreat with natural hot springs and rejuvenating spa treatments.",
        "A trendy beachfront hotel with modern decor and lively ambiance.",
        "A picturesque resort with panoramic views and natural beauty.",
        "A cozy inn with warm hospitality and comfortable accommodations.",
        "A luxurious hotel with elegant decor and world-class dining.",
        "A historic mansion turned boutique hotel with unique charm and personality.",
        "A contemporary resort with endless recreation options and stunning natural surroundings.",
        "A charming bed and breakfast with quaint rooms and homemade breakfast.",
        "A stylish hotel with chic design and central location.",
        "A secluded hideaway with lush gardens and serene atmosphere.",
        "A modern eco-friendly hotel with sustainable design and green amenities.",
        "A romantic retreat with candlelit dinners and cozy fireplaces.",
        "A sleek urban hotel with modern amenities and prime location.",
        "A beachfront resort with water sports and lively beach scene.",
        "A luxurious mountain lodge with cozy fireplaces and gourmet dining.",
        "A contemporary hotel with stunning rooftop pool and bar.",
        "A family-friendly hotel with spacious suites and kid-friendly amenities.",
        "A historic hotel with vintage decor and unique charm.",
        "A modern hotel with vibrant decor and eclectic design.",
        "A cozy inn with homemade breakfast and scenic surroundings.",
        "A luxurious resort with private beach and world-class spa.",
        "A trendy hotel with chic design and lively social scene.",
        "A secluded mountain retreat with stunning views and peaceful ambiance.",
        "A boutique hotel with unique design and personalized service.",
        "A contemporary beachfront hotel with sleek decor and stunning ocean views.",
        "A luxurious city hotel with opulent design and central location.",
        "A family-friendly resort with endless water park and pool options.",
        "A charming inn with cozy fireplaces and comfortable rooms.",
        "A historic hotel with elegant ballroom and rich cultural heritage.",
        "A modern hotel with cutting-edge technology and sleek design.",
        "A tranquil retreat with lush gardens and serene atmosphere.",
        "A luxurious beachfront resort with world-class amenities and white sandy beaches.",
    ]

    
    static private func getTravelPlaceDetails() -> [TravelPlaceDetail]{
        var travelPlaceDetails : [TravelPlaceDetail] = []
        
        for i in 1...50{
            travelPlaceDetails.append(
                TravelPlaceDetail(
                    placeId: i>9 ? "PD11"+String(i) : "PD110"+String(i),
                    placeName: placeNamesList[i],
                    description: descriptionList[i],
                    hostId: hostList[i%5],
                    noOfRooms: Int.random(in: 1...12),
                    noOfBedRooms: Int.random(in: 1...8),
                    noOfBathRooms: Int.random(in: 1...12),
                    noOfBeds: Int.random(in: 1...12),
                    noOfPeopleAccomodate: Int.random(in: 2...12),
                    isAvailable: true,
                    price:
                        Price(pricePerDay: Double(Int.random(in: 200...500)).round(to: 2), taxPercentage: Double.random(in: 1.0...25.0).round(to: 2), currencyCode: "USD"),
                    reviewDetail: getRandomReview(),
                    ratingDetail: getRandomRating(),
                    amenities: getRandomAmenity(row: i),
                    location: Location(
                        city: cityList[Int.random(in: 0..<cityList.count)],
                        state: stateList[Int.random(in: 0..<stateList.count)],
                        country: countryList[Int.random(in: 0..<countryList.count)],
                        address: addressList[Int.random(in: 0..<addressList.count)]
                    ),
                    images: imagesList[i-1],
                    isWishListed: false
                )
            )
        }
        
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

