package com.vote.service;

import java.util.List;
import com.vote.domain.Applicants;

/**
 * 曲目信息Service接口
 * 
 * @author ruoyi
 * @date 2022-07-05
 */
public interface IApplicantsService 
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
     * 批量删除曲目信息
     * 
     * @param ids 需要删除的曲目信息主键集合
     * @return 结果
     */
    public int deleteApplicantsByIds(String ids);

    /**
     * 删除曲目信息信息
     * 
     * @param id 曲目信息主键
     * @return 结果
     */
    public int deleteApplicantsById(Integer id);
}
