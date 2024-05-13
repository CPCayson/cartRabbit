const admin = require("firebase-admin/app");
admin.initializeApp();

const stripeWebhook = require("./stripe_webhook.js");
exports.stripeWebhook = stripeWebhook.stripeWebhook;
const getDecodedDirections = require("./get_decoded_directions.js");
exports.getDecodedDirections = getDecodedDirections.getDecodedDirections;
