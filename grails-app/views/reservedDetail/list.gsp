

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'reservedDetail.label', default: 'ReservedDetail')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'reservedDetail.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="identificationNumber" title="${message(code: 'reservedDetail.identificationNumber.label', default: 'Identification Number')}" />
                        
                            <g:sortableColumn property="driverName" title="${message(code: 'reservedDetail.driverName.label', default: 'Driver Name')}" />
                        
                            <th><g:message code="reservedDetail.driverAge.label" default="Driver Age" /></th>
                   	    
                            <g:sortableColumn property="phoneNumber" title="${message(code: 'reservedDetail.phoneNumber.label', default: 'Phone Number')}" />
                        
                            <th><g:message code="reservedDetail.pickupCity.label" default="Pickup City" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${reservedDetailInstanceList}" status="i" var="reservedDetailInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${reservedDetailInstance.id}">${fieldValue(bean: reservedDetailInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: reservedDetailInstance, field: "identificationNumber")}</td>
                        
                            <td>${fieldValue(bean: reservedDetailInstance, field: "driverName")}</td>
                        
                            <td>${fieldValue(bean: reservedDetailInstance, field: "driverAge")}</td>
                        
                            <td>${fieldValue(bean: reservedDetailInstance, field: "phoneNumber")}</td>
                        
                            <td>${fieldValue(bean: reservedDetailInstance, field: "pickupCity")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${reservedDetailInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
