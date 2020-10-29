let no = 1;
let users = [];

window.onload = function () {
  const userContainer = document.getElementById('user-container');
  getCurrentTime();
  fetch('http://10.120.105.25:5000/all/Users')
    .then((res) => {
      return res.json();
    })
    .then((loadedUsers) => {
      console.log(loadedUsers);
      loadedUsers.forEach((user) => {
        // Tạo thẻ div class column
        var columnDivNode = document.createElement('div');
        columnDivNode.className = 'column';

        // Tạo thẻ div class card trong div class column
        var nodeCard = document.createElement('div');
        nodeCard.className = 'card';

        var imgCard = document.createElement('img');
        imgCard.style.width = '100%';
        imgCard.alt = 'No ' + no;

        var containerNode = document.createElement('div');
        userContainer.className = 'container';

        var nameNodeH2 = document.createElement('H2');
        nameNodeH2.innerHTML = user.givenName + user.firstName;

        var nameNodeEcode = document.createElement('P');
        nameNodeEcode.className = 'title';
        nameNodeEcode.innerHTML = 'Ecode: ' + user.eCode;

        var nameNodePEmail = document.createElement('P');
        nameNodePEmail.innerHTML = 'Email: ' + user.email;

        var containerBtnNode = document.createElement('div');
        containerBtnNode.className = 'container-btn';
        var aBtnDetailNode = document.createElement('a');
        aBtnDetailNode.className = 'btn-detail';
        aBtnDetailNode.innerHTML = 'Detail';
        var aBtnEditlNode = document.createElement('a');
        aBtnEditlNode.className = 'btn-detail';
        aBtnEditlNode.innerHTML = 'Edit';
        var aBtnDeletelNode = document.createElement('a');
        aBtnDeletelNode.className = 'btn-delete';
        aBtnDeletelNode.innerHTML = 'Delete';
        containerBtnNode.appendChild(aBtnDetailNode);
        containerBtnNode.appendChild(aBtnEditlNode);
        containerBtnNode.appendChild(aBtnDeletelNode);

        containerNode.appendChild(nameNodeH2);
        containerNode.appendChild(nameNodeEcode);
        containerNode.appendChild(nameNodePEmail);
        containerNode.appendChild(containerBtnNode);

        nodeCard.appendChild(imgCard);
        nodeCard.appendChild(containerNode);

        columnDivNode.appendChild(nodeCard);
        userContainer.appendChild(columnDivNode);
        no = no + 1;
      });
    })
    .catch((err) => {
      console.error(err);
    });
};

function getCurrentTime() {
  var today = new Date();
  var dd = today.getDate();
  var mm = today.getMonth() + 1; //January is 0!
  var yyyy = today.getFullYear();
  if (dd < 10) {
    dd = '0' + dd;
  }

  if (mm < 10) {
    mm = '0' + mm;
  }

  today = yyyy + '/' + dd + '/' + mm;
  //   document.getElementById('curent-time').innerHTML = today;
  var myVar = setInterval(function () {
    myTimer();
  }, 1000);
}

function myTimer() {
  var d = new Date();
  document.getElementById('curent-time').innerHTML =
    d.toLocaleTimeString() + ' © 2020 - My ASP.NET Application';
}
