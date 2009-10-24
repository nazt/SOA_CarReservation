class City {
	String city
	String address
    static constraints = {
		city()
		address(nullable:true)
    }
	String toString()
	{
		return "$city"
	}
}
