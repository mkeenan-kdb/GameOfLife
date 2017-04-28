$(document).ready(function(){
 var bw = 1000;
 var bh = 500;
 var p = 10;

 var canvas = document.getElementById("grid");
 var context = canvas.getContext("2d");
 drawBoard = function(){
 for (var x = 0; x <= bw; x += 5) {
     context.moveTo(0.5 + x + p, p);
     context.lineTo(0.5 + x + p, bh + p);
 }


 for (var x = 0; x <= bh; x += 5) {
     context.moveTo(p, 0.5 + x + p);
     context.lineTo(bw + p, 0.5 + x + p);
 }

 context.strokeStyle = "black";
 context.stroke();
 }

 drawBoard();
});

function connect(){
	var ws = new WebSocket("ws://localhost:50602");
	$("#Start").click(function(){
		ws.sendcmd("Start");				
	});
    $("#Stop").click(function(){
        ws.sendcmd("Stop");
    });
	// Required by c.js 
	ws.binaryType = 'arraybuffer';
	// WebSocket event handlers
	ws.onopen = function () {
	     console.log("Open");
	};
	ws.onclose = function () {
	     console.log("Closed")
	};
	ws.onmessage = function (event) {
		 data = JSON.parse(deserialize(event.data));
	     var canvas = document.getElementById("grid");
    	 var context = canvas.getContext("2d");
		 context.fillStyle = "black";
		 console.log(data.length);
		 context.clearRect(0, 0, canvas.width, canvas.height);
		 for(i=0;i<data.length;i++){
			d = data[i];
			context.fillRect(d[1],d[0],4.8,4.8);
		 }
	};
	ws.onerror = function (error) {
	     console.log("Error " + error.data);
	};
	ws.sendcmd = function (cmd){
	  ws.send(serialize(cmd));
	};
};
