const admin = require("firebase-admin/app");
admin.initializeApp();
    
const stripeWebhook = require('./stripe_webhook.js');
exports.stripeWebhook = stripeWebhook.stripeWebhook;
const getDecodedDirections = require('./get_decoded_directions.js');
exports.getDecodedDirections = getDecodedDirections.getDecodedDirections;
const webhook = require('./webhook.js');
exports.webhook = webhook.webhook;
const helloWorld = require('./hello_world.js');
exports.helloWorld = helloWorld.helloWorld;
const app = require('./app.js');
exports.app = app.app;