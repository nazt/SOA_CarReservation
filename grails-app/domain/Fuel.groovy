class Fuel {
	static hasMany = [carstock:CarStock]
	String fuel
    static constraints = {
    }
	String toString()
	{
		return "$id - $fuel"
	}
}
