package com.vote.dto;

/**
 * @author 魏渝辉
 * @Date:2022年07月09日 23:12
 * @Description:  接收自动计算分数实体类
 */


public class AutoCalculateDTO {

    private Integer matchId;

    private Integer raceSchedule;

    public Integer getMatchId() {
        return matchId;
    }

    public void setMatchId(Integer matchId) {
        this.matchId = matchId;
    }

    public Integer getRaceSchedule() {
        return raceSchedule;
    }

    public void setRaceSchedule(Integer raceSchedule) {
        this.raceSchedule = raceSchedule;
    }

    @Override
    public String toString() {
        return "AutoCalculateDTO{" +
                "matchId=" + matchId +
                ", raceSchedule=" + raceSchedule +
                '}';
    }
}
