import { prevSongButtonImageElement,playPauseSongButtonImageElement,
    stopSongButtonImageElement, nextSongButtonImageElement} from "../../../../Model/Client/image-data.js";
import { audioFiles, audioPlayerElement, nowPlayingAudioFile, isPlaying,
    updateIsPlaying, updateNowPlayingAudioFile, 
    isShuffling, curLoopState, noLoop, oneSongLoop, totalSongLoop} from "../../../../Model/Client/audio-file-data.js";
import { audioProgressBarInputElement } from "../../../../Model/Client/input-data.js";
import { audioPlayingTimeFrameElement, lyricsFrameElement } from "../../../../Model/Client/frame-data.js";
import { updateCurAudioFileURL, curAudioFileURL } from "../../../../Model/Client/URL-data.js";
import { lyricsWatcher, setLyricsWatcher } from "../../../../Model/Client/lyrics-data.js";

let clickPrevSongButton;
prevSongButtonImageElement.addEventListener("click", clickPrevSongButton = async () => {
    try {
        prevSongButtonImageElement.removeEventListener("click", clickPrevSongButton);
        checkLyricsWatcher();
        const curAudioIndex = audioFiles.indexOf(nowPlayingAudioFile);
        let newAudioIndex = curAudioIndex - 1;

        if(newAudioIndex < 0) {
            newAudioIndex = audioFiles.length - 1;
            if(isPlaying === true) {
                if(curLoopState === noLoop) {
                    newAudioIndex = 0;
                    await updateWhenPlaying(curAudioIndex, newAudioIndex);
                }
                else if(curLoopState === oneSongLoop) {
                    newAudioIndex = 0;
                    await updateWhenPlaying(curAudioIndex, newAudioIndex);
                }
                else {
                    if(isShuffling === true) {
                        let randomIndex = Math.floor(Math.random() * audioFiles.length);
                        newAudioIndex = randomIndex;
                        while(newAudioIndex === curAudioIndex) {
                            randomIndex = Math.floor(Math.random() * audioFiles.length);
                            newAudioIndex = randomIndex;
                            if(audioFiles.length === 1) {
                                break;
                            }
                        }
                        await updateWhenPlaying(curAudioIndex, newAudioIndex);
                    }
                    else {
                        await updateWhenPlaying(curAudioIndex, newAudioIndex);
                    }
                }
            }
            else {//isPlaying is false
                if(curLoopState === noLoop) {
                    newAudioIndex = 0;
                    await updateWhenPausing(curAudioIndex, newAudioIndex);
                }
                else if(curLoopState === oneSongLoop) {
                    newAudioIndex = 0;
                    await updateWhenPausing(curAudioIndex, newAudioIndex);
                }
                else {
                    if(isShuffling === true) {
                        let randomIndex = Math.floor(Math.random() * audioFiles.length);
                        newAudioIndex = randomIndex;
                        while(newAudioIndex === curAudioIndex) {
                            randomIndex = Math.floor(Math.random() * audioFiles.length);
                            newAudioIndex = randomIndex;
                            if(audioFiles.length === 1) {
                                break;
                            }
                        }
                        await updateWhenPausing(curAudioIndex, newAudioIndex);
                    }
                    else {
                        await updateWhenPausing(curAudioIndex, newAudioIndex);
                    }
                }
            }
        }
        else {
            if(isPlaying === true) {
                if(curLoopState === noLoop) {
                    newAudioIndex = curAudioIndex;
                    await updateWhenPlaying(curAudioIndex, newAudioIndex);
                }
                else if(curLoopState === oneSongLoop) {
                    newAudioIndex = curAudioIndex;
                    await updateWhenPlaying(curAudioIndex, newAudioIndex);
                }
                else {
                    if(isShuffling === true) {
                        let randomIndex = Math.floor(Math.random() * audioFiles.length);
                        newAudioIndex = randomIndex;
                        while(newAudioIndex === curAudioIndex) {
                            randomIndex = Math.floor(Math.random() * audioFiles.length);
                            newAudioIndex = randomIndex;
                            if(audioFiles.length === 1) {
                                break;
                            }
                        }
                        await updateWhenPlaying(curAudioIndex, newAudioIndex);
                    }
                    else {
                        await updateWhenPlaying(curAudioIndex, newAudioIndex);
                    }
                }
            }
            else {//isPlaing === false
                if(curLoopState === noLoop) {
                    newAudioIndex = curAudioIndex;
                    await updateWhenPausing(curAudioIndex, newAudioIndex);
                }
                else if(curLoopState === oneSongLoop) {
                    newAudioIndex = curAudioIndex;
                    await updateWhenPausing(curAudioIndex, newAudioIndex);
                }
                else {//total song loop
                    if(isShuffling === true) {
                        let randomIndex = Math.floor(Math.random() * audioFiles.length);
                        newAudioIndex = randomIndex;
                        while(newAudioIndex === curAudioIndex) {
                            randomIndex = Math.floor(Math.random() * audioFiles.length);
                            newAudioIndex = randomIndex;
                            if(audioFiles.length === 1) {
                                break;
                            }
                        }
                        await updateWhenPausing(curAudioIndex, newAudioIndex);
                    }
                    else {
                        await updateWhenPausing(curAudioIndex, newAudioIndex);
                    }
                }
            }
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

        async function updateWhenPlaying(curIndex, newIndex) {
            try {
                const prevAudioFrameElement = document.querySelectorAll(".audio-file-frame")[curIndex];
                const curAudioFrameElement = document.querySelectorAll(".audio-file-frame")[newIndex];

                prevAudioFrameElement.style.fontWeight = "normal";
                curAudioFrameElement.style.fontWeight = "bold";
        
                updateNowPlayingAudioFile(audioFiles[newIndex]);
                updateIsPlaying(true);
                updateCurAudioFileURL(nowPlayingAudioFile);
                audioPlayerElement.src = curAudioFileURL;
                const task1 = await loadMetaData();

                function loadMetaData() {
                    return new Promise((resolve, reject) => {
                        let load;
                        audioPlayerElement.addEventListener('loadedmetadata', load = () => {
                            const durationMin = parseInt(audioPlayerElement.duration / 60);
                            const durationSec = parseInt(audioPlayerElement.duration % 60);
                            const currentMin = parseInt(audioPlayerElement.currentTime / 60);
                            const currentSec = parseInt(audioPlayerElement.currentTime % 60);
                            audioPlayingTimeFrameElement.textContent = 
                            `${currentMin}:${currentSec} / ${durationMin}:${durationSec}`;

                            audioProgressBarInputElement.value = 
                            (audioPlayerElement.currentTime / audioPlayerElement.duration) * 100;

                            audioPlayerElement.removeEventListener("loadedmetadata", load);
                        });
                        resolve();
                    });
                }
                
                audioPlayerElement.play();
            }
            catch(error) {
                throw new Error(error);
            }
        }

        async function updateWhenPausing(curIndex, newIndex) {
            try {
                const prevAudioFrameElement = document.querySelectorAll(".audio-file-frame")[curIndex];
                const curAudioFrameElement = document.querySelectorAll(".audio-file-frame")[newIndex];

                prevAudioFrameElement.style.fontWeight = "normal";
                curAudioFrameElement.style.fontWeight = "bold";

                updateNowPlayingAudioFile(audioFiles[newIndex]);
                updateIsPlaying(false);
                updateCurAudioFileURL(nowPlayingAudioFile);
                audioPlayerElement.src = curAudioFileURL;
                const task1 = await loadMetaData();

                function loadMetaData() {
                    return new Promise((resolve, reject) => {
                        let load;
                        audioPlayerElement.addEventListener('loadedmetadata', load = () => {
                            const durationMin = parseInt(audioPlayerElement.duration / 60);
                            const durationSec = parseInt(audioPlayerElement.duration % 60);
                            const currentMin = parseInt(audioPlayerElement.currentTime / 60);
                            const currentSec = parseInt(audioPlayerElement.currentTime % 60);
                            audioPlayingTimeFrameElement.textContent = 
                            `${currentMin}:${currentSec} / ${durationMin}:${durationSec}`;

                            audioProgressBarInputElement.value = 
                            (audioPlayerElement.currentTime / audioPlayerElement.duration) * 100;

                            audioPlayerElement.removeEventListener("loadedmetadata", load);
                        });
                        resolve();
                    });
                }
            }
            catch(error) {
                throw new Error(error);
            }
        }

        prevSongButtonImageElement.addEventListener("click", clickPrevSongButton);
    }
    catch(error) {
        prevSongButtonImageElement.addEventListener("click", clickPrevSongButton);
        console.log(error);
    }
}); 

let clickPlayPauseSongButton;
playPauseSongButtonImageElement.addEventListener("click", clickPlayPauseSongButton = () => {
    playPauseSongButtonImageElement.removeEventListener("click", clickPlayPauseSongButton);
    playPauseSongButtonImageElement.click();
    const playButtonSrc = "/View/Images/play-song-button.svg";
    const pauseButtonSrc = "/View/Images/pause-song-button.svg";
    
    if(audioPlayerElement.duration) {
        if(isPlaying === true) {
            audioPlayerElement.pause();
            playPauseSongButtonImageElement.src = playButtonSrc;
            updateIsPlaying(false);
        }
        else { 
            audioPlayerElement.play();
            playPauseSongButtonImageElement.src = pauseButtonSrc;
            updateIsPlaying(true);
        }
    }

    playPauseSongButtonImageElement.addEventListener("click", clickPlayPauseSongButton);
}); 

let clickStopSongButton;
stopSongButtonImageElement.addEventListener("click", clickStopSongButton = () => {
    stopSongButtonImageElement.removeEventListener("click", clickStopSongButton);
    if(audioPlayerElement.duration) {
        const playButtonSrc = "/View/Images/play-song-button.svg";
        const durationMin = parseInt(audioPlayerElement.duration / 60);
        const durationSec = parseInt(audioPlayerElement.duration % 60);
    
        audioPlayerElement.pause();
    
        playPauseSongButtonImageElement.src = playButtonSrc;
        audioPlayerElement.currentTime = 0;
        audioProgressBarInputElement.value = 0;
        audioPlayingTimeFrameElement.textContent = 
            `${0}:${0} / ${durationMin}:${durationSec}`;
    
        updateIsPlaying(false);
    }
    stopSongButtonImageElement.addEventListener("click", clickStopSongButton);
});

let clickNextSongButton;
nextSongButtonImageElement.addEventListener("click", clickNextSongButton = async () => {
    try {
        nextSongButtonImageElement.removeEventListener("click", clickNextSongButton);
        checkLyricsWatcher();
        const curAudioIndex = audioFiles.indexOf(nowPlayingAudioFile);
        let newAudioIndex = curAudioIndex + 1;

        if(newAudioIndex >= audioFiles.length) {
            newAudioIndex = 0;
            if(isPlaying === true) {
                if(curLoopState === noLoop) {
                    newAudioIndex = curAudioIndex;
                    await updateWhenPlaying(curAudioIndex, newAudioIndex);
                }
                else if(curLoopState === oneSongLoop) {
                    newAudioIndex = curAudioIndex;
                    await updateWhenPlaying(curAudioIndex, newAudioIndex);
                }
                else {
                    if(isShuffling === true) {
                        let randomIndex = Math.floor(Math.random() * audioFiles.length);
                        newAudioIndex = randomIndex;
                        while(newAudioIndex === curAudioIndex) {
                            randomIndex = Math.floor(Math.random() * audioFiles.length);
                            newAudioIndex = randomIndex;
                            if(audioFiles.length === 1) {
                                break;
                            }
                        }
                        await updateWhenPlaying(curAudioIndex, newAudioIndex);
                    }
                    else {
                        await updateWhenPlaying(curAudioIndex, newAudioIndex);
                    }
                }
            }
            else {
                if(curLoopState === noLoop) {
                    newAudioIndex = curAudioIndex;
                    await updateWhenPausing(curAudioIndex, newAudioIndex);
                }
                else if(curLoopState === oneSongLoop) {
                    newAudioIndex = curAudioIndex;
                    await updateWhenPausing(curAudioIndex, newAudioIndex);
                }
                else {
                    if(isShuffling === true) {
                        let randomIndex = Math.floor(Math.random() * audioFiles.length);
                        newAudioIndex = randomIndex;
                        while(newAudioIndex === curAudioIndex) {
                            randomIndex = Math.floor(Math.random() * audioFiles.length);
                            newAudioIndex = randomIndex;
                            if(audioFiles.length === 1) {
                                break;
                            }
                        }
                        await updateWhenPausing(curAudioIndex, newAudioIndex);
                    }
                    else {
                        await updateWhenPausing(curAudioIndex, newAudioIndex);
                    }
                }
            }
        }
        else {
            if(isPlaying === true) {
                if(curLoopState === noLoop) {
                    newAudioIndex = curAudioIndex;
                    await updateWhenPlaying(curAudioIndex, newAudioIndex);
                }
                else if(curLoopState === oneSongLoop) {
                    newAudioIndex = curAudioIndex;
                    await updateWhenPlaying(curAudioIndex, newAudioIndex);
                }
                else {
                    if(isShuffling === true) {
                        let randomIndex = Math.floor(Math.random() * audioFiles.length);
                        newAudioIndex = randomIndex;
                        while(newAudioIndex === curAudioIndex) {
                            randomIndex = Math.floor(Math.random() * audioFiles.length);
                            newAudioIndex = randomIndex;
                            if(audioFiles.length === 1) {
                                break;
                            }
                        }
                        await updateWhenPlaying(curAudioIndex, newAudioIndex);
                    }
                    else {
                        await updateWhenPlaying(curAudioIndex, newAudioIndex);
                    }
                }
            }
            else {//isPlaying is false
                if(curLoopState === noLoop) {
                    newAudioIndex = curAudioIndex;
                    await updateWhenPausing(curAudioIndex, newAudioIndex);
                }
                else if(curLoopState === oneSongLoop) {
                    newAudioIndex = curAudioIndex;
                    await updateWhenPausing(curAudioIndex, newAudioIndex);
                }
                else {
                    if(isShuffling === true) {
                        let randomIndex = Math.floor(Math.random() * audioFiles.length);
                        newAudioIndex = randomIndex;
                        while(newAudioIndex === curAudioIndex) {
                            randomIndex = Math.floor(Math.random() * audioFiles.length);
                            newAudioIndex = randomIndex;
                            if(audioFiles.length === 1) {
                                break;
                            }
                        }
                        await updateWhenPausing(curAudioIndex, newAudioIndex);
                    }
                    else {
                        await updateWhenPausing(curAudioIndex, newAudioIndex);
                    }
                }
            }
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

        async function updateWhenPlaying(curIndex, newIndex) {
            try {
                const prevAudioFrameElement = document.querySelectorAll(".audio-file-frame")[curIndex];
                const curAudioFrameElement = document.querySelectorAll(".audio-file-frame")[newIndex];

                prevAudioFrameElement.style.fontWeight = "normal";
                curAudioFrameElement.style.fontWeight = "bold";
        
                updateNowPlayingAudioFile(audioFiles[newIndex]);
                updateIsPlaying(true);
                updateCurAudioFileURL(nowPlayingAudioFile);
                audioPlayerElement.src = curAudioFileURL;
                const task1 = await loadMetaData();

                function loadMetaData() {
                    return new Promise((resolve, reject) => {
                        let load;
                        audioPlayerElement.addEventListener('loadedmetadata', load = () => {
                            const durationMin = parseInt(audioPlayerElement.duration / 60);
                            const durationSec = parseInt(audioPlayerElement.duration % 60);
                            const currentMin = parseInt(audioPlayerElement.currentTime / 60);
                            const currentSec = parseInt(audioPlayerElement.currentTime % 60);
                            audioPlayingTimeFrameElement.textContent = 
                            `${currentMin}:${currentSec} / ${durationMin}:${durationSec}`;

                            audioProgressBarInputElement.value = 
                            (audioPlayerElement.currentTime / audioPlayerElement.duration) * 100;

                            audioPlayerElement.removeEventListener("loadedmetadata", load);
                        });
                        resolve();
                    });
                }
                
                audioPlayerElement.play();
            }
            catch(error) {
                throw new Error(error);
            }
        }

        async function updateWhenPausing(curIndex, newIndex) {
            try {
                const prevAudioFrameElement = document.querySelectorAll(".audio-file-frame")[curIndex];
                const curAudioFrameElement = document.querySelectorAll(".audio-file-frame")[newIndex];

                prevAudioFrameElement.style.fontWeight = "normal";
                curAudioFrameElement.style.fontWeight = "bold";

                updateNowPlayingAudioFile(audioFiles[newIndex]);
                updateIsPlaying(false);
                updateCurAudioFileURL(nowPlayingAudioFile);
                audioPlayerElement.src = curAudioFileURL;
                const task1 = await loadMetaData();

                function loadMetaData() {
                    return new Promise((resolve, reject) => {
                        let load;
                        audioPlayerElement.addEventListener('loadedmetadata', load = () => {
                            const durationMin = parseInt(audioPlayerElement.duration / 60);
                            const durationSec = parseInt(audioPlayerElement.duration % 60);
                            const currentMin = parseInt(audioPlayerElement.currentTime / 60);
                            const currentSec = parseInt(audioPlayerElement.currentTime % 60);
                            audioPlayingTimeFrameElement.textContent = 
                            `${currentMin}:${currentSec} / ${durationMin}:${durationSec}`;

                            audioProgressBarInputElement.value = 
                            (audioPlayerElement.currentTime / audioPlayerElement.duration) * 100;

                            audioPlayerElement.removeEventListener("loadedmetadata", load);
                        });
                        resolve();
                    });
                }
            }
            catch(error) {
                throw new Error(error);
            }
        }

        nextSongButtonImageElement.addEventListener("click", clickNextSongButton);
    }
    catch(error) {
        nextSongButtonImageElement.addEventListener("click", clickNextSongButton);
        console.log(error);
    }
});

function startTaskAfterAudioEnded() {
    doTaskAfterAudioEnded();
}

async function doTaskAfterAudioEnded() {
    try {
        audioPlayerElement.removeEventListener("ended", startTaskAfterAudioEnded);
        checkLyricsWatcher();
        const curAudioIndex = audioFiles.indexOf(nowPlayingAudioFile);
        let newAudioIndex = (curAudioIndex + 1) % audioFiles.length;

        if(curLoopState === noLoop) {
            clearInterval(displayAudioProcessThread);
            audioPlayerElement.currentTime = 0;
            const playButtonSrc = "/View/Images/play-song-button.svg";
            const durationMin = parseInt(audioPlayerElement.duration / 60);
            const durationSec = parseInt(audioPlayerElement.duration % 60);
            const currentMin = parseInt(audioPlayerElement.currentTime / 60);
            const currentSec = parseInt(audioPlayerElement.currentTime % 60);
    
            playPauseSongButtonImageElement.src = playButtonSrc;
            audioPlayingTimeFrameElement.textContent = 
            `${currentMin}:${currentSec} / ${durationMin}:${durationSec}`;
            audioProgressBarInputElement.value = 
            (audioPlayerElement.currentTime / audioPlayerElement.duration) * 100;
            updateIsPlaying(false);
    
            displayAudioProcessThread = setInterval(() => {
                if((audioPlayerElement.currentTime / audioPlayerElement.duration) * 100) {
                    const durationMin = parseInt(audioPlayerElement.duration / 60);
                    const durationSec = parseInt(audioPlayerElement.duration % 60);
                    const currentMin = parseInt(audioPlayerElement.currentTime / 60);
                    const currentSec = parseInt(audioPlayerElement.currentTime % 60);
                    audioPlayingTimeFrameElement.textContent = 
                    `${currentMin}:${currentSec} / ${durationMin}:${durationSec}`;
        
                    audioProgressBarInputElement.value = 
                      (audioPlayerElement.currentTime / audioPlayerElement.duration) * 100;
                }
            },10);
        }
        else if(curLoopState === oneSongLoop) {
            audioPlayerElement.play();
        }
        else {//total song loop
            if(isShuffling === true) {
                let randomIndex = Math.floor(Math.random() * audioFiles.length);
                newAudioIndex = randomIndex;
                while(newAudioIndex === curAudioIndex) {
                    randomIndex = Math.floor(Math.random() * audioFiles.length);
                    newAudioIndex = randomIndex;
                    if(audioFiles.length === 1) {
                        break;
                    }
                }
                await updateWhenPlaying(curAudioIndex, newAudioIndex);
            }
            else {
                await updateWhenPlaying(curAudioIndex, newAudioIndex);
            }
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

        async function updateWhenPlaying(curIndex, newIndex) {
            try {
                const prevAudioFrameElement = document.querySelectorAll(".audio-file-frame")[curIndex];
                const curAudioFrameElement = document.querySelectorAll(".audio-file-frame")[newIndex];
                prevAudioFrameElement.style.fontWeight = "normal";
                curAudioFrameElement.style.fontWeight = "bold";
                updateNowPlayingAudioFile(audioFiles[newIndex]);
                updateIsPlaying(true);
                updateCurAudioFileURL(nowPlayingAudioFile);
                audioPlayerElement.src = curAudioFileURL;
                const task1 = await loadMetaData();

                function loadMetaData() {
                    return new Promise((resolve, reject) => {
                        let load;
                        audioPlayerElement.addEventListener('loadedmetadata', load = () => {
                            const durationMin = parseInt(audioPlayerElement.duration / 60);
                            const durationSec = parseInt(audioPlayerElement.duration % 60);
                            const currentMin = parseInt(audioPlayerElement.currentTime / 60);
                            const currentSec = parseInt(audioPlayerElement.currentTime % 60);
                            audioPlayingTimeFrameElement.textContent = 
                            `${currentMin}:${currentSec} / ${durationMin}:${durationSec}`;

                            audioProgressBarInputElement.value = 
                            (audioPlayerElement.currentTime / audioPlayerElement.duration) * 100;

                            audioPlayerElement.removeEventListener("loadedmetadata", load);
                        });
                        resolve();
                    });
                }
                
                audioPlayerElement.play();
            }
            catch(error) {
                throw new Error(error);
            }
        }

        audioPlayerElement.addEventListener("ended", startTaskAfterAudioEnded);
    }
    catch(error) {
        console.log(error);
    }

}
audioPlayerElement.addEventListener("ended", startTaskAfterAudioEnded);

let displayAudioProcessThread = setInterval(() => {
    if((audioPlayerElement.currentTime / audioPlayerElement.duration) * 100) {
        const durationMin = parseInt(audioPlayerElement.duration / 60);
        const durationSec = parseInt(audioPlayerElement.duration % 60);
        const currentMin = parseInt(audioPlayerElement.currentTime / 60);
        const currentSec = parseInt(audioPlayerElement.currentTime % 60);
        audioPlayingTimeFrameElement.textContent = 
        `${currentMin}:${currentSec} / ${durationMin}:${durationSec}`;

        audioProgressBarInputElement.value = 
          (audioPlayerElement.currentTime / audioPlayerElement.duration) * 100;
    }
},10);

audioProgressBarInputElement.addEventListener("mousedown", () => {
    if(audioPlayerElement.duration) {
        let mouseMoveListener;
        let mouseUpListener;
        clearInterval(displayAudioProcessThread);

        window.addEventListener("mousemove", mouseMoveListener = () => {
            setAudioPlayingTime();
        });
        
        window.addEventListener("mouseup", mouseUpListener = () => {
            setAudioProcess(mouseMoveListener, mouseUpListener);
        });
    }
});

function setAudioPlayingTime() {
    const currentTime = (audioProgressBarInputElement.value * audioPlayerElement.duration) / 100;

    if(currentTime !== NaN) {
        const durationMin = parseInt(audioPlayerElement.duration / 60);
        const durationSec = parseInt(audioPlayerElement.duration % 60);
        const currentMin = parseInt(currentTime / 60);
        const currentSec = parseInt(currentTime % 60);
        audioPlayingTimeFrameElement.textContent = 
        `${currentMin}:${currentSec} / ${durationMin}:${durationSec}`;
    }
}

function setAudioProcess(mouseMoveListener, mouseUpListener) {
    audioPlayerElement.currentTime = 
    (audioProgressBarInputElement.value * audioPlayerElement.duration) / 100;

    displayAudioProcessThread = setInterval(() => {
        if((audioPlayerElement.currentTime / audioPlayerElement.duration) * 100) {
            const durationMin = parseInt(audioPlayerElement.duration / 60);
            const durationSec = parseInt(audioPlayerElement.duration % 60);
            const currentMin = parseInt(audioPlayerElement.currentTime / 60);
            const currentSec = parseInt(audioPlayerElement.currentTime % 60);
            audioPlayingTimeFrameElement.textContent = 
            `${currentMin}:${currentSec} / ${durationMin}:${durationSec}`;

            audioProgressBarInputElement.value = 
              (audioPlayerElement.currentTime / audioPlayerElement.duration) * 100;
        }
    },10);

    window.removeEventListener("mousemove", mouseMoveListener);
    window.removeEventListener("mouseup", mouseUpListener);
}


