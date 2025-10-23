export const mainFrameElement = document.querySelector(".main-frame");

export const leftSideFrameElement = document.querySelector(".left-side-frame");
export const rightSideFrameElement = document.querySelector(".right-side-frame");

export const rightTopItemFrameElement = document.querySelector(".right-top-item-frame");
export const rightMiddleItemFrameElements = document.querySelectorAll(".right-middle-item-frame");
export const rightBottomItemFrameElement = document.querySelector(".right-bottom-item-frame");

export const rightItemBottomScrollBarElements = document.querySelectorAll(".right-item-bottom-scroll-bar");
export const rightItemTopScrollBarElements = document.querySelectorAll(".right-item-top-scroll-bar");

export const audioControlFrameElement = document.querySelector(".audio-control-frame");
export const audioButtonContainerElement = document.querySelector(".audio-button-container");
export const audioPlaySettingContainerElement = document.querySelector(".audio-play-setting-container");
export const audioVolumeContainerElement = document.querySelector(".audio-volume-container");

export const audioInformationFrameElement = document.querySelector(".audio-information-frame");
export const audioPlayingTimeFrameElement = document.querySelector(".audio-playing-time-frame");

export const lyricsFrameElement = document.querySelector(".lyrics-frame");

export let audioFrameElements = [];
export let curAudioFrameElement = null;
export function updateCurAudioFrameElement(element) {
    curAudioFrameElement = element;
}