<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------
namespace Home\Controller;
use WechatLogin\TPWechatLogin;

/**
 * 公众号管理
 */
class PublicController extends HomeController {
	protected $addon, $model;
	public function _initialize() {
		parent::_initialize ();
		
		$this->assign ( 'check_all', false );
		$this->assign ( 'search_url', U ( 'lists' ) );
		
		define ( 'ADDON_PUBLIC_PATH', '' );
		defined ( '_ADDONS' ) or define ( '_ADDONS', MODULE_NAME );
		defined ( '_CONTROLLER' ) or define ( '_CONTROLLER', CONTROLLER_NAME );
		defined ( '_ACTION' ) or define ( '_ACTION', ACTION_NAME );
		
		$this->model = M ( 'model' )->getByName ( 'public' );
		$this->assign ( 'model', $this->model );

		$res['title'] = '公众号列表';
		$res['url'] = U('lists');
		$res['class'] = 'current';
		$nav[] = $res;
		$this->assign('nav', $nav);
		
		// dump ( $this->model );
	}

	protected function _display() {
		$this->view->display ( 'Addons:' . ACTION_NAME );
	}

	function help() {
		if (empty ( $_GET ['public_id'] )) {
			$this->error ( '公众号参数非法' );
		}
		$this->display ( 'Index/help' );
	}

	/**
	 * 显示指定模型列表数据
	 */
	public function lists() {
		if (! is_administrator ( $this->mid )) {
			// redirect ( addons_url ( 'UserCenter://UserCenter/lists' ) );
		}
		// 获取模型信息
		$model = $this->model;
		
		// 搜索条件
		$mp_ids = M ( 'public_link' )->where ( "uid='{$this->mid}'" )->getFields ( 'mp_id' );
		$map ['id'] = 0;
		if (! empty ( $mp_ids )) {
			$map ['id'] = $map3 ['mp_id'] = array (
					'in',
					$mp_ids 
			);
			
			$list = M ( 'public_link' )->where ( $map3 )->group ( 'mp_id' )->field ( 'mp_id,count(1) as num' )->select ();
			foreach ( $list as $vo ) {
				$countArr [$vo ['mp_id']] = $vo ['num'];
			}
		}
		
		// 读取模型数据列表
		$name = parse_name ( get_table_name ( $model ['id'] ), true );
		$data = M ( $name )->field ( true )->where ( $map )->select ();
		foreach ( $data as $d ) {
			$d ['count'] = $countArr [$d ['id']];
			$d ['is_creator'] = $d ['uid'] == $this->mid ? 1 : 0;
			$listArr [$d ['is_creator']] [] = $d;
		}
		
		$list_data ['list_data'] = $listArr;
		$this->assign ( $list_data );

		// 使用提示
		$normal_tips = '您目前最多可自己创建' . getPublicMax ( $this->mid ) . '个公众号（不包括管理员分配的公众号），如需要更多请联系管理员';
		$this->assign ( 'normal_tips', $normal_tips );
		
		$this->display ( 'Publics/lists' );
	}

