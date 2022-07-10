package com.vote.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.vote.domain.ResultMatch;
import com.vote.dto.AutoCalculateDTO;
import com.vote.mapper.ResultMatchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.amqp.RabbitTemplateConfigurer;
import org.springframework.stereotype.Service;
import com.vote.mapper.SemiFinalsMapper;
import com.vote.domain.SemiFinals;
import com.vote.service.ISemiFinalsService;
import com.vote.common.core.text.Convert;

/**
 * 复赛管理Service业务层处理
 * 
 * @author 魏渝辉
 * @date 2022-07-05
 */
@Service
public class SemiFinalsServiceImpl implements ISemiFinalsService 
{
    @Autowired
    private SemiFinalsMapper semiFinalsMapper;

    @Autowired
    private ResultMatchMapper resultMatchMapper;
    /**
     * 查询复赛管理
     * 
     * @param id 复赛管理主键
     * @return 复赛管理
     */
    @Override
    public SemiFinals selectSemiFinalsById(Integer id)
    {
        return semiFinalsMapper.selectSemiFinalsById(id);
    }

    /**
     * 查询复赛管理列表
     * 
     * @param semiFinals 复赛管理
     * @return 复赛管理
     */
    @Override
    public List<SemiFinals> selectSemiFinalsList(SemiFinals semiFinals)
    {
        return semiFinalsMapper.selectSemiFinalsList(semiFinals);
    }

    /**
     * 新增复赛管理
     * 
     * @param semiFinals 复赛管理
     * @return 结果
     */
    @Override
    public int insertSemiFinals(SemiFinals semiFinals)
    {
        return semiFinalsMapper.insertSemiFinals(semiFinals);
    }

    /**
     * 修改复赛管理
     * 
     * @param semiFinals 复赛管理
     * @return 结果
     */
    @Override
    public int updateSemiFinals(SemiFinals semiFinals)
    {
        return semiFinalsMapper.updateSemiFinals(semiFinals);
    }

    /**
     * 批量删除复赛管理
     * 
     * @param ids 需要删除的复赛管理主键
     * @return 结果
     */
    @Override
    public int deleteSemiFinalsByIds(String ids)
    {
        return semiFinalsMapper.deleteSemiFinalsByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除复赛管理信息
     * 
     * @param id 复赛管理主键
     * @return 结果
     */
    @Override
    public int deleteSemiFinalsById(Integer id)
    {
        return semiFinalsMapper.deleteSemiFinalsById(id);
    }

    /**
     * 自动分配复赛
     * 1.根据matchId,raceSchedule从比赛结果中获取前八个选手id
     * 2.讲这8个选手插入到复赛
     * @param autoCalculateDTO
     * @return
     */
    @Override
    public HashMap<String,String> autoDistribute(AutoCalculateDTO autoCalculateDTO) {
        HashMap<String, String> result = new HashMap<>();
        ResultMatch resultMatch = new ResultMatch();
        SemiFinals semiFinals = new SemiFinals();
        resultMatch.setMatchId(autoCalculateDTO.getMatchId());
        resultMatch.setRaceSchedule(autoCalculateDTO.getRaceSchedule());
        semiFinals.setMatchId(autoCalculateDTO.getMatchId());
        List<SemiFinals> semiFinals1 = semiFinalsMapper.selectSemiFinalsList(semiFinals);
        if (!semiFinals1.isEmpty()){
            result.put("err","该复赛信息已导入");
            return result;
        }
        //前八名
        List<ResultMatch> ids = resultMatchMapper.selectResultListsLimitPreEight(resultMatch);
        if (ids.isEmpty()){
            result.put("err","初赛结果暂未出来,无法分配");
            return result;
        }else{
            for (ResultMatch item : ids) {
                Integer playerId = item.getPlayerId();
                BigDecimal finalScore = item.getFinalScore();
                Date date = new Date();
                semiFinals.setPlayerId(playerId);
                semiFinals.setFirstScore(finalScore);
                semiFinals.setSubmitTime(date);
                semiFinalsMapper.insertSemiFinals(semiFinals);
            }
            result.put("success","分配成功");
            return result;
        }
    }
}
