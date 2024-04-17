const fs = require('fs');
const path = require('path');
const admin = require('firebase-admin');
const { exit, stdout } = require('process');

var serviceAccount = require("./serviceAccountKey.json");

const projectID = 'nathaniel-dev';
/// Path to the root storage directory.
const storagePath = process.argv[2];

// Set re-usable constant values.
const bucketName = `gs://${projectID}.appspot.com`;

// Initialize Firebase Admin SDK.
admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    storageBucket: bucketName
});

// Abort if storage directory cannot be found.
if (!fs.existsSync(storagePath)) {
    stdout.write('No storage directory could be found.');
    exit(1);
}

const content = fs
    .readdirSync(storagePath, { withFileTypes: true, recursive: true })
    .filter(entry => !entry.isDirectory())
    .map(entry => path.join(entry.path, entry.name));

for (let item of content) {
    let dest = item.split('/');
    dest.shift();
    let dest0 = dest.join('/');

    admin.storage()
        .bucket()
        .upload(item, {
            destination: dest0,
        });
    stdout.write(`\n✓ Uploaded ${item}`);
}

stdout.write('\n');