<ul class="list-unstyled">
	<?php foreach ($informations as $information) { ?>
	<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
	<?php } ?>
	<?php if(isset($simple_blog_found)) { ?>
	<li><a href="<?php echo $simple_blog; ?>"><?php echo $simple_blog_footer_heading; ?></a></li>
	<?php } ?>
</ul>