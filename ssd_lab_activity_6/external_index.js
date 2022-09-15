function checkPassword(){
    document.getElementById("password_verification").innerHTML="";
    var orig_password = document.getElementById("server_password").value;
    var confirm_password = document.getElementById("confirm_server_password").value;

    if(orig_password == confirm_password){
        document.getElementById("password_verification").innerHTML="";
    } else{
        document.getElementById("password_verification").innerHTML="Invalid Password";
    }
}

function checkUname()
{           
    document.getElementById("username_verification").innerHTML="";

    var uname = document.getElementById("server_username").value;
    var uppercase = /[A-Z]/g;
    var digit = /[0-9]/g;

    if((uname.match(uppercase) && uname.match(digit))){
        // not match requirement    
        document.getElementById("username_verification").innerHTML="";
    } else{
        document.getElementById("username_verification").innerHTML="Invalid Uname";
    }
}   

function showdata(e)
            {
                e.preventDefault();
                
                var name = document.getElementById("mgr_name").value;
                var email = document.getElementById("grp_email").value;
                var uname = document.getElementById("server_username").value;
                var team_lead = document.getElementById("team_lead").value;
                //var team_mem_add = document.getElementById("team_mem_add").innerHTML;


                var data = "Name: " + name +"\r\n";
                data += "Email: "+email+"\r\n";
                data += "Username: "+uname+"\r\n";
                data += "Team Lead: "+team_lead+"\r\n";

                alert(data);

                return false;
            }

            var theme = 1; // 1- normal 0- black
            function KeyPress(e) {
                var evtobj = window.event? event : e
                
                if (evtobj.key == "M" && evtobj.ctrlKey){
                    theme=1-theme; // toggle    
                }

                if(theme === 0)
                {
                    document.body.style.backgroundColor = "powderblue";
                    document.getElementsByClassName("td.col").style.color = "white";
                    document.getElementsByClassName("team_mem1").style.backgroundColor = "lightgrey";
                } else {
                    document.body.style.backgroundColor = "white";
                    document.getElementsByClassName("td.col").style.backgroundColor = "black";
                    document.getElementsByClassName("team_mem1").style.backgroundColor = "white";
                }
            }
            document.onkeydown = KeyPress;

            function allowDrop(event) {
                event.preventDefault();
            }

            function drag(event) {
                event.dataTransfer.setData("team_mem", event.target.id);
            }

            function drop(event) {
                event.preventDefault();
                var data = event.dataTransfer.getData("team_mem");
                event.target.appendChild(document.getElementById(data));
            }

       