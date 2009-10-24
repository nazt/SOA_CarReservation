

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'carStock.label', default: 'CarStock')}" />
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
            <g:hasErrors bean="${carStockInstance}">
            <div class="errors">
                <g:renderErrors bean="${carStockInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${carStockInstance?.id}" />
                <g:hiddenField name="version" value="${carStockInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="brand"><g:message code="carStock.brand.label" default="Brand" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: carStockInstance, field: 'brand', 'errors')}">
                                    <g:select name="brand.id" from="${CarBrand.list()}" optionKey="id" value="${carStockInstance?.brand?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="model"><g:message code="carStock.model.label" default="Model" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: carStockInstance, field: 'model', 'errors')}">
                                    <g:textField name="model" value="${carStockInstance?.model}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="colour"><g:message code="carStock.colour.label" default="Colour" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: carStockInstance, field: 'colour', 'errors')}">
                                    <g:select name="colour.id" from="${Colour.list()}" optionKey="id" value="${carStockInstance?.colour?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="gear"><g:message code="carStock.gear.label" default="Gear" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: carStockInstance, field: 'gear', 'errors')}">
                                    <g:select name="gear.id" from="${Gear.list()}" optionKey="id" value="${carStockInstance?.gear?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="type"><g:message code="carStock.type.label" default="Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: carStockInstance, field: 'type', 'errors')}">
                                    <g:select name="type.id" from="${CarType.list()}" optionKey="id" value="${carStockInstance?.type?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="engine"><g:message code="carStock.engine.label" default="Engine" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: carStockInstance, field: 'engine', 'errors')}">
                                    <g:select name="engine.id" from="${Engine.list()}" optionKey="id" value="${carStockInstance?.engine?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fuel"><g:message code="carStock.fuel.label" default="Fuel" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: carStockInstance, field: 'fuel', 'errors')}">
                                    <g:select name="fuel.id" from="${Fuel.list()}" optionKey="id" value="${carStockInstance?.fuel?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="carRegistration"><g:message code="carStock.carRegistration.label" default="Car Registration" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: carStockInstance, field: 'carRegistration', 'errors')}">
                                    <g:textField name="carRegistration" value="${carStockInstance?.carRegistration}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="pickupCity"><g:message code="carStock.pickupCity.label" default="Pickup City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: carStockInstance, field: 'pickupCity', 'errors')}">
                                    <g:select name="pickupCity.id" from="${City.list()}" optionKey="id" value="${carStockInstance?.pickupCity?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="rate"><g:message code="carStock.rate.label" default="Rate" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: carStockInstance, field: 'rate', 'errors')}">
                                    <g:textField name="rate" value="${fieldValue(bean: carStockInstance, field: 'rate')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="reserved"><g:message code="carStock.reserved.label" default="Reserved" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: carStockInstance, field: 'reserved', 'errors')}">
                                    <g:checkBox name="reserved" value="${carStockInstance?.reserved}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dateCreated"><g:message code="carStock.dateCreated.label" default="Date Created" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: carStockInstance, field: 'dateCreated', 'errors')}">
                                    <g:datePicker name="dateCreated" precision="day" value="${carStockInstance?.dateCreated}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="revervedDetail"><g:message code="carStock.revervedDetail.label" default="Reverved Detail" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: carStockInstance, field: 'revervedDetail', 'errors')}">
                                    
<ul>
<g:each in="${carStockInstance?.revervedDetail?}" var="r">
    <li><g:link controller="reservedDetail" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="reservedDetail" action="create" params="['carStock.id': carStockInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'reservedDetail.label', default: 'ReservedDetail')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lastUpdated"><g:message code="carStock.lastUpdated.label" default="Last Updated" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: carStockInstance, field: 'lastUpdated', 'errors')}">
                                    <g:datePicker name="lastUpdated" precision="day" value="${carStockInstance?.lastUpdated}"  />
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
