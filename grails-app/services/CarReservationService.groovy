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
/*	CarStock[] getCarStock()
	{
		return CarStock.list() as CarStock[]
	}*/
}
