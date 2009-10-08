class ReservedDetail {
	static belongsTo = [car:CarStock]	
	String driverName
	
    static constraints = {
	driverName()
    }
}
