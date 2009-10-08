

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Gear</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Gear List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Gear</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Gear</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${gearInstance}">
            <div class="errors">
                <g:renderErrors bean="${gearInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${gearInstance?.id}" />
                <input type="hidden" name="version" value="${gearInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="carstock">Carstock:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:gearInstance,field:'carstock','errors')}">
                                    
<ul>
<g:each var="c" in="${gearInstance?.carstock?}">
    <li><g:link controller="carStock" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="carStock" params="['gear.id':gearInstance?.id]" action="create">Add CarStock</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="gear">Gear:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:gearInstance,field:'gear','errors')}">
                                    <input type="text" id="gear" name="gear" value="${fieldValue(bean:gearInstance,field:'gear')}"/>
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
