<?php

namespace Addons\Example\Controller;

use Home\Controller\AddonsController;

class ExampleController extends AddonsController
{

    function _initialize()
    {
        parent::_initialize();

        $res ['title'] = '功能演示';
        $res ['url'] = addons_url ( 'Example://Example/config');
        $res ['class'] = 'current';
        $nav [] = $res;

        $this->assign('nav',$nav);
    }

    // jssdk使用演示
    public function demo()
    {
        $this->display();
    }
}
