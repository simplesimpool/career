export let curAudioFileURL = null;

export function updateCurAudioFileURL(audioFile) {
    try {
        if(curAudioFileURL === null) {
            curAudioFileURL = URL.createObjectURL(audioFile);
        }
        else {
            URL.revokeObjectURL(curAudioFileURL);
            curAudioFileURL = URL.createObjectURL(audioFile);
        }
    }
    catch(err) {
        console.error(err);
        throw new Error(err);
    }
}