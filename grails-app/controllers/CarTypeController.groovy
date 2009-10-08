

class CarTypeController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ carTypeInstanceList: CarType.list( params ), carTypeInstanceTotal: CarType.count() ]
    }

    def show = {
        def carTypeInstance = CarType.get( params.id )

        if(!carTypeInstance) {
            flash.message = "CarType not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ carTypeInstance : carTypeInstance ] }
    }

    def delete = {
        def carTypeInstance = CarType.get( params.id )
        if(carTypeInstance) {
            try {
                carTypeInstance.delete(flush:true)
                flash.message = "CarType ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "CarType ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "CarType not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def carTypeInstance = CarType.get( params.id )

        if(!carTypeInstance) {
            flash.message = "CarType not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ carTypeInstance : carTypeInstance ]
        }
    }

    def update = {
        def carTypeInstance = CarType.get( params.id )
        if(carTypeInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(carTypeInstance.version > version) {
                    
                    carTypeInstance.errors.rejectValue("version", "carType.optimistic.locking.failure", "Another user has updated this CarType while you were editing.")
                    render(view:'edit',model:[carTypeInstance:carTypeInstance])
                    return
                }
            }
            carTypeInstance.properties = params
            if(!carTypeInstance.hasErrors() && carTypeInstance.save()) {
                flash.message = "CarType ${params.id} updated"
                redirect(action:show,id:carTypeInstance.id)
            }
            else {
                render(view:'edit',model:[carTypeInstance:carTypeInstance])
            }
        }
        else {
            flash.message = "CarType not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def carTypeInstance = new CarType()
        carTypeInstance.properties = params
        return ['carTypeInstance':carTypeInstance]
    }

    def save = {
        def carTypeInstance = new CarType(params)
        if(!carTypeInstance.hasErrors() && carTypeInstance.save()) {
            flash.message = "CarType ${carTypeInstance.id} created"
            redirect(action:show,id:carTypeInstance.id)
        }
        else {
            render(view:'create',model:[carTypeInstance:carTypeInstance])
        }
    }
}
