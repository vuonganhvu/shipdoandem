<?php
class ControllerExtensionModuleFbChat extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/fb_chat');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('module_fb_chat', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true));
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		if(isset($this->error['fb_sdk']))
		{
			$data['error_fb_sdk'] = $this->error['fb_sdk'];
		}else{
		    $data['error_fb_sdk'] = '';
	    }

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/fb_chat', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['action'] = $this->url->link('extension/module/fb_chat', 'user_token=' . $this->session->data['user_token'], true);

		$data['cancel'] = $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true);

		if (isset($this->request->post['module_fb_chat_status'])) {
			$data['module_fb_chat_status'] = $this->request->post['module_fb_chat_status'];
		} else {
			$data['module_fb_chat_status'] = $this->config->get('module_fb_chat_status');
		}
		if (isset($this->request->post['module_fb_chat_sdk'])) {
			$data['js_sdk_val'] = $this->request->post['module_fb_chat_sdk'];
		} else {
			$data['js_sdk_val'] = $this->config->get('module_fb_chat_sdk');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/fb_chat', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/fb_chat')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
       	if ( !trim( $this->request->post['module_fb_chat_sdk']  )) {
			$this->error['fb_sdk'] = $this->language->get('error_fb_sdk');
		}

		return !$this->error;
	}
}
?>