package com.vote.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.vote.mapper.ApplicantsMapper;
import com.vote.domain.Applicants;
import com.vote.service.IApplicantsService;
import com.vote.common.core.text.Convert;

/**
 * 曲目信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-07-05
 */
@Service
public class ApplicantsServiceImpl implements IApplicantsService 
{
    @Autowired
    private ApplicantsMapper applicantsMapper;

    /**
     * 查询曲目信息
     * 
     * @param id 曲目信息主键
     * @return 曲目信息
     */
    @Override
    public Applicants selectApplicantsById(Integer id)
    {
        return applicantsMapper.selectApplicantsById(id);
    }

    /**
     * 查询曲目信息列表
     * 
     * @param applicants 曲目信息
     * @return 曲目信息
     */
    @Override
    public List<Applicants> selectApplicantsList(Applicants applicants)
    {
        return applicantsMapper.selectApplicantsList(applicants);
    }

    /**
     * 新增曲目信息
     * 
     * @param applicants 曲目信息
     * @return 结果
     */
    @Override
    public int insertApplicants(Applicants applicants)
    {
        return applicantsMapper.insertApplicants(applicants);
    }

    /**
     * 修改曲目信息
     * 
     * @param applicants 曲目信息
     * @return 结果
     */
    @Override
    public int updateApplicants(Applicants applicants)
    {
        return applicantsMapper.updateApplicants(applicants);
    }

    /**
     * 批量删除曲目信息
     * 
     * @param ids 需要删除的曲目信息主键
     * @return 结果
     */
    @Override
    public int deleteApplicantsByIds(String ids)
    {
        return applicantsMapper.deleteApplicantsByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除曲目信息信息
     * 
     * @param id 曲目信息主键
     * @return 结果
     */
    @Override
    public int deleteApplicantsById(Integer id)
    {
        return applicantsMapper.deleteApplicantsById(id);
    }
}
