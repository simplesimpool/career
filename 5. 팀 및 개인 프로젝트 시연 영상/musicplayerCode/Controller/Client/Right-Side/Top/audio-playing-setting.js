import { curLoopState, isShuffling, noLoop, oneSongLoop, 
    totalSongLoop,updateCurLoopState, 
    updateIsShuffling} from "../../../../Model/Client/audio-file-data.js";
import { repeatButtonImageElement, shuffleButtonImageElement } from "../../../../Model/Client/image-data.js";

 
let clickRepeatButton
repeatButtonImageElement.addEventListener("click", clickRepeatButton = () => {
    repeatButtonImageElement.removeEventListener("click", clickRepeatButton);
    repeatButtonImageElement.click();

    let newLoopState = (curLoopState + 1) % 3;

    if(curLoopState === totalSongLoop) {
        repeatButtonImageElement.src = "/View/Images/repeat-one-button.svg";
        updateCurLoopState(newLoopState); //1
    }
    else if(curLoopState === oneSongLoop) {
        repeatButtonImageElement.src = "/View/Images/no-repeat-button.svg";
        updateCurLoopState(newLoopState); //2
    }
    else {//noLoop
        repeatButtonImageElement.src = "/View/Images/repeat-total-button.svg";
        updateCurLoopState(newLoopState); //0
    }
    
    repeatButtonImageElement.addEventListener("click", clickRepeatButton);
});

let clickShuffleButton;
shuffleButtonImageElement.addEventListener("click", clickShuffleButton = () => {
    shuffleButtonImageElement.removeEventListener("click", clickShuffleButton);
    shuffleButtonImageElement.click();

    if(isShuffling === false) {
        shuffleButtonImageElement.src = "/View/Images/shuffle-on-button.svg";
        updateIsShuffling(true);
    }
    else {
        shuffleButtonImageElement.src = "/View/Images/shuffle-off-button.svg";
        updateIsShuffling(false);
    }

    shuffleButtonImageElement.addEventListener("click", clickShuffleButton);
});