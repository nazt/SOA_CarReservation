

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create CarBrand</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">CarBrand List</g:link></span>
        </div>
        <div class="body">
            <h1>Create CarBrand</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${carBrandInstance}">
            <div class="errors">
                <g:renderErrors bean="${carBrandInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="brand">Brand:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:carBrandInstance,field:'brand','errors')}">
                                    <input type="text" id="brand" name="brand" value="${fieldValue(bean:carBrandInstance,field:'brand')}"/>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
