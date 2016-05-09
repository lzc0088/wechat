<?php

namespace Addons\Dg\Model;

use Home\Model\WeixinModel;

/**
 * Dg的微信模型
 */
class WeixinAddonModel extends WeixinModel
{
    function reply($dataArr, $keywordArr = array())
    {
        $config = getAddonConfig('Dg'); // 获取后台插件的配置参数
        // 其中token和openid这两个参数一定要传，否则程序不知道是哪个微信用户进入了系统
        $param ['token'] = get_token();
        $param ['openid'] = get_openid();
        $keyword = $keywordArr ['keyword'];// 设置的关键词
        $myword = trim($dataArr ['Content']);// 用户输入的内容
//        $myword = str_replace($keyword, '', $myword);// 过滤匹配词

        // 当用户触发成语接龙插件时
        if ($dataArr['Content'] == '在线点歌' || $dataArr['Content'] == 'Dg') {
            $keywordArr['step'] = 'input';        // 定义消息上下文的判断标识
            beginContext('Dg', $keywordArr);            // 设置消息上下文
            replyText('进入在线点歌模式，请输入一个歌名，比如：小苹果');        // 进行第一次响应
        }

        // 用户的下一次输入处于消息上下文中
        if ($keywordArr['step'] == 'input') {
            if ($dataArr['Content'] == '退出在线点歌') {
                // 不设置消息上下文，则用户的下一次输入不再处于消息上下文中
                replyText('你已退出在线点歌模式，再次回复【在线点歌】即可进入~');
                return false;
            }

            $keywordArr['step'] = 'input';        // 定义消息上下文的判断标识
            beginContext('Dg', $keywordArr);        // 继续设置消息上下文

            $arr = $this->getBaiDugqlist($myword);
            $mygqinfoarr = $this->getBaiDugqinfo($arr['0']['song_id']);
            $songName = $mygqinfoarr['songName'];
            $artistName = $mygqinfoarr['artistName'];
            $songLink = $this->getBaiDugqurl($mygqinfoarr['songLink']);
            $this->replyMusicnothumb($songName, $artistName, $songLink, $songLink);
        }

//        if (empty($myword) || empty($keyword)) {
//            $randgqinfoarr = $this->getBaiDurand();// 随机歌曲
//            $songName = $randgqinfoarr['songName'];
//            $artistName = $randgqinfoarr['artistName'];
//            $songLink = $this->getBaiDugqurl($randgqinfoarr['songLink']);
//            $this->replyMusicnothumb($songName, $artistName, $songLink, $songLink);
//        } elseif ($keyword == '点歌') {
//            $arr = $this->getBaiDugqlist($myword);
//            $mygqinfoarr = $this->getBaiDugqinfo($arr['0']['song_id']);
//            $songName = $mygqinfoarr['songName'];
//            $artistName = $mygqinfoarr['artistName'];
//            $songLink = $this->getBaiDugqurl($mygqinfoarr['songLink']);
//            $this->replyMusicnothumb($songName, $artistName, $songLink, $songLink);
//            $this->replyText($msg);
//        } else {
//            $this->replyText("系统指令出错\n发送【点歌】随机听歌，\n发送【点歌+歌曲名】点歌");
//        }
    }

    //获取搜索歌名
    function getBaiDugqlist($gq)
    {
        $param ['from'] = 'qianqian';
        $param ['version'] = '2.1.0';
        $param ['method'] = 'baidu.ting.search.common';
        $param ['format'] = 'json';
        $param ['query'] = $gq;
        $param ['page_no'] = '1';
        $param ['page_size'] = '200';
        $url = 'http://tingapi.ting.baidu.com/v1/restserver/ting?' . http_build_query($param);
        $content = file_get_contents($url);
        $content = json_decode($content, true);
        if (!empty($content['song_list'])) {
            return $content['song_list'];
        } else {
            $this->replyText("系统没有找到相关歌曲\n发送【点歌】随机听歌，\n发送【点歌+歌曲名】点歌");
        }
    }

    //获取ID歌曲信息
    function getBaiDugqinfo($songIds)
    {
        $param ['songIds'] = $songIds;
        $url = 'http://ting.baidu.com/data/music/links?' . http_build_query($param);
        $content = file_get_contents($url);
        $content = json_decode($content, true);
        if ($content['errorCode'] == 22000) {
            return $content['data']['songList']['0'];
        } else {
            $this->replyText("系统没有找到相关歌曲\n发送【点歌】随机听歌，\n发送【点歌+歌曲名】点歌");
        }
    }

    //随机音乐
    function getBaiDurand()
    {
        $gqlist = $this->getBaiDudt('public_tuijian_suibiantingting');
        shuffle($gqlist);//调用现成的数组随机排列函数
        $gqlist = array_slice($gqlist, 0, 1);//截取前$limit个
        $gqinfo = $this->getBaiDugqinfo($gqlist['0']['songid']);
        return $gqinfo;
    }

