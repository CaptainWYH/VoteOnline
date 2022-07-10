package com.vote.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import com.vote.MatchSessionsVO;
import com.vote.common.core.domain.entity.SysUser;
import com.vote.domain.Applicants;
import com.vote.domain.SemiFinals;
import com.vote.mapper.ApplicantsMapper;
import com.vote.mapper.SemiFinalsMapper;
import com.vote.system.mapper.SysUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.vote.mapper.MatchSessionMapper;
import com.vote.domain.MatchSession;
import com.vote.service.IMatchSessionService;
import com.vote.common.core.text.Convert;

/**
 * 比赛场次Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-07-05
 */
@Service
public class MatchSessionServiceImpl implements IMatchSessionService 
{
    @Autowired
    private MatchSessionMapper matchSessionMapper;

    @Autowired
    private ApplicantsMapper applicantsMapper;

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private SemiFinalsMapper semiFinalsMapper;

    /**
     * 查询比赛场次
     * 
     * @param id 比赛场次主键
     * @return 比赛场次
     */
    @Override
    public MatchSession selectMatchSessionById(Integer id)
    {
        return matchSessionMapper.selectMatchSessionById(id);
    }

    /**
     * 查询比赛场次列表
     * 
     * @param matchSession 比赛场次
     * @return 比赛场次
     */
    @Override
    public List<MatchSession> selectMatchSessionList(MatchSession matchSession)
    {
        return matchSessionMapper.selectMatchSessionList(matchSession);
    }

    /**
     * 新增比赛场次
     * 
     * @param matchSession 比赛场次
     * @return 结果
     */
    @Override
    public int insertMatchSession(MatchSession matchSession)
    {
        return matchSessionMapper.insertMatchSession(matchSession);
    }

    /**
     * 修改比赛场次
     * 
     * @param matchSession 比赛场次
     * @return 结果
     */
    @Override
    public int updateMatchSession(MatchSession matchSession)
    {
        return matchSessionMapper.updateMatchSession(matchSession);
    }

    /**
     * 批量删除比赛场次
     * 
     * @param ids 需要删除的比赛场次主键
     * @return 结果
     */
    @Override
    public int deleteMatchSessionByIds(String ids)
    {
        return matchSessionMapper.deleteMatchSessionByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除比赛场次信息
     * 
     * @param id 比赛场次主键
     * @return 结果
     */
    @Override
    public int deleteMatchSessionById(Integer id)
    {
        return matchSessionMapper.deleteMatchSessionById(id);
    }

    @Override
    public HashMap<String,String> autoDistribute(Integer matchId, Integer raceSchedule) {
        HashMap<String,String> result = new HashMap<>();
        int row = 0;
        List<Integer> playerIds = new ArrayList<>();
        //查询出未被分配的选手
        if (raceSchedule == 1){//初赛
            playerIds = applicantsMapper.selectNotDistribute(matchId, raceSchedule);
        }else{
            //决赛
            SemiFinals semiFinals = new SemiFinals();
            semiFinals.setMatchId(matchId);
            List<SemiFinals> finals = semiFinalsMapper.selectSemiFinalsList(semiFinals);
            if (finals.isEmpty()){//空  说明复赛信息还未导入
                result.put("err","复赛信息还未导入,请稍后再试");
                return result;
            }else{
                for (SemiFinals aFinal : finals) {
                    playerIds.add(aFinal.getPlayerId());
                }
            }
        }

        //打乱排序
        Collections.shuffle(playerIds);

        MatchSession matchSession = new MatchSession();
        matchSession.setMatchId(matchId);
        matchSession.setRaceSchedule(raceSchedule);
        //开始自动分配
        while(!playerIds.isEmpty()){
            Integer player1 = playerIds.get(0);
            playerIds.remove(0);
            //第二个可能为空需要判断
            Integer player2 = null;
            if (!playerIds.isEmpty()){
                player2 = playerIds.get(0);
                playerIds.remove(0);
            }
            //写入数据库
            matchSession.setaId(player1);
            matchSession.setbId(player2);
            row += matchSessionMapper.insertMatchSession(matchSession);
        }
        if (row > 0){
            result.put("success","分配成功");
            return result;
        }else{
            result.put("err", "分配失败");
            return result;
        }
    }

    @Override
    public List<MatchSessionsVO> selectMatchSessions(MatchSession matchSession) {
        List<MatchSessionsVO> matchSessions = matchSessionMapper.selectMatchSessions(matchSession);
        Applicants applicants = new Applicants();
        applicants.setMatchId(matchSession.getMatchId());
        applicants.setRaceSchedule(matchSession.getRaceSchedule());
        System.out.println(matchSessions);
        for (MatchSessionsVO session : matchSessions) {
            Integer aId = session.getaId();
            Integer bId = session.getbId();

            if(null != aId){
                SysUser aUser = sysUserMapper.selectUserById(Long.valueOf(aId));
                String aName = aUser.getUserName();
                applicants.setPlayerId(aId);
                String aTitle = applicantsMapper.selectTitleByApplicants(applicants);
                session.setaTitle(aTitle);
                session.setaName(aName);

            }
            if (null != bId){
                SysUser bUser = sysUserMapper.selectUserById(Long.valueOf(bId));
                applicants.setPlayerId(bId);
                String bTitle = applicantsMapper.selectTitleByApplicants(applicants);
                String bName = bUser.getUserName();
                session.setbName(bName);
                session.setbTitle(bTitle);
            }
        }
        return matchSessions;
    }
}
