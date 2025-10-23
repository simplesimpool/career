import { addFolderImageElement } from "../../../Model/Client/image-data.js";
import { folderInputElement } from "../../../Model/Client/input-data.js";
import { rightBottomItemFrameElement } from "../../../Model/Client/frame-data.js";
import { audioFiles, updateIsPlaying, updateNowPlayingAudioFile, audioPlayerElement,
    prevPlayedAudioFile } from "../../../Model/Client/audio-file-data.js";
import { playPauseSongButtonImageElement } from "../../../Model/Client/image-data.js";
import { curAudioFileURL, updateCurAudioFileURL } from "../../../Model/Client/URL-data.js";
import { lyricsWatcher, setLyricsWatcher } from "../../../Model/Client/lyrics-data.js";    
import { lyricsFrameElement } from "../../../Model/Client/frame-data.js";

function clickLoadFolderImageElement() {
    folderInputElement.click();
}

addFolderImageElement.addEventListener("click", clickLoadFolderImageElement);

folderInputElement.addEventListener('change', async (event) => {
    try {
        if(event.target.files.length > 0) {
            const task1 = await disableLoadFolderClick();
            const task2 = await displayFolderLoading();
            const task3 = await addToAudioFiles(event.target.files);
            const task4 = await createDivAndInsert(event.target.files);
            const task5 = await clearFolderLoading();
            const task6 = await enableLoadFolderClick();
        }
    }
    catch(error) {
        console.log(error);
    }
});

function disableLoadFolderClick() {
    return new Promise((resolve, reject) => {
        addFolderImageElement.removeEventListener("click", clickLoadFolderImageElement);
        //make the file image have dark color or change opacity
        resolve();
    });
}

function displayFolderLoading() {
    return new Promise((resolve, reject) => {
        const loadingElement = document.createElement("div");
        loadingElement.classList.add("folder-loading");
        loadingElement.textContent = "Loading...";
        rightBottomItemFrameElement.appendChild(loadingElement);
        resolve();
    });
}

function addToAudioFiles(selectedFiles) {
    return new Promise((resolve, reject) => {
        for(const selectedFile of selectedFiles) {
            if(selectedFile.type.match("audio") != null) {
                audioFiles.push(selectedFile);
            }
        }
        resolve();
    });
}

function createDivAndInsert(selectedFiles) {
    return new Promise((resolve, reject) => {
        for(const selectedFile of selectedFiles) {
            if(selectedFile.type.match("audio") != null) {
                const bottomPaddingElement = document.querySelector(".audio-file-frame-padding");
                const audioFrameElement = document.createElement("div");

                audioFrameElement.classList.add("audio-file-frame");
                audioFrameElement.textContent = `${selectedFile.name}`;
                
                audioFrameElement.addEventListener("dblclick", async () => {
                    try {
                        checkLyricsWatcher();
                        updateNowPlayingAudioFile(selectedFile);
                        updateIsPlaying(true);
                        audioFrameElement.style.fontWeight = "bold";

                        if(prevPlayedAudioFile != null) {
                            const prevAudioFrameElement = document.querySelectorAll(".audio-file-frame")
                            [audioFiles.indexOf(prevPlayedAudioFile)];

                            prevAudioFrameElement.style.fontWeight = "normal";
                        }

                        updateCurAudioFileURL(selectedFile);
                        const pauseButtonSrc = "/View/Images/pause-song-button.svg";
                        playPauseSongButtonImageElement.src = pauseButtonSrc;
                        audioPlayerElement.src = curAudioFileURL;
                        const task1 = await loadMetaData();
                        audioPlayerElement.play();

                        function loadMetaData() {   
                            return new Promise((resolve, reject) => {
                                let load;
                                audioPlayerElement.addEventListener('loadedmetadata', load = () => {
                                    //disable slider thumb

                                    audioPlayerElement.removeEventListener("loadedmetadata", load);
                                });
                                resolve();
                            });
                        }

                        function checkLyricsWatcher() {
                            if(lyricsWatcher !== null) {
                                clearInterval(lyricsWatcher);
                                setLyricsWatcher(null);
                        
                                const parentDiv = lyricsFrameElement;
                                while (parentDiv.firstChild) {
                                    parentDiv.removeChild(parentDiv.firstChild);
                                }
                            }
                        }
                    }
                    catch(error) {
                        throw new Error(error);
                    }
                });
                rightBottomItemFrameElement.insertBefore(audioFrameElement, bottomPaddingElement);
            }
        }
        resolve();
    });
}

function clearFolderLoading() {
    return new Promise((resolve, reject) => {
        const loadingeElement = document.querySelector(".folder-loading");
        loadingeElement.remove();
        resolve();
    });
}

function enableLoadFolderClick() {
    return new Promise((resolve, reject) => {
        addFolderImageElement.addEventListener("click", clickLoadFolderImageElement);
        resolve();
    });
}