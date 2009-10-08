

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Fuel</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Fuel List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Fuel</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Fuel</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${fuelInstance}">
            <div class="errors">
                <g:renderErrors bean="${fuelInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${fuelInstance?.id}" />
                <input type="hidden" name="version" value="${fuelInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="carstock">Carstock:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:fuelInstance,field:'carstock','errors')}">
                                    
<ul>
<g:each var="c" in="${fuelInstance?.carstock?}">
    <li><g:link controller="carStock" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="carStock" params="['fuel.id':fuelInstance?.id]" action="create">Add CarStock</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fuel">Fuel:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:fuelInstance,field:'fuel','errors')}">
                                    <input type="text" id="fuel" name="fuel" value="${fieldValue(bean:fuelInstance,field:'fuel')}"/>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
