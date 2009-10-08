

class EngineController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ engineInstanceList: Engine.list( params ), engineInstanceTotal: Engine.count() ]
    }

    def show = {
        def engineInstance = Engine.get( params.id )

        if(!engineInstance) {
            flash.message = "Engine not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ engineInstance : engineInstance ] }
    }

    def delete = {
        def engineInstance = Engine.get( params.id )
        if(engineInstance) {
            try {
                engineInstance.delete(flush:true)
                flash.message = "Engine ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Engine ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Engine not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def engineInstance = Engine.get( params.id )

        if(!engineInstance) {
            flash.message = "Engine not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ engineInstance : engineInstance ]
        }
    }

    def update = {
        def engineInstance = Engine.get( params.id )
        if(engineInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(engineInstance.version > version) {
                    
                    engineInstance.errors.rejectValue("version", "engine.optimistic.locking.failure", "Another user has updated this Engine while you were editing.")
                    render(view:'edit',model:[engineInstance:engineInstance])
                    return
                }
            }
            engineInstance.properties = params
            if(!engineInstance.hasErrors() && engineInstance.save()) {
                flash.message = "Engine ${params.id} updated"
                redirect(action:show,id:engineInstance.id)
            }
            else {
                render(view:'edit',model:[engineInstance:engineInstance])
            }
        }
        else {
            flash.message = "Engine not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def engineInstance = new Engine()
        engineInstance.properties = params
        return ['engineInstance':engineInstance]
    }

    def save = {
        def engineInstance = new Engine(params)
        if(!engineInstance.hasErrors() && engineInstance.save()) {
            flash.message = "Engine ${engineInstance.id} created"
            redirect(action:show,id:engineInstance.id)
        }
        else {
            render(view:'create',model:[engineInstance:engineInstance])
        }
    }
}
