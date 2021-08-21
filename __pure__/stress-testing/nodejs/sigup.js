function handle(signal) {
   console.log(`*^!@4=> Received event: ${signal}`)
}
process.on('SIGHUP', handle)
