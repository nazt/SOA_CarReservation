class Gear {
	static hasMany = [carstock:CarStock]
	String gear
	
    static constraints = {
    }
	String toString()
	{
		return "$id - $gear"
	}
}
