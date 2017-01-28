var searchBoxEventHandler = function () { //toggles searchbox on and off
	var searchBox = $(".search-box"),
		searchLink = $(".search-link"),
		search = searchLink.add(searchBox).add($("#appendedInput")).add($("#searchButton")).add($("#searchIcon"));

	search.on("mouseenter", function(e) {
		e.preventDefault();
		searchLink.css("background", "#eee").css("color", "#005580");
		searchBox.css("display", "block");
	});

	search.on("mouseout", function(e) {
		e.preventDefault();
		searchLink.css("background", "white").css("color", "#08c");
		searchBox.css("display", "none");
	}); 
}


var updatePostTabSwitcher = function() {
	var statusTab = $(".update-status-photo .update-tab-selector .status-tab"),
		photoTab = $(".update-status-photo .update-tab-selector .photo-tab"),
		updateStatus = $(".update-status-photo .update-status"),
		updatePhoto = $(".update-status-photo .update-photo");

	statusTab.on("click", function(e) {
		if(statusTab.hasClass("selected")) return;
		statusTab.addClass("selected");
		photoTab.removeClass("selected");
		updateStatus.show();
		updatePhoto.hide();
	});

	photoTab.on("click", function(e) {
		if(photoTab.hasClass("selected")) return;
		photoTab.addClass("selected");
		statusTab.removeClass("selected");
		updatePhoto.show();
		updateStatus.hide();
	});
	// statusTab.add(photoTab).on("click", function(e) {
	// 	statusTab.toggleClass("selected");		
	// 	photoTab.toggleClass("selected");
	// 	updateStatus.toggle();
	// 	updatePhoto.toggle();
	// }); 
}

var uploadPhotoHandler = function() {
	var uploadPhoto = $("#upload-photo");
	uploadPhoto.on("click", function(e) {
		$('#profile-photo').modal();

		$("#image-submit").on("click", function(e) {
			 
		    $('#upload-form').ajaxForm({ 
		        dataType: 'json', 
		 		success: processJson 
		    });
		});

		function processJson(data) { 
 		   // 'data' is the json object returned from the server 
    	alert(data.message); 
		}		
	});
	


}

var initAll = function() {
	searchBoxEventHandler();
	updatePostTabSwitcher();
	uploadPhotoHandler();
}

$(document).ready(initAll);