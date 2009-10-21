class City {
	String name
	String address
    static constraints = {
		name()
		address()
    }
	String toString()
	{
		return "$name"
	}
}
