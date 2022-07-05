package com.vote.mapper;

import java.util.List;
import com.vote.domain.Match;

/**
 * 比赛信息Mapper接口
 * 
 * @author ruoyi
 * @date 2022-07-05
 */
public interface MatchMapper 
{
    /**
     * 查询比赛信息
     * 
     * @param matchId 比赛信息主键
     * @return 比赛信息
     */
    public Match selectMatchByMatchId(Integer matchId);

    /**
     * 查询比赛信息列表
     * 
     * @param match 比赛信息
     * @return 比赛信息集合
     */
    public List<Match> selectMatchList(Match match);

    /**
     * 新增比赛信息
     * 
     * @param match 比赛信息
     * @return 结果
     */
    public int insertMatch(Match match);

    /**
     * 修改比赛信息
     * 
     * @param match 比赛信息
     * @return 结果
     */
    public int updateMatch(Match match);

    /**
     * 删除比赛信息
     * 
     * @param matchId 比赛信息主键
     * @return 结果
     */
    public int deleteMatchByMatchId(Integer matchId);

    /**
     * 批量删除比赛信息
     * 
     * @param matchIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMatchByMatchIds(String[] matchIds);
}
