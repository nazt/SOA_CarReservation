

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'reservedDetail.label', default: 'ReservedDetail')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reservedDetail.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: reservedDetailInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reservedDetail.identificationNumber.label" default="Identification Number" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: reservedDetailInstance, field: "identificationNumber")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reservedDetail.driverName.label" default="Driver Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: reservedDetailInstance, field: "driverName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reservedDetail.driverAge.label" default="Driver Age" /></td>
                            
                            <td valign="top" class="value"><g:link controller="driverAgeList" action="show" id="${reservedDetailInstance?.driverAge?.id}">${reservedDetailInstance?.driverAge?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reservedDetail.phoneNumber.label" default="Phone Number" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: reservedDetailInstance, field: "phoneNumber")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reservedDetail.pickupCity.label" default="Pickup City" /></td>
                            
                            <td valign="top" class="value"><g:link controller="city" action="show" id="${reservedDetailInstance?.pickupCity?.id}">${reservedDetailInstance?.pickupCity?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reservedDetail.dropoffCity.label" default="Dropoff City" /></td>
                            
                            <td valign="top" class="value"><g:link controller="city" action="show" id="${reservedDetailInstance?.dropoffCity?.id}">${reservedDetailInstance?.dropoffCity?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reservedDetail.pickupDate.label" default="Pickup Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${reservedDetailInstance?.pickupDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reservedDetail.dropoffDate.label" default="Dropoff Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${reservedDetailInstance?.dropoffDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reservedDetail.status.label" default="Status" /></td>
                            
                            <td valign="top" class="value"><g:link controller="reservStatus" action="show" id="${reservedDetailInstance?.status?.id}">${reservedDetailInstance?.status?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reservedDetail.car.label" default="Car" /></td>
                            
                            <td valign="top" class="value"><g:link controller="carStock" action="show" id="${reservedDetailInstance?.car?.id}">${reservedDetailInstance?.car?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${reservedDetailInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
