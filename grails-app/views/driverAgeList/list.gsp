

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>DriverAgeList List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New DriverAgeList</g:link></span>
        </div>
        <div class="body">
            <h1>DriverAgeList List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="age" title="Age" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${driverAgeListInstanceList}" status="i" var="driverAgeListInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${driverAgeListInstance.id}">${fieldValue(bean:driverAgeListInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:driverAgeListInstance, field:'age')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${driverAgeListInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
