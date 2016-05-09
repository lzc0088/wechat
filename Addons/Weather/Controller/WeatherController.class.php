<?php

namespace Addons\Weather\Controller;

use Home\Controller\AddonsController;

class WeatherController extends AddonsController
{
    function _initialize()
    {
        parent::_initialize();

        $res ['title'] = '天气预报';
        $res ['url'] = addons_url ( 'Weather://Weather/lists');
        $res ['class'] = 'current';
        $nav [] = $res;

        $this->assign('nav',$nav);
    }

//    public function del($model = null, $id = null, $ids = null)
//    {
//        // 删除keyword表中对应的记录
//        if ($id) {
//            $ids = array($id);
//        }
//        if ($ids) {
//            foreach ($ids as &$tempid) {
//                M('keyword')->where(array('addon' => $this->model['addon'], 'aim_id' => $tempid))->delete();
//            }
//        }
//
//        parent::del($model, $ids);
//    }
}
