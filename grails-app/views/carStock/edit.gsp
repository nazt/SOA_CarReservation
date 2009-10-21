

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit CarStock</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">CarStock List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New CarStock</g:link></span>
        </div>
        <div class="body">
            <h1>Edit CarStock</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${carStockInstance}">
            <div class="errors">
                <g:renderErrors bean="${carStockInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${carStockInstance?.id}" />
                <input type="hidden" name="version" value="${carStockInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="brand">Brand:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:carStockInstance,field:'brand','errors')}">
                                    <g:select optionKey="id" from="${CarBrand.list()}" name="brand.id" value="${carStockInstance?.brand?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="model">Model:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:carStockInstance,field:'model','errors')}">
                                    <input type="text" id="model" name="model" value="${fieldValue(bean:carStockInstance,field:'model')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="colour">Colour:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:carStockInstance,field:'colour','errors')}">
                                    <g:select optionKey="id" from="${Colour.list()}" name="colour.id" value="${carStockInstance?.colour?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="gear">Gear:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:carStockInstance,field:'gear','errors')}">
                                    <g:select optionKey="id" from="${Gear.list()}" name="gear.id" value="${carStockInstance?.gear?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type">Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:carStockInstance,field:'type','errors')}">
                                    <g:select optionKey="id" from="${CarType.list()}" name="type.id" value="${carStockInstance?.type?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="engine">Engine:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:carStockInstance,field:'engine','errors')}">
                                    <g:select optionKey="id" from="${Engine.list()}" name="engine.id" value="${carStockInstance?.engine?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fuel">Fuel:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:carStockInstance,field:'fuel','errors')}">
                                    <g:select optionKey="id" from="${Fuel.list()}" name="fuel.id" value="${carStockInstance?.fuel?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="carRegistration">Car Registration:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:carStockInstance,field:'carRegistration','errors')}">
                                    <input type="text" id="carRegistration" name="carRegistration" value="${fieldValue(bean:carStockInstance,field:'carRegistration')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="rate">Rate:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:carStockInstance,field:'rate','errors')}">
                                    <input type="text" id="rate" name="rate" value="${fieldValue(bean:carStockInstance,field:'rate')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="reserved">Reserved:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:carStockInstance,field:'reserved','errors')}">
                                    <g:checkBox name="reserved" value="${carStockInstance?.reserved}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated">Date Created:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:carStockInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${carStockInstance?.dateCreated}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated">Last Updated:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:carStockInstance,field:'lastUpdated','errors')}">
                                    <g:datePicker name="lastUpdated" value="${carStockInstance?.lastUpdated}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="revervedDetail">Reverved Detail:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:carStockInstance,field:'revervedDetail','errors')}">
                                    
<ul>
<g:each var="r" in="${carStockInstance?.revervedDetail?}">
    <li><g:link controller="reservedDetail" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="reservedDetail" params="['carStock.id':carStockInstance?.id]" action="create">Add ReservedDetail</g:link>

                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
