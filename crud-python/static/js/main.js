$(document).ready( function (){
	fetch("/task/list")
	.then( function(response){
		return response.json();
	}).then( function(json){
		console.log(json);
	})
});

