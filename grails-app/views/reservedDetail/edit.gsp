

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit ReservedDetail</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">ReservedDetail List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New ReservedDetail</g:link></span>
        </div>
        <div class="body">
            <h1>Edit ReservedDetail</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${reservedDetailInstance}">
            <div class="errors">
                <g:renderErrors bean="${reservedDetailInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${reservedDetailInstance?.id}" />
                <input type="hidden" name="version" value="${reservedDetailInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="car">Car:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:reservedDetailInstance,field:'car','errors')}">
                                    <g:select optionKey="id" from="${CarStock.list()}" name="car.id" value="${reservedDetailInstance?.car?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="driverName">Driver Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:reservedDetailInstance,field:'driverName','errors')}">
                                    <input type="text" id="driverName" name="driverName" value="${fieldValue(bean:reservedDetailInstance,field:'driverName')}"/>
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
