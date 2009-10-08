

class ColourController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ colourInstanceList: Colour.list( params ), colourInstanceTotal: Colour.count() ]
    }

    def show = {
        def colourInstance = Colour.get( params.id )

        if(!colourInstance) {
            flash.message = "Colour not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ colourInstance : colourInstance ] }
    }

    def delete = {
        def colourInstance = Colour.get( params.id )
        if(colourInstance) {
            try {
                colourInstance.delete(flush:true)
                flash.message = "Colour ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Colour ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Colour not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def colourInstance = Colour.get( params.id )

        if(!colourInstance) {
            flash.message = "Colour not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ colourInstance : colourInstance ]
        }
    }

    def update = {
        def colourInstance = Colour.get( params.id )
        if(colourInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(colourInstance.version > version) {
                    
                    colourInstance.errors.rejectValue("version", "colour.optimistic.locking.failure", "Another user has updated this Colour while you were editing.")
                    render(view:'edit',model:[colourInstance:colourInstance])
                    return
                }
            }
            colourInstance.properties = params
            if(!colourInstance.hasErrors() && colourInstance.save()) {
                flash.message = "Colour ${params.id} updated"
                redirect(action:show,id:colourInstance.id)
            }
            else {
                render(view:'edit',model:[colourInstance:colourInstance])
            }
        }
        else {
            flash.message = "Colour not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def colourInstance = new Colour()
        colourInstance.properties = params
        return ['colourInstance':colourInstance]
    }

    def save = {
        def colourInstance = new Colour(params)
        if(!colourInstance.hasErrors() && colourInstance.save()) {
            flash.message = "Colour ${colourInstance.id} created"
            redirect(action:show,id:colourInstance.id)
        }
        else {
            render(view:'create',model:[colourInstance:colourInstance])
        }
    }
}
