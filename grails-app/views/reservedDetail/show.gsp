

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show ReservedDetail</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">ReservedDetail List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New ReservedDetail</g:link></span>
        </div>
        <div class="body">
            <h1>Show ReservedDetail</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:reservedDetailInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Identification Number:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:reservedDetailInstance, field:'identificationNumber')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Driver Name:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:reservedDetailInstance, field:'driverName')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Driver Age:</td>
                            
                            <td valign="top" class="value"><g:link controller="driverAgeList" action="show" id="${reservedDetailInstance?.driverAge?.id}">${reservedDetailInstance?.driverAge?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Phone Number:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:reservedDetailInstance, field:'phoneNumber')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Pickup City:</td>
                            
                            <td valign="top" class="value"><g:link controller="city" action="show" id="${reservedDetailInstance?.pickupCity?.id}">${reservedDetailInstance?.pickupCity?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Dropoff City:</td>
                            
                            <td valign="top" class="value"><g:link controller="city" action="show" id="${reservedDetailInstance?.dropoffCity?.id}">${reservedDetailInstance?.dropoffCity?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Pickup Date:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:reservedDetailInstance, field:'pickupDate')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Dropoff Date:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:reservedDetailInstance, field:'dropoffDate')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Car:</td>
                            
                            <td valign="top" class="value"><g:link controller="carStock" action="show" id="${reservedDetailInstance?.car?.id}">${reservedDetailInstance?.car?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${reservedDetailInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
