package com.vote.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.vote.common.annotation.Excel;
import com.vote.common.core.domain.BaseEntity;

/**
 * 比赛评委中间表对象 match_judges
 * 
 * @author ruoyi
 * @date 2022-07-05
 */
public class MatchJudges extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 比赛id */
    @Excel(name = "比赛id")
    private Integer matchId;

    /** 评委id */
    @Excel(name = "评委id")
    private Integer judgesId;

    /** 1-初赛  2-决赛 */
    @Excel(name = "1-初赛  2-决赛")
    private Integer raceSchedule;

    public void setMatchId(Integer matchId) 
    {
        this.matchId = matchId;
    }

    public Integer getMatchId() 
    {
        return matchId;
    }
    public void setJudgesId(Integer judgesId) 
    {
        this.judgesId = judgesId;
    }

    public Integer getJudgesId() 
    {
        return judgesId;
    }
    public void setRaceSchedule(Integer raceSchedule) 
    {
        this.raceSchedule = raceSchedule;
    }

    public Integer getRaceSchedule() 
    {
        return raceSchedule;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("matchId", getMatchId())
            .append("judgesId", getJudgesId())
            .append("raceSchedule", getRaceSchedule())
            .toString();
    }
}
