$(document).ready(function() {
   


   var otable =  $('#entertainments').dataTable( {
        sPaginationType: "full_numbers",
        bJQueryUI: true,
        processing: true,
        serverSide: true,
        sAjaxSource: $('#entertainments').data('source')
    } );



   var row_id
   $('#entertainments tbody').on('keyup', 'tr', function () {
        row_id = $('td', this).eq(0).text();
    } );
   var update_url = ""
   otable.makeEditable({
        sUpdateURL: update_url,
        aoColumns: [
                        null,
                        {   
                            className: "hello",    
                            placeholder: '',
                            method: 'GET',
                            value: "pop",
                            aaData: "asdsd"
                        },
                        {
                            placeholder: '',
                            method: 'GET'
                        },
                        {
                            placeholder: '',
                            method: 'GET'
                        },
                        {
                            placeholder: '',
                            method: 'GET'
                        }
                ],
        fnOnEditing: function(input)
                {   
                    //$("#trace").append("Updating cell with value " + input.val());
                    /*otable.$('tr').keyup( function () {
                    aData = otable.fnGetData(this); // get datarow 
                    console.log(aData)
                    });*/

                      console.log(otable)  
                    update_url = "http://localhost:3000/entertainments/"+row_id
                    try {
                        x = $('#'+row_id+' td')
                            for (i = 0; i < x.length; i++) {
                                if(x[i].childNodes[0].childNodes[0])
                                    {
                                    x[i].innerHTML = input.val()
                                    console.log(x[i].innerHTML);
                                    }   
                                    else 
                                    console.log(x[i].innerHTML);
                            }    
                    }
                    catch(err) {
                        console.log("asd")
                    }
                    

                    
                     /*otable.$('tr').keyup( function () {
                    aData = otable.fnGetData(this); // get datarow 
                    console.log(aData)
                    });*/
                    
                      //console.log(otable)  
                    /*var aPos = otable.fnGetPosition($("#11")[0]);    
                    console.log(document.getElementsByTagName("input"))
                    console.log(otable.fnGetData(aPos));
                    console.log(input);*/
                    // update_url = "http://localhost:3000/entertainments/"+row_id
                    $.ajax({
                        url: "http://localhost:3000/entertainments/"+row_id,
                        type: "put",
                        data: {
                            'entertainment[id]' : x[0].innerHTML,
                            'entertainment[name]' : x[1].innerHTML,
                            'entertainment[state_or_province]' : x[2].innerHTML,
                            'entertainment[url]' : x[3].innerHTML,
                            'entertainment[phone_number]' : x[4].innerHTML
                          }
                    });

                      
                    return true;
                },
            fnOnEdited: function(input){
                otable.fnDraw();
            }            
    });

    
   
} );