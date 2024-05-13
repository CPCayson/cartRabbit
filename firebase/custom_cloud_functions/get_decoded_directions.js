const functions = require("firebase-functions");
const admin = require("firebase-admin");

const https = require("https");

// To avoid deployment errors, do not call admin.initializeApp() in your code
function decodePolyline(encoded) {
  let poly = [];
  let index = 0,
    len = encoded.length;
  let lat = 0,
    lng = 0;

  while (index < len) {
    let shift = 0,
      result = 0;
    let b;
    do {
      b = encoded.charCodeAt(index++) - 63;
      result |= (b & 0x1f) << shift;
      shift += 5;
    } while (b >= 0x20);
    let dlat = result & 1 ? ~(result >> 1) : result >> 1;
    lat += dlat;

    shift = 0;
    result = 0;
    do {
      b = encoded.charCodeAt(index++) - 63;
      result |= (b & 0x1f) << shift;
      shift += 5;
    } while (b >= 0x20);
    let dlng = result & 1 ? ~(result >> 1) : result >> 1;
    lng += dlng;

    let p = { lat: lat / 1e5, lng: lng / 1e5 };
    poly.push(p);
  }

  return poly;
}

exports.getDecodedDirections = functions.https.onCall((data, context) => {
  return new Promise((resolve, reject) => {
    const { origin, destination, waypoints, apiKey } = data;

    // URL encode the parameters
    const encodedOrigin = encodeURIComponent(origin);
    const encodedDestination = encodeURIComponent(destination);
    const encodedWaypoints = encodeURIComponent(waypoints);

    const url = `https://maps.googleapis.com/maps/api/directions/json?origin=${encodedOrigin}&destination=${encodedDestination}&waypoints=${encodedWaypoints}&key=${apiKey}`;

    https
      .get(url, (res) => {
        let rawData = "";

        res.on("data", (chunk) => {
          rawData += chunk;
        });

        res.on("end", () => {
          try {
            const jsonData = JSON.parse(rawData);
            const detailedPolylines = jsonData.routes.map((route) =>
              route.legs.flatMap((leg) =>
                leg.steps.map((step) => decodePolyline(step.polyline.points)),
              ),
            );
            resolve({ detailedPolylines });
          } catch (error) {
            console.error("Error:", error);
            reject(
              new functions.https.HttpsError(
                "unknown",
                "Failed to process the response",
              ),
            );
          }
        });
      })
      .on("error", (error) => {
        console.error("Error calling Google Directions API:", error);
        reject(
          new functions.https.HttpsError(
            "internal",
            "Unable to call Google Directions API",
          ),
        );
      });
  });
});

/* Prosoxh kamoia fora ama perneis olo ton kwdika copy paste to flutterflow laggarei
 kai den kanei deploy tote apla kane kati jerw gw pata ena space kai pata jana save
 kai deploy kai tha doylepsei, ta parapona sto flutterflow!*/
