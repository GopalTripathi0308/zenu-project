<h1>Hello World!</h1>
<p>Current time: <cfoutput>#time#</cfoutput></p>
<p>Time to say <cfoutput>#linkTo(text="goodbye", action="goodbye")#?</cfoutput></p>
<div class="download-section">
<cfoutput>
    <p class="download-link">
        #linkTo(
            text="Download Tutorial", 
            action="sendTutorial",
            class="btn btn-primary"
        )#
    </p>
</cfoutput>
</div>
<style>
.download-section {
    margin: 20px 0;
    padding: 15px;
    background: #f5f5f5;
    border-radius: 5px;
}

.download-link a {
    display: inline-block;
    padding: 10px 20px;
    text-decoration: none;
    color: #fff;
    background: #007bff;
    border-radius: 4px;
}
</style>