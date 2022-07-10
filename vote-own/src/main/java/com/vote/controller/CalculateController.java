package com.vote.controller;

import com.vote.common.core.domain.AjaxResult;
import com.vote.dto.AutoCalculateDTO;
import com.vote.service.IResultMatchService;
import com.vote.service.ISemiFinalsService;
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

    @Autowired
    private ISemiFinalsService semiFinalsService;

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

    /**
     * 自动分配复赛信息
     * @return
     */
    @PostMapping("/calculate/autoDistributeFinal")
    @ResponseBody
    public AjaxResult autoDistributeFinal(AutoCalculateDTO autoCalculateDTO){
        HashMap<String, String> map = semiFinalsService.autoDistribute(autoCalculateDTO);
        if (map.containsKey("err")){
            return AjaxResult.error(map.get("err"));
        }else{
            return AjaxResult.success(map.get("success"));
        }
    }
}
