

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'reservedDetail.label', default: 'ReservedDetail')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${reservedDetailInstance}">
            <div class="errors">
                <g:renderErrors bean="${reservedDetailInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${reservedDetailInstance?.id}" />
                <g:hiddenField name="version" value="${reservedDetailInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="identificationNumber"><g:message code="reservedDetail.identificationNumber.label" default="Identification Number" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reservedDetailInstance, field: 'identificationNumber', 'errors')}">
                                    <g:textField name="identificationNumber" value="${reservedDetailInstance?.identificationNumber}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="driverName"><g:message code="reservedDetail.driverName.label" default="Driver Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reservedDetailInstance, field: 'driverName', 'errors')}">
                                    <g:textField name="driverName" value="${reservedDetailInstance?.driverName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="driverAge"><g:message code="reservedDetail.driverAge.label" default="Driver Age" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reservedDetailInstance, field: 'driverAge', 'errors')}">
                                    <g:select name="driverAge.id" from="${DriverAgeList.list()}" optionKey="id" value="${reservedDetailInstance?.driverAge?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="phoneNumber"><g:message code="reservedDetail.phoneNumber.label" default="Phone Number" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reservedDetailInstance, field: 'phoneNumber', 'errors')}">
                                    <g:textField name="phoneNumber" value="${reservedDetailInstance?.phoneNumber}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="pickupCity"><g:message code="reservedDetail.pickupCity.label" default="Pickup City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reservedDetailInstance, field: 'pickupCity', 'errors')}">
                                    <g:select name="pickupCity.id" from="${City.list()}" optionKey="id" value="${reservedDetailInstance?.pickupCity?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dropoffCity"><g:message code="reservedDetail.dropoffCity.label" default="Dropoff City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reservedDetailInstance, field: 'dropoffCity', 'errors')}">
                                    <g:select name="dropoffCity.id" from="${City.list()}" optionKey="id" value="${reservedDetailInstance?.dropoffCity?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="pickupDate"><g:message code="reservedDetail.pickupDate.label" default="Pickup Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reservedDetailInstance, field: 'pickupDate', 'errors')}">
                                    <g:datePicker name="pickupDate" precision="day" value="${reservedDetailInstance?.pickupDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dropoffDate"><g:message code="reservedDetail.dropoffDate.label" default="Dropoff Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reservedDetailInstance, field: 'dropoffDate', 'errors')}">
                                    <g:datePicker name="dropoffDate" precision="day" value="${reservedDetailInstance?.dropoffDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="status"><g:message code="reservedDetail.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reservedDetailInstance, field: 'status', 'errors')}">
                                    <g:select name="status.id" from="${ReservStatus.list()}" optionKey="id" value="${reservedDetailInstance?.status?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="car"><g:message code="reservedDetail.car.label" default="Car" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reservedDetailInstance, field: 'car', 'errors')}">
                                    <g:select name="car.id" from="${CarStock.list()}" optionKey="id" value="${reservedDetailInstance?.car?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
