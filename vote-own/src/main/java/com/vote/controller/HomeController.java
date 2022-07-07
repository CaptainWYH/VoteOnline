package com.vote.controller;

import com.vote.common.config.RuoYiConfig;
import com.vote.common.core.controller.BaseController;
import com.vote.common.core.page.TableDataInfo;
import com.vote.domain.Match;
import com.vote.service.IMatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

/**
 * @author 魏渝辉
 * @Date:2022年07月07日 9:22
 * @Description:
 */


@Controller
public class HomeController extends BaseController {

    private String prefix = "vote-own/";

    @Autowired
    private IMatchService matchService;

    @GetMapping("/system/home")
    public String home(ModelMap mmap)
    {
        Match match = new Match();
        List<Match> list = matchService.selectMatchList(match);

        TableDataInfo dataTable = getDataTable(list);
        mmap.put("dataTable", dataTable);
        System.out.println("home");
        return prefix + "UserHome";
    }
}
