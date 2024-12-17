component extends="Controller" {
    function hello() {
        time = Now();
    }

   function goodbye(){
    message = "Goodbye";
   }

function sendTutorial() {
        sendFile(file="Uday-Naliyapara.pdf", name="Tutorial.pdf", disposition="inline");
    }


}

