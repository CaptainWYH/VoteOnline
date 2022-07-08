package com.vote.controller;

import com.vote.common.core.controller.BaseController;
import com.vote.common.core.domain.AjaxResult;
import com.vote.common.core.domain.entity.SysUser;
import com.vote.domain.ViewerVote;
import com.vote.service.IViewerVoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author 魏渝辉
 * @Date:2022年07月08日 11:53
 * @Description:
 */


@Controller
public class VoteController extends BaseController {

    private String prefix = "vote-own/";


    @Autowired
    private IViewerVoteService viewerVoteService;


    @PostMapping("/vote")
    @ResponseBody
    public AjaxResult vote(ViewerVote viewerVote){
        SysUser sysUser = getSysUser();
        viewerVote.setViewerId(Math.toIntExact(sysUser.getUserId()));
        return toAjax(viewerVoteService.insertViewerVote(viewerVote));
    }
}
