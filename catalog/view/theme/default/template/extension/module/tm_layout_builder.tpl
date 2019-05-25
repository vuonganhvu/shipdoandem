<?php $rowsBefore = false; $rowFlag = false; ?>

<?php if( !isset($rows) ) { ?>
<div <?php echo $id ? 'id="' . $id . '"' : ''; ?> class="homebuilder clearfix <?php echo $class; ?>">
	<?php if($rowsBefore == true) {
		$level = 1;
	} else {
		$rows = $layouts; 
		$level = 1; 
	} ?>
<?php } ?>
	<?php foreach ( $rows as $lkey => $row) { ?>
		
		<?php $row->level = $level; ?> 

		<?php if( $row->level>1 && $row->fullwidth == '1' ) {
			$row->level = 1;
			$level = 1;
			$rowsBefore = true;
			$rows = $row;
		} ?>

		<?php if( $rowsBefore == true && $rowFlag == false ) {
			echo "</div></div>";
			$rowFlag = true;
		} ?>

		<?php if ( $row->level==1 ){ ?>
		<div class="tm-container <?php if($row->fullwidth == '0') { echo "container"; } ?>" <?php echo $row->attrs; ?>>
			<div class="tm-inner">
				<?php } ?>  
				<div class="row row-level-<?php echo $row->level; ?> <?php echo $row->sfxcls; ?>">
					<div class="row-inner <?php echo $row->cls; ?> clearfix">
						<?php foreach( $row->cols as $col ) { ?>
							<div class="col-lg-<?php echo $col->lgcol; ?> col-md-<?php echo $col->mdcol; ?> col-sm-<?php echo $col->smcol;?> col-xs-<?php echo $col->xscol; ?> <?php echo $col->sfxcls; ?>">
								<div class="col-inner <?php echo $col->cls;?>">
									<?php foreach ( $col->widgets as $widget ) {
										if( isset($widget->content) ) { 
											echo $widget->content;
										}
									} ?>
									<?php if ( isset($col->rows) && $col->rows ) { 
										$rows = $col->rows; 
										$level = $level + 1; 
										require( DIR_TEMPLATE.$template );
									} ?>
								</div>
							</div>
						<?php } ?>
					</div>
				</div>
		<?php if ( $row->level==1 ) { ?>
			</div>
		</div>
		<?php } ?>
		<?php } ?> 
	<?php if( $level == 1 ){ ?>
	</div>
	<?php } ?>