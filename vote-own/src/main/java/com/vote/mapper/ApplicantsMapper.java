package com.vote.mapper;

import java.util.List;
import com.vote.domain.Applicants;
import org.apache.ibatis.annotations.Param;

/**
 * 曲目信息Mapper接口
 * 
 * @author ruoyi
 * @date 2022-07-05
 */
public interface ApplicantsMapper 
{
    /**
     * 查询曲目信息
     * 
     * @param id 曲目信息主键
     * @return 曲目信息
     */
    public Applicants selectApplicantsById(Integer id);

    /**
     * 查询曲目信息列表
     * 
     * @param applicants 曲目信息
     * @return 曲目信息集合
     */
    public List<Applicants> selectApplicantsList(Applicants applicants);

    /**
     * 新增曲目信息
     * 
     * @param applicants 曲目信息
     * @return 结果
     */
    public int insertApplicants(Applicants applicants);

    /**
     * 修改曲目信息
     * 
     * @param applicants 曲目信息
     * @return 结果
     */
    public int updateApplicants(Applicants applicants);

    /**
     * 删除曲目信息
     * 
     * @param id 曲目信息主键
     * @return 结果
     */
    public int deleteApplicantsById(Integer id);

    /**
     * 批量删除曲目信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteApplicantsByIds(String[] ids);

    /**
     * 查询未被分配的选手
     * @param matchId
     * @param raceSchedule
     * @return
     */
    public List<Integer> selectNotDistribute(@Param("matchId") Integer matchId, @Param("raceSchedule") Integer raceSchedule);

    /**
     * 通过比赛id   赛程   选手id 查询曲目名称
     * @param applicants
     * @return
     */
    public String selectTitleByApplicants(Applicants applicants);

}
