

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>CarType List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New CarType</g:link></span>
        </div>
        <div class="body">
            <h1>CarType List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="type" title="Type" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${carTypeInstanceList}" status="i" var="carTypeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${carTypeInstance.id}">${fieldValue(bean:carTypeInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:carTypeInstance, field:'type')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${carTypeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
