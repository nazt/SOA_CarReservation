class BootStrap {

     def init = { servletContext ->
		new Fuel(fuel:'Gasoline').save()
		new Fuel(fuel:'Diesel').save()		
		new CarBrand(brand:'Toyota').save()
		new CarBrand(brand:'Mitsubishi Motors').save()
		new CarType(type:'Pickup').save()
		new Engine(engine:'2,000 CC').save()		
		new Engine(engine:'1,500 CC').save()	
		new Gear(gear:'Automatic').save()
		new Gear(gear:'Manual').save()
		new Colour(colour:'Red').save()
		new Colour(colour:'Blue').save()
		new Colour(colour:'Green').save()
		new ReservStatus(status:'Pending').save()
		new ReservStatus(status:'Canceled').save()
		new ReservStatus(status:'Paid').save()
		new City(city:'Bangkok').save()
		new City(city:'Nakhonsawan').save()
		new DriverAgeList(age:'25+').save()
		new DriverAgeList(age:'14-24').save()
     }
     def destroy = {
     }
} 