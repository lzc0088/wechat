<?php

namespace Addons\Tuling\Controller;
use Home\Controller\AddonsController;

class TulingController extends AddonsController{
    function _initialize()
    {
        parent::_initialize();

        $res ['title'] = '图灵机器人';
        $res ['url'] = addons_url ( 'Tuling://Tuling/config');
        $res ['class'] = 'current';
        $nav [] = $res;

        $this->assign('nav',$nav);
    }
}
