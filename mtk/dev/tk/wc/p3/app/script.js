// Application specific code

 // Invoke API function on a specific instance
function startPB(id) {
  document.getElementById(id).move()
}
// Get / Set property from application code
function changeMax () {
  var pb2 = document.getElementById("2");
  alert("Changing current Max " + pb2.max + " to 150"); // getter
  pb2.max = 150; // setter
}

function changeColor () {
  var colors =["red","blue", "orange", "yellow"];
  var pb1 = document.getElementById("1");
  var newColor = colors[Math.floor(Math.random() * colors.length)]; 
  alert(`Changing color from ${pb1.color} to ${newColor}`)// getter
  pb1.color =  newColor; //setter
}