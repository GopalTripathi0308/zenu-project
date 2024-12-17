<cfoutput>

<h1>Edit User #EncodeForHtml(user.name)#</h1>

#startFormTag(route="user", key=user.key(), method="patch")#
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

</cfoutput>