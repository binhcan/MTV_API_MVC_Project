$(document).ready(function () {
	'use strict';
	var $window = $(window);
	var elem = document.getElementById("video1");
	var StageUrl = '@Url.Action("Index", "Rounds")';
	$('#start-btn').mouseup(function () {
		$('#notClick-btn-img').show();
		$('#clicked-btn-img').hide();
	}).mousedown(function () {
		$('#clicked-btn-img').show();
		$('#notClick-btn-img').hide();
	});

	$('#closebt-container').click(function () {
		$('#result-div').hide();
		$('#winner-lst').show();
	});

	$('#Video-effect-modal').on('shown.bs.modal', function () {
		openFullscreen();
		$('#video1')[0].play();
		setTimeout(function () {
			$('#Video-effect-modal').hide();
			$('.modal-backdrop').hide();
			$('body').removeClass('modal-open')
			//$('.modal-open').hide();
			$('#video1')[0].pause();
			closeFullscreen();
			$('#result-div').show('slow', function () {

				var children = $(".thumb");
				var index = 0;

				function addClassNextChild() {
					if (index == children.length) return;
					children.eq(index++).show().velocity("transition.expandIn", { opacity: 1, stagger: 250 });
					window.setTimeout(addClassNextChild, 500);
				}

				addClassNextChild();

			});
			//$('#result-btn-hidden').trigger('click');
		}, 5000);
	})
	$('#Video-effect-modal').on('hidden.bs.modal', function () {
		$('#video1')[0].pause();
	});

	//$('#stage-id').click(function () {
	//	$('#load-data').load(StageUrl);
	//});
	$('.stage-id').on('click', function () {
		console.log($(this).children('.stage-value').text())
		var index = $(this).children('.stage-value').text();
		$.ajax({
			type: "GET",
			url: '/Rounds/Index/' + index,
			success: function (data) {
				$('#load-data').html(data);
			}
		});
	});

	function openFullscreen() {
		if (elem.requestFullscreen) {
			elem.requestFullscreen();
		} else if (elem.mozRequestFullScreen) { /* Firefox */
			elem.mozRequestFullScreen();
		} else if (elem.webkitRequestFullscreen) { /* Chrome, Safari & Opera */
			elem.webkitRequestFullscreen();
		} else if (elem.msRequestFullscreen) { /* IE/Edge */
			elem.msRequestFullscreen();
		}
	}

	function closeFullscreen() {
		if (document.exitFullscreen) {
			document.exitFullscreen();
		} else if (document.mozCancelFullScreen) {
			document.mozCancelFullScreen();
		} else if (document.webkitExitFullscreen) {
			document.webkitExitFullscreen();
		} else if (document.msExitFullscreen) {
			document.msExitFullscreen();
		}
	}

	//$('#result-btn-hidden').click(function () {
	//    //demo 01
	//    $("#result-btn-hidden").animatedModal({
	//        animatedIn: 'zoomIn',
	//        animatedOut: 'bounceOut',
	//        color: '#39BEB9',
	//        beforeOpen: function () {

	//            var children = $(".thumb");
	//            var index = 0;

	//            function addClassNextChild() {
	//                if (index == children.length) return;
	//                children.eq(index++).show().velocity("transition.expandIn", { opacity: 1, stagger: 250 });
	//                window.setTimeout(addClassNextChild, 200);
	//            }

	//            addClassNextChild();

	//        },
	//        afterClose: function () {
	//            $(".thumb").hide();

	//        }
	//    });
	//});


	//$("#result-btn-hidden").animatedModal({
	//	animatedIn: 'zoomIn',
	//	animatedOut: 'bounceOut',
	//	color: '#39BEB9',
	//	beforeOpen: function () {

	//		var children = $(".thumb");
	//		var index = 0;

	//		function addClassNextChild() {
	//			if (index == children.length) return;
	//			children.eq(index++).show().velocity("transition.expandIn", { opacity: 1, stagger: 250 });
	//			window.setTimeout(addClassNextChild, 500);
	//		}

	//		addClassNextChild();

	//	},
	//	afterClose: function () {
	//		$(".thumb").hide();

	//	}
	//});


	//$("#result-btn-hidden").animatedModal({
	//    animatedIn: 'zoomIn',
	//    animatedOut: 'bounceOut',
	//    color: '#39BEB9',
	//    //beforeOpen: function () {

	//    //    var children = $(".thumb");
	//    //    var index = 0;

	//    //    function addClassNextChild() {
	//    //        if (index == children.length) return;
	//    //        children.eq(index++).show().velocity("transition.expandIn", { opacity: 1, stagger: 250 });
	//    //        window.setTimeout(addClassNextChild, 200);
	//    //    }

	//    //    addClassNextChild();

	//    //},
	//    afterClose: function () {
	//        $(".thumb").hide();

	//    }
	//});

	////demo 02
	//$("#demo02").animatedModal({
	//    animatedIn: 'lightSpeedIn',
	//    animatedOut: 'bounceOutDown',
	//    color: '#3498db',
	//    // Callbacks
	//    beforeOpen: function () {
	//        console.log("The animation was called");
	//    },
	//    afterOpen: function () {
	//        console.log("The animation is completed");
	//    },
	//    beforeClose: function () {
	//        console.log("The animation was called");
	//    },
	//    afterClose: function () {
	//        console.log("The animation is completed");
	//    }
	//});

}); // end document ready