

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'carStock.label', default: 'CarStock')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'carStock.id.label', default: 'Id')}" />
                        
                            <th><g:message code="carStock.brand.label" default="Brand" /></th>
                   	    
                            <g:sortableColumn property="model" title="${message(code: 'carStock.model.label', default: 'Model')}" />
                        
                            <th><g:message code="carStock.colour.label" default="Colour" /></th>
                   	    
                            <th><g:message code="carStock.gear.label" default="Gear" /></th>
                   	    
                            <th><g:message code="carStock.type.label" default="Type" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${carStockInstanceList}" status="i" var="carStockInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${carStockInstance.id}">${fieldValue(bean: carStockInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: carStockInstance, field: "brand")}</td>
                        
                            <td>${fieldValue(bean: carStockInstance, field: "model")}</td>
                        
                            <td>${fieldValue(bean: carStockInstance, field: "colour")}</td>
                        
                            <td>${fieldValue(bean: carStockInstance, field: "gear")}</td>
                        
                            <td>${fieldValue(bean: carStockInstance, field: "type")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${carStockInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
