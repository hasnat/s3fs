module.exports = {
        accessKeyId: process.env.AWS_ACCESS_KEY_ID,
        secretAccessKey: process.env.AWS_SECRET_KEY,

    // used for fake-s3... for aws sdk
    // to use http://fake-s3:4572/bucket-name  (ok host in docker network)
    // not do http://bucket-name.fake-s3:4572/ (unresolved host in docker network)
        hostPrefixEnabled: false,
        s3ForcePathStyle: true,
        endpoint: process.env.AWS_ENDPOINT
    };
