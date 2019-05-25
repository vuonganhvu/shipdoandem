<div class="social-block">
	<div class="box-heading">
		<h3><?php echo $title; ?></h3>
	</div>
	<div class="box-content">
		<p><?php echo $description; ?></p>
		<?php if ($socials) { ?>
		<ul class="social-list list-unstyled">
			<?php foreach ($socials as $social) { ?>
			<li><a class="<?php echo $social['css']; ?>" href="<?php echo $social['link']; ?>" data-toggle="tooltip" title="<?php echo $social['name']; ?>"></a></li>
			<?php } ?>
		</ul>
		<?php } ?>
	</div>
</div>