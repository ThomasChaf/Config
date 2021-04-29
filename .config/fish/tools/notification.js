const notifier = require('node-notifier');

notifier.notify({
  title: 'Dev notification',
  message: process.argv[2],
  sound: true
});