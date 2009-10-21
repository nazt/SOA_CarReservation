

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
                        
                   	        <g:sortableColumn property="identificationNumber" title="Identification Number" />
                        
                   	        <g:sortableColumn property="driverName" title="Driver Name" />
                        
                   	        <th>Driver Age</th>
                   	    
                   	        <g:sortableColumn property="phoneNumber" title="Phone Number" />
                        
                   	        <th>Pickup City</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${reservedDetailInstanceList}" status="i" var="reservedDetailInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${reservedDetailInstance.id}">${fieldValue(bean:reservedDetailInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:reservedDetailInstance, field:'identificationNumber')}</td>
                        
                            <td>${fieldValue(bean:reservedDetailInstance, field:'driverName')}</td>
                        
                            <td>${fieldValue(bean:reservedDetailInstance, field:'driverAge')}</td>
                        
                            <td>${fieldValue(bean:reservedDetailInstance, field:'phoneNumber')}</td>
                        
                            <td>${fieldValue(bean:reservedDetailInstance, field:'pickupCity')}</td>
                        
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
