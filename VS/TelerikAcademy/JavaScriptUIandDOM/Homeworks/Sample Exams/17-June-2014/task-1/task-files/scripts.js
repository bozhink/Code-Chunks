function createImagesPreviewer(selector, items) {
	var id, i, len, myElement,
			contents;

	// Check for missing parameters
	if (selector == null) {
		throw new Error('Input parameters are obligatiry.');
	}

	// Check for invalid parameters' type
	if (typeof(selector) !== 'string') {
		throw new Error('Id must be a string and contents must be an array');
	}

	// Sets the main object
	myElement = selector;
	if (!(myElement instanceof HTMLElement)) {
		if (selector[0] === "#") {
			myElement = [document.getElementById(selector.substr(1))];
		} else if (selector[0] === ".") {
			myElement = document.getElementsByClassName(selector.substr(1));
		} else {
			myElement = document.getElementsByTagName(selector);
		}

		if (myElement == null) {
			throw new Error('No such an element ' + selector);
		}

		myElement = myElement[0];
	}

	var mainPreviewFrame = document.createElement('section');
	mainPreviewFrame.innerHTML = '<div id="main-preview"></div>';
	mainPreviewFrame.style.float="left";
	mainPreviewFrame.style.width="450px";

	myElement.appendChild(mainPreviewFrame);

	// Layout
	var nav = document.createElement('nav');
	nav.style.float = 'left';
	nav.innerHTML = '<input type="text" id="serach-box" />';

	var itemsHolder = document.createElement('div');
	itemsHolder.id = 'items';

	generateNavContent(itemsHolder, items);

	nav.appendChild(itemsHolder);

	myElement.appendChild(nav);

	var thumbnails = document.getElementsByClassName('thumbnail');
	for (i = 0, len = thumbnails.length; i < len; i += 1) {
		thumbnails[i].addEventListener('mouseover', function(){
			this.style.backgroundColor = 'red';
		}, false);

		thumbnails[i].addEventListener('mouseout', function(){
			this.style.backgroundColor = 'purple';
		}, false);

		thumbnails[i].addEventListener('click', function(){
			this.style.backgroundColor = 'green';
		}, false);
	}

	var searchBox = document.getElementById('serach-box');
	searchBox.addEventListener('change', function () {
		var that = this;
		var itemsHolder = document.getElementById('items');
		var text  = that.value;
		console.log('"' + text + '"')
		var previewItems = [];
		if (text.length > 0) {
			previewItems = searchResult(text, items);
		} else {
			previewItems = items.slice(0);
		}
		generateNavContent(itemsHolder, previewItems);
	}, false);

}

function generateNavContent(element, items) {
	var thumbImg = document.createElement('img');
	thumbImg.width = 100;

	var thumbDiv = document.createElement('div');
	thumbDiv.className = 'thumbnail';
	thumbDiv.style.textAlign = 'center';
	thumbDiv.style.backgroundColor = 'purple';

	var thisImg,
		thisDiv,
		fragment = '';
	for (i = 0, len = items.length; i < len; i += 1) {
		thisDiv = thumbDiv.cloneNode();
		thisDiv.innerHTML = '<h3>' + items[i].title + '</h3>';
		
		thisImg = thumbImg.cloneNode();
		thisImg.src = items[i].url;
		thisImg.title = items[i].title;

		thisDiv.appendChild(thisImg);

		fragment += thisDiv.outerHTML;
	}

	element.innerHTML = fragment;

	// set main-preview
	if (items.length > 0) {
		setMainPreviewElement(items[0]);
	} else {
		setMainPreviewElement();
	}
}

function setMainPreviewElement(item) {
	var mainPreviewElement = document.getElementById('main-preview');
	if (item == null) {
		mainPreviewElement.innerHTML = '';
	} else {
		var img = document.createElement('img');
		img.width = 450;
		img.src = item.url;
		img.title = item.title;
		mainPreviewElement.innerHTML = img.outerHTML;
	}
}


function searchResult(text, items) {
	var result = [], i, len;
	text = text.toLowerCase();
	for (i = 0, len = items.length; i < len; i += 1) {
		if (items[i].title.toLowerCase().indexOf(text) >= 0) {
			result.push(items[i]);
		}
	}

	return result;
}
