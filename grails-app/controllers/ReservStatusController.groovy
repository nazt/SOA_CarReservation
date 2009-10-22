class ReservStatusController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [reservStatusInstanceList: ReservStatus.list(params), reservStatusInstanceTotal: ReservStatus.count()]
    }

    def create = {
        def reservStatusInstance = new ReservStatus()
        reservStatusInstance.properties = params
        return [reservStatusInstance: reservStatusInstance]
    }

    def save = {
        def reservStatusInstance = new ReservStatus(params)
        if (reservStatusInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'reservStatus.label', default: 'ReservStatus'), reservStatusInstance.id])}"
            redirect(action: "show", id: reservStatusInstance.id)
        }
        else {
            render(view: "create", model: [reservStatusInstance: reservStatusInstance])
        }
    }

    def show = {
        def reservStatusInstance = ReservStatus.get(params.id)
        if (!reservStatusInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reservStatus.label', default: 'ReservStatus'), params.id])}"
            redirect(action: "list")
        }
        else {
            [reservStatusInstance: reservStatusInstance]
        }
    }

    def edit = {
        def reservStatusInstance = ReservStatus.get(params.id)
        if (!reservStatusInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reservStatus.label', default: 'ReservStatus'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [reservStatusInstance: reservStatusInstance]
        }
    }

    def update = {
        def reservStatusInstance = ReservStatus.get(params.id)
        if (reservStatusInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (reservStatusInstance.version > version) {
                    
                    reservStatusInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'reservStatus.label', default: 'ReservStatus')], "Another user has updated this ReservStatus while you were editing")
                    render(view: "edit", model: [reservStatusInstance: reservStatusInstance])
                    return
                }
            }
            reservStatusInstance.properties = params
            if (!reservStatusInstance.hasErrors() && reservStatusInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'reservStatus.label', default: 'ReservStatus'), reservStatusInstance.id])}"
                redirect(action: "show", id: reservStatusInstance.id)
            }
            else {
                render(view: "edit", model: [reservStatusInstance: reservStatusInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reservStatus.label', default: 'ReservStatus'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def reservStatusInstance = ReservStatus.get(params.id)
        if (reservStatusInstance) {
            try {
                reservStatusInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'reservStatus.label', default: 'ReservStatus'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'reservStatus.label', default: 'ReservStatus'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reservStatus.label', default: 'ReservStatus'), params.id])}"
            redirect(action: "list")
        }
    }
}
