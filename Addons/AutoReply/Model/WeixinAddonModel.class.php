<?php

namespace Addons\AutoReply\Model;

use Home\Model\WeixinModel;

/**
 * AutoReply的微信模型
 */
class WeixinAddonModel extends WeixinModel
{
    function reply($dataArr, $keywordArr = array())
    {
        $map ['id'] = $keywordArr ['aim_id'];
        $info = M('auto_reply')->where($map)->find();
        $this->replyMsg($info);
    }

    // 关注时自动处理
    public function subscribe($data)
    {
        // 判断用户是否已经关注
        $map ['token'] = $data ['ToUserName'];
        $map ['openid'] = $data ['FromUserName'];
        $public_follow = M ( 'public_follow' )->where ( $map )->find ();
        if (isset($public_follow) && $public_follow['has_subscribe'] == 1) {
            replyText("已关注！");
            exit();
        }

        $uid = $public_follow['uid'];

//        $uid = D('Common/Follow')->init_follow($data ['FromUserName']);
        session('mid', $uid);

        // 更新关注状态
        D('Common/Follow')->set_subscribe($data ['FromUserName'], 1);

        // 增加积分
        add_credit('subscribe');

        // 关注时自动回复（欢迎语）
        $info = M('auto_reply')->where(array('token' => get_token(), 'reply_scene' => 0))->find();
        $this->replyMsg($info);
    }

    // 取消关注时的自动处理
    public function unsubscribe($data)
    {
        session('mid', null);

        // 直接删除用户
        $map_follow ['openid'] = $data ['FromUserName'];
        $map_follow ['token'] = get_token ();
        $map_user ['uid'] = D ( 'public_follow' )->where ( $map_follow )->getField ( 'uid' );
        M ( 'public_follow' )->where ( $map_follow )->delete ();
        M ( 'user' )->where ( $map_user )->delete ();
        M ( 'credit_data' )->where ( $map_user )->delete ();

        // 取消专注改变用户状态
//        D('Common/Follow')->set_subscribe($data ['FromUserName'], 0);

        // 积分处理
//        add_credit('unsubscribe');
    }

    // 位置处理 todo
    public function reportLocation($data) {
        $latitude = $data ['Location_X'];
        $longitude = $data ['Location_Y'];
        $pos = file_get_contents('http://lbs.juhe.cn/api/getaddressbylngb?lngx=' . $latitude . '&lngy=' . $longitude);
        $pos_ar = json_decode($pos, true);
        $this->replyText(htmlspecialchars_decode($pos_ar ['row'] ['result'] ['formatted_address']));
    }

    // 回复
    function replyMsg($info)
    {
        $msg_type = $info ['msg_type'];

        // 文本
        if ($msg_type == 'text') {
            $content = replace_url(htmlspecialchars_decode($info ['content']));
            $this->replyText($content);
        }
        // 图片
        elseif ($msg_type == 'image') {
            if ($info['image_id']) {
// 				$d['image_id']=url_img_html(get_cover_url($d['image_id']));
                $media_id = D('Common/Custom')->get_image_media_id($info['image_id']);
            } else if ($info['image_material']) {
                $map_img ['id'] = $info ['image_material'];
                $media_img = M('material_image')->where($map_img)->find();
                $media_id = $media_img['media_id'];
                if (!$media_id) {
                    $media_id = D('Common/Custom')->get_image_media_id($media_img['cover_id']);
                }
            }
            $this->replyImage($media_id);
        }
        // 图文
        else if ($msg_type == 'news') {
            $param ['publicid'] = get_token_appinfo('', 'id');

            $map_news ['group_id'] = $info ['group_id'];
            $list = M('material_news')->where($map_news)->select();
            foreach ($list as $k => $vo) {
                if ($k > 8) {
                    continue;
                }

                if (empty($vo ['url'])) {
                    $url = $this->_getNewsUrl($vo, $param);
                } else {
                    $url = $vo ['url'];
                }

                $articles [] = array(
                    'Title' => $vo ['title'],
                    'Description' => $vo ['intro'],
                    'PicUrl' => get_cover_url($vo ['cover_id']),
                    'Url' => $url
                );
            }
            $this->replyNews($articles);
        }
        // 语音
        elseif ($msg_type == 'voice') {
            $map_voice['id'] = $info['voice_id'];
            $media_voice = M('material_file')->where($map_voice)->find();
            $media_id = $media_voice['media_id'];
            if (!$media_id) {
                $media_id = D('Common/Custom')->get_file_media_id($media_voice['file_id']);
            }
            $this->replyVoice($media_id);
        }
        // 视频
        elseif ($msg_type == 'video') {
            $map_video['id'] = $info['video_id'];
            $media_video = M('material_file')->where($map_video)->find();
            $media_id = $media_video['media_id'];
            if (!$media_id) {
                $media_id = D('Common/Custom')->get_file_media_id($media_video['file_id']);
            }
            $this->replyVideo($media_id);
        }
        else {
            $content = replace_url(htmlspecialchars_decode($info ['content']));
            $this->replyText($content);
        }
    }

    function _getNewsUrl($info, $param)
    {
        if (!empty ($info ['link'])) {
            $url = replace_url($info ['link']);
        } else {
            $param ['id'] = $info ['id'];
            $url = U('Home/Material/news_detail', $param);
        }
        return $url;
    }
}