	public function del($model = null, $ids = null) {
		$model = $this->model;
		
		if (empty ( $ids )) {
			$ids = I ( 'id' );
		}
		if (empty ( $ids )) {
			$ids = array_unique ( ( array ) I ( 'ids', 0 ) );
		}
		if (empty ( $ids )) {
			$this->error ( '请选择要操作的数据!' );
		}
		
		$Model = M ( get_table_name ( $model ['id'] ) );
		$map ['id'] = array ('in',$ids);
		if ($Model->where ( $map )->delete ()) {
			// public_link
			$map_link ['mp_id'] = array ('in', $ids);
			M ( 'public_link' )->where ( $map_link )->delete ();

			// dc_public_follow

			// dc_auto_reply

			// dc_ address

			// dc_credit_config

			// dc_credit_data

			// dc_custom_menu

			// dc_custom_menu_type

			// dc_common_category_group

			// dc_common_category

			// dc_donations_list

			// dc_donations_money

			// dc_extensions

			// dc_forms

			// dc_forms_attribute

			// dc_forms_value

			// dc_keyword

			// dc_material_file

			// dc_material_image

			// dc_material_news

			// dc_material_text

			// dc_message

			// dc_payment_order

			// dc_payment_set

			// dc_picture

			// dc_qr_code

			// dc_scene_qrcode

			// dc_scene_qrcode_statistics

			// dc_shop

			// dc_shop_slideshow

			// dc_smalltools

			// dc_sucai_template

			// dc_suggestions

			// dc_tmplmsg

			// dc_update_score_log

			// dc_weisite_category

			// dc_weisite_footer

			// dc_weisite_slideshow

			// dc_youaskservice_group

			// dc_youaskservice_keyword

			// dc_youaskservice_user

			// dc_custom_reply_mult

			// dc_custom_reply_news

			// dc_custom_reply_text

			$this->success ( '删除成功' );
		} else {
			$this->error ( '删除失败！' );
		}
	}
	public function edit($model = null, $id = 0) {
		$id || $id = I ( 'id' );
		redirect ( U ( 'add', array (
				'id' => $id 
		) ) );
	}

	// 编辑公众号
	public function edit_mp() {

		$res['title'] = '公众号编辑';
		$res['url'] = '';
		$res['class'] = 'current';
		$nav[] = $res;
		$this->assign('nav', $nav);

		$map ['id'] = $id = I ( 'id' );
		$data = D ( 'Common/Public' )->where ( $map )->find ();
		if (! empty ( $data ) && $data ['uid'] != $this->mid) {
			$this->error ( '非法操作' );
		}
		
		$this->assign ( 'id', $id );
		
		$model = $this->model;
		if (IS_POST) {
			foreach ( $_POST as &$v ) {
				$v = trim ( $v );
			}
			
			// 检查专属域名是否已被占用
			if (C ( 'DIV_DOMAIN' )) {
				$map2 ['domain'] = $domain = I ( 'domain' );
				if (empty ( $domain )) {
					$this->error ( '专属域名不能为空' );
					exit ();
				}
				if (is_numeric ( $domain )) {
					$this->error ( '专属域名不能为纯数字' );
					exit ();
				}
				$plen = strlen ( $domain );
				// ! preg_match ( "/^(([a-z]+[0-9]+)|([0-9]+[a-z]+))[a-z0-9]*$/i", $domain ) ||
				if ($plen < 3 || $plen > 10) {
					$this->error ( '专属域名必须为3-10位的字母和数字的组合' );
					exit ();
				}
				
				$map2 ['uid'] = array (
						'exp',
						'!=' . $this->mid 
				);
				$arr = array (
						'www' => 1
				); // CHECKOUT
				
				if (isset ( $arr [$domain] ) || D ( 'Common/Public' )->where ( $map2 )->getField ( 'id' )) {
					$this->error ( '该专属域名已经存在，请换别的再试' );
					exit ();
				}
			}
			
			$_POST ['token'] = $_POST ['public_id'];
			$_POST ['group_id'] = intval ( C ( 'DEFAULT_PUBLIC_GROUP_ID' ) );
			$_POST ['uid'] = $this->mid;
			
			// 更新缓存
			D ( 'Common/Public' )->clear ( $id );
			session ( 'token', $_POST ['token'] );
			
			$map2 ['uid'] = $this->mid;
			M ( 'manager' )->where ( $map2 )->setField ( 'has_public', 1 );
			D ( 'Common/User' )->clear ( $this->mid );
			
			$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			if (empty ( $id )) {
				if ($Model->create () && $id = $Model->add ()) {
					// 增加公众号与用户的关联关系
					$data ['uid'] = $this->mid;
					$data ['mp_id'] = $id;
					$data ['is_creator'] = 1;
					M ( 'public_link' )->add ( $data );
					
					$url = U ( 'lists' );
					
					$this->success ( '添加基本信息成功！', $url );
				} else {
					$this->error ( $Model->getError () );
				}
			} else {
				$_POST ['id'] = $id;
				$url = U ( 'lists' );
				$Model->create () && $res = $Model->save ();
				if ($res) {
					$this->success ( '保存基本信息成功！', $url );
				} elseif ($res === 0) {
					$this->success ( ' ', $url );
				} else {
					$this->error ( $Model->getError () );
				}
			}
		} else {
			$data ['type'] = intval ( $data ['type'] );
			$this->assign ( 'info', $data );
			
			$this->display ( 'Publics/edit_mp' );
		}
	}

