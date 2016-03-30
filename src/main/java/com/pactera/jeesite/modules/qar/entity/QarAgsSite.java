/**
 * Copyright &copy; 2014-2016 <a href="https://pactera.com">Pactera-JeeSite</a> All rights reserved.served.
 */
package com.pactera.jeesite.modules.qar.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * AGS工作站状态监控Entity
 * @author Jeffen@pactera
 * @version 2015-06-08
 */
public class QarAgsSite extends DataEntity<QarAgsSite> {
	
	private static final long serialVersionUID = 1L;
	private Integer no;		// 序号
	private String site;		// 工作站
	private String status;		// 链接状态
	private Double load;		// 负载
	private Double quota;		// 配额
	
	public QarAgsSite() {
		super();
	}

	public QarAgsSite(String id){
		super(id);
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}
	
	@Length(min=1, max=100, message="工作站长度必须介于 1 和 100 之间")
	public String getSite() {
		return site;
	}

	public void setSite(String site) {
		this.site = site;
	}
	
	@Length(min=0, max=100, message="链接状态长度必须介于 0 和 100 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public Double getLoad() {
		return load;
	}

	public void setLoad(Double load) {
		this.load = load;
	}
	
	public Double getQuota() {
		return quota;
	}

	public void setQuota(Double quota) {
		this.quota = quota;
	}
	
}