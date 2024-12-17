<cfoutput>

<h1>New User</h1>

#startFormTag(route="users")#
    <div>
        #textField(objectName="user", property="name", label="Name")#
    </div>

    <div>
        #textField(objectName="user", property="email", label="Email")#
    </div>

    <div>
        #passwordField(
            objectName="user",
            property="password",
            label="Password"
        )#
    </div>

    <div>#submitTag()#</div>
#endFormTag()#




    <div style="position:fixed;bottom:10px;right:10px;z-index:9999;">
        <form method="post">
            <input type="hidden" name="switchEnvironment" 
                   value="#application.wheels.environment == 'development' ? 'production' : 'development'#">
            <button type="submit">Switch to #application.wheels.environment == 'development' ? 'Production' : 'Development'#</button>
        </form>
    </div>

</cfoutput>