    //随机音乐列表
    function getBaiDudt($dt)
    {
        $param ['from'] = 'qianqian';
        $param ['version'] = '2.1.0';
        $param ['method'] = 'baidu.ting.radio.getChannelSong';
        $param ['format'] = 'json';
        $param ['pn'] = '0';
        $param ['rn'] = '100';
        $param ['channelname'] = 'public_tuijian_rege';
        $url = 'http://tingapi.ting.baidu.com/v1/restserver/ting?' . http_build_query($param);
        $content = file_get_contents($url);
        $content = json_decode($content, true);
        if ($content['error_code'] == 22000) {
            return ($content['result']['songlist']);
        } else {
            $this->replyText("系统没有找到相关音乐\n发送【点歌】随机听歌，\n发送【点歌+歌曲名】点歌");
        }
    }

    //歌曲URL处理
    function getBaiDugqurl($songurl)
    {
        if (strrpos($songurl, '&')) {
            $songurl = substr($songurl, 0, strrpos($songurl, '&'));
        }
        return $songurl;
    }

    // 关键词处理
    public function text($data)
    {
        $keyword = '';
        $config = getAddonConfig('Dg');
        if ($config['keyword']) {
            $keyword = $config['keyword'];
        } else {
            $keyword = '点歌';
        }
        // replyText($config['keyword']);

        \Think\Log::write("dddd: \r\n" . var_export($this->chstr($data['Content'], $keyword), true) . "\r\n\r\n", \Think\Log::INFO);

        if ($this->chstr($data['Content'], $keyword)) {
            $myword = trim($data ['Content']);//用户输入的内容
            $myword = str_replace($keyword, '', $myword);//过滤匹配词
            if (empty($myword) || empty($keyword)) {
                $randgqinfoarr = $this->getBaiDurand();//随机歌曲
                $songName = $randgqinfoarr['songName'];
                $artistName = $randgqinfoarr['artistName'];
                $songLink = $this->getBaiDugqurl($randgqinfoarr['songLink']);
                $this->replyMusicnothumb($songName, $artistName, $songLink, $songLink);
            }
            elseif ($keyword == $config['keyword']) {
                $arr = $this->getBaiDugqlist($myword);
                $mygqinfoarr = $this->getBaiDugqinfo($arr['0']['song_id']);
                $songName = $mygqinfoarr['songName'];
                $artistName = $mygqinfoarr['artistName'];
                $songLink = $this->getBaiDugqurl($mygqinfoarr['songLink']);
                $this->replyMusicnothumb($songName, $artistName, $songLink, $songLink);
            } else {
                $this->replyText("系统指令出错\n发送【点歌】随机听歌，\n发送【点歌+歌曲名】点歌");
            }
            return true;
        }
    }

    public function voice($data)
    {
        //点个插件voice 接收语音时，不要加上“点歌”，否者语音的话，后面的插件无法再识别语言（多客服）
        $data['Content'] = substr($data['Recognition'], 0, strlen($data['Recognition']) - 3);

        $config = getAddonConfig('Dg');
        // replyText($config['keyword']);

        if ($this->chstr($data['Content'], $config['keyword'])) {
            if ($config['keyword']) {
                $keyword = $config['keyword'];
            } else {
                $keyword = '点歌';
            }

            $myword = trim($data ['Content']);//用户输入的内容
            $myword = str_replace($keyword, '', $myword);//过滤匹配词
            if (empty($myword) || empty($keyword)) {
                $randgqinfoarr = $this->getBaiDurand();//随机歌曲
                $songName = $randgqinfoarr['songName'];
                $artistName = $randgqinfoarr['artistName'];
                $songLink = $this->getBaiDugqurl($randgqinfoarr['songLink']);
                $this->replyMusicnothumb($songName, $artistName, $songLink, $songLink);
            } elseif ($keyword == $config['keyword']) {
                $arr = $this->getBaiDugqlist($myword);
                $mygqinfoarr = $this->getBaiDugqinfo($arr['0']['song_id']);
                $songName = $mygqinfoarr['songName'];
                $artistName = $mygqinfoarr['artistName'];
                $songLink = $this->getBaiDugqurl($mygqinfoarr['songLink']);
                $this->replyMusicnothumb($songName, $artistName, $songLink, $songLink);
            } else {
                $this->replyText("系统指令出错\n发送【点歌】随机听歌，\n发送【点歌+歌曲名】点歌");
            }
        }
    }

    function chstr($str, $in)
    {
        $tmparr = explode($in, $str);
        if (count($tmparr) > 1) {
            return true;
        } else {
            return false;

        }
    }
}