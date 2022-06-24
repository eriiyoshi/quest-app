<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
    <head>
        <title>Person Demographics</title>
    </head>
    
    <body>
        <div class="parent-flex-container">
            <div class="child-flex-container">
                <div>
                    <c:if test="${empty records}">
                        No records have been created.
                    </c:if>
                        
                    <c:if test="${not empty records}">
                    <table>
                  	<tr>
                            <th><b>Name</b></th>
                            <th><b>PPSN</b></th>
                            <th><b>DOB</b></th>
                            <th><b>Mobile Phone</b></th>
                        </tr>
                        
                        <c:forEach var="record" items="${records}">
                            <tr>
                                <td style="width: 15%">${record.name}</td>
                                <td>${record.pps}</td>
                                <td><fmt:formatDate pattern="dd/MM/yyyy" value="${record.birthday}" /></td>
                                <td>${record.mobile}</td>
                            </tr>
                        </c:forEach>
                    </table>
                    </c:if>
                </div>
                <div>
                    <input type="button" class="button" value="Back" onclick="window.location='/'" >
                </div>
                
            </div>
        </div>
    </body>
</html> 

<style>    
.parent-flex-container {
  display: flex;
  flex-wrap: nowrap;
  flex-direction: column;
  align-items: center;
}

.child-flex-container {
  display: flex;
  flex-wrap: nowrap;
  flex-direction: column;
  border-style: double;
  align-items: center;
  width: 40%;
  padding-top: 2%;
  padding-bottom: 2%;
  font-family: system-ui,-apple-system,system-ui,"Helvetica Neue",Helvetica,Arial,sans-serif;
}

.button{
    margin-top: 15%;
    margin-bottom: 10%;
    background-color: #FFFFFF;
    border: 1px solid rgba(0, 0, 0, 0.1);
    border-radius: .25rem;
    cursor: pointer;
    font-family: system-ui,-apple-system,system-ui,"Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 16px;
    font-weight: 500;
    min-height: 2rem;
    width: 100px;
}

table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}
</style>