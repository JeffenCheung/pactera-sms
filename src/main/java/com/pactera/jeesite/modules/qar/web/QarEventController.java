/**
 * Copyright &copy; 2014-2016 <a href="https://pactera.com">Pactera-JeeSite</a> All rights reserved.
 */
package com.pactera.jeesite.modules.qar.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.utils.MutiLangUtils;
import com.pactera.jeesite.modules.qar.entity.QarEvent;
import com.pactera.jeesite.modules.qar.service.QarEventService;

import javax.validation.ConstraintViolationException;
import org.springframework.web.multipart.MultipartFile;

import com.thinkgem.jeesite.common.beanvalidator.BeanValidators;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.Encodes;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.common.utils.excel.ImportExcel;
/**
 * QAR超限事件poiController
 * @author Jeffen@pactera
 * @version 2015-10-16
 */
@Controller
@RequestMapping(value = "${adminPath}/qar/qarEvent")
public class QarEventController extends BaseController {

	public static final String URL_ADMIN_REPAGE = "redirect:"+Global.getAdminPath()+"/qar/qarEvent/?repage";
	public static final String URL_MODULE_LIST = "modules/qar/qarEventList";
	public static final String URL_MODULE_FORM = "modules/qar/qarEventForm";
	
	public static final String PERMISSION_VIEW = "qar:qarEvent:view";
	public static final String PERMISSION_EDIT = "qar:qarEvent:edit";
	public static final String PERMISSION_DBA = "qar:qarEvent:dba";
	public static final String PERMISSION_IO = "qar:qarEvent:io";
	
	@Autowired
	private QarEventService qarEventService;
	
