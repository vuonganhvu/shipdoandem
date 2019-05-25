<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');

				$data['theme_path'] = $this->config->get('theme_' . $this->config->get('config_theme') . '_directory');
				

		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}

		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', true);
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['tracking'] = $this->url->link('information/tracking');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/login', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);

				$data['address']   = nl2br($this->config->get('config_address'));
				$data['telephone'] = $this->config->get('config_telephone');
				$data['fax']       = $this->config->get('config_fax');
				$data['email']     = $this->config->get('config_email');
				$data['geocode']   = $this->config->get('config_geocode');
				$data['open']      = $this->config->get('config_open');
				

		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

				if(($this->config->has('theme_' . $this->config->get('config_theme') . '_simple_blog_status')) && ($this->config->get('theme_' . $this->config->get('config_theme') . '_simple_blog_status'))) {
				$data['simple_blog_found'] = 1;
				$tmp = $this->config->get('theme_' . $this->config->get('config_theme') . '_simple_blog_footer_heading');
				if (!empty($tmp)) {
				$data['simple_blog_footer_heading'] = $this->config->get('theme_' . $this->config->get('config_theme') . '_simple_blog_footer_heading');
				} else {
				$data['simple_blog_footer_heading'] = $this->language->get('text_simple_blog');
				}
				$data['simple_blog']	= $this->url->link('simple_blog/article');
				}
				

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = ($this->request->server['HTTPS'] ? 'https://' : 'http://') . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}


				$data['footer_1'] = $this->load->controller('common/footer_1');
				$data['footer_2'] = $this->load->controller('common/footer_2');
				$data['footer_3'] = $this->load->controller('common/footer_3');
				$data['footer_4'] = $this->load->controller('common/footer_4');
				
		$data['scripts'] = $this->document->getScripts('footer');
		
		return $this->load->view('common/footer', $data);
	}
}
