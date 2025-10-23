import { mainFrameElement } from "../../../Model/Client/frame-data.js";

addMainFrameListeners();

function addMainFrameListeners() {
    window.addEventListener("load", updateMainFrame);
    window.addEventListener("resize", updateMainFrame);
}

function updateMainFrame() {//Update .main-frame css properties whenever the browser is resized or loaded
    mainFrameElement.style.marginLeft = `${window.innerWidth / 8}px`;
    mainFrameElement.style.marginRight = `${window.innerWidth / 8}px`;
    mainFrameElement.style.marginTop = `${window.innerHeight / 20}px`;
    mainFrameElement.style.marginBottom = `${window.innerHeight / 10}px`;

    const style = window.getComputedStyle(mainFrameElement);

    mainFrameElement.style.width = `${window.innerWidth - 
        parseFloat(style.marginLeft) - parseFloat(style.marginRight)}px`;
    mainFrameElement.style.height = `${window.innerHeight - 
        parseFloat(style.marginTop) - parseFloat(style.marginBottom)}px`;
}