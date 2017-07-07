var loadFile = function (event, index) {
    $('#blah' + index).attr('src', URL.createObjectURL(event.target.files[0]));
};