	@ModelAttribute
	public QarEvent get(@RequestParam(required=false) String id) {
		QarEvent entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = qarEventService.get(id);
		}
		if (entity == null){
			entity = new QarEvent();
		}
		return entity;
	}
	
	
	@RequiresPermissions(PERMISSION_VIEW)
	@RequestMapping(value = {"list", ""})
	public String list(QarEvent qarEvent, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<QarEvent> page = qarEventService.findPage(new Page<QarEvent>(request, response), qarEvent); 
		model.addAttribute("page", page);
		return URL_MODULE_LIST;
	}

	@RequiresPermissions(PERMISSION_VIEW)
	@RequestMapping(value = "form")
	public String form(QarEvent qarEvent, Model model) {
		model.addAttribute("qarEvent", qarEvent);
		return URL_MODULE_FORM;
	}

	@RequiresPermissions(PERMISSION_EDIT)
	@RequestMapping(value = "save")
	public String save(QarEvent qarEvent, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, qarEvent)){
			return form(qarEvent, model);
		}
		qarEventService.save(qarEvent);
		addMessage(redirectAttributes, MutiLangUtils.getLang("common.save.success.param", "【QAR超限事件poi】"));
		return URL_ADMIN_REPAGE;
	}
	
	@RequiresPermissions(PERMISSION_EDIT)
	@RequestMapping(value = "delete")
	public String delete(QarEvent qarEvent, RedirectAttributes redirectAttributes) {
		qarEventService.delete(qarEvent);
		String physicalDelete = qarEvent.getPhysicalDelete().booleanValue()?" <span class='text-warning'>[注：物理删除]</span>":"";
		addMessage(redirectAttributes, MutiLangUtils.getLang("common.delete.success.param", "【QAR超限事件poi】") + physicalDelete);
		return URL_ADMIN_REPAGE;
	}
	
	@RequiresPermissions(PERMISSION_EDIT)
	@RequestMapping(value = "deleteChecked")
	public String deleteChecked(QarEvent qarEvent, RedirectAttributes redirectAttributes) {
		qarEventService.deleteList(qarEvent);
		String physicalDelete = qarEvent.getPhysicalDelete().booleanValue()?" <span class='text-warning'>[注：物理删除]</span>":"";
		addMessage(redirectAttributes, MutiLangUtils.getLang("common.delete.success.param", "【QAR超限事件poi】") + " （共批量删除 " + qarEvent.getCbRowDataIds().size() + " 条数据）" + physicalDelete);
		return URL_ADMIN_REPAGE;
	}
	
	@RequiresPermissions(PERMISSION_DBA)
	@RequestMapping(value = "truncateTable")
	public String truncateTable(QarEvent qarEvent, RedirectAttributes redirectAttributes) {
		qarEventService.truncateTable(qarEvent);
		addMessage(redirectAttributes, MutiLangUtils.getLang("common.delete.success.param", "【QAR超限事件poi，<span class='text-warning'>物理清空</span>】"));
		return URL_ADMIN_REPAGE;
	}
	
	@RequiresPermissions(PERMISSION_DBA)
	@RequestMapping(value = "copy")
	public String copy(QarEvent qarEvent, RedirectAttributes redirectAttributes) {
		qarEventService.copy(qarEvent);
		addMessage(redirectAttributes, MutiLangUtils.getLang("common.copy.success.param", "【QAR超限事件poi】"));
		return URL_ADMIN_REPAGE;
	}
	
	@RequiresPermissions(PERMISSION_DBA)
	@RequestMapping(value = "copyChecked")
	public String copyChecked(QarEvent qarEvent, RedirectAttributes redirectAttributes) {
		qarEventService.copyList(qarEvent);
		addMessage(redirectAttributes, MutiLangUtils.getLang("common.copy.success.param", "【QAR超限事件poi】") + " （共批量复制 " + qarEvent.getCbRowDataIds().size() + " 条数据）");
		return URL_ADMIN_REPAGE;
	}
	
	
	/**
	 * 导出Excel数据
	 * @param qarEvent
	 * @param request
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions(PERMISSION_IO)
	@RequestMapping(value = "export/excel", method = RequestMethod.POST)
	public String exportExcelFile(QarEvent qarEvent, HttpServletRequest request,
			HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
			String fileName = "【QAR超限事件poi】" + DateUtils.getDateTimeTight() + ".xlsx";
			List<QarEvent> lst = qarEventService.findList(qarEvent);
			new ExportExcel("QAR超限事件poi", QarEvent.class).setDataList(lst).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导出QAR超限事件poi失败！失败信息：" + e.getMessage());
		}
		return URL_ADMIN_REPAGE;
	}

	/**
	 * 导入Excel数据
	 * 
	 * @param file
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions(PERMISSION_IO)
	@RequestMapping(value = "import/excel", method = RequestMethod.POST)
	public String importExcelFile(MultipartFile file,
			RedirectAttributes redirectAttributes) throws Exception {
		if (Global.isDemoMode()) {
			addMessage4DemoMode(redirectAttributes);
			return "redirect:" + Global.getAdminPath()
					+ "/qar/qarEvent/?repage";
		}
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			if (StringUtils.isBlank(file.getOriginalFilename())) {
				throw new RuntimeException("导入文档为空!");
			} else if (!file.getOriginalFilename().toLowerCase()
					.endsWith("xlsx")) {
				throw new RuntimeException("文档格式不正确!");
			} else {
				ImportExcel ei = new ImportExcel(file, 1, 0);
				List<QarEvent> list = ei.getDataList(QarEvent.class);
				long i = 0;
				for (QarEvent qarEvent : list) {

					try {
						BeanValidators.validateWithException(validator, qarEvent);
						qarEventService.save(qarEvent);
						successNum++;
						++i;
					} catch (ConstraintViolationException ex) {
						failureMsg.append("<br/>Excel数据第" + i + "行导入失败：");
						List<String> messageList = BeanValidators
								.extractPropertyAndMessageAsList(ex, ": ");
						for (String message : messageList) {
							failureMsg.append(message + "; ");
							failureNum++;
						}
					} catch (Exception ex) {
						failureMsg.append("<br/>导入Excel数据失败：" + ex.getMessage());
					}
				}
				if (failureNum > 0) {
					failureMsg.insert(0, "，失败 " + failureNum + " 条数据，导入信息如下：");
				}
				addMessage(redirectAttributes, "已成功导入 " + successNum
						+ " 条Excel数据" + failureMsg);
			}
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入Excel数据失败！失败信息：" + e.getMessage());
		}
		return URL_ADMIN_REPAGE;
	}

	/**
	 * 下载导入Excel数据的模板
	 * 
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions(PERMISSION_IO)
	@RequestMapping(value = "import/excel/template")
	public String importExcelFileTemplate(HttpServletResponse response,
			RedirectAttributes redirectAttributes) {
		try {
			String fileName = "【QAR超限事件poi】数据导入模板.xlsx";

			List<QarEvent> list = new ArrayList();
			QarEvent qarEvent = new QarEvent();
			//qarEvent = qarEvent.getSinglePoJoByDefaultValue();
			list.add(qarEvent);

			new ExportExcel("QAR超限事件poi", QarEvent.class, 2).setDataList(list).write(response, fileName).dispose();
			return null;

		} catch (Exception e) {
			addMessage(redirectAttributes, "导入模板下载失败！失败信息：" + e.getMessage());
		}
		return URL_ADMIN_REPAGE;
	}
}