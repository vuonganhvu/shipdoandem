<div class="ajax-quickview">
	<div class="ajax-quickview-images">
		<ul class="list-unstyled">
			<li class="ajax-quickview-image">
				<img width="<?php echo $product['thumb_width']; ?>" height="<?php echo $product['thumb_height']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" src="<?php echo $product['thumb']; ?>"/>
			</li>
			<?php foreach ($product['additional_thumbs'] as $thumb) { ?>
			<li class="ajax-quickview-image">
				<img width="<?php echo $product['thumb_width']; ?>" height="<?php echo $product['thumb_height']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" src="<?php echo $thumb; ?>"/>
			</li>
			<?php } ?>
		</ul>
		<?php if ($product['additional_thumbs']) { ?>
		<a href="#" class="next-img"><i class="fa fa-chevron-right" aria-hidden="true"></i></a>
		<a href="#" class="prev-img"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
		<?php } ?>
			<?php if ($product['special']) { ?>
			<?php if ($label_sale) { ?>
			<div class="sale">
				<span><?php echo $text_sale; ?></span>
			</div>
			<?php } ?>
			<?php if ($label_discount) { ?>
			<div class="discount">
				<span><?php echo $product['label_discount']; ?></span>
			</div>
			<?php } ?>
			<?php } ?>

			<?php if ($product['label_new']) { ?>
			<div class="new-pr"><span><?php echo $text_new; ?></span></div>
			<?php } ?>		
	</div>
	<div class="ajax-quickview-cont-wrap">
		<div class="ajax-quickview-cont">

			<div class="name">
				<h3><?php echo $product['name']; ?></h3>
			</div>

			<?php if ($product['price']) { ?>
			<div class="price">
				<?php if (!$product['special']) { ?>
				<?php echo $product['price']; ?>
				<?php } else { ?>
				<span class="price-new"><?php echo $product['special']; ?></span>
				<span class="price-old"><?php echo $product['price']; ?></span>
				<?php } ?>
				<?php if ($product['tax']) { ?>
				<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
				<?php } ?>
			</div>
			<?php } ?>

			<div class="model">
				<?php echo $text_model; ?>
				<?php echo $product['model']; ?>
			</div>

			<div class="manufacturer">
				<?php echo $text_manufacturer; ?>
				<?php echo $product['manufacturer']; ?>
			</div>

			<?php if ($product['rating']) { ?>
			<div class="rating">
				<?php for ($i = 1; $i <= 5; $i++) { ?>
				<?php if ($product['rating'] < $i) { ?>
				<span class="fa-stack">
					<i class="material-icons-star fa-stack-1x"></i>
				</span>
				<?php } else { ?>
				<span class="fa-stack">
					<i class="material-icons-star fa-stack-1x"></i>
					<i class="material-icons-star star fa-stack-1x"></i>
				</span>
				<?php } ?>
				<?php } ?>
			</div>
			<?php } ?>

			<!-- Product options -->
			<div class="product-option-wrap">
				<?php if ($product['options'] && (count($product['options']) < 4)) { ?>
				<div class="product-options form-horizontal">
					<div class="options">
						<h3><?php echo $text_option; ?></h3>
						<div class="form-group hidden">
							<input type="text" name="product_id" value="<?php echo $product['product_id'] ?>" class="form-control"/>
						</div>
						<?php foreach ($product['options'] as $option) { ?>
						<?php if ($option['type'] == 'select') { ?>
						<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
							<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id']; ?>">
								<?php echo $option['name']; ?>
							</label>
							<div class="col-sm-12">
								<select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
									<option value=""><?php echo $text_select; ?></option>
									<?php foreach ($option['product_option_value'] as $option_value) { ?>
									<option value="<?php echo $option_value['product_option_value_id']; ?>">
										<?php echo $option_value['name']; ?>
										<?php if ($option_value['price']) { ?>(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)<?php } ?>
									</option>
									<?php } ?>
								</select>
							</div>
						</div>
						<?php } ?>
						<?php if ($option['type'] == 'radio') { ?>
						<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
							<label class="control-label col-sm-12">
								<?php echo $option['name']; ?>
							</label>
							<div class="col-sm-12">
								<div id="input-option<?php echo $option['product_option_id']; ?>">
									<?php foreach ($option['product_option_value'] as $option_value) { ?>
									<div class="radio">
										<label for="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id']; ?>]">
											<input type="radio" hidden name="option[<?php echo $option['product_option_id']; ?>]" id="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>"/>
											<?php echo $option_value['name']; ?>
											<?php if ($option_value['price']) { ?>(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)<?php } ?>
										</label>
									</div>
									<?php } ?>
								</div>
							</div>
						</div>
						<?php } ?>
						<?php if ($option['type'] == 'checkbox') { ?>
						<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
							<label class="control-label col-sm-12">
								<?php echo $option['name']; ?>
							</label>
							<div class="col-sm-12">
								<div id="input-option<?php echo $option['product_option_id']; ?>">
									<?php foreach ($option['product_option_value'] as $option_value) { ?>
									<div class="checkbox">
										<label>
											<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>"/>
											<?php echo $option_value['name']; ?>
											<?php if ($option_value['price']) { ?>(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)<?php } ?>
										</label>
									</div>
									<?php } ?>
								</div>
							</div>
						</div>
						<?php } ?>
						<?php if ($option['type'] == 'image') { ?>
						<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
							<label class="control-label col-sm-12">
								<?php echo $option['name']; ?>
							</label>
							<div class="col-sm-12">
								<div id="input-option<?php echo $option['product_option_id']; ?>">
									<?php foreach ($option['product_option_value'] as $option_value) { ?>
									<div class="radio">
										<label>
											<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>"/>
											<img width="50" height="50" src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail"/> <?php echo $option_value['name']; ?>
											<?php if ($option_value['price']) { ?>(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)<?php } ?>
										</label>
									</div>
									<?php } ?>
								</div>
							</div>
						</div>
						<?php } ?>
						<?php if ($option['type'] == 'text') { ?>
						<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
							<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id']; ?>">
								<?php echo $option['name']; ?>
							</label>
							<div class="col-sm-12">
								<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"/>
							</div>
						</div>
						<?php } ?>
						<?php if ($option['type'] == 'textarea') { ?>
						<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
							<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id']; ?>">
								<?php echo $option['name']; ?>
							</label>
							<div class="col-sm-12">
								<textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?>
								</textarea>
							</div>
						</div>
						<?php } ?>
						<?php if ($option['type'] == 'file') { ?>
						<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
							<label class="control-label col-sm-12">
								<?php echo $option['name']; ?>
							</label>
							<div class="col-sm-12">
								<button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-block btn-default">
									<i class="fa fa-upload"></i>
									<?php echo $button_upload; ?>
								</button>
								<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>"/>
							</div>
						</div>
						<?php } ?>
						<?php if ($option['type'] == 'date') { ?>
						<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
							<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id']; ?>">
								<?php echo $option['name']; ?>
							</label>
							<div class="col-sm-12">
								<div class="input-group date">
									<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"/>
									<span class="input-group-btn">
										<button class="btn btn-default" type="button">
											<i class="fa fa-calendar"></i>
										</button>
									</span>
								</div>
							</div>
						</div>
						<?php } ?>
						<?php if ($option['type'] == 'datetime') { ?>
						<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
							<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
							<div class="col-sm-12">
								<div class="input-group datetime">
									<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"/>
									<span class="input-group-btn">
										<button type="button" class="btn btn-default">
											<i class="fa fa-calendar"></i>
										</button>
									</span>
								</div>
							</div>
						</div>
						<?php } ?>
						<?php if ($option['type'] == 'time') { ?>
						<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
							<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id']; ?>">
								<?php echo $option['name']; ?>
							</label>
							<div class="col-sm-12">
								<div class="input-group time">
									<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"/>
									<span class="input-group-btn">
										<button type="button" class="btn btn-default">
											<i class="fa fa-calendar"></i>
										</button>
									</span>
								</div>
							</div>
						</div>
						<?php } ?>
						<?php } ?>
					</div>
				</div>
				<?php } ?>
				<div class="form-group">
					<button class="product-btn-add" type="button" <?php if ($product['options'] && (count($product['options']) < 4)) { ?> onclick="cart.addPopup($(this),'<?php echo $product['product_id']; ?>');" <?php } else { ?> onclick="cart.add('<?php echo $product['product_id']; ?>', $(this).parents('.product-option-wrap').find('input[name=\'quantity\']').val());" <?php } ?>>
						<span><?php echo $button_cart; ?></span>
					</button>				
					<?php if ( empty($product['options'] ) || ( !empty($product['options']) && count($product['options']) < 4 )) { ?>
					<a class="counter counter-minus material-design-horizontal39" href='#'></a>
					<input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" class="form-control"/>
					<input type="hidden" name="product_id" value="<?php echo $product['product_id']; ?>"/>
					<a class="counter counter-plus material-design-add186" href='#'></a>
					<?php } ?>
				</div>
			</div>
			<div class="cart-button">
				<button class="btn" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
					<span><?php echo $button_wishlist; ?></span>
				</button><br>
				<button class="btn" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');">
					<span><?php echo $button_compare; ?></span>
				</button>
			</div>
		</div>
	</div>
</div>