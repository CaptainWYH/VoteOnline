package com.vote.controller;

import com.vote.common.core.domain.AjaxResult;
import com.vote.dto.AutoCalculateDTO;
import com.vote.service.IResultMatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;

/**
 * @author 魏渝辉
 * @Date:2022年07月09日 23:09
 * @Description:  计算分数控制层
 */


@Controller
public class CalculateController {

    @Autowired
    private IResultMatchService resultMatchService;

    @PostMapping("/calculate")
    @ResponseBody
    public AjaxResult calculate(AutoCalculateDTO autoCalculateDTO){
        HashMap<String, String> result = resultMatchService.autoCalculate(autoCalculateDTO);
        if (result.containsKey("err")){
            return AjaxResult.error(result.get("err"));
        }else{
            return AjaxResult.success("比赛结果计算成功,请检查是否有误");
        }
    }
}
