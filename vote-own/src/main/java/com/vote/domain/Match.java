package com.vote.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.vote.common.annotation.Excel;
import com.vote.common.core.domain.BaseEntity;

/**
 * 比赛信息对象 match
 * 
 * @author ruoyi
 * @date 2022-07-05
 */
public class Match extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 比赛id 主键 */
    private Integer matchId;

    /** 比赛名称 */
    @Excel(name = "比赛名称")
    private String matchName;

    /** 比赛开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "比赛开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date matchBeginTime;

    /** 比赛截止时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "比赛截止时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date matchEndTime;

    public void setMatchId(Integer matchId) 
    {
        this.matchId = matchId;
    }

    public Integer getMatchId() 
    {
        return matchId;
    }
    public void setMatchName(String matchName) 
    {
        this.matchName = matchName;
    }

    public String getMatchName() 
    {
        return matchName;
    }
    public void setMatchBeginTime(Date matchBeginTime) 
    {
        this.matchBeginTime = matchBeginTime;
    }

    public Date getMatchBeginTime() 
    {
        return matchBeginTime;
    }
    public void setMatchEndTime(Date matchEndTime) 
    {
        this.matchEndTime = matchEndTime;
    }

    public Date getMatchEndTime() 
    {
        return matchEndTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("matchId", getMatchId())
            .append("matchName", getMatchName())
            .append("matchBeginTime", getMatchBeginTime())
            .append("matchEndTime", getMatchEndTime())
            .toString();
    }
}
