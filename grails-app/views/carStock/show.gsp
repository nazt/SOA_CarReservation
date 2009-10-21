

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show CarStock</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">CarStock List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New CarStock</g:link></span>
        </div>
        <div class="body">
            <h1>Show CarStock</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:carStockInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Brand:</td>
                            
                            <td valign="top" class="value"><g:link controller="carBrand" action="show" id="${carStockInstance?.brand?.id}">${carStockInstance?.brand?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Model:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:carStockInstance, field:'model')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Colour:</td>
                            
                            <td valign="top" class="value"><g:link controller="colour" action="show" id="${carStockInstance?.colour?.id}">${carStockInstance?.colour?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Gear:</td>
                            
                            <td valign="top" class="value"><g:link controller="gear" action="show" id="${carStockInstance?.gear?.id}">${carStockInstance?.gear?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Type:</td>
                            
                            <td valign="top" class="value"><g:link controller="carType" action="show" id="${carStockInstance?.type?.id}">${carStockInstance?.type?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Engine:</td>
                            
                            <td valign="top" class="value"><g:link controller="engine" action="show" id="${carStockInstance?.engine?.id}">${carStockInstance?.engine?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Fuel:</td>
                            
                            <td valign="top" class="value"><g:link controller="fuel" action="show" id="${carStockInstance?.fuel?.id}">${carStockInstance?.fuel?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Car Registration:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:carStockInstance, field:'carRegistration')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Rate:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:carStockInstance, field:'rate')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Reserved:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:carStockInstance, field:'reserved')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date Created:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:carStockInstance, field:'dateCreated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Last Updated:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:carStockInstance, field:'lastUpdated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Reverved Detail:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="r" in="${carStockInstance.revervedDetail}">
                                    <li><g:link controller="reservedDetail" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${carStockInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
