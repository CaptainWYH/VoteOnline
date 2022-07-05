package com.vote.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.vote.mapper.MatchJudgesMapper;
import com.vote.domain.MatchJudges;
import com.vote.service.IMatchJudgesService;
import com.vote.common.core.text.Convert;

/**
 * 比赛评委中间表Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-07-05
 */
@Service
public class MatchJudgesServiceImpl implements IMatchJudgesService 
{
    @Autowired
    private MatchJudgesMapper matchJudgesMapper;

    /**
     * 查询比赛评委中间表
     * 
     * @param matchId 比赛评委中间表主键
     * @return 比赛评委中间表
     */
    @Override
    public MatchJudges selectMatchJudgesByMatchId(Integer matchId)
    {
        return matchJudgesMapper.selectMatchJudgesByMatchId(matchId);
    }

    /**
     * 查询比赛评委中间表列表
     * 
     * @param matchJudges 比赛评委中间表
     * @return 比赛评委中间表
     */
    @Override
    public List<MatchJudges> selectMatchJudgesList(MatchJudges matchJudges)
    {
        return matchJudgesMapper.selectMatchJudgesList(matchJudges);
    }

    /**
     * 新增比赛评委中间表
     * 
     * @param matchJudges 比赛评委中间表
     * @return 结果
     */
    @Override
    public int insertMatchJudges(MatchJudges matchJudges)
    {
        return matchJudgesMapper.insertMatchJudges(matchJudges);
    }

    /**
     * 修改比赛评委中间表
     * 
     * @param matchJudges 比赛评委中间表
     * @return 结果
     */
    @Override
    public int updateMatchJudges(MatchJudges matchJudges)
    {
        return matchJudgesMapper.updateMatchJudges(matchJudges);
    }

    /**
     * 批量删除比赛评委中间表
     * 
     * @param matchIds 需要删除的比赛评委中间表主键
     * @return 结果
     */
    @Override
    public int deleteMatchJudgesByMatchIds(String matchIds)
    {
        return matchJudgesMapper.deleteMatchJudgesByMatchIds(Convert.toStrArray(matchIds));
    }

    /**
     * 删除比赛评委中间表信息
     * 
     * @param matchId 比赛评委中间表主键
     * @return 结果
     */
    @Override
    public int deleteMatchJudgesByMatchId(Integer matchId)
    {
        return matchJudgesMapper.deleteMatchJudgesByMatchId(matchId);
    }
}
