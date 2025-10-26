import { volumeButtonImageElement } from "../../../../Model/Client/image-data.js";
import { volumeProgressBarInputElement } from "../../../../Model/Client/input-data.js";
import { audioPlayerElement } from "../../../../Model/Client/audio-file-data.js";


let clickVolumeButton;
volumeButtonImageElement.addEventListener("click", clickVolumeButton = () => {
    volumeButtonImageElement.removeEventListener("click", clickVolumeButton);
    volumeButtonImageElement.click();

    //change volume button
    volumeButtonImageElement.addEventListener("click", clickVolumeButton);
});

volumeProgressBarInputElement.addEventListener("click", () => {
    changeVolume();
});

volumeProgressBarInputElement.addEventListener("mousedown", () => {
    let mouseMoveListener;
    let mouseUpListener;

    window.addEventListener("mousemove", mouseMoveListener = () => {
        changeVolume();
    });
    window.addEventListener("mouseup", mouseUpListener = () => {
        stopChangeVolume(mouseMoveListener, mouseUpListener);
    });
});

function changeVolume() {
    audioPlayerElement.volume = volumeProgressBarInputElement.value * 0.01;
}

function stopChangeVolume(mouseMoveListener, mouseUpListener) {
    window.removeEventListener("mousemove", mouseMoveListener);
    window.removeEventListener("mouseup", mouseUpListener);
}