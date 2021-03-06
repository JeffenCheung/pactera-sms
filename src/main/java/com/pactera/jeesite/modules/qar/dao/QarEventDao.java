/**
 * Copyright &copy; 2014-2016 <a href="https://pactera.com">Pactera-JeeSite</a> All rights reserved.served.
 */
package com.pactera.jeesite.modules.qar.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.pactera.jeesite.modules.qar.entity.QarEvent;

/**
 * QAR超限事件poiDAO接口
 * @author Jeffen@pactera
 * @version 2015-10-16
 */
@MyBatisDao
public interface QarEventDao extends CrudDao<QarEvent> {
	
}