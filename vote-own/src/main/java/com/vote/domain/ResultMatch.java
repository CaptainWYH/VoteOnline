package com.vote.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.vote.common.annotation.Excel;
import com.vote.common.core.domain.BaseEntity;

/**
 * 比赛结果对象 result_match
 * 
 * @author 魏渝辉
 * @date 2022-07-05
 */
public class ResultMatch extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Integer id;

    /** 比赛id */
    @Excel(name = "比赛id")
    private Integer matchId;

    /** 赛程 */
    @Excel(name = "赛程")
    private Integer raceSchedule;

    /** 选手id */
    @Excel(name = "选手id")
    private Integer playerId;

    /** 评委分数 */
    @Excel(name = "评委分数")
    private Integer judgesScore;

    /** 观众投票数量 */
    @Excel(name = "观众投票数量")
    private Integer voteCount;

    /** 票数百分比 */
    @Excel(name = "票数百分比")
    private BigDecimal percent;

    /** 最终分数 */
    @Excel(name = "最终分数")
    private BigDecimal finalScore;

    public void setId(Integer id) 
    {
        this.id = id;
    }

    public Integer getId() 
    {
        return id;
    }
    public void setMatchId(Integer matchId) 
    {
        this.matchId = matchId;
    }

    public Integer getMatchId() 
    {
        return matchId;
    }
    public void setRaceSchedule(Integer raceSchedule) 
    {
        this.raceSchedule = raceSchedule;
    }

    public Integer getRaceSchedule() 
    {
        return raceSchedule;
    }
    public void setPlayerId(Integer playerId) 
    {
        this.playerId = playerId;
    }

    public Integer getPlayerId() 
    {
        return playerId;
    }
    public void setJudgesScore(Integer judgesScore) 
    {
        this.judgesScore = judgesScore;
    }

    public Integer getJudgesScore() 
    {
        return judgesScore;
    }
    public void setVoteCount(Integer voteCount) 
    {
        this.voteCount = voteCount;
    }

    public Integer getVoteCount() 
    {
        return voteCount;
    }
    public void setPercent(BigDecimal percent) 
    {
        this.percent = percent;
    }

    public BigDecimal getPercent() 
    {
        return percent;
    }
    public void setFinalScore(BigDecimal finalScore) 
    {
        this.finalScore = finalScore;
    }

    public BigDecimal getFinalScore() 
    {
        return finalScore;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("matchId", getMatchId())
            .append("raceSchedule", getRaceSchedule())
            .append("playerId", getPlayerId())
            .append("judgesScore", getJudgesScore())
            .append("voteCount", getVoteCount())
            .append("percent", getPercent())
            .append("finalScore", getFinalScore())
            .toString();
    }
}
