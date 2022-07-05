package com.vote.mapper;

import java.util.List;
import com.vote.domain.MatchJudges;

/**
 * 比赛评委中间表Mapper接口
 * 
 * @author ruoyi
 * @date 2022-07-05
 */
public interface MatchJudgesMapper 
{
    /**
     * 查询比赛评委中间表
     * 
     * @param matchId 比赛评委中间表主键
     * @return 比赛评委中间表
     */
    public MatchJudges selectMatchJudgesByMatchId(Integer matchId);

    /**
     * 查询比赛评委中间表列表
     * 
     * @param matchJudges 比赛评委中间表
     * @return 比赛评委中间表集合
     */
    public List<MatchJudges> selectMatchJudgesList(MatchJudges matchJudges);

    /**
     * 新增比赛评委中间表
     * 
     * @param matchJudges 比赛评委中间表
     * @return 结果
     */
    public int insertMatchJudges(MatchJudges matchJudges);

    /**
     * 修改比赛评委中间表
     * 
     * @param matchJudges 比赛评委中间表
     * @return 结果
     */
    public int updateMatchJudges(MatchJudges matchJudges);

    /**
     * 删除比赛评委中间表
     * 
     * @param matchId 比赛评委中间表主键
     * @return 结果
     */
    public int deleteMatchJudgesByMatchId(Integer matchId);

    /**
     * 批量删除比赛评委中间表
     * 
     * @param matchIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMatchJudgesByMatchIds(String[] matchIds);
}
