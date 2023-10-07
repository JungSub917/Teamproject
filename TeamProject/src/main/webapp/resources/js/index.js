window.initMap = function() {
		const tourLat = document.getElementById("tourLat").dataset.lat;
		const tourLng = document.getElementById("tourLng").dataset.lng;

		const map = new google.maps.Map(document.getElementById("map"), {
			center: { lat: parseFloat(tourLat), lng: parseFloat(tourLng) },
			zoom: 13,
			disableDefaultUI: true // 기본 UI 요소 비활성화
		});

		new google.maps.Marker({
			position: { lat: parseFloat(tourLat), lng: parseFloat(tourLng) },
			map: map
		});
	}