	public function add($model = null) {
		if (IS_POST) {
			foreach ( $_POST as &$v ) {
				$v = trim ( $v );
			}
			
			$map ['uid'] = $this->mid;
			if (M ( 'manager' )->where ( $map )->find ()) {
				M ( 'manager' )->where ( $map )->save ( $_POST );
			} else {
				$_POST ['uid'] = $this->mid;
				M ( 'manager' )->add ( $_POST );
			}
			
			$data ['is_init'] = 1;
			$res = D ( 'Common/User' )->updateInfo ( $this->mid, $data );
			
			$is_open = C ( 'PUBLIC_BIND' ) && $this->mid == 46283;
			
			$url = U ( 'lists' );
			if ($res) {
				$this->success ( '保存基本信息成功！', $url );
			} elseif ($res === 0) {
				$this->success ( ' ', $url );
			} else {
				$this->error ( '保存失败' );
			}
		} else {
			$manager = ( array ) M ( 'manager' )->find ( $this->mid );
			$data = D ( 'Common/User' )->find ( $this->mid );
			
			$data = array_merge ( $data, $manager );
			
			$this->assign ( 'info', $data );
			
			$this->display ( 'Publics/add' );
		}
	}


	
	// 模拟登陆公众号进行一键绑定
	public function auto_bind_0() {

		// $mp_token = get_rand_char(32);
		// echo $mp_token;die;

		// $interface_url = C('DIV_DOMAIN') ? U('home/weixin/index') : U('home/weixin/index',array('id'=>$id));
		// echo $interface_url;
		// $wechat = new TPWechatLogin('lbwego@163.com','lbweigo');
		// $wechat->setImgPath('./Uploads/Picture/WechatLogin');
		// $mpInfo = $wechat->getMpInfo();
		// dump($mpInfo);

		// $result = $wechat->bind('http://idouly.com/mp/index.php?s=/home/weixin/index/id/1.html', 'idouly_com');
		// dump($result);
		// die;

		$res['title'] = '1. 一键获取公众号信息';
		$res['url'] = U('auto_bind_0',array('id'=>I('id')));
		$res['class'] = 'current';
		$nav[] = $res;

		$res['title'] = '2. 设置公众号信息';
		$res['url'] = '';
		$res['class'] = '';
		$nav[] = $res;

		$res['title'] = '3. 公众号接入配置';
		$res['url'] = '';
		$res['class'] = '';
		$nav[] = $res;
		$this->assign('nav', $nav);
		
		$model = $this->model;
		if (IS_POST) {
			foreach ( $_POST as &$v ) {
				$v = trim ( $v );
			}

			if ($_POST['mp_username'] == '') {
				$this->error('请填写公众号登陆用户名');
				exit();
			}

			if ($_POST['mp_password'] == '') {
				$this->error('请填写公众号登陆密码');
				exit();
			}

			$wechat = new TPWechatLogin($_POST['mp_username'], $_POST['mp_password']);
			$wechat->setImgPath('./Uploads/Picture/WechatLogin');
			$mpInfo = $wechat->getMpInfo();

			if (!$mpInfo['origin_id']) {
				$this->error ( '一键获取公众号信息失败，请手动设置公众号信息！' );
				redirect(U('Home/Public/step_0'));
				exit ();
			}

			
			// 检查专属域名是否已被占用
			if (C ( 'DIV_DOMAIN' )) {
				$map2 ['domain'] = $domain = I ( 'domain' );
				if (empty ( $domain )) {
					$this->error ( '专属域名不能为空' );
					exit ();
				}
				if (is_numeric ( $domain )) {
					$this->error ( '专属域名不能为纯数字' );
					exit ();
				}
				$plen = strlen ( $domain );
				// ! preg_match ( "/^(([a-z]+[0-9]+)|([0-9]+[a-z]+))[a-z0-9]*$/i", $domain ) ||
				if ($plen < 3 || $plen > 10) {
					$this->error ( '专属域名必须为3-10位的字母和数字的组合' );
					exit ();
				}
				
				$map2 ['uid'] = array (
						'exp',
						'!=' . $this->mid 
				);
				$arr = array (
						'www' => 1
				); // CHECKOUT
				
				if (isset ( $arr [$domain] ) || D ( 'Common/Public' )->where ( $map2 )->getField ( 'id' )) {
					$this->error ( '该专属域名已经存在，请换别的再试' );
					exit ();
				}
			}
			
			$mp_data['public_id'] = $mpInfo['origin_id'];
			$mp_data['token'] = $mpInfo['origin_id'];
			$mp_data['group_id'] = intval ( C ( 'DEFAULT_PUBLIC_GROUP_ID' ) );
			$mp_data['uid'] = $this->mid;
			$mp_data['headface_url'] = $mpInfo['headpic'];
			$mp_data['qrcode_url'] = $mpInfo['qrcode'];
			$mp_data['public_name'] = $mpInfo['name'];
			$mp_data['wechat'] = $mpInfo['mp_number'];
			
			$mp_data['mp_username'] = $_POST['mp_username'];
			$mp_data['mp_password'] = $_POST['mp_password'];
			$mp_data['interface_url'] = U('home/weixin/index');
			$mp_data['type'] = intval($mpInfo['type']);

			$mp_data['appid'] = $mpInfo['appid'];
			$mp_data['encodingaeskey'] = $mpInfo['encoding_aeskey'];


			
			// 更新缓存
			D ( 'Common/Public' )->clear ( $id );
			session ( 'token', $mpInfo['origin_id'] );
			
			$map2 ['uid'] = $this->mid;
			M ( 'manager' )->where ( $map2 )->setField ( 'has_public', 1 );
			D ( 'Common/User' )->clear ( $this->mid );
			
			$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
			// 获取模型的字段信息
			// $Model = $this->checkAttr ( $Model, $model ['id'] );
			$mp_info = $Model->where(array('public_id'=>$mpInfo['origin_id']))->find();
			if (!$mp_info) {
				$mp_data['mp_token'] = get_rand_char(32);	// 生成32位随机字符串用于做接口验证
				if ($Model->create () && $id = $Model->add ($mp_data)) {
					// 增加公众号与用户的关联关系
					$data ['uid'] = $this->mid;
					$data ['mp_id'] = $id;
					$data ['is_creator'] = 1;
					M ( 'public_link' )->add ( $data );

					$interface_url = C('DIV_DOMAIN') ? U('home/weixin/index') : U('home/weixin/index',array('id'=>$id));
					
					$url = U ( 'step_1?id=' . $id );

					// $result = $wechat->bind(U('home/weixin/index',array('id'=>$id)), $mp_data['mp_token']);
					// if ($result) {
					// 	$this->success ( '一键绑定公众号成功！', $url );
					// } else {
					// 	$this->success ( '绑定公众号成功，请到微信公众号后台开发者中心进行3.公众号接入配置！', $url );
					// }
					
					$this->success ( '一键获取公众号信息成功！', $url );
				} else {
					$this->error ( $Model->getError () );
				}
			} else {
				
				$url = U ( 'step_1?id=' . $mp_info['id'] );
				$Model->create () && $res = $Model->where(array('public_id'=>$mpInfo['origin_id']))->save ($mp_data);
				
				$result = $wechat->bind(U('home/weixin/index',array('id'=>$mp_info['id'])), $mp_info['mp_token']);
					
				if ($res) {
					// if ($result) {
					// 	$this->success ( '一键绑定公众号成功！', $url );
					// } else {
					// 	$this->success ( '绑定公众号成功，请到微信公众号后台开发者中心进行3.公众号接入配置！', $url );
					// }
					$this->success ( '一键获取公众号信息成功！', $url );
				} elseif ($res === 0) {
					// if ($result) {
					// 	$this->success ( '一键绑定公众号成功！', $url );
					// } else {
					// 	$this->success ( '绑定公众号成功，请到微信公众号后台开发者中心进行3.公众号接入配置！', $url );
					// }
					$this->success ( '一键获取公众号信息成功！', $url );
				} else {
					$this->error ( $Model->getError () );
				}
			}
		} else {

			if (empty ( $id )) {
				$allow_add_count = getPublicMax ( $this->mid );
				$has_add_count = M ( 'public_link' )->where ( "uid='{$this->mid}'" )->getField ( 'sum(is_creator)' );
				if ($allow_add_count <= $has_add_count) {
					$this->error ( '您最多只能创建 ' . $allow_add_count . ' 个公众号！' );
					exit ();
				}
			} else {
				$data = M ( get_table_name ( $model ['id'] ) )->find ( $id );
			}

			$data ['type'] = intval ( $data ['type'] );
			$this->assign ( 'info', $data );
			
			$this->display ( 'Publics/auto_bind_0' );
		}
	}

	// 一键绑定公众号模式下保存高级接口信息
	public function auto_bind_1() {
		$res['title'] = '公众号基本信息';
		$res['url'] = U('step_0',array('id'=>I('id')));
		$res['class'] = '';
		$nav[] = $res;

		$res['title'] = '高级功能参数';
		$res['url'] = U('step_1',array('id'=>I('id')));
		$res['class'] = 'current';
		$nav[] = $res;

		$res['title'] = '3. 公众号接入配置';
		$res['url'] = U('mp_interface',array('id'=>I('id')));
		$res['class'] = '';
		$nav[] = $res;
		$this->assign('nav', $nav);
		

		$model = $this->model;
		$id = I ( 'get.id' );
		$this->assign ( 'id', $id );
		
		$data = M ( get_table_name ( $model ['id'] ) )->find ( $id );
		if (empty ( $data ) || $data ['uid'] != $this->mid) {
			$this->error ( '请先填写公众号基本信息' );
		}
		$is_audit = $data ['is_audit'];
		$this->assign ( 'is_audit', $is_audit );
		if (IS_POST) {
			// 更新缓存
			D ( 'Common/Public' )->clear ( $id );
			
			$_POST ['id'] = $id;
			
			foreach ( $_POST as &$v ) {
				$v = trim ( $v );
			}
			
			$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			
			if ($Model->create () && false !== $Model->save ()) {
				D ( 'Common/Public' )->clear ( $data ['id'] );
				
				if ($is_audit == 0 && ! C ( 'REG_AUDIT' )) {
					$this->success ( '提交成功！', U ( 'waitAudit', array (
							'id' => $id 
					) ) );
				} else {
					$this->success ( '保存成功！', U ( 'mp_interface', array('id'=>I('id')) ) );
				}
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			$data || $this->error ( '数据不存在！' );
			
			$this->assign ( 'info', $data );
			
			$this->display ( 'Publics/auto_bind_1' );
		}
	}

	function step_0() {
		// $wechat = new TPWechatLogin('idouly@163.com','idouly123');
		// $wechat->setImgPath('./Uploads/Picture/WechatLogin');
		// $wechat->getMpInfo();
		$res['title'] = '1. 一键获取公众号信息';
		$res['url'] = U('auto_bind_0',array('id'=>I('id')));
		$res['class'] = '';
		$nav[] = $res;

		$res['title'] = '2. 设置公众号信息';
		$res['url'] = U('step_0',array('id'=>I('id')));
		$res['class'] = 'current';
		$nav[] = $res;

		$res['title'] = '3. 公众号接入配置';
		$res['url'] = U('mp_interface',array('id'=>I('id')));
		$res['class'] = '';
		$nav[] = $res;
		$this->assign('nav', $nav);

		// die;
		$map ['id'] = $id = I ( 'id' );
		$data = D ( 'Common/Public' )->where ( $map )->find ();
		if (! empty ( $data ) && $data ['uid'] != $this->mid) {
			$this->error ( '非法操作' );
		}
		
		$this->assign ( 'id', $id );
		
		$model = $this->model;
		if (IS_POST) {
			foreach ( $_POST as &$v ) {
				$v = trim ( $v );
			}
			
			// 检查专属域名是否已被占用
			if (C ( 'DIV_DOMAIN' )) {
				$map2 ['domain'] = $domain = I ( 'domain' );
				if (empty ( $domain )) {
					$this->error ( '专属域名不能为空' );
					exit ();
				}
				if (is_numeric ( $domain )) {
					$this->error ( '专属域名不能为纯数字' );
					exit ();
				}
				$plen = strlen ( $domain );
				// ! preg_match ( "/^(([a-z]+[0-9]+)|([0-9]+[a-z]+))[a-z0-9]*$/i", $domain ) ||
				if ($plen < 3 || $plen > 10) {
					$this->error ( '专属域名必须为3-10位的字母和数字的组合' );
					exit ();
				}
				
				$map2 ['uid'] = array (
						'exp',
						'!=' . $this->mid 
				);
				$arr = array (
						'www' => 1
				); // CHECKOUT
				
				if (isset ( $arr [$domain] ) || D ( 'Common/Public' )->where ( $map2 )->getField ( 'id' )) {
					$this->error ( '该专属域名已经存在，请换别的再试' );
					exit ();
				}
			}
			
			$_POST ['token'] = $_POST ['public_id'];
			$_POST ['group_id'] = intval ( C ( 'DEFAULT_PUBLIC_GROUP_ID' ) );
			$_POST ['uid'] = $this->mid;

			$_POST ['mp_token'] = get_rand_char(32);	// 生成32位随机字符串用于做接口验证
			
			$_POST ['interface_url'] = U('home/weixin/index');
			
			// 更新缓存
			D ( 'Common/Public' )->clear ( $id );
			session ( 'token', $_POST ['token'] );
			
			$map2 ['uid'] = $this->mid;
			M ( 'manager' )->where ( $map2 )->setField ( 'has_public', 1 );
			D ( 'Common/User' )->clear ( $this->mid );
			
			$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			if (empty ( $id )) {
				if ($Model->create () && $id = $Model->add ()) {
					// 增加公众号与用户的关联关系
					$data ['uid'] = $this->mid;
					$data ['mp_id'] = $id;
					$data ['is_creator'] = 1;
					M ( 'public_link' )->add ( $data );
					
					$url = U ( 'step_1?id=' . $id );
					
					$this->success ( '添加基本信息成功！', $url );
				} else {
					$this->error ( $Model->getError () );
				}
			} else {
				$_POST ['id'] = $id;
				$url = U ( 'lists' );
				$Model->create () && $res = $Model->save ();
				if ($res) {
					$this->success ( '保存基本信息成功！', $url );
				} elseif ($res === 0) {
					$this->success ( ' ', $url );
				} else {
					$this->error ( $Model->getError () );
				}
			}
		} else {
			if (empty ( $id )) {
				$allow_add_count = getPublicMax ( $this->mid );
				$has_add_count = M ( 'public_link' )->where ( "uid='{$this->mid}'" )->getField ( 'sum(is_creator)' );
				if ($allow_add_count <= $has_add_count) {
					$this->error ( '您最多只能创建 ' . $allow_add_count . ' 个公众号！' );
					exit ();
				}
			} else {
				$data = M ( get_table_name ( $model ['id'] ) )->find ( $id );
			}
			
			$data ['type'] = intval ( $data ['type'] );
			$this->assign ( 'info', $data );
			
			$this->display ( 'Publics/step_0' );
		}
	}
	function step_1() {
//		$res['title'] = '1. 一键获取公众号信息';
//		$res['url'] = U('auto_bind_0',array('id'=>I('id')));
//		$res['class'] = '';
//		$nav[] = $res;

		$res['title'] = '1. 设置公众号信息';
		$res['url'] = U('step_1',array('id'=>I('id')));
		$res['class'] = 'current';
		$nav[] = $res;

		$res['title'] = '2. 公众号接入配置';
		$res['url'] = U('mp_interface',array('id'=>I('id')));
		$res['class'] = '';
		$nav[] = $res;
		$this->assign('nav', $nav);

		$model = $this->model;
		$id = I ( 'get.id' );
		$this->assign ( 'id', $id );
		
		$data = M ( get_table_name ( $model ['id'] ) )->find ( $id );
		if (empty ( $data ) || $data ['uid'] != $this->mid) {
			$this->error ( '请先填写公众号基本信息' );
		}
		$is_audit = $data ['is_audit'];
		$this->assign ( 'is_audit', $is_audit );
		if (IS_POST) {
			// 更新缓存
			D ( 'Common/Public' )->clear ( $id );
			
			$_POST ['id'] = $id;
			
			foreach ( $_POST as &$v ) {
				$v = trim ( $v );
			}
			
			$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			
			if ($Model->create () && false !== $Model->save ()) {
				D ( 'Common/Public' )->clear ( $data ['id'] );
				
				if ($is_audit == 0 && ! C ( 'REG_AUDIT' )) {
					$this->success ( '提交成功！', U ( 'waitAudit', array (
							'id' => $id 
					) ) );
				} else {
					$this->success ( '保存成功！', U ( 'mp_interface', array('id'=>I('id')) ) );
				}
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			$data || $this->error ( '数据不存在！' );
			
			$this->assign ( 'info', $data );
			
			$this->display ( 'Publics/step_1' );
		}
	}
	function step_2() {
		$model = $this->model;
		$id = I ( 'get.id' );
		$this->assign ( 'id', $id );
		
		$data = M ( get_table_name ( $model ['id'] ) )->find ( $id );
		if (empty ( $data ) || $data ['uid'] != $this->mid) {
			$this->error ( '非法操作' );
		}
		$is_audit = $data ['is_audit'];
		$this->assign ( 'is_audit', $is_audit );
		if (IS_POST) {
			// 更新缓存
			D ( 'Common/Public' )->clear ( $id );
			
			$_POST ['id'] = $id;
			
			foreach ( $_POST as &$v ) {
				$v = trim ( $v );
			}
			
			$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			
			if ($Model->create () && false !== $Model->save ()) {
				D ( 'Common/Public' )->clear ( $data ['id'] );
				
				if ($is_audit == 0 && ! C ( 'REG_AUDIT' )) {
					$this->success ( '提交成功！', U ( 'waitAudit', array (
							'id' => $id 
					) ) );
				} else {
					$this->success ( '保存成功！', U ( 'Home/Index/main' ) );
				}
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			$data || $this->error ( '数据不存在！' );
			
			$this->assign ( 'info', $data );
			
			$this->display ( 'Publics/step_2' );
		}
	}
	protected function checkAttr($Model, $model_id) {
		$fields = get_model_attribute ( $model_id );
		$validate = $auto = array ();
		foreach ( $fields as $key => $attr ) {
			if ($attr ['is_must']) { // 必填字段
				$validate [] = array (
						$attr ['name'],
						'require',
						$attr ['title'] . '必须!' 
				);
			}
			// 自动验证规则
			if (! empty ( $attr ['validate_rule'] ) || $attr ['validate_type'] == 'unique') {
				$validate [] = array (
						$attr ['name'],
						$attr ['validate_rule'],
						$attr ['error_info'] ? $attr ['error_info'] : $attr ['title'] . '验证错误',
						0,
						$attr ['validate_type'],
						$attr ['validate_time'] 
				);
			}
			// 自动完成规则
			if (! empty ( $attr ['auto_rule'] )) {
				$auto [] = array (
						$attr ['name'],
						$attr ['auto_rule'],
						$attr ['auto_time'],
						$attr ['auto_type'] 
				);
			} elseif ('checkbox' == $attr ['type']) { // 多选型
				$auto [] = array (
						$attr ['name'],
						'arr2str',
						3,
						'function' 
				);
			} elseif ('datetime' == $attr ['type']) { // 日期型
				$auto [] = array (
						$attr ['name'],
						'strtotime',
						3,
						'function' 
				);
			}
		}
		return $Model->validate ( $validate )->auto ( $auto );
	}
	function changPublic() {
		$map ['id'] = I ( 'id', 0, 'intval' );
		$info = M ( 'public' )->where ( $map )->find ();
		
		unset ( $map );
		$map ['uid'] = session ( 'mid' );
		M ( 'public_link' )->where ( $map )->setField ( 'is_use', 0 );
		
		$map ['mp_id'] = $info ['id'];
		M ( 'public_link' )->where ( $map )->setField ( 'is_use', 1 );
		
		get_token ( $info ['public_id'] );
		
		redirect ( U ( 'lists' ) );
	}
	
	// 等待审核页面
	function waitAudit() {
		$data = D ( 'Common/User' )->find ( $this->mid );
		$is_audit = $data ['is_audit'];
		if ($is_audit == 0 && ! C ( 'REG_AUDIT' )) {
			$this->display ( 'Publics/waitAudit' );
		} else {
			redirect ( U ( 'home/index/index' ) );
		}
	}

	// 3.公众号接入配置
	function mp_interface() {
		$model = $this->model;
		$id = I ( 'get.id' );
		$this->assign ( 'id', $id );
		
		$data = M ( get_table_name ( $model ['id'] ) )->find ( $id );
		if (empty ( $data ) || $data ['uid'] != $this->mid) {
			$this->error ( '请先新增或选择公众号' );
		}

//		$res['title'] = '1. 一键获取公众号信息';
//		$res['url'] = U('auto_bind_0',array('id'=>I('id')));
//		$res['class'] = '';
//		$nav[] = $res;

		$res['title'] = '1. 设置公众号信息';
		$res['url'] = U('step_1',array('id'=>I('id')));
		$res['class'] = '';
		$nav[] = $res;

		$res['title'] = '2. 公众号接入配置';
		$res['url'] = U('mp_interface',array('id'=>I('id')));
		$res['class'] = 'current';
		$nav[] = $res;
		$this->assign('nav', $nav);

		$mpInfo = M('public')->where(array('id'=>I('id')))->find();
		$this->assign('id', $mpInfo['id']);
		$this->assign('mpInfo', $mpInfo);
		$this->assign('mp_token', $mpInfo['mp_token']);
		$this->assign('encodingaeskey', $mpInfo['encodingaeskey']);

		$this->display('Publics/interface');
	}

	/**
	 * 一键接入
	 * @author 艾逗笔<765532665@qq.com>
	 */
	function auto_bind_interface() {
		$mpInfo = M('public')->where(array('id'=>I('mp_id')))->find();
		if (!$mpInfo) {
			$this->error("公众号参数为空，接入失败");
		}

		$wechat = new TPWechatLogin($mpInfo['mp_username'], $mpInfo['mp_password']);
		$result = $wechat->bind(U('home/weixin/index',array('id'=>$mpInfo['id'])), $mpInfo['mp_token']);
		// dump($result);
		// dump($mpInfo);
		// die;		
		if ($result) {
			$this->success ( '一键接入公众号成功！', U('lists') );
		} else {
			$this->error ( '一键接入公众号失败，请按照引导步骤手动接入' );
		}
	}
}