package com.vote.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.vote.common.annotation.Excel;
import com.vote.common.core.domain.BaseEntity;

/**
 * 复赛管理对象 semi_finals
 * 
 * @author 魏渝辉
 * @date 2022-07-05
 */
public class SemiFinals extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Integer id;

    /** 比赛id */
    @Excel(name = "比赛id")
    private Integer matchId;

    /** 选手id */
    @Excel(name = "选手id")
    private Integer playerId;

    /** 发布时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "发布时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date submitTime;

    /** 初赛得分 */
    @Excel(name = "初赛得分")
    private BigDecimal firstScore;

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
    public void setPlayerId(Integer playerId) 
    {
        this.playerId = playerId;
    }

    public Integer getPlayerId() 
    {
        return playerId;
    }
    public void setSubmitTime(Date submitTime) 
    {
        this.submitTime = submitTime;
    }

    public Date getSubmitTime() 
    {
        return submitTime;
    }
    public void setFirstScore(BigDecimal firstScore) 
    {
        this.firstScore = firstScore;
    }

    public BigDecimal getFirstScore() 
    {
        return firstScore;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("matchId", getMatchId())
            .append("playerId", getPlayerId())
            .append("submitTime", getSubmitTime())
            .append("firstScore", getFirstScore())
            .toString();
    }
}
