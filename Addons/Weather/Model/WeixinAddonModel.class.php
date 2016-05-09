<?php

namespace Addons\Weather\Model;

use Home\Model\WeixinModel;

/**
 * Weather的微信模型
 * Weiphp天气预报
 */
class WeixinAddonModel extends WeixinModel
{
    function reply($dataArr, $keywordArr = array())
    {
        $config = getAddonConfig('Weather'); // 获取后台插件的配置参数
        preg_match('/(.+)天气/i', $dataArr['Content'], $matches);

        if (!isset($matches[1])) {
            $this->replyText("请输入要查询城市的名称，如输入：北京天气");
        }

        $json_array = file_get_contents('http://api.map.baidu.com/telematics/v3/weather?location=' . $matches[1] . '&output=json&ak=w7nErstGIETGShZOY0cvcGrO');
        $json_array = json_decode($json_array, true);
        $array = $json_array['results'][0]['weather_data'];
        print_r($json_array);
        date_default_timezone_set('Asia/Shanghai');
        if ($json_array['error'] > -3) {
            foreach ($array as $key => $val) {
                date_default_timezone_set('PRC');
                $h = date('H');
                if ($h >= 8 && $h <= 19) {
                    $articles [$key] = array(
                        'Title' => $val['date'] . "\n" . $val['weather'] . " " . $val['wind'] . " " . $val['temperature'],
                        'Description' => '',
                        'PicUrl' => $val['dayPictureUrl'],
                        'Url' => ''
                    );
                } else {
                    $articles [$key] = array(
                        'Title' => $val['date'] . "\n" . $val['weather'] . " " . $val['wind'] . " " . $val['temperature'],
                        'Description' => '',
                        'PicUrl' => $val['nightPictureUrl'],
                        'Url' => ''
                    );
                }
            }

            $tarray = array(
                'Title' => $json_array['results'][0]['currentCity'] . "天气预报",
                'Description' => '',
                'PicUrl' => '',
                'Url' => ''
            );
            array_unshift($articles, $tarray);
            $this->replyNews($articles);
        } else {
            $this->replyText("无法获取".$matches[1]."天气情况！");
        }
    }

    // 关注公众号事件
    public function subscribe()
    {
        return true;
    }

    // 取消关注公众号事件
    public function unsubscribe()
    {
        return true;
    }

    // 扫描带参数二维码事件
    public function scan()
    {
        return true;
    }

    // 上报地理位置事件
    public function location()
    {
        return true;
    }
}