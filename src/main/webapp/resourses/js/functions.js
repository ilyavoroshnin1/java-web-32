function deleteStudents(){
    var checkedCheckboxs = document.querySelectorAll('input[name=idStud]:checked')
    if (checkedCheckboxs.length == 0){
        alert("Выберите хотя бы одного студента, пожалуйста!!!");
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
    var checkedCheckboxs = document.querySelectorAll('input[name=idStud]:checked');
    if (checkedCheckboxs.length == 0){
        alert("Выберите одного студента, пожалуйста!!!");
        return;
    }

    if (checkedCheckboxs.length > 1){
        alert("Выберите ТОЛЬКО ОДНОГО студента, пожалуйста!!!");
        return;
    }

    var ids = "";
    for (var i = 0; i < checkedCheckboxs.length; i++){
        ids = ids + checkedCheckboxs[i].value + " ";
    }

    document.getElementById("hiddenModify").value = ids;
    document.getElementById('formModify').submit();
}

function deleteDisciplines() {
    var checkedCheckboxs = document.querySelectorAll('input[name=idDiscipline]:checked');
    if (checkedCheckboxs.length == 0) {
        alert("Выберите хотя бы одну дисциплину!");
        return;
    }

    var ids = "";
    for (var i = 0; i < checkedCheckboxs.length; i++) {
        ids = ids + checkedCheckboxs[i].value + " ";
    }

    document.getElementById("hiddenDeleteDisciplines").value = ids;
    document.getElementById('formDeleteDisciplines').submit();

}

function modifyDiscipline() {
    var checkedCheckboxs = document.querySelectorAll('input[name=idDiscipline]:checked');

    if (checkedCheckboxs.length != 1) {
        alert("Выберите одну дисциплину!");
        return;
    }

    document.getElementById("hiddenModifyDiscipline").value = checkedCheckboxs[0].value;
    document.getElementById('formModifyDiscipline').submit();

}

function deleteCurrentTerm() {
    var checkedCheckboxs = document.querySelectorAll('option[name=idSelectedTermToForm]');

    document.getElementById("idSelectedTermToDelete").value = checkedCheckboxs[0].value;
    document.getElementById('formToDeleteTerm').submit();

}

function getTermToModify() {
    var checkedCheckboxs = document.querySelectorAll('option[name=idSelectedTermToForm]');

    document.getElementById("idSelectedTermToModify").value = checkedCheckboxs[0].value;
    document.getElementById('formToModifyTerm').submit();

}

function modifyTerm() {
    var varForId = document.querySelectorAll('input[name=idTerm]');

    var varForNewDuration = document.querySelectorAll('input[name=duration]');

    var checkedCheckboxs = document.querySelectorAll('option[name=disciplineToAdd]:checked');

    var ids = "";
    if (checkedCheckboxs.length > 0) {
        for (var i = 0; i < checkedCheckboxs.length; i++) {
            ids = ids + checkedCheckboxs[i].value + " ";
        }
    }

    document.getElementById("idTermModifying").value = varForId[0].value;
    document.getElementById("newDuration").value = varForNewDuration[0].value;
    document.getElementById("newIdsDisciplines").value = ids;
    document.getElementById('formModifyingTerm').submit();

}

function creatingTerm() {
    var varForNewDuration = document.querySelectorAll('input[name=durationToForm]');
    var varForDisciplines = document.querySelectorAll('option[name=disciplineToAdd]:checked');

    var ids = "";
    if (varForDisciplines.length > 0) {
        for (var i = 0; i < varForDisciplines.length; i++) {
            ids = ids + varForDisciplines[i].value + " ";
        }
    }

    document.getElementById("duration").value = varForNewDuration[0].value;
    document.getElementById("idsDisciplines").value = ids;
    document.getElementById('formToCreateTerm').submit();
}

function studentProgress() {
    var checkedCheckboxs = document.querySelectorAll('input[name=idStud]:checked');
    if (checkedCheckboxs.length != 1) {
        alert("Выберите одного студента!");
        return;
    }
    document.getElementById("idStudentProgress").value = checkedCheckboxs[0].value;
    document.getElementById('formProgress').submit();
}


function getAverageMark() {
    var allMarks = document.querySelectorAll('[name=ocenka]');
    console.log(allMarks);
    var averageMark = 0;
    var sumOfMarks = 0;
    if (allMarks.length > 0) {
        for (var i = 0; i < allMarks.length; i++) {
            sumOfMarks = sumOfMarks + parseInt(allMarks[i].innerHTML);
        }
        averageMark = sumOfMarks/allMarks.length;
        if (String(averageMark).includes(".") && String(averageMark).split(".")[1].length > 2){
            var multiple = Math.pow(10, 2);
            averageMark = Math.round(averageMark * multiple) / multiple;
        }
    }
    document.getElementById("averageMark").innerHTML = averageMark;
}