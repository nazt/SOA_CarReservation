class City {
	String name
	String address
    static constraints = {
		name()
		address(nullable:true)
    }
	String toString()
	{
		return "$name"
	}
}
