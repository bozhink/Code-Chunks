var errorProvider = (function () {
    function raiseError(err) {
        var errorMessage;

        if (typeof (err) === 'object') {
            if (err.responseText !== undefined) {
                errorMessage = err.responseText.replace(/"/g, '');
            } else {
                errorMessage = JSON.stringify(err);
            }
        } else {
            errorMessage = err;
        }

        toastr.clear();
        toastr.error(errorMessage);
    }

    return {
        raiseError: raiseError
    };
}());