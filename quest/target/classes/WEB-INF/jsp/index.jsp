<%@ page pageEncoding="UTF-8" %>

<html>
    <head>
        <title>Person Demographics</title>
    </head>
    
    <body>
        <div class="parent-flex-container">
            <div class="child-flex-container">
                <div class="welcome-title"><h2>Welcome!</h2></div>
                <div>
                    
                    <input type="button" class="button" value="Add New Record"
                           onclick="window.location='/record/register'" >
                </div>
                <div>
                    <!--<input type="button" class="button" value="List All Records"
                           onclick="window.location='/record/all'" >-->
                    <form action="/record/all" method="GET">
                        <input type="submit" class="button" value="List All Records">
                    </form>
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
  width: 30%;
  padding-top: 2%;
  padding-bottom: 2%;
}

.welcome-title{
  font-family: system-ui,-apple-system,system-ui,"Helvetica Neue",Helvetica,Arial,sans-serif;
}

.button{
    margin-top: 10%;
    margin-bottom: 10%;
    background-color: #FFFFFF;
    border: 1px solid rgba(0, 0, 0, 0.1);
    border-radius: .25rem;
    cursor: pointer;
    font-family: system-ui,-apple-system,system-ui,"Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 16px;
    font-weight: 500;
    min-height: 2rem;
    width: 150px;
}
</style>