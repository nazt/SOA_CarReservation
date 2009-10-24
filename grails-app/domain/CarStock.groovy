class CarStock {
	static belongsTo = [pickupCity:City,colour:Colour,brand:CarBrand,engine:Engine,fuel:Fuel,type:CarType,gear:Gear]
	static hasMany = [revervedDetail:ReservedDetail]
static xmlTransients = ['colour','brand','engine','fuel','type','gear','pickupCity']
	String model
	String carRegistration
	Boolean reserved
	Date dateCreated
	Date lastUpdated
	Double rate
	
	
    static constraints = {
		brand()
		model()
		colour()
		gear()
		type()
		engine()
		fuel()
		carRegistration(nullable:false)
		pickupCity()
		rate()
		reserved()
    }
	String toString()
	{
		return "$id - $carRegistration"
	}
}
