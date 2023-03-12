function decorate(func, param1, param2) {
    const f = func()
    return (function run(input) { f.next(input).then(run) })()
}
const _main = (async function () {
    'use strict';
    try {
        var S3FS = require('../../index'), s3Credentials = require('../../test/_s3Credentials')

        console.log('Regression Testing')

        var bucketName = 's3fs-bucket-test-bucket-' + (Math.random() + '').slice(2, 8),
            s3fsImpl = new S3FS(bucketName, s3Credentials);


        var created = await s3fsImpl.create()

        console.log('bucket creation response', created)

        console.log('file creation response', (await s3fsImpl.writeFile('file-1.json', '{ "test": "test" }')))
        console.log('ls', (await s3fsImpl.readdir('/')))
        if ((await s3fsImpl.readdir('/')).length === 1) {
            return process.exit(0);
        }
        process.exit(1)
    } catch (e) {
        console.log('error', e)
        process.exit(1)
    }
})


_main();