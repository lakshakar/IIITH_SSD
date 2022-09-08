       
           function addRow(){
               var rollNo=document.getElementById("rollNo").value;
               var name=document.getElementById("name").value;
               if(rollNo.trim() ==="" || name.trim() === "")return;
               var table_t1 = document.getElementById("abcd");
               var newRow = table_t1.insertRow(-1);
               
               var rNo = newRow.insertCell(0);
               var nm = newRow.insertCell(1);
               
               rNo.innerHTML = rollNo;
               nm.innerHTML = name; 
               
               document.getElementById("rollNo").value="";
               document.getElementById("name").value="";
           }
           
           function removeRow(){
               var table = document.getElementById("abcd");
               var totalRows = table.rows.length;

               table.deleteRow(totalRows -1);
           }
