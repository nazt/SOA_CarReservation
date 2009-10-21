

class CityController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ cityInstanceList: City.list( params ), cityInstanceTotal: City.count() ]
    }

    def show = {
        def cityInstance = City.get( params.id )

        if(!cityInstance) {
            flash.message = "City not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ cityInstance : cityInstance ] }
    }

    def delete = {
        def cityInstance = City.get( params.id )
        if(cityInstance) {
            try {
                cityInstance.delete(flush:true)
                flash.message = "City ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "City ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "City not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def cityInstance = City.get( params.id )

        if(!cityInstance) {
            flash.message = "City not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ cityInstance : cityInstance ]
        }
    }

    def update = {
        def cityInstance = City.get( params.id )
        if(cityInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(cityInstance.version > version) {
                    
                    cityInstance.errors.rejectValue("version", "city.optimistic.locking.failure", "Another user has updated this City while you were editing.")
                    render(view:'edit',model:[cityInstance:cityInstance])
                    return
                }
            }
            cityInstance.properties = params
            if(!cityInstance.hasErrors() && cityInstance.save()) {
                flash.message = "City ${params.id} updated"
                redirect(action:show,id:cityInstance.id)
            }
            else {
                render(view:'edit',model:[cityInstance:cityInstance])
            }
        }
        else {
            flash.message = "City not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def cityInstance = new City()
        cityInstance.properties = params
        return ['cityInstance':cityInstance]
    }

    def save = {
        def cityInstance = new City(params)
        if(!cityInstance.hasErrors() && cityInstance.save()) {
            flash.message = "City ${cityInstance.id} created"
            redirect(action:show,id:cityInstance.id)
        }
        else {
            render(view:'create',model:[cityInstance:cityInstance])
        }
    }
}
