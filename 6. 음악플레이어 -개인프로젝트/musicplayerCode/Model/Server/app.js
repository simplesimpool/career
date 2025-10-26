const express = require("express")
const cluster = require("cluster");
const os = require("os");
const path = require('path');
const fs = require('fs');
const cors = require("cors");
const multer = require("multer");
const axios = require("axios");
const FormData = require('form-data');
const { AssemblyAI } = require("assemblyai");

const PORT = 3000;
const numCPUs = os.cpus().length;
const app = express();

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null,  path.join(__dirname, "Uploads")) // uploads is the directory where files will be stored
    },
    filename: function (req, file, cb) {
        cb(null, file.originalname) // use the original filename as the stored filename
    }
});
const upload = multer({ storage: storage });

app.use(cors());
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use(express.static(path.join(__dirname, "..", "..", "View")));

app.use("/View/Main-Frame", express.static(path.join(__dirname, "..", "..", "View/Main-Frame")));
app.use("/View/Display", express.static(path.join(__dirname, "..", "..", "View/Display")));
app.use("/View/Images", express.static(path.join(__dirname, "..", "..", "View/Images")));
app.use("/View/Input", express.static(path.join(__dirname, "..", "..", "View/Input")));
app.use("/View/Left-Side", express.static(path.join(__dirname, "..", "..", "View/Left-Side")));
app.use("/View/Right-Side/Between", express.static(path.join(__dirname, "..", "..", "View/Right-Side/Between")));
app.use("/View/Right-Side/Bottom", express.static(path.join(__dirname, "..", "..", "View/Right-Side/Bottom")));
app.use("/View/Right-Side/Common", express.static(path.join(__dirname, "..", "..", "View/Right-Side/Common")));
app.use("/View/Right-Side/Top", express.static(path.join(__dirname, "..", "..", "View/Right-Side/Top")));

app.use("/Model/Client", express.static(path.join(__dirname, "..", "..", "/Model/Client")));

app.use("/Controller/Client/Document", express.static(path.join(__dirname, "..", "..", "/Controller/Client/Document")));
app.use("/Controller/Client/Left-Side", express.static(path.join(__dirname, "..", "..", "/Controller/Client/Left-Side")));
app.use("/Controller/Client/Right-Side", express.static(path.join(__dirname, "..", "..", "/Controller/Client/Right-Side")));
app.use("/Controller/Client/Main-Frame", express.static(path.join(__dirname, "..", "..", "/Controller/Client/Main-Frame")));

if(cluster.isPrimary) {
    for(let i = 0; i < numCPUs - 1; i++) {
        cluster.fork();
    }

    cluster.on('message', (worker, message) => {
        console.log("hahahahaha");
    });

    cluster.on('exit', (worker, code, signal) => {
        console.log(`Worker ${worker.process.pid} died`);
        cluster.fork();//this code is needed when the worker process died.
    });
}
else {
    app.get("/", (req, res) => {
        res.sendFile(path.join(__dirname, "..", "..", "View", "index.html"));
    });
    
    app.get("/data/test1", (req, res) => {
        const intData1 = 1;
        const strData1 = "string1";
        const resJson = {
            intData1: intData1,
            strData1: strData1
        };
        res.json(resJson);
    });
    
    app.get("/data/test2", (req, res) => {
        const intData2 = 2;
        const strData2 = "string2";
        const resJson = {
            intData1: intData2,
            strData1: strData2
        };
        res.json(resJson);
    });
    
    app.post("/data/lyrics", upload.single('file'), async (req, res) => {
        let audioFileURL = null;
        const apiKey = "a6170822afb2454e971c3e9e25ddfbf2";
        let transcription = null;
    
        try {
            const task1 = await checkHeaders();
            const task2 = await checkFile();
            const task3 = await requestAudioFileURL();
            const tasl4 = await requestAudioTranscription();
            const task5 = await deleteUploads();
            res.json(transcription);
    
            async function checkHeaders() {
    
            }
    
            async function checkFile() {
            }
    
            async function requestAudioFileURL() {
                const fileLocation = path.join(__dirname, `/Uploads/${req.file.originalname}`);
                const URL = 'https://api.assemblyai.com/v2/upload';
                const headers = {
                    "Authorization": apiKey,
                    "Content-Type": "application/octet-stream",
                }
                const formData = new FormData();
                formData.append('file', fs.createReadStream(fileLocation));
    
                await axios.post(URL, formData, { headers: headers })
                .then(response => {
                    console.log('Response URL :', response.data.upload_url);
                    audioFileURL = response.data.upload_url;
                })
                .catch(err => {
                    throw new Error(err);
                });
            }
    
            async function requestAudioTranscription() {
                let transid = null;
                let URL = 'https://api.assemblyai.com/v2/transcript';
                let headers = {
                    "Authorization": apiKey,
                    "Content-Type": "application/json"
                };
            
                const requestData = {
                    audio_url: audioFileURL,
                    language_detection: true,
                    sentiment_analysis: true,
                    speech_model: 'nano', 
                    speaker_labels: true,
                    speakers_expected: 10
                };
    
                await axios.post(URL, requestData, { headers: headers })
                .then(response => {
                    transid = response.data.id;
                })
                .catch(err => {
                    throw new Error(err);
                });
    
                URL = `https://api.assemblyai.com/v2/transcript/${transid}`;
                headers = {
                    'Authorization': apiKey,
                };
    
                let status = null;
                while(status !== 'completed') {
                    await axios.get(URL, { headers: headers } )
                    .then(response => {
                        //console.log("transcripion : ", response.data);
                        status = response.data.status;
                    })
                    .catch(err => {
                        throw new Error(err);
                    });
                }
    
                URL = `https://api.assemblyai.com/v2/transcript/${transid}/sentences`;
    
                await axios.get(URL, { headers: headers } )
                .then(response => {
                    console.log("transcripion : ", response.data);
                    transcription = response.data;
                })
                .catch(err => {
                    throw new Error(err);
                });
            }
            
        }
        catch(err) {
            console.log(err);
            audioFileURL = null;
            await deleteUploads();
            res.json(null);
        }
    
        async function deleteUploads() {
            const uploadDir = path.join(__dirname, "/Uploads");
            const files = fs.readdirSync(uploadDir);
            for (const file of files) {
                if(file === "preventRemoving.txt") {//this code only for preventing delete from github
                    //do nothing
                }
                else {
                    fs.unlinkSync(path.join(uploadDir, file));
                    console.log(`Deleted ${file}`);
                }
            }
            console.log('All files in uploads directory have been deleted.');
        }
    });
    
    app.listen(PORT, () => {
        console.log(`Server is running on http://localhost:${PORT}`);
    });
}


