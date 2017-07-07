var loadFile = function (event, index) {
    var output = document.getElementById('blah' + index);
    $('#blah' + index).attr('src', URL.createObjectURL(event.target.files[0]));
};


