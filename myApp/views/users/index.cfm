<cfoutput>
<cfinclude template="../shared/_banner.cfm">

<h1>Users</h1>

<p>#linkTo(text="New User", route="newUser")#</p>

<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th colspan="2"></th>
        </tr>
    </thead>
    <tbody>
        <cfloop query="users">
            <tr>
                <td>
                    #EncodeForHtml(users.name)#
                </td>
                <td>
                    #EncodeForHtml(users.email)#
                </td>
                <td>
                    #linkTo(
                        text="Edit",
                        route="editUser",
                        key=users.id,
                        title="Edit #users.name#"
                    )#
                </td>
                <td>
                    #buttonTo(
                        text="Delete",
                        route="user",
                        key=users.id,
                        method="delete",
                        title="Delete #users.name#"
                    )#
                </td>
            </tr>
        </cfloop>
    </tbody>
</table>

</cfoutput>