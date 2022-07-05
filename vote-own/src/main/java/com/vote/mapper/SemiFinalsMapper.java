package com.vote.mapper;

import java.util.List;
import com.vote.domain.SemiFinals;

/**
 * 复赛管理Mapper接口
 * 
 * @author 魏渝辉
 * @date 2022-07-05
 */
public interface SemiFinalsMapper 
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
     * 删除复赛管理
     * 
     * @param id 复赛管理主键
     * @return 结果
     */
    public int deleteSemiFinalsById(Integer id);

    /**
     * 批量删除复赛管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSemiFinalsByIds(String[] ids);
}
