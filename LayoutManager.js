function AdaptiveLayoutManager(originalWidth,originalHeight,newWidth,newHeight) {
    this.originalWidth = originalWidth;
    this.originalHeight = originalHeight;
    this.newWidth = newWidth;
    this.newHeight = newHeight;
}

AdaptiveLayoutManager.prototype.updateWindowWidth = function(width) {
    this.newWidth = width;
}

AdaptiveLayoutManager.prototype.updateWindowHeight = function(height) {
    this.newHeight = height;
}

AdaptiveLayoutManager.prototype.width = function(width) {
    var factor =  width / this.originalWidth;
    var adaptiveWidth = factor * this.newWidth;
    return adaptiveWidth;
}

AdaptiveLayoutManager.prototype.height = function(height) {
    var factor =  height / this.originalHeight;
    var adaptiveHeight = factor * this.newHeight;
    return adaptiveHeight;
}

AdaptiveLayoutManager.prototype.average = function(avg) {
    var adaptiveAvg =  ( this.height(avg) + this.width(avg)) /2
    return adaptiveAvg;
}
