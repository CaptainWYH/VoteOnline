package com.vote.controller;

import com.vote.common.core.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author 魏渝辉
 * @Date:2022年07月07日 9:22
 * @Description:
 */


@Controller
public class HomeController extends BaseController {

    private String prefix = "vote-own/";

    @GetMapping("/system/home")
    public String home(ModelMap mmap)
    {
//        mmap.put("version", RuoYiConfig.getVersion());
        System.out.println("home");
        return prefix + "UserHome";
    }
}
