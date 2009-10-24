class CarReservationService {

    boolean transactional = true
 	static expose=['xfire']


	Colour[] getColourList()
	{
		return Colour.list() as Colour[]
	}
	Gear[] getGearList()
	{
		return Gear.list() as Gear[]
	}	
	Engine[]  getEngineList()
	{
		return Engine.list() as Engine[] 
	}
	CarBrand[] getCarBrandList()
	{
		return CarBrand.list() as CarBrand[]
	}
	Fuel[] getFuelList()
	{
		return Fuel.list() as Fuel[]
	}	
	String echoBack(String input)
	{
		return "Hello" as String
	}
	String helloName(String name)
	{
		println "Hello, " + name as String
		return "Hello, " + name as String
	}
	String getColorFromId(Integer id)
	{
		def result= CarStock.find('from CarStock as c where c.id = '+id);
		return result.colour
	}
	String getColourFromId(Integer id)
	{
		def result= CarStock.find('from CarStock as c where c.id = '+id);
		return result.colour
	}	
	String getFuelFromId(Integer id)
	{
		def result= CarStock.find('from CarStock as c where c.id = '+id);
		return result.fuel
	}	
	
	String getEngineFromId(Integer id)
	{
		def result= CarStock.find('from CarStock as c where c.id = '+id);
		return result.engine
	}
	String getCarBrandFromId(Integer id)
	{
		def result= CarStock.find('from CarStock as c where c.id = '+id);
		return result.brand
	}
	String getGearFromId(Integer id)
	{
		def result= CarStock.find('from CarStock as c where c.id = '+id);
		return result.gear
	}	
	String getPickupCityFromId(Integer id)
	{
		def result= CarStock.find('from CarStock as c where c.id = '+id);
		return result.pickupCity
	}
	CarStock[] searchCar(String brand,String gear,String colour , String carType, String fuel ,String pickupCity)
	{
 
	 	def avail_stock= CarStock.findAll('from CarStock as c where c.reserved = false') as CarStock[]
		def result_stock=[]
		avail_stock.each {  
			if(   (it.colour.toString()==colour || colour.toUpperCase()=='ANY' ) && (it.brand.toString()==brand || brand.toUpperCase()=='ANY' ) && (it.gear.toString()==brand || gear.toUpperCase()=='ANY' )  && (it.type.toString()==carType || carType.toUpperCase()=='ANY' )  && (it.fuel.toString()==fuel || fuel.toUpperCase()=='ANY' ) && (it.pickupCity.toString()==pickupCity || pickupCity.toUpperCase()=='ANY' ) )
			{
				result_stock << it
			} 
		}
/*		println result_stock*/
		return result_stock as CarStock[]
	}
	CarStock[] getCarStock()
	{
		return CarStock.findAll('from CarStock as c where c.reserved = false') as CarStock[]
	}
	String reservCar(String ident,String name,Integer ageId,String phone,Integer pickCityId,Integer dropCityId,Integer carStockId)
	{
		def age=new DriverAgeList()
	
		def pickCity=new City()
		def dropCity=new City()
		def car=new CarStock()
		def rStatus=new ReservStatus()
		rStatus=rStatus.get(1)
		car=car.get(carStockId)
		pickCity=pickCity.get(pickCityId)
		dropCity=dropCity.get(dropCityId)
		age=age.get(ageId)
		println "rStatus = " + rStatus
		println "car = " + car
		println "pickCity = " + pickCity
		println "dropCity = " + dropCity
		println "age = " + age
		println "ident = "	+ ident
		println "name = " + name
		println "phone = " + phone
/*		 	def reservDetail=new ReservedDetail(identificationNumber:ident,driverName:name,driverAge:age,pickupCity:pickCity,dropoffCity:dropCity,status:rStatus,pickupDate:new Date(),dropoffDate:new Date())*/

		//reservDetail.error.each { println it }
		
/*		def reservDetail=new ReservedDetail(identificationNumber:ident,driverName:name,driverAge:age,pickupCity:pickCity,dropoffCity:dropCity,status:rStatus).save()
*/
 
/*pickupDate_hour:12,  pickupDate_year:2009, pickupDate_day:21, pickupDate:struct*/
		def reservedDetailInstance = new ReservedDetail([status:rStatus ,   dropoffCity:dropCity,   car:car,   identificationNumber:1159900101111,   driverName:'Nat Weerawan', pickupCity:pickCity, dropoffDate:new Date() , phoneNumber:'0891278553', driverAge:age,   pickupDate:new Date()])
		println reservedDetailInstance
		if (reservedDetailInstance.save() ) {
			println "OK SAVE!"
		}
		else
		{
			
			println "FAILED"
		}
		
/*		println reservDetail*/
		println "test"
/*		static belongsTo = [car:CarStock,driverAge:DriverAgeList,pickupCity:City,dropoffCity:City,status:ReservStatus]	
		String identificationNumber
		String driverName
		String phoneNumber*/
/*		[action:save, dropoffDate:struct, controller:reservedDetail, dropoffDate_minute:27, driverAge.id:1, pickupDate_month:10, dropoffDate_year:2009, dropoffDate_hour:12, dropoffCity:[id:1], dropoffDate_day:22, identificationNumber:1159900000012, driverName:Nat Weerawan, pickupCity:[id:1], pickupDate_minute:27, dropoffDate_month:10, dropoffCity.id:1, phoneNumber:0891278552, , pickupCity.id:1]*/
	//	pickupDate_hour:12,  pickupDate_year:2009, pickupDate_day:21, pickupDate:struct
		
	}
}
