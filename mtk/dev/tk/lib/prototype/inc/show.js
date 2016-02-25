//////////////////////////////////////////////////////////////////////////
//// 
///////////////////////////////////////////////////////////////////////////
jQuery(document).ready(function() {
	jQuery("#page").change(function() {
		var role = $("#role").val();
		var page = $("#page").val();

		document.location.href="/bin/display?page=tk::prototype&urole=" + role + "&upage=" + page;
	    });

	jQuery("#role").change(function() {
		var role = $("#role").val();
		var page = $("#page").val();

		document.location.href="/bin/display?page=tk::prototype&urole=" + role + "&upage=" + page;
	    });

	jQuery("#show .alink").click(function() {
		jQuery("#show li").removeClass("active");

		var obj = jQuery(this);
		var part = obj.attr("part");

		jQuery(obj).parent().addClass("active");

		jQuery("#show h3 span").html(part);
		jQuery("#show h3 span").html(part);

		var player = jQuery.cookie('player');

		jQuery("#dummy").load("/bin/display?ajax=1&callback=tk::prototype::components::show::part&part=" + part + "&player=" + player, function() {
			jQuery("#showme").show();
			jQuery("#refresh").show();
			jQuery("#save").show();
			jQuery("#default").show();

			var code = jQuery("#code").val();
			jQuery("#preview").load("/bin/display?callback=tk::prototype::components::show::preview&part=" + part + "&code=" + encodeURIComponent(code));
		    });
	    });

	jQuery("#showme").click(function() {
		var part = jQuery("#show h3 span").html();
		var code = jQuery("#code").val();

		jQuery("#preview").load("/bin/display?callback=tk::prototype::components::show::preview&part=" + part + "&code=" + encodeURIComponent(code));
	    });

	jQuery("#refresh").click(function() {
		var part = jQuery("#show h3 span").html();
		var player = jQuery.cookie('player');

		jQuery("#dummy").load("/bin/display?ajax=1&callback=tk::prototype::components::show::part&part=" + part + "&player=" + player, function() {
			var code = jQuery("#code").val();
			jQuery("#preview").load("/bin/display?callback=tk::prototype::components::show::preview&part=" + part + "&code=" + encodeURIComponent(code));
			jQuery("#showme").show();
			jQuery("#refresh").show();
		    });
	    });

	jQuery("#save").click(function() {
		var part = jQuery("#show h3 span").html();
		var code = jQuery("#code").val();
		var page = $("#page").val();
		var player = jQuery.cookie('player');
		
		var url = "/bin/display?callback=tk::prototype::components::save&part=" + part + "&apage=" + page + "&code=" + encodeURIComponent(code) + "&player=" + player;
		jQuery("#preview").load(url);
	    });

	jQuery("#default").click(function() {
		var part = jQuery("#show h3 span").html();
		var page = $("#page").val();
		var player = jQuery.cookie('player');
		
		var url = "/bin/display?callback=tk::prototype::components::default&part=" + part + "&apage=" + page;
		//alert(url);
		jQuery("#dummy").load(url);
	    });
    });
