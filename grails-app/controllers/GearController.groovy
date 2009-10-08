

class GearController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ gearInstanceList: Gear.list( params ), gearInstanceTotal: Gear.count() ]
    }

    def show = {
        def gearInstance = Gear.get( params.id )

        if(!gearInstance) {
            flash.message = "Gear not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ gearInstance : gearInstance ] }
    }

    def delete = {
        def gearInstance = Gear.get( params.id )
        if(gearInstance) {
            try {
                gearInstance.delete(flush:true)
                flash.message = "Gear ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Gear ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Gear not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def gearInstance = Gear.get( params.id )

        if(!gearInstance) {
            flash.message = "Gear not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ gearInstance : gearInstance ]
        }
    }

    def update = {
        def gearInstance = Gear.get( params.id )
        if(gearInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(gearInstance.version > version) {
                    
                    gearInstance.errors.rejectValue("version", "gear.optimistic.locking.failure", "Another user has updated this Gear while you were editing.")
                    render(view:'edit',model:[gearInstance:gearInstance])
                    return
                }
            }
            gearInstance.properties = params
            if(!gearInstance.hasErrors() && gearInstance.save()) {
                flash.message = "Gear ${params.id} updated"
                redirect(action:show,id:gearInstance.id)
            }
            else {
                render(view:'edit',model:[gearInstance:gearInstance])
            }
        }
        else {
            flash.message = "Gear not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def gearInstance = new Gear()
        gearInstance.properties = params
        return ['gearInstance':gearInstance]
    }

    def save = {
        def gearInstance = new Gear(params)
        if(!gearInstance.hasErrors() && gearInstance.save()) {
            flash.message = "Gear ${gearInstance.id} created"
            redirect(action:show,id:gearInstance.id)
        }
        else {
            render(view:'create',model:[gearInstance:gearInstance])
        }
    }
}
