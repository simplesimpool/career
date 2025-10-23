import {  rightSideFrameElement, rightTopItemFrameElement, 
rightMiddleItemFrameElements, rightBottomItemFrameElement } from "../../../Model/Client/frame-data.js";
import { resetImageElement } from "../../../Model/Client/image-data.js";
addResetSizeListeners();

function addResetSizeListeners() {
    window.addEventListener("load", initRightItemsFrame);

    resetImageElement.addEventListener("click", function() {
        resetSize();
    });
}

function initRightItemsFrame() {
    let leftHeight = 100;
    const topElement = rightTopItemFrameElement;
    const topElementStyle = window.getComputedStyle(topElement);
    const topElementMinHeight = parseFloat(topElementStyle.getPropertyValue("min-height"));
    leftHeight -= topElementMinHeight;

    const betweenElements = rightMiddleItemFrameElements;
    for(const betweenElement of betweenElements) {
        const betweenElementStyle = window.getComputedStyle(betweenElement);
        const betweenElementHeight = parseFloat(betweenElementStyle.getPropertyValue("min-height"));
        leftHeight -= betweenElementHeight;
    }

    const bottomElement = rightBottomItemFrameElement;
    bottomElement.style.minHeight = `${leftHeight}%`;
}

function resetSize() { //This function divides right-side-frame evenly.
    const numOfElements = rightSideFrameElement.childElementCount;

    rightTopItemFrameElement.style.height = `${100 / numOfElements}%`;

    for(const element of rightMiddleItemFrameElements) {
        element.style.height = `${100 / numOfElements}%`;
    }

    rightBottomItemFrameElement.style.height = `${100 / numOfElements}%`;
}
