<?php

namespace Addons\CustomMenu\Controller;

use Home\Controller\AddonsController;

class BaseController extends AddonsController{	

	function _initialize(){
		parent::_initialize();
		
		$controller = strtolower ( _CONTROLLER );
		$action = strtolower ( _ACTION );
		$path = $controller.'/'.$action;

		$menu_cur_flag = false;
		$menu_now_cur_flag = false;

		if ($action == 'menu_lists'
			|| $path == 'custommenu/lists' || $path == 'custommenu/add' || $path == 'custommenu/edit'
			|| $path == 'custommenu/special_lists' || $path == 'custommenu/special_add' || $path == 'custommenu/special_edit') {
			$menu_cur_flag = true;
		}
		if ($action == 'menu_now_lists') {
			$menu_now_cur_flag = true;
		}

		$res ['title'] = '平台端菜单管理';
		$res ['url'] = addons_url ( 'CustomMenu://CustomMenuType/menu_lists' , array('type'=>0));
		$res ['class'] = $menu_cur_flag ? 'current' : '';
		$nav [] = $res;

		$res ['title'] = '微信端菜单管理';
		$res ['url'] = addons_url (  'CustomMenu://CustomMenuType/menu_now_lists');
		$res ['class'] = $menu_now_cur_flag ? 'current' : '';
		$nav [] = $res;

		$this->assign('nav',$nav);

		// $res ['title'] = '默认菜单';
		// $res ['url'] = addons_url ( 'CustomMenu://CustomMenu/lists' );
		// $res ['class'] = $action == 'lists'? 'current' : '';
		// $nav [] = $res;
		
		// $res ['title'] = '个性菜单';
		// $res ['url'] = addons_url ( 'CustomMenu://CustomMenu/special_lists' );
		// $res ['class'] = $action == 'special_lists'? 'current' : '';
		// $nav [] = $res;

		$sub_res ['title'] = '默认菜单';
		$sub_res ['url'] = addons_url('CustomMenu://CustomMenuType/menu_lists', array('type' => 0));
		$sub_res ['class'] = ($path == 'custommenu/lists' || $path == 'custommenu/add' || $path == 'custommenu/edit') ? 'cur' : '';
		$sub_nav [] = $sub_res;

		$sub_res ['title'] = '个性菜单';
		$sub_res ['url'] = addons_url('CustomMenu://CustomMenuType/menu_lists', array('type' => 1));
		$sub_res ['class'] = ($path == 'custommenu/special_lists' || $path == 'custommenu/special_add' || $path == 'custommenu/special_edit') ? 'cur' : '';
		$sub_nav [] = $sub_res;

		$this->assign('sub_nav', $sub_nav);
	}
}
