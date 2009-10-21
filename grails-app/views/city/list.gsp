

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>City List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New City</g:link></span>
        </div>
        <div class="body">
            <h1>City List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="address" title="Address" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${cityInstanceList}" status="i" var="cityInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${cityInstance.id}">${fieldValue(bean:cityInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:cityInstance, field:'name')}</td>
                        
                            <td>${fieldValue(bean:cityInstance, field:'address')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${cityInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
