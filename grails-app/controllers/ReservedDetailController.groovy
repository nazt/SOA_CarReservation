class ReservedDetailController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [reservedDetailInstanceList: ReservedDetail.list(params), reservedDetailInstanceTotal: ReservedDetail.count()]
    }

    def create = {
        def reservedDetailInstance = new ReservedDetail()
        reservedDetailInstance.properties = params
        return [reservedDetailInstance: reservedDetailInstance]
    }

    def save = {
	println params
	params.each{ print it ; print  " -- " ;  println  it.class }
        def reservedDetailInstance = new ReservedDetail(params)
        if (reservedDetailInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'reservedDetail.label', default: 'ReservedDetail'), reservedDetailInstance.id])}"
            redirect(action: "show", id: reservedDetailInstance.id)
        }
        else {
            render(view: "create", model: [reservedDetailInstance: reservedDetailInstance])
        }
    }

    def show = {
        def reservedDetailInstance = ReservedDetail.get(params.id)
        if (!reservedDetailInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reservedDetail.label', default: 'ReservedDetail'), params.id])}"
            redirect(action: "list")
        }
        else {
            [reservedDetailInstance: reservedDetailInstance]
        }
    }

    def edit = {
        def reservedDetailInstance = ReservedDetail.get(params.id)
        if (!reservedDetailInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reservedDetail.label', default: 'ReservedDetail'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [reservedDetailInstance: reservedDetailInstance]
        }
    }

    def update = {
        def reservedDetailInstance = ReservedDetail.get(params.id)
        if (reservedDetailInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (reservedDetailInstance.version > version) {
                    
                    reservedDetailInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'reservedDetail.label', default: 'ReservedDetail')], "Another user has updated this ReservedDetail while you were editing")
                    render(view: "edit", model: [reservedDetailInstance: reservedDetailInstance])
                    return
                }
            }
            reservedDetailInstance.properties = params
            if (!reservedDetailInstance.hasErrors() && reservedDetailInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'reservedDetail.label', default: 'ReservedDetail'), reservedDetailInstance.id])}"
                redirect(action: "show", id: reservedDetailInstance.id)
            }
            else {
                render(view: "edit", model: [reservedDetailInstance: reservedDetailInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reservedDetail.label', default: 'ReservedDetail'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def reservedDetailInstance = ReservedDetail.get(params.id)
        if (reservedDetailInstance) {
            try {
                reservedDetailInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'reservedDetail.label', default: 'ReservedDetail'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'reservedDetail.label', default: 'ReservedDetail'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reservedDetail.label', default: 'ReservedDetail'), params.id])}"
            redirect(action: "list")
        }
    }
}
