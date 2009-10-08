

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Colour List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Colour</g:link></span>
        </div>
        <div class="body">
            <h1>Colour List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="colour" title="Colour" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${colourInstanceList}" status="i" var="colourInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${colourInstance.id}">${fieldValue(bean:colourInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:colourInstance, field:'colour')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${colourInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
