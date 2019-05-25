<h3 class="box-heading"><?php echo $text_contact; ?></h3>
	<div class="box-content footer_box">
		<address>
			<p><a class="footer-link" href="//www.google.com/maps/?q=<?php echo $geocode ? str_replace(' ', '+', $geocode) : str_replace(' ', '+', strip_tags($address)); ?>" target="_blank"><?php echo $address ?></a><br>
				<a class="footer-link" href="callto:<?php echo $telephone; ?>"><?php echo $telephone; ?></a><br>
				<a href="mailto:<?php echo $email; ?> "><?php echo $email; ?></a></p>
		</address>
	<p><?php echo $open; ?></p>
</div>