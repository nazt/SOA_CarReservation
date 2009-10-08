

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Gear List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Gear</g:link></span>
        </div>
        <div class="body">
            <h1>Gear List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="gear" title="Gear" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${gearInstanceList}" status="i" var="gearInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${gearInstance.id}">${fieldValue(bean:gearInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:gearInstance, field:'gear')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${gearInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
