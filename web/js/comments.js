function replyInfo(cid, uid){
//    console.log("cliked");
    const d={
        cid: cid,
        uid: uid
    };
    
    $.ajax({
        url: "ReplyInfo",
        method: "post",
        data: d,
        success: function(data,status,e){
//            console.log(data);
            $('#cid').attr('value',data);
        },
        error: function(e,status,data){
            console.log(error);
        }
    })
    
}


