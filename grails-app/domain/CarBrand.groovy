class CarBrand {
	static hasMany = [carstock:CarStock]
	String brand
    static constraints = {
    }
	String toString()
	{
		return "$id - $brand"
	}
}
