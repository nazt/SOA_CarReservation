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
}
