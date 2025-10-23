import { audioFrameElements, curAudioFrameElement, updateCurAudioFrameElement } from "../../../Model/Client/frame-data.js";
import { audioFiles } from "../../../Model/Client/audio-file-data.js";

addAudioActions();
function addAudioActions() {
    try {
        const deleteSongElement = document.querySelector(".delete-song");
        deleteSongElement.addEventListener("click", async () => {
            for(const element of audioFrameElements) {
                if(element === curAudioFrameElement) {
                    const targetFrameIndex = audioFrameElements.indexOf(element);
                    let targetAudioIndex = 0;

                    for(const audioFile of audioFiles) {
                        if(element.textContent === audioFile.name) {
                            break;
                        }
                        targetAudioIndex++;
                    }

                    if(targetAudioIndex >= audioFiles.length) {
                        throw new Error;
                    }
                    else {
                        element.remove();
                        updateCurAudioFrameElement(null);
                        audioFiles.splice(targetAudioIndex, 1);
                        audioFrameElements.splice(targetFrameIndex, 1);
                    }
                    break;
                }
            }
        });
    }
    catch(err) {
        console.error(err);
    }
 
}
