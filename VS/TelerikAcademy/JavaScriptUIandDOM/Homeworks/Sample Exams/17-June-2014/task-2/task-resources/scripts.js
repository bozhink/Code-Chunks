/* globals $ */
$.fn.gallery = function (columnsPerRow) {
    columnsPerRow = columnsPerRow || 4;

    var $this = $(this),
        $selected = $this.children('.selected'),
        $galleryList = $this.children('.gallery-list'),
        $imageContainers = $galleryList.children('.image-container'),
        $currentImage = $selected.find('#current-image'),
        $previousImage = $selected.find('#previous-image'),
        $nextImage = $selected.find('#next-image');

    $imageContainers.each(function (index, element) {
        if (index % columnsPerRow === 0) {
            $(element).addClass('clearfix');
        }
    });

    function setImageInformation($element, src, index) {
        $element.attr({
            'src': src,
            'data-info': index
        });
    }

    function getImageInformation($element) {
        return {
            src: $element.attr('src'),
            index: parseInt($element.attr('data-info'))
        };
    }

    function getImageByIndex(index) {
        return $this.find('img[data-info="' + index + '"]');
    }

    function getNextIndex(index) {
        var len = $imageContainers.length;
        return (index + len) % len + 1;
    }

    function getPreviousIndex(index) {
        var len = $imageContainers.length;
        return (index - 2 + len) % len + 1;
    }

    function clickEvent() {
        var $that = $(this),
            $currentImageInfo = getImageInformation($that),
            previousIndex = getPreviousIndex($currentImageInfo.index),
            previousImage = getImageByIndex(previousIndex),
            previousImageInfo = getImageInformation(previousImage),
            nextIndex = getNextIndex($currentImageInfo.index),
            nextImage = getImageByIndex(nextIndex),
            nextImageInfo = getImageInformation(nextImage);

        $galleryList.addClass('blurred');

        $('<div>').addClass('disabled-background').appendTo($galleryList);

        setImageInformation($previousImage, previousImageInfo.src, previousImageInfo.index);
        setImageInformation($currentImage, $currentImageInfo.src, $currentImageInfo.index);
        setImageInformation($nextImage, nextImageInfo.src, nextImageInfo.index);

        $selected.show();
    }

    $galleryList.on('click', 'img', clickEvent);

    $currentImage.on('click', function () {
        $galleryList.removeClass('blurred');
        $galleryList.children('.disabled-background').remove();
        $selected.hide();
    });
    
    $previousImage.on('click', clickEvent);
    $nextImage.on('click', clickEvent);

    $this.addClass('gallery');
    $selected.hide();

    return this;
};