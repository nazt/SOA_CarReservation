class ReservedDetail {
	static belongsTo = [car:CarStock,driverAge:DriverAgeList, dropoffCity:City,status:ReservStatus]	
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
		dropoffCity()
		pickupDate()
		dropoffDate()
		status()
    }
}
