package com.vote.service;

import java.util.HashMap;
import java.util.List;
import com.vote.domain.SemiFinals;
import com.vote.dto.AutoCalculateDTO;

/**
 * 复赛管理Service接口
 * 
 * @author 魏渝辉
 * @date 2022-07-05
 */
public interface ISemiFinalsService 
{
    /**
     * 查询复赛管理
     * 
     * @param id 复赛管理主键
     * @return 复赛管理
     */
    public SemiFinals selectSemiFinalsById(Integer id);

    /**
     * 查询复赛管理列表
     * 
     * @param semiFinals 复赛管理
     * @return 复赛管理集合
     */
    public List<SemiFinals> selectSemiFinalsList(SemiFinals semiFinals);

    /**
     * 新增复赛管理
     * 
     * @param semiFinals 复赛管理
     * @return 结果
     */
    public int insertSemiFinals(SemiFinals semiFinals);

    /**
     * 修改复赛管理
     * 
     * @param semiFinals 复赛管理
     * @return 结果
     */
    public int updateSemiFinals(SemiFinals semiFinals);

    /**
     * 批量删除复赛管理
     * 
     * @param ids 需要删除的复赛管理主键集合
     * @return 结果
     */
    public int deleteSemiFinalsByIds(String ids);

    /**
     * 删除复赛管理信息
     * 
     * @param id 复赛管理主键
     * @return 结果
     */
    public int deleteSemiFinalsById(Integer id);

    /**
     * 自动分配复赛
     * @param autoCalculateDTO
     * @return
     */
    public HashMap<String,String> autoDistribute(AutoCalculateDTO autoCalculateDTO);

}
