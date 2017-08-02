/*global Qiniu */
/*global plupload */
/*global FileProgress */
/*global hljs */
var uploader;
$(function() {
     uploader = Qiniu.uploader({
        disable_statistics_report: false,
        runtimes: 'html5,flash,html4',
        browse_button: 'pickfiles',
        container: 'container',
        drop_element: 'container',
        max_file_size: '1000mb',
        flash_swf_url: 'bower_components/plupload/js/Moxie.swf',
        dragdrop: true,
        chunk_size: '4mb',
        multi_selection: !(moxie.core.utils.Env.OS.toLowerCase() === "ios"),
        uptoken_url: $('#uptoken_url').val(),
        // uptoken_func: function(){
        //     var ajax = new XMLHttpRequest();
        //     ajax.open('GET', $('#uptoken_url').val(), false);
        //     ajax.setRequestHeader("If-Modified-Since", "0");
        //     ajax.send();
        //     if (ajax.status === 200) {
        //         var res = JSON.parse(ajax.responseText);
        //         console.log('custom uptoken_func:' + res.uptoken);
        //         return res.uptoken;
        //     } else {
        //         console.log('custom uptoken_func err');
        //         return '';
        //     }
        // },
        domain: $('#domain').val(),
        get_new_uptoken: false,
        //downtoken_url: '/downtoken',
        // unique_names: true,
        // save_key: true,
        // x_vars: {
        //     'id': '1234',
        //     'time': function(up, file) {
        //         var time = (new Date()).getTime();
        //         // do something with 'time'
        //         return time;
        //     },
        // },
        auto_start: true,
        log_level: 5,
        init: {
            'BeforeChunkUpload': function(up, file) {
                console.log("before chunk upload:", file.name);
            },
            'FilesAdded': function(up, files) {
                $('table').show();
                $('#success').hide();
                plupload.each(files, function(file) {
                    var progress = new FileProgress(file,
                        'fsUploadProgress');
                    progress.setStatus("等待...");
                    progress.bindUploadCancel(up);
                });
            },
            'BeforeUpload': function(up, file) {
                console.log("this is a beforeupload function from init");
                var progress = new FileProgress(file, 'fsUploadProgress');
                var chunk_size = plupload.parseSize(this.getOption(
                    'chunk_size'));
                if (up.runtime === 'html5' && chunk_size) {
                    progress.setChunkProgess(chunk_size);
                }
            },
            'UploadProgress': function(up, file) {
                var progress = new FileProgress(file, 'fsUploadProgress');
                var chunk_size = plupload.parseSize(this.getOption(
                    'chunk_size'));
                progress.setProgress(file.percent + "%", file.speed,
                    chunk_size);
            },
            'UploadComplete': function() {
                $('#success').show();
            },
            'FileUploaded': function(up, file, info) {
                //var progress = new FileProgress(file, 'fsUploadProgress');
                //console.log("response:", info.response);
                //progress.setComplete(up, info.response);
                var res = $.parseJSON(info.response);
                file.hash=res.hash;
                file.path=res.key;
                uploadedHandler(up,file,info,res.key);
            },
            'Error': function(up, err, errTip) {
                $('table').show();
                if(err.file.isExists==undefined||!err.file.isExists) {
                    var progress = new FileProgress(err.file, 'fsUploadProgress');
                    progress.setError();
                    progress.setStatus(errTip);
                }else{
                    uploadedHandler(up,err.file,err.file.info,err.file.key);
                }
            }
            // ,
            // 'Key': function(up, file) {
            //     var key = "";
            //     // do something with key
            //     return key
            // }
        }
    });
    //uploader.init();
    uploader.initData=function(pid,basePath){
        if(pid==undefined||pid.length==0)
        {
            retrun ;
        }
        $.ajax({
            type: "POST",
            url:basePath+'tb_attachmentInfo/findRelation.do',
            data: {ftAttachmentRelationId:pid},
            dataType:'json',
            //beforeSend: validateData,
            cache: false,
            success: function(data){
                		var attachmentList=data.varList;
                    $("#old_file_json").val(  JSON.stringify(attachmentList)  );
                    if(attachmentList!=undefined&&attachmentList.length>0) {
                        for (var i = 0; i < attachmentList.length; i++) {
                            var file_1 = new File([""], attachmentList[i].ftAttachmentName);
                            var file1 = new plupload.File(file_1);
                            file1.id = attachmentList[i].ftAttachmentId;
                            file1.ftAttachmentId = attachmentList[i].ftAttachmentId;
                            file1.name = attachmentList[i].ftAttachmentName;
                            file1.size = attachmentList[i].ftAttachmentSize;
                            file1.path = attachmentList[i].ftAttachmentPath;
                            file1.type = attachmentList[i].ftAttachmentType;
                            file1.isExists = true;
                            file1.info ={"response":"{\"hash\":\"" + attachmentList[i].tfHash + "\",\"key\":\"" + file1.path + "\"}","responseHeaders":"Pragma: no-cache","status":200};
                            var files1 = Array();
                            files1[0] = file1;
                            //				var up1=new plupload.Uploader();
                            //				up1.addFile(file1,file1.name);
                            uploader.addFile(file1, file1.name);
                        }
                    }
            }
        });
    }

    var uploadedHandler=function(up,file,info,key){
        jsonAppend(up.files,file);
        var progress = new FileProgress(file, 'fsUploadProgress');
        //$(progress.fileProgressWrapper[0]).attr("ftAttachmentId",file.ftAttachmentId);
        progress.setComplete(up, info.response);
        url = imgBaseUrl + encodeURI(key);
        $("#showImg").attr("src",url);
        $("#logourl").val(url);
        $("#success").hide();
    }
    var jsonAppend=function(files,file){
        this.fileJson="[";
        for(var i=0;i<files.length;i++)
        {
            if( files[i]==undefined)
                continue;
            if( $("#isMultipart").val()=="false"&&file!=undefined) {
                if (files[i].id != file.id) {//单文件上传时，处理
                    $("#" + files[i].id).remove();
                }
            }
            var hash="";//files[i].hasOwnProperty("hash")
            if(  ("hash" in files[i])  &&files[i].hash!=undefined)
                hash=files[i].hash
            if(i+1==files.length)
            {
                this.fileJson=this.fileJson+"{\"hash\":\""+hash+"\",\"path\":\""+files[i].path+"\",\"type\":\""+files[i].type+"\",\"size\":\""+files[i].size+"\",\"ftAttachmentId\":\""+files[i].ftAttachmentId+"\"}";
            }else
                this.fileJson=this.fileJson+"{\"hash\":\""+hash+"\",\"path\":\""+files[i].path+"\",\"type\":\""+files[i].type+"\",\"size\":\""+files[i].size+"\",\"ftAttachmentId\":\""+files[i].ftAttachmentId+"\"},";
        }
        this.fileJson=this.fileJson+"]";
        $("#file_json").val(this.fileJson);
    }
    $(".qiniu_item_del").live('click', function() {

        //$(this).parent().parent(".progressContainer").remove();
        for (var i=0;i<uploader.files.length;i++)
        {
            if(uploader.files[i].ftAttachmentId==$(this).parent().parent()[0].id)
            {
                //uploader.splice(i+1,1);
                uploader.removeFile(uploader.files[i]);
            }

        }
        //delete a.data[1];
        //$($(this).parent().parent()[0]).id;
        jsonAppend(uploader.files);
        //$(this).parent().find("ftAttachmentId")
        $(this).parent().parent().remove();
    });






    uploader.bind('BeforeUpload', function() {
        console.log("hello man, i am going to upload a file");
    });
    uploader.bind('FileUploaded', function() {
        console.log('hello man,a file is uploaded');
    });
    $('#container').on(
        'dragenter',
        function(e) {
            e.preventDefault();
            $('#container').addClass('draging');
            e.stopPropagation();
        }
    ).on('drop', function(e) {
            e.preventDefault();
            $('#container').removeClass('draging');
            e.stopPropagation();
        }).on('dragleave', function(e) {
            e.preventDefault();
            $('#container').removeClass('draging');
            e.stopPropagation();
        }).on('dragover', function(e) {
            e.preventDefault();
            $('#container').addClass('draging');
            e.stopPropagation();
        });



    $('#show_code').on('click', function() {
        $('#myModal-code').modal();
        $('pre code').each(function(i, e) {
            hljs.highlightBlock(e);
        });
    });


    $('body').on('click', 'table button.btn', function() {
        $(this).parents('tr').next().toggle();
    });


    var getRotate = function(url) {
        if (!url) {
            return 0;
        }
        var arr = url.split('/');
        for (var i = 0, len = arr.length; i < len; i++) {
            if (arr[i] === 'rotate') {
                return parseInt(arr[i + 1], 10);
            }
        }
        return 0;
    };

    $('#myModal-img .modal-body-footer').find('a').on('click', function() {
        var img = $('#myModal-img').find('.modal-body img');
        var key = img.data('key');
        var oldUrl = img.attr('src');
        var originHeight = parseInt(img.data('h'), 10);
        var fopArr = [];
        var rotate = getRotate(oldUrl);
        if (!$(this).hasClass('no-disable-click')) {
            $(this).addClass('disabled').siblings().removeClass('disabled');
            if ($(this).data('imagemogr') !== 'no-rotate') {
                fopArr.push({
                    'fop': 'imageMogr2',
                    'auto-orient': true,
                    'strip': true,
                    'rotate': rotate,
                    'format': 'png'
                });
            }
        } else {
            $(this).siblings().removeClass('disabled');
            var imageMogr = $(this).data('imagemogr');
            if (imageMogr === 'left') {
                rotate = rotate - 90 < 0 ? rotate + 270 : rotate - 90;
            } else if (imageMogr === 'right') {
                rotate = rotate + 90 > 360 ? rotate - 270 : rotate + 90;
            }
            fopArr.push({
                'fop': 'imageMogr2',
                'auto-orient': true,
                'strip': true,
                'rotate': rotate,
                'format': 'png'
            });
        }

        $('#myModal-img .modal-body-footer').find('a.disabled').each(
            function() {

                var watermark = $(this).data('watermark');
                var imageView = $(this).data('imageview');
                var imageMogr = $(this).data('imagemogr');

                if (watermark) {
                    fopArr.push({
                        fop: 'watermark',
                        mode: 1,
                        image: 'http://www.b1.qiniudn.com/images/logo-2.png',
                        dissolve: 100,
                        gravity: watermark,
                        dx: 100,
                        dy: 100
                    });
                }

                if (imageView) {
                    var height;
                    switch (imageView) {
                        case 'large':
                            height = originHeight;
                            break;
                        case 'middle':
                            height = originHeight * 0.5;
                            break;
                        case 'small':
                            height = originHeight * 0.1;
                            break;
                        default:
                            height = originHeight;
                            break;
                    }
                    fopArr.push({
                        fop: 'imageView2',
                        mode: 3,
                        h: parseInt(height, 10),
                        q: 100,
                        format: 'png'
                    });
                }

                if (imageMogr === 'no-rotate') {
                    fopArr.push({
                        'fop': 'imageMogr2',
                        'auto-orient': true,
                        'strip': true,
                        'rotate': 0,
                        'format': 'png'
                    });
                }
            });

        var newUrl = Qiniu.pipeline(fopArr, key);

        var newImg = new Image();
        img.attr('src', 'static/plupload/images/loading.gif');
        newImg.onload = function() {
            img.attr('src', newUrl);
            img.parent('a').attr('href', newUrl);
        };
        newImg.src = newUrl;
        return false;
    });

});
