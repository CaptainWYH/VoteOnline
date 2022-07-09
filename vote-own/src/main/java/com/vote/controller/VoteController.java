package com.vote.controller;

import com.vote.common.core.controller.BaseController;
import com.vote.common.core.domain.AjaxResult;
import com.vote.common.core.domain.entity.SysUser;
import com.vote.domain.JudgesPoints;
import com.vote.domain.ViewerVote;
import com.vote.service.IJudgesPointsService;
import com.vote.service.IViewerVoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;

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

    @Autowired
    private IJudgesPointsService judgesPointsService;


    @PostMapping("/vote")
    @ResponseBody
    public AjaxResult vote(ViewerVote viewerVote){
        SysUser sysUser = getSysUser();
        viewerVote.setViewerId(Math.toIntExact(sysUser.getUserId()));
        System.out.println("投票:" + viewerVote);
        HashMap<String, String> vote = viewerVoteService.vote(viewerVote);
        if(vote.containsKey("err")){
            return AjaxResult.error(vote.get("err"));
        }else if(vote.containsKey("success")){
            return AjaxResult.success(vote.get("success"));
        }else{
            return AjaxResult.error("系统错误");
        }
    }

    @PostMapping("/judgesVote")
    @ResponseBody
    public AjaxResult judgesVote(JudgesPoints judgesPoints){
        SysUser sysUser = getSysUser();
        judgesPoints.setJudgesId(Math.toIntExact(sysUser.getUserId()));
        System.out.println("投票:" + judgesPoints);
        HashMap<String, String> vote = judgesPointsService.vote(judgesPoints);
        if(vote.containsKey("err")){
            return AjaxResult.error(vote.get("err"));
        }else if(vote.containsKey("success")){
            return AjaxResult.success(vote.get("success"));
        }else{
            return AjaxResult.error("系统错误");
        }
    }
}
