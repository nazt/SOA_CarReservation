class Colour {
	static hasMany = [carstock:CarStock]
	String colour
    static constraints = {
    }
	String toString()
	{
		return "$colour"
	}
}
