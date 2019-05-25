<?php if ($informations) { ?>
<ul class="box-content list-unstyled">
	<?php foreach ($informations as $information) { ?>
	<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
	<?php } ?>
	<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
	<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
	<?php if(isset($simple_blog_found)) { ?>
	<li><a href="<?php echo $simple_blog; ?>"><?php echo $simple_blog_footer_heading; ?></a></li>
	<?php } ?>
</ul>
<?php } ?>