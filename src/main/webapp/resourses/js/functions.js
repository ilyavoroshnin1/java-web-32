function deleteStudents(){
    var checkedCheckboxs = document.querySelectorAll('input[name=idStud]:checked')
    if (checkedCheckboxs.length == 0){
        alert("Выберите хотя бы одного студента, пожалуйста!!!")
        return;
    }

    // 1 4 6 9 - будет примерно такая строка
    var ids = "";
    for (var i = 0; i < checkedCheckboxs.length; i++){
        ids = ids + checkedCheckboxs[i].value + " ";
    }

    document.getElementById("hiddenDelete").value = ids;
    document.getElementById('formDelete').submit();
}


function modifyStudents(){
    var checkedCheckboxs = document.querySelectorAll('input[name=idStud]:checked')
    if (checkedCheckboxs.length == 0){
        alert("Выберите одного студента, пожалуйста!!!")
        return;
    }

    if (checkedCheckboxs.length > 1){
        alert("Выберите ТОЛЬКО ОДНОГО студента, пожалуйста!!!")
        return;
    }

    var ids = "";
    for (var i = 0; i < checkedCheckboxs.length; i++){
        ids = ids + checkedCheckboxs[i].value + " ";
    }

    document.getElementById("hiddenModify").value = ids;
    document.getElementById('formModify').submit();
}