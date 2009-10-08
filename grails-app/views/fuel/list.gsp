

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Fuel List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Fuel</g:link></span>
        </div>
        <div class="body">
            <h1>Fuel List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="fuel" title="Fuel" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${fuelInstanceList}" status="i" var="fuelInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${fuelInstance.id}">${fieldValue(bean:fuelInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:fuelInstance, field:'fuel')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${fuelInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
