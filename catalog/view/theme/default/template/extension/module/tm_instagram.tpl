<div class="instagram">
	<div class="box-heading">
		<h3><i class="fa fa-instagram"></i><?php echo $heading_title; ?></h3>
	</div>
	<div class="content">
		<div id="instafeed" class="clearfix row"></div>
	</div>
</div>
<script type="text/javascript">
	var userFeed = new Instafeed({
		<?php if ($get == 'tagged') { ?>
			get: 'tagged',
			tagName:'<?php echo $tag_name; ?>',
			<?php } else { ?>
				get: 'user',
				userId: <?php echo $user_id; ?>,
				<?php } ?>
				accessToken: '<?php echo $accesstoken; ?>',
				limit: <?php echo $limit; ?>,
				resolution: "low_resolution",
				template: '<a href="{{link}}" class="col-md-3 col-xs-3"> <img src="{{image}}" width="{{width}}" height="{{height}}" alt="" class="image"> <div class="activities"> <span class="likes"><i class="fa fa-thumbs-o-up"></i> {{likes}}</span> <span class="comments"><i class="fa fa-comments-o"></i> {{comments}}</span> </div> <div class="location">{{location}}</div> <div class="caption">{{caption}}</div> </a>'
			});
	userFeed.run();
</script>