

class FuelController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ fuelInstanceList: Fuel.list( params ), fuelInstanceTotal: Fuel.count() ]
    }

    def show = {
        def fuelInstance = Fuel.get( params.id )

        if(!fuelInstance) {
            flash.message = "Fuel not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ fuelInstance : fuelInstance ] }
    }

    def delete = {
        def fuelInstance = Fuel.get( params.id )
        if(fuelInstance) {
            try {
                fuelInstance.delete(flush:true)
                flash.message = "Fuel ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Fuel ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Fuel not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def fuelInstance = Fuel.get( params.id )

        if(!fuelInstance) {
            flash.message = "Fuel not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ fuelInstance : fuelInstance ]
        }
    }

    def update = {
        def fuelInstance = Fuel.get( params.id )
        if(fuelInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(fuelInstance.version > version) {
                    
                    fuelInstance.errors.rejectValue("version", "fuel.optimistic.locking.failure", "Another user has updated this Fuel while you were editing.")
                    render(view:'edit',model:[fuelInstance:fuelInstance])
                    return
                }
            }
            fuelInstance.properties = params
            if(!fuelInstance.hasErrors() && fuelInstance.save()) {
                flash.message = "Fuel ${params.id} updated"
                redirect(action:show,id:fuelInstance.id)
            }
            else {
                render(view:'edit',model:[fuelInstance:fuelInstance])
            }
        }
        else {
            flash.message = "Fuel not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def fuelInstance = new Fuel()
        fuelInstance.properties = params
        return ['fuelInstance':fuelInstance]
    }

    def save = {
        def fuelInstance = new Fuel(params)
        if(!fuelInstance.hasErrors() && fuelInstance.save()) {
            flash.message = "Fuel ${fuelInstance.id} created"
            redirect(action:show,id:fuelInstance.id)
        }
        else {
            render(view:'create',model:[fuelInstance:fuelInstance])
        }
    }
}
