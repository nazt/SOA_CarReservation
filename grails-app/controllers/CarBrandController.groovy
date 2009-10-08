

class CarBrandController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ carBrandInstanceList: CarBrand.list( params ), carBrandInstanceTotal: CarBrand.count() ]
    }

    def show = {
        def carBrandInstance = CarBrand.get( params.id )

        if(!carBrandInstance) {
            flash.message = "CarBrand not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ carBrandInstance : carBrandInstance ] }
    }

    def delete = {
        def carBrandInstance = CarBrand.get( params.id )
        if(carBrandInstance) {
            try {
                carBrandInstance.delete(flush:true)
                flash.message = "CarBrand ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "CarBrand ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "CarBrand not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def carBrandInstance = CarBrand.get( params.id )

        if(!carBrandInstance) {
            flash.message = "CarBrand not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ carBrandInstance : carBrandInstance ]
        }
    }

    def update = {
        def carBrandInstance = CarBrand.get( params.id )
        if(carBrandInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(carBrandInstance.version > version) {
                    
                    carBrandInstance.errors.rejectValue("version", "carBrand.optimistic.locking.failure", "Another user has updated this CarBrand while you were editing.")
                    render(view:'edit',model:[carBrandInstance:carBrandInstance])
                    return
                }
            }
            carBrandInstance.properties = params
            if(!carBrandInstance.hasErrors() && carBrandInstance.save()) {
                flash.message = "CarBrand ${params.id} updated"
                redirect(action:show,id:carBrandInstance.id)
            }
            else {
                render(view:'edit',model:[carBrandInstance:carBrandInstance])
            }
        }
        else {
            flash.message = "CarBrand not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def carBrandInstance = new CarBrand()
        carBrandInstance.properties = params
        return ['carBrandInstance':carBrandInstance]
    }

    def save = {
        def carBrandInstance = new CarBrand(params)
        if(!carBrandInstance.hasErrors() && carBrandInstance.save()) {
            flash.message = "CarBrand ${carBrandInstance.id} created"
            redirect(action:show,id:carBrandInstance.id)
        }
        else {
            render(view:'create',model:[carBrandInstance:carBrandInstance])
        }
    }
}
