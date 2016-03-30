/**
 * Copyright &copy; 2014-2016 <a href="https://pactera.com">Pactera-JeeSite</a> All rights reserved.served.
 */
package com.pactera.jeesite.modules.test.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao2;
import com.pactera.jeesite.modules.test.entity.TestDataDs2;

/**
 * 【数据源2】业务数据表演示-数据源2DAO接口
 * @author Jeffen@pactera
 * @version 2015-10-25
 */
@MyBatisDao2
public interface TestDataDs2Dao extends CrudDao<TestDataDs2> {
	
}