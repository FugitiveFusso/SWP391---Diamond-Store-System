<!DOCTYPE html>
<html>
<head>
  <title>Firebase Image Upload using HTML and JavaScript</title>
  <style>
    #photo {
      margin-top: 200px;
      margin-left: 450px;
    }
    #upload {
      margin-top: 20px;
      margin-left: 450px;
    }
  </style>
</head>
<body>
  <input type="file" id="photo" />
  <button id="upload" onclick="uploadImage()">Upload Image</button>
  <script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-app.js"></script>
  <script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-storage.js"></script>
  <script>
    const firebaseConfig = {
      apiKey: "AIzaSyCQ1UbCDO8RA1q1T9hu0yTyqp9MCENfgO8",
      authDomain: "java-424302.firebaseapp.com",
      projectId: "java-424302",
      storageBucket: "java-424302.appspot.com",
      messagingSenderId: "792757160936",
      appId: "1:792757160936:web:3e6556cd0f4bf11ac5b25d",
      measurementId: "G-GYE1RJNERG"
    };

    firebase.initializeApp(firebaseConfig);

    function uploadImage() {
      const ref = firebase.storage().ref();
      const file = document.querySelector("#photo").files[0];
      const name = +new Date() + "-" + file.name;
      const metadata = {
        contentType: file.type
      };
      const task = ref.child(name).put(file, metadata);
      task
        .then(snapshot => snapshot.ref.getDownloadURL())
        .then(url => {
          console.log(url);
          alert('image uploaded successfully');
          document.querySelector("#image").src = url;
        })
        .catch(console.error);
    }
  </script>
</body>
</html>