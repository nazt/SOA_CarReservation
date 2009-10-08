

class ReservedDetailController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ reservedDetailInstanceList: ReservedDetail.list( params ), reservedDetailInstanceTotal: ReservedDetail.count() ]
    }

    def show = {
        def reservedDetailInstance = ReservedDetail.get( params.id )

        if(!reservedDetailInstance) {
            flash.message = "ReservedDetail not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ reservedDetailInstance : reservedDetailInstance ] }
    }

    def delete = {
        def reservedDetailInstance = ReservedDetail.get( params.id )
        if(reservedDetailInstance) {
            try {
                reservedDetailInstance.delete(flush:true)
                flash.message = "ReservedDetail ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "ReservedDetail ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "ReservedDetail not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def reservedDetailInstance = ReservedDetail.get( params.id )

        if(!reservedDetailInstance) {
            flash.message = "ReservedDetail not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ reservedDetailInstance : reservedDetailInstance ]
        }
    }

    def update = {
        def reservedDetailInstance = ReservedDetail.get( params.id )
        if(reservedDetailInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(reservedDetailInstance.version > version) {
                    
                    reservedDetailInstance.errors.rejectValue("version", "reservedDetail.optimistic.locking.failure", "Another user has updated this ReservedDetail while you were editing.")
                    render(view:'edit',model:[reservedDetailInstance:reservedDetailInstance])
                    return
                }
            }
            reservedDetailInstance.properties = params
            if(!reservedDetailInstance.hasErrors() && reservedDetailInstance.save()) {
                flash.message = "ReservedDetail ${params.id} updated"
                redirect(action:show,id:reservedDetailInstance.id)
            }
            else {
                render(view:'edit',model:[reservedDetailInstance:reservedDetailInstance])
            }
        }
        else {
            flash.message = "ReservedDetail not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def reservedDetailInstance = new ReservedDetail()
        reservedDetailInstance.properties = params
        return ['reservedDetailInstance':reservedDetailInstance]
    }

    def save = {
        def reservedDetailInstance = new ReservedDetail(params)
        if(!reservedDetailInstance.hasErrors() && reservedDetailInstance.save()) {
            flash.message = "ReservedDetail ${reservedDetailInstance.id} created"
            redirect(action:show,id:reservedDetailInstance.id)
        }
        else {
            render(view:'create',model:[reservedDetailInstance:reservedDetailInstance])
        }
    }
}
