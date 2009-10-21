

class DriverAgeListController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ driverAgeListInstanceList: DriverAgeList.list( params ), driverAgeListInstanceTotal: DriverAgeList.count() ]
    }

    def show = {
        def driverAgeListInstance = DriverAgeList.get( params.id )

        if(!driverAgeListInstance) {
            flash.message = "DriverAgeList not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ driverAgeListInstance : driverAgeListInstance ] }
    }

    def delete = {
        def driverAgeListInstance = DriverAgeList.get( params.id )
        if(driverAgeListInstance) {
            try {
                driverAgeListInstance.delete(flush:true)
                flash.message = "DriverAgeList ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "DriverAgeList ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "DriverAgeList not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def driverAgeListInstance = DriverAgeList.get( params.id )

        if(!driverAgeListInstance) {
            flash.message = "DriverAgeList not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ driverAgeListInstance : driverAgeListInstance ]
        }
    }

    def update = {
        def driverAgeListInstance = DriverAgeList.get( params.id )
        if(driverAgeListInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(driverAgeListInstance.version > version) {
                    
                    driverAgeListInstance.errors.rejectValue("version", "driverAgeList.optimistic.locking.failure", "Another user has updated this DriverAgeList while you were editing.")
                    render(view:'edit',model:[driverAgeListInstance:driverAgeListInstance])
                    return
                }
            }
            driverAgeListInstance.properties = params
            if(!driverAgeListInstance.hasErrors() && driverAgeListInstance.save()) {
                flash.message = "DriverAgeList ${params.id} updated"
                redirect(action:show,id:driverAgeListInstance.id)
            }
            else {
                render(view:'edit',model:[driverAgeListInstance:driverAgeListInstance])
            }
        }
        else {
            flash.message = "DriverAgeList not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def driverAgeListInstance = new DriverAgeList()
        driverAgeListInstance.properties = params
        return ['driverAgeListInstance':driverAgeListInstance]
    }

    def save = {
        def driverAgeListInstance = new DriverAgeList(params)
        if(!driverAgeListInstance.hasErrors() && driverAgeListInstance.save()) {
            flash.message = "DriverAgeList ${driverAgeListInstance.id} created"
            redirect(action:show,id:driverAgeListInstance.id)
        }
        else {
            render(view:'create',model:[driverAgeListInstance:driverAgeListInstance])
        }
    }
}
