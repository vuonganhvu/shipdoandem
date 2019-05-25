<div class="clearfix"></div>
<div id="tm_manufactures" class="owl-carousel manufacturers">
	<?php if ($brands) { ?>
		<?php foreach ($brands as $brand) { ?>
			<?php if ($brand['manufacturer']) { ?>
				<?php foreach ($brand['manufacturer'] as $manufacturer) { ?>
					<div class="item text-center">			
					<a href="<?php echo $manufacturer['href']; ?>"><img src="<?php echo $manufacturer['image']; ?>" class="img-responsive" alt=""></a>
					</div>
				<?php } ?>
			<?php } ?>
		<?php } ?>
	<?php } ?>
</div>