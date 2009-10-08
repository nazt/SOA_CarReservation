

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>ReservedDetail List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New ReservedDetail</g:link></span>
        </div>
        <div class="body">
            <h1>ReservedDetail List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Car</th>
                   	    
                   	        <g:sortableColumn property="driverName" title="Driver Name" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${reservedDetailInstanceList}" status="i" var="reservedDetailInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${reservedDetailInstance.id}">${fieldValue(bean:reservedDetailInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:reservedDetailInstance, field:'car')}</td>
                        
                            <td>${fieldValue(bean:reservedDetailInstance, field:'driverName')}</td>
                        
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
