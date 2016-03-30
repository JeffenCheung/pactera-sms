/**
 * Copyright &copy; 2014-2016 <a href="https://pactera.com">Pactera-JeeSite</a> All rights reserved.served.
 */
package com.pactera.jeesite.modules.qar.entity;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.excel.annotation.*;

/**
 * QAR超限事件poiEntity
 * @author Jeffen@pactera
 * @version 2015-10-16
 */
public class QarEvent extends DataEntity<QarEvent> {
	
	private static final long serialVersionUID = 1L;
	private Integer fltFileno;		// FLT_FILENO
	private Date evtStarttime;		// EVT_STARTTIME
	private Integer evtProno;		// EVT_PRONO
	private String evtClass;		// EVT_CLASS
	private Integer evtPhase;		// EVT_PHASE
	private String evtFltdeparture;		// EVT_FLTDEPARTURE
	private String evtFltarrival;		// EVT_FLTARRIVAL
	private String evtFltno;		// EVT_FLTNO
	private String evtActail;		// EVT_ACTAIL
	private String evtFltstatus;		// EVT_FLTSTATUS
	private String evtProtype;		// EVT_PROTYPE
	private String evtFltrunwayldg;		// EVT_FLTRUNWAYLDG
	private String evtFltrunwayto;		// EVT_FLTRUNWAYTO
	private String evtValid;		// EVT_VALID
	private Double evtLimit;		// EVT_LIMIT
	private Double evtMaxval;		// EVT_MAXVAL
	private Double evtDuration;		// EVT_DURATION
	private Double evtTimetopeak;		// EVT_TIMETOPEAK
	private Double evtAvggap;		// EVT_AVGGAP
	private Double evtFltidterased;		// EVT_FLTIDTERASED
	private String evtArlcode;		// EVT_ARLCODE
	private String evtNote;		// EVT_NOTE
	private String evtMail;		// EVT_MAIL
	
	public QarEvent() {
		super();
	}

	public QarEvent(String id){
		super(id);
	}

	@ExcelField(type = 0, align = 0, sort = 20, title = "标题1**批注1")
	public Integer getFltFileno() {
		return fltFileno;
	}

