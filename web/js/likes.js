function dolike(pid,uid){
    
    const d={
        pid: pid,
        uid: uid,
        operation: "like"

    };
    
    $.ajax({
        url: "LikeByUser",
        data: d,
        success: function(data,status,jqXHR){
            if(data=='true'){
                let c=$(".like-counter").html();
                c++;
                $('.like-counter').html(c);
                
            }
        },
        error: function(jqXHR,status,error){
            console.log(error);
        }
    });
    
    
}






