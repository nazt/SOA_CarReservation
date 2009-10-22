class CarStockController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [carStockInstanceList: CarStock.list(params), carStockInstanceTotal: CarStock.count()]
    }

    def create = {
        def carStockInstance = new CarStock()
        carStockInstance.properties = params
        return [carStockInstance: carStockInstance]
    }

    def save = {
        def carStockInstance = new CarStock(params)
        if (carStockInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'carStock.label', default: 'CarStock'), carStockInstance.id])}"
            redirect(action: "show", id: carStockInstance.id)
        }
        else {
            render(view: "create", model: [carStockInstance: carStockInstance])
        }
    }

    def show = {
        def carStockInstance = CarStock.get(params.id)
        if (!carStockInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'carStock.label', default: 'CarStock'), params.id])}"
            redirect(action: "list")
        }
        else {
            [carStockInstance: carStockInstance]
        }
    }

    def edit = {
        def carStockInstance = CarStock.get(params.id)
        if (!carStockInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'carStock.label', default: 'CarStock'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [carStockInstance: carStockInstance]
        }
    }

    def update = {
        def carStockInstance = CarStock.get(params.id)
        if (carStockInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (carStockInstance.version > version) {
                    
                    carStockInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'carStock.label', default: 'CarStock')], "Another user has updated this CarStock while you were editing")
                    render(view: "edit", model: [carStockInstance: carStockInstance])
                    return
                }
            }
            carStockInstance.properties = params
            if (!carStockInstance.hasErrors() && carStockInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'carStock.label', default: 'CarStock'), carStockInstance.id])}"
                redirect(action: "show", id: carStockInstance.id)
            }
            else {
                render(view: "edit", model: [carStockInstance: carStockInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'carStock.label', default: 'CarStock'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def carStockInstance = CarStock.get(params.id)
        if (carStockInstance) {
            try {
                carStockInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'carStock.label', default: 'CarStock'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'carStock.label', default: 'CarStock'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'carStock.label', default: 'CarStock'), params.id])}"
            redirect(action: "list")
        }
    }
}
