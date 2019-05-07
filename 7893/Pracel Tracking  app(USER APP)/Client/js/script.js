(function(window,google)
{

	//map option
	var option={
		center:{
		lat:37.791350,
		lng:-122.435883
	},
	zoom:10
	}
	//map
	element=document.getElementById("maparea"),

	map =new google.maps.Map(element,option);
}(window,google));