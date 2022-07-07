package com.vote.controller;

import com.vote.SignUpDTO;
import com.vote.common.core.controller.BaseController;
import com.vote.common.core.domain.AjaxResult;
import com.vote.common.core.domain.entity.SysUser;
import com.vote.domain.Applicants;
import com.vote.service.IApplicantsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author 魏渝辉
 * @Date:2022年07月06日 16:57
 * @Description:
 */

@Controller
public class SignUpController extends BaseController {

    @Autowired
    private IApplicantsService applicantsService;

    /**
     * 用户进行报名曲目
     * @param signUpDTO
     * @return
     */
    @PostMapping("/signUp")
    @ResponseBody
    public AjaxResult signUp(SignUpDTO signUpDTO){
        Applicants applicants = new Applicants();
        SysUser sysUser = getSysUser();
        applicants.setMatchId(signUpDTO.getMatchId());
        applicants.setPlayerId(Math.toIntExact(sysUser.getUserId()));

        List<Applicants> applicants1 = applicantsService.selectApplicantsList(applicants);
        if (!applicants1.isEmpty()){
            return error("您已报名本比赛");
        }

        //初赛曲目
        applicants.setSongTitle(signUpDTO.getFirstTitle());
        applicants.setRaceSchedule(1);


        applicantsService.insertApplicants(applicants);
        //决赛曲目
        applicants.setSongTitle(signUpDTO.getEndTitle());
        applicants.setRaceSchedule(2);
        applicantsService.insertApplicants(applicants);
        return toAjax(1);
    }
}
