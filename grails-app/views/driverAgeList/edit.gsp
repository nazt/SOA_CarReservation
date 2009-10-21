

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit DriverAgeList</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">DriverAgeList List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New DriverAgeList</g:link></span>
        </div>
        <div class="body">
            <h1>Edit DriverAgeList</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${driverAgeListInstance}">
            <div class="errors">
                <g:renderErrors bean="${driverAgeListInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${driverAgeListInstance?.id}" />
                <input type="hidden" name="version" value="${driverAgeListInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="age">Age:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:driverAgeListInstance,field:'age','errors')}">
                                    <input type="text" id="age" name="age" value="${fieldValue(bean:driverAgeListInstance,field:'age')}"/>
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
