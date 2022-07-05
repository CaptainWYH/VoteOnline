package com.vote.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.vote.mapper.MatchMapper;
import com.vote.domain.Match;
import com.vote.service.IMatchService;
import com.vote.common.core.text.Convert;

/**
 * 比赛信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-07-05
 */
@Service
public class MatchServiceImpl implements IMatchService 
{
    @Autowired
    private MatchMapper matchMapper;

    /**
     * 查询比赛信息
     * 
     * @param matchId 比赛信息主键
     * @return 比赛信息
     */
    @Override
    public Match selectMatchByMatchId(Integer matchId)
    {
        return matchMapper.selectMatchByMatchId(matchId);
    }

    /**
     * 查询比赛信息列表
     * 
     * @param match 比赛信息
     * @return 比赛信息
     */
    @Override
    public List<Match> selectMatchList(Match match)
    {
        return matchMapper.selectMatchList(match);
    }

    /**
     * 新增比赛信息
     * 
     * @param match 比赛信息
     * @return 结果
     */
    @Override
    public int insertMatch(Match match)
    {
        return matchMapper.insertMatch(match);
    }

    /**
     * 修改比赛信息
     * 
     * @param match 比赛信息
     * @return 结果
     */
    @Override
    public int updateMatch(Match match)
    {
        return matchMapper.updateMatch(match);
    }

    /**
     * 批量删除比赛信息
     * 
     * @param matchIds 需要删除的比赛信息主键
     * @return 结果
     */
    @Override
    public int deleteMatchByMatchIds(String matchIds)
    {
        return matchMapper.deleteMatchByMatchIds(Convert.toStrArray(matchIds));
    }

    /**
     * 删除比赛信息信息
     * 
     * @param matchId 比赛信息主键
     * @return 结果
     */
    @Override
    public int deleteMatchByMatchId(Integer matchId)
    {
        return matchMapper.deleteMatchByMatchId(matchId);
    }
}
