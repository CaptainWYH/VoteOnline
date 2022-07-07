package com.vote;

/**
 * @author 魏渝辉
 * @Date:2022年07月07日 21:38
 * @Description:
 */

public class SignUpDTO {

    private Integer matchId;

    private String firstTitle;

    private String endTitle;

    public Integer getMatchId() {
        return matchId;
    }

    public void setMatchId(Integer matchId) {
        this.matchId = matchId;
    }

    public String getFirstTitle() {
        return firstTitle;
    }

    public void setFirstTitle(String firstTitle) {
        this.firstTitle = firstTitle;
    }

    public String getEndTitle() {
        return endTitle;
    }

    public void setEndTitle(String endTitle) {
        this.endTitle = endTitle;
    }

    @Override
    public String toString() {
        return "SignUpDTO{" +
                "matchId=" + matchId +
                ", firstTitle='" + firstTitle + '\'' +
                ", endTitle='" + endTitle + '\'' +
                '}';
    }
}