	public void setFltFileno(Integer fltFileno) {
		this.fltFileno = fltFileno;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@ExcelField(type = 1, align = 1, sort = 30, title = "标题2")
	public Date getEvtStarttime() {
		return evtStarttime;
	}

	public void setEvtStarttime(Date evtStarttime) {
		this.evtStarttime = evtStarttime;
	}
	
	@ExcelField(type = 1, align = 2, sort = 40, title = "标题3")
	public Integer getEvtProno() {
		return evtProno;
	}

	public void setEvtProno(Integer evtProno) {
		this.evtProno = evtProno;
	}
	
	@Length(min=0, max=1, message="EVT_CLASS长度必须介于 0 和 1 之间")
	@ExcelField(type = 2, align = 3, sort = 50, title = "标题4")
	public String getEvtClass() {
		return evtClass;
	}

	public void setEvtClass(String evtClass) {
		this.evtClass = evtClass;
	}
	
	@ExcelField(sort = 60, title = "标题5")
	public Integer getEvtPhase() {
		return evtPhase;
	}

	public void setEvtPhase(Integer evtPhase) {
		this.evtPhase = evtPhase;
	}
	
	@Length(min=0, max=4, message="EVT_FLTDEPARTURE长度必须介于 0 和 4 之间")
	@ExcelField(sort = 70, title = "标题6")
	public String getEvtFltdeparture() {
		return evtFltdeparture;
	}

	public void setEvtFltdeparture(String evtFltdeparture) {
		this.evtFltdeparture = evtFltdeparture;
	}
	
	@Length(min=0, max=4, message="EVT_FLTARRIVAL长度必须介于 0 和 4 之间")
	public String getEvtFltarrival() {
		return evtFltarrival;
	}

	public void setEvtFltarrival(String evtFltarrival) {
		this.evtFltarrival = evtFltarrival;
	}
	
	@Length(min=0, max=10, message="EVT_FLTNO长度必须介于 0 和 10 之间")
	public String getEvtFltno() {
		return evtFltno;
	}

	public void setEvtFltno(String evtFltno) {
		this.evtFltno = evtFltno;
	}
	
	@Length(min=0, max=6, message="EVT_ACTAIL长度必须介于 0 和 6 之间")
	public String getEvtActail() {
		return evtActail;
	}

	public void setEvtActail(String evtActail) {
		this.evtActail = evtActail;
	}
	
	@Length(min=0, max=1, message="EVT_FLTSTATUS长度必须介于 0 和 1 之间")
	public String getEvtFltstatus() {
		return evtFltstatus;
	}

	public void setEvtFltstatus(String evtFltstatus) {
		this.evtFltstatus = evtFltstatus;
	}
	
	@Length(min=0, max=1, message="EVT_PROTYPE长度必须介于 0 和 1 之间")
	public String getEvtProtype() {
		return evtProtype;
	}

	public void setEvtProtype(String evtProtype) {
		this.evtProtype = evtProtype;
	}
	
	@Length(min=0, max=3, message="EVT_FLTRUNWAYLDG长度必须介于 0 和 3 之间")
	public String getEvtFltrunwayldg() {
		return evtFltrunwayldg;
	}

	public void setEvtFltrunwayldg(String evtFltrunwayldg) {
		this.evtFltrunwayldg = evtFltrunwayldg;
	}
	
	@Length(min=0, max=3, message="EVT_FLTRUNWAYTO长度必须介于 0 和 3 之间")
	public String getEvtFltrunwayto() {
		return evtFltrunwayto;
	}

	public void setEvtFltrunwayto(String evtFltrunwayto) {
		this.evtFltrunwayto = evtFltrunwayto;
	}
	
	@Length(min=0, max=1, message="EVT_VALID长度必须介于 0 和 1 之间")
	public String getEvtValid() {
		return evtValid;
	}

	public void setEvtValid(String evtValid) {
		this.evtValid = evtValid;
	}
	
	public Double getEvtLimit() {
		return evtLimit;
	}

	public void setEvtLimit(Double evtLimit) {
		this.evtLimit = evtLimit;
	}
	
	public Double getEvtMaxval() {
		return evtMaxval;
	}

	public void setEvtMaxval(Double evtMaxval) {
		this.evtMaxval = evtMaxval;
	}
	
	public Double getEvtDuration() {
		return evtDuration;
	}

	public void setEvtDuration(Double evtDuration) {
		this.evtDuration = evtDuration;
	}
	
	public Double getEvtTimetopeak() {
		return evtTimetopeak;
	}

	public void setEvtTimetopeak(Double evtTimetopeak) {
		this.evtTimetopeak = evtTimetopeak;
	}
	
	public Double getEvtAvggap() {
		return evtAvggap;
	}

	public void setEvtAvggap(Double evtAvggap) {
		this.evtAvggap = evtAvggap;
	}
	
	public Double getEvtFltidterased() {
		return evtFltidterased;
	}

	public void setEvtFltidterased(Double evtFltidterased) {
		this.evtFltidterased = evtFltidterased;
	}
	
	@Length(min=0, max=2, message="EVT_ARLCODE长度必须介于 0 和 2 之间")
	public String getEvtArlcode() {
		return evtArlcode;
	}

	public void setEvtArlcode(String evtArlcode) {
		this.evtArlcode = evtArlcode;
	}
	
	@Length(min=0, max=100, message="EVT_NOTE长度必须介于 0 和 100 之间")
	public String getEvtNote() {
		return evtNote;
	}

	public void setEvtNote(String evtNote) {
		this.evtNote = evtNote;
	}
	
	@Length(min=0, max=50, message="EVT_MAIL长度必须介于 0 和 50 之间")
	public String getEvtMail() {
		return evtMail;
	}

	public void setEvtMail(String evtMail) {
		this.evtMail = evtMail;
	}
	
}