(function (window, document) {
	'use strict';

var requirejs = window.require;

requirejs.config({
        paths: {
            'vs': './node_modules/monaco-editor/min/vs'
        }
});

requirejs(['vs/editor/editor.main'], function () {
    var monaco = window.monaco,
        editor = monaco.editor.create(document.getElementById('editor-container'), {
        value: [
            'function x() {',
            '\tconsole.log("Hello world!");',
            '}'
        ].join('\n'),
        language: 'javascript',
        theme: 'vs'
    });
});
}(window, document));
