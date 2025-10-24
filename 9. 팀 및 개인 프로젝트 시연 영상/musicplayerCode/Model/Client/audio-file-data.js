export let audioFiles = [];
export let audioFrameElements = [];
export let nowPlayingAudioFile = null;
export let prevPlayedAudioFile = null;

export let isPlaying = false;
export let isMuting = false;

export let isShuffling = false;
export let curLoopState = 0;

export let totalSongLoop = 0;
export let oneSongLoop = 1;
export let noLoop = 2;

export const audioPlayerElement = document.querySelector(".audio-player");

export function updateNowPlayingAudioFile(audioFile) {
    updatePrevPlayedAudioFile(nowPlayingAudioFile);
    nowPlayingAudioFile = audioFile;
}

export function updateIsPlaying(state) {
    isPlaying = state;
}

export function updateIsShuffling(state) {
    isShuffling = state;
}

export function updateIsMuting(state) {
    isMuting = state;
}

export function updateCurLoopState(value) {
    curLoopState = value;
}

export function updatePrevPlayedAudioFile(audioFile) {
    prevPlayedAudioFile = audioFile;
}