class CarType {
	static hasMany = [carstock:CarStock]
	String type
    static constraints = {
    }
	String toString()
	{
		return "$type"
	}
}
