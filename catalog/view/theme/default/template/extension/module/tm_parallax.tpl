<!-- RD Parallax -->
<div id="parallax_<?php echo $module_counter; ?>" class="rd-parallax">
	<div class="rd-parallax-layer" data-type="media" data-speed="<?php echo $speed; ?>" data-direction="<?php echo $direction; ?>" data-url="<?php echo $image; ?>" data-blur="<?php echo $blur; ?>">
	</div>
	<?php $i = 0; foreach ($layers as $layer) { ?>
	<div class="rd-parallax-layer layer-<?php echo $i ?>" data-type="<?php echo $layer['type'] ?>" data-speed="<?php echo $layer['speed']; ?>" data-fade="<?php echo $layer['fade']; ?>" data-direction="<?php echo $layer['direction']; ?>" <?php if ($layer['type'] == 'media' && isset($layer['image'])) { ?> data-url="<?php echo $layer['image']; ?>" data-blur="<?php echo $layer['blur']; ?>" <?php } ?>>
		
		<div class="container">
			<?php echo $layer['description']; ?>

			<?php if ($layer['type'] == 'html' && isset($layer['image'])) { ?>
			<img width="<?php echo $layer['image_width']; ?>" height="<?php echo $layer['image_height']; ?>" src="<?php echo $layer['image']; ?>" alt="">
			<?php } ?>

			<?php if (isset($layer['modules'])) { ?>
			<?php foreach ($layer['modules'] as $module) { ?>
			<?php echo $module; ?>
			<?php } ?>
			<?php } ?>
		</div>
	</div>
	<?php $i++; } ?>
</div>
<script>
	jQuery(document).ready(function () {
		jQuery("#parallax_<?php echo $module_counter; ?>").RDParallax();
	});
</script>
<!-- END RD Parallax-->
