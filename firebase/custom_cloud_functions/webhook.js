const functions = require('firebase-functions');
const admin = require('firebase-admin');
// To avoid deployment errors, do not call admin.initializeApp() in your code
const cors = require('cors');
// To avoid deployment errors, do not call admin.initializeApp() in your code

const corsHandler = cors({ origin: true }); 

exports.webhook = functions.https.onRequest(async (req, res) => {

  corsHandler(req, res, async () => {

      const db = admin.firestore();
    const jsonData = req.body; 

    console.log(`Received Stripe event: ${JSON.stringify(jsonData)}`);

    const collectionRef = db.collection('orders');

    const batch = db.batch();
    const snapshot = await collectionRef.get(); 

    snapshot.forEach((doc) => {
          const docData = doc.data();
    const  payment= docData.payment_link;

    if (payment === jsonData['object']['payment_link']) {
      const docRef = doc.ref;
      
      const updateFields = {};
      if ('payment_link' in docData && 'status' in docData) { 
        updateFields.status = jsonData['object']['payment_status'];
      }

      if (Object.keys(updateFields).length > 0) {
        batch.update(docRef, updateFields);
      } 
    }
  });

    batch.commit().then(() => {
      console.log('Updated fields for the user with payment link ');
    });    
    res.status(200).send('Success');
    });