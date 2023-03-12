if (!process.env.AWS_ACCESS_KEY_ID || !process.env.AWS_SECRET_KEY) {
        // for local debugging
        process.env.AWS_ACCESS_KEY_ID = process.env.AWS_ACCESS_KEY_ID || 'AKIAIOSFODNN7EXAMPLE';
        process.env.AWS_SECRET_KEY = process.env.AWS_SECRET_KEY || 'wJalrXUtnFEMI/K7MDENG/bZCI/K';
        process.env.AWS_ENDPOINT = process.env.AWS_ENDPOINT || 'http://127.0.0.1:4566/';
        console.log(`Using fake s3 credentials targeting s3 endpoint ${process.env.AWS_ENDPOINT}`);
}


// console.log(process.env)
module.exports = {
        accessKeyId: process.env.AWS_ACCESS_KEY_ID,
        secretAccessKey: process.env.AWS_SECRET_KEY,

    // used for fake-s3... for aws sdk
    // to use http://fake-s3:4572/bucket-name  (ok host in docker network)
    // not do http://bucket-name.fake-s3:4572/ (unresolved host in docker network)
        hostPrefixEnabled: false,
        s3ForcePathStyle: true,
        forcePathStyle: true,
        pathStyleAccessEnabled: true,
        // s3BucketEndpoint: true,
        endpoint: process.env.AWS_ENDPOINT
    };
