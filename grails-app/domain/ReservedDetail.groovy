class ReservedDetail {
	static belongsTo = [car:CarStock,driverAge:DriverAgeList,pickupCity:City,dropoffCity:City]	
	String identificationNumber
	String driverName
	String phoneNumber
	
	Date pickupDate
	Date dropoffDate
    static constraints = {
		identificationNumber()
 		driverName()
		driverAge()
		phoneNumber()
		pickupCity()
		dropoffCity()
		pickupDate()
		dropoffDate()
    }
}
