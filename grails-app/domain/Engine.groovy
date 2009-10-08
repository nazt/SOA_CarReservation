class Engine {
	static hasMany = [carstock:CarStock]
	String engine
    static constraints = {
    }
	String toString()
	{
		return "$id - $engine"
	}
}
