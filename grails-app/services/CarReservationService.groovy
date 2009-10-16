class CarReservationService {

    boolean transactional = true
 	static expose=['xfire']

    def serviceMethod() {

    }
	Colour[] getColours()
	{
		Colour.list() as Colour[]
	}
}
