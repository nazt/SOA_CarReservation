

class CarStockController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ carStockInstanceList: CarStock.list( params ), carStockInstanceTotal: CarStock.count() ]
    }

    def show = {
        def carStockInstance = CarStock.get( params.id )

        if(!carStockInstance) {
            flash.message = "CarStock not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ carStockInstance : carStockInstance ] }
    }

    def delete = {
        def carStockInstance = CarStock.get( params.id )
        if(carStockInstance) {
            try {
                carStockInstance.delete(flush:true)
                flash.message = "CarStock ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "CarStock ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "CarStock not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def carStockInstance = CarStock.get( params.id )

        if(!carStockInstance) {
            flash.message = "CarStock not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ carStockInstance : carStockInstance ]
        }
    }

    def update = {
        def carStockInstance = CarStock.get( params.id )
        if(carStockInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(carStockInstance.version > version) {
                    
                    carStockInstance.errors.rejectValue("version", "carStock.optimistic.locking.failure", "Another user has updated this CarStock while you were editing.")
                    render(view:'edit',model:[carStockInstance:carStockInstance])
                    return
                }
            }
            carStockInstance.properties = params
            if(!carStockInstance.hasErrors() && carStockInstance.save()) {
                flash.message = "CarStock ${params.id} updated"
                redirect(action:show,id:carStockInstance.id)
            }
            else {
                render(view:'edit',model:[carStockInstance:carStockInstance])
            }
        }
        else {
            flash.message = "CarStock not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def carStockInstance = new CarStock()
        carStockInstance.properties = params
        return ['carStockInstance':carStockInstance]
    }

    def save = {
        def carStockInstance = new CarStock(params)
        if(!carStockInstance.hasErrors() && carStockInstance.save()) {
            flash.message = "CarStock ${carStockInstance.id} created"
            redirect(action:show,id:carStockInstance.id)
        }
        else {
            render(view:'create',model:[carStockInstance:carStockInstance])
        }
    }
}
