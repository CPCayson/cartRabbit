const functions = require('firebase-functions');
const admin = require('firebase-admin');
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.app = functions.region('us-central1').https.onCall(
  (data, context) => {
    // Write your code below!
const express = require('express');
const stripe = require('stripe')('sk_test_51KVWLuCox373OxMXDZfa49Vs6gpnSGbXaJCCwKde0An6rdW9JjK99tw1xWL6eOZASRWamXGxZOLx1PzDqxFqwD1100DYo992cm');
const app = express();
const port = 3000;

app.use(express.json());

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});

    // Write your code above!
  }
);