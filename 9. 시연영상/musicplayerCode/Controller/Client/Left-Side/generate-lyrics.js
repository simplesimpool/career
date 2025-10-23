import { nowPlayingAudioFile } from "../../../Model/Client/audio-file-data.js";
import { lyricsImageElement } from "../../../Model/Client/image-data.js"
import { lyricsFrameElement } from "../../../Model/Client/frame-data.js";
import { lyricsWatcher, setLyricsWatcher } from "../../../Model/Client/lyrics-data.js";
import { audioPlayerElement } from "../../../Model/Client/audio-file-data.js";

let clickLyricsImageElement;
let recvData = null;

lyricsImageElement.addEventListener("click", clickLyricsImageElement = async () => {
    try {
        const task1 = await checkLyricsWatcher();
        const task2 = await disableLyricsClick();
        const task3 = await insertLoading();
        const tast4 = await requestLyrics();
        const task5 = await clearLoading();
        const task6 = await insertLyricsFrame();
        const task7 = await runLyricsWatcher();
        const task8 = await enableGenerateLyricsClick();
    }
    catch(err) {
        await clearOnlyLoading();
        await enableGenerateLyricsClick();
        alert("Requesting ai lyrics has been failed.");
        console.error(err);
    }
});

async function checkLyricsWatcher() {
    if(lyricsWatcher !== null) {
        clearInterval(lyricsWatcher);
        setLyricsWatcher(null);

        const parentDiv = lyricsFrameElement;
        while (parentDiv.firstChild) {
            parentDiv.removeChild(parentDiv.firstChild);
        }
    }
}

async function disableLyricsClick() {
    lyricsImageElement.removeEventListener("click", clickLyricsImageElement);
}

async function insertLoading() {
    const parentDiv = lyricsFrameElement;
    const childDiv = document.createElement("div");

    childDiv.classList.add('loading-frame');
    childDiv.textContent = "Loading...";
    parentDiv.appendChild(childDiv);
}

async function requestLyrics() {
    const formData = new FormData();
    formData.append('file', nowPlayingAudioFile);

    await axios.post('http://localhost:3000/data/lyrics', formData, { 
            headers: { 
                'Content-Type': 'multipart/form-data' 
            } 
        }
    )
    .then(response => {
        recvData = response.data;
        // console.log(recvData.sentences);
        if(response.data === null) {
            throw new Error("client has been received null data");
        }
    })
    .catch(err => {
        throw new Error(err);
    });
}

async function clearLoading() {
    const parentDiv = lyricsFrameElement;
    const childDiv = parentDiv.querySelector(".loading-frame");

    parentDiv.removeChild(childDiv);
}

async function clearOnlyLoading() {
    const parentDiv = lyricsFrameElement;
    const childDiv = parentDiv.querySelector(".loading-frame");

    if(childDiv !== null) {
        parentDiv.removeChild(childDiv);
    }
}

async function insertLyricsFrame() {
    const parentDiv = lyricsFrameElement;
    for(const sentence of recvData.sentences) {
        const childDiv = document.createElement("div");

        childDiv.classList.add('sentence-frame');
        if (!childDiv.hasAttribute('tabindex')) {
            childDiv.setAttribute('tabindex', '0');
        }
        childDiv.textContent = sentence.text;
        parentDiv.appendChild(childDiv);
    }
}

async function runLyricsWatcher() {
    const divs = document.querySelectorAll(".sentence-frame");
    setLyricsWatcher(setInterval(() => {
        for(const sentence of recvData.sentences) {
            const startTime = sentence.start * 0.001;
            const endTime = sentence.end * 0.001;
            const divPos = recvData.sentences.indexOf(sentence);

            if(audioPlayerElement.currentTime >= startTime && audioPlayerElement.currentTime <= endTime) {
                divs[divPos].focus();
                break;                                          
            }
        }
    }, 100));
}

async function enableGenerateLyricsClick() {
    lyricsImageElement.addEventListener("click", clickLyricsImageElement);
}



