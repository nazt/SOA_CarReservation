

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create ReservedDetail</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">ReservedDetail List</g:link></span>
        </div>
        <div class="body">
            <h1>Create ReservedDetail</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${reservedDetailInstance}">
            <div class="errors">
                <g:renderErrors bean="${reservedDetailInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="identificationNumber">Identification Number:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:reservedDetailInstance,field:'identificationNumber','errors')}">
                                    <input type="text" id="identificationNumber" name="identificationNumber" value="${fieldValue(bean:reservedDetailInstance,field:'identificationNumber')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="driverName">Driver Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:reservedDetailInstance,field:'driverName','errors')}">
                                    <input type="text" id="driverName" name="driverName" value="${fieldValue(bean:reservedDetailInstance,field:'driverName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="driverAge">Driver Age:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:reservedDetailInstance,field:'driverAge','errors')}">
                                    <g:select optionKey="id" from="${DriverAgeList.list()}" name="driverAge.id" value="${reservedDetailInstance?.driverAge?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phoneNumber">Phone Number:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:reservedDetailInstance,field:'phoneNumber','errors')}">
                                    <input type="text" id="phoneNumber" name="phoneNumber" value="${fieldValue(bean:reservedDetailInstance,field:'phoneNumber')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pickupCity">Pickup City:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:reservedDetailInstance,field:'pickupCity','errors')}">
                                    <g:select optionKey="id" from="${City.list()}" name="pickupCity.id" value="${reservedDetailInstance?.pickupCity?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dropoffCity">Dropoff City:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:reservedDetailInstance,field:'dropoffCity','errors')}">
                                    <g:select optionKey="id" from="${City.list()}" name="dropoffCity.id" value="${reservedDetailInstance?.dropoffCity?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pickupDate">Pickup Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:reservedDetailInstance,field:'pickupDate','errors')}">
                                    <g:datePicker name="pickupDate" value="${reservedDetailInstance?.pickupDate}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dropoffDate">Dropoff Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:reservedDetailInstance,field:'dropoffDate','errors')}">
                                    <g:datePicker name="dropoffDate" value="${reservedDetailInstance?.dropoffDate}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="car">Car:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:reservedDetailInstance,field:'car','errors')}">
                                    <g:select optionKey="id" from="${CarStock.list()}" name="car.id" value="${reservedDetailInstance?.car?.id}" ></g:select>
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
