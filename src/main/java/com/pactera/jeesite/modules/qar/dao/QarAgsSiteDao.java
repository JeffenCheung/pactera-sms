/**
 * Copyright &copy; 2014-2016 <a href="https://pactera.com">Pactera-JeeSite</a> All rights reserved.served.
 */
package com.pactera.jeesite.modules.qar.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.pactera.jeesite.modules.qar.entity.QarAgsSite;

/**
 * AGS工作站状态监控DAO接口
 * @author Jeffen@pactera
 * @version 2015-06-08
 */
@MyBatisDao
public interface QarAgsSiteDao extends CrudDao<QarAgsSite> {
	
}