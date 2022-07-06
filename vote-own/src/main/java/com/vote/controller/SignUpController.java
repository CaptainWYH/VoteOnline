package com.vote.controller;

import com.vote.common.core.controller.BaseController;
import com.vote.common.core.domain.AjaxResult;
import com.vote.common.core.domain.entity.SysUser;
import com.vote.domain.Applicants;
import com.vote.service.IApplicantsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
     * @param applicants
     * @return
     */
    @GetMapping("/signUp")
    @ResponseBody
    public AjaxResult signUp(Applicants applicants){
        System.out.println("进入报名控制层");
        SysUser sysUser = getSysUser();
        System.out.println(sysUser);
        applicants.setPlayerId(Math.toIntExact(sysUser.getUserId()));
        return toAjax(applicantsService.insertApplicants(applicants));
    }
}
