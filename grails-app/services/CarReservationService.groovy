class CarReservationService {

    boolean transactional = true
 	static expose=['xfire']

    def serviceMethod() {

    }
	Colour[] getColourList()
	{
		Colour.list() as Colour[]
	}
	Gear[] getGearList()
	{
		Gear.list() as Gear[]
	}	
	Engine[] getEngineList()
	{
		Engine.list() as Engine[]
	}
	CarBrand[] getCarBrandList()
	{
		CarBrand.list() as CarBrand[]
	}
	Fuel[] getEngineList()
	{
		Fuel.list() as Engine[]
	}	
	String echoBack(String input)
	{
		return "Hello" as String
	}
	CarStock[] searchCar(String colour,String engine,String fuel,String carType)
	{
		println colour 
		CarStock.list() as CarStock[]
	}
}
