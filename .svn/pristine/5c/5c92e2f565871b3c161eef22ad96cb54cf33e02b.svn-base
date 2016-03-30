/**
 * Copyright &copy; 2014-2016 <a href="https://pactera.com">Pactera-JeeSite</a> All rights reserved.
 */
package com.pactera.jeesite.modules.test.web;

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
import com.pactera.jeesite.modules.test.entity.TestDataShowHow;
import com.pactera.jeesite.modules.test.service.TestDataShowHowService;

import javax.validation.ConstraintViolationException;
import org.springframework.web.multipart.MultipartFile;
import com.orangesignal.csv.CsvConfig;
import com.orangesignal.csv.manager.CsvEntityManager;
import com.orangesignal.csv.manager.CsvSaver;
import com.thinkgem.jeesite.common.beanvalidator.BeanValidators;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.Encodes;
/**
 * 业务数据表演示updController
 * @author Jeffen@pactera
 * @version 2015-10-07
 */
@Controller
@RequestMapping(value = "${adminPath}/test/testDataShowHow")
public class TestDataShowHowController extends BaseController {

	public static final String URL_ADMIN_REPAGE = "redirect:"+Global.getAdminPath()+"/test/testDataShowHow/?repage";
	public static final String URL_MODULE_LIST = "modules/test/testDataShowHowList";
	public static final String URL_MODULE_FORM = "modules/test/testDataShowHowForm";
	
	public static final String PERMISSION_VIEW = "test:testDataShowHow:view";
	public static final String PERMISSION_EDIT = "test:testDataShowHow:edit";
	public static final String PERMISSION_DBA = "test:testDataShowHow:dba";
	public static final String PERMISSION_IO = "test:testDataShowHow:io";
	
	@Autowired
	private TestDataShowHowService testDataShowHowService;
	
	@ModelAttribute
	public TestDataShowHow get(@RequestParam(required=false) String id) {
		TestDataShowHow entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = testDataShowHowService.get(id);
		}
		if (entity == null){
			entity = new TestDataShowHow();
		}
		return entity;
	}
	
	
	@RequiresPermissions(PERMISSION_VIEW)
	@RequestMapping(value = {"list", ""})
	public String list(TestDataShowHow testDataShowHow, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TestDataShowHow> page = testDataShowHowService.findPage(new Page<TestDataShowHow>(request, response), testDataShowHow); 
		model.addAttribute("page", page);
		return URL_MODULE_LIST;
	}

	@RequiresPermissions(PERMISSION_VIEW)
	@RequestMapping(value = "form")
	public String form(TestDataShowHow testDataShowHow, Model model) {
		model.addAttribute("testDataShowHow", testDataShowHow);
		return URL_MODULE_FORM;
	}

	@RequiresPermissions(PERMISSION_EDIT)
	@RequestMapping(value = "save")
	public String save(TestDataShowHow testDataShowHow, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, testDataShowHow)){
			return form(testDataShowHow, model);
		}
		testDataShowHowService.save(testDataShowHow);
		addMessage(redirectAttributes, MutiLangUtils.getLang("common.save.success.param", "【业务数据表演示upd】"));
		return URL_ADMIN_REPAGE;
	}
	
	@RequiresPermissions(PERMISSION_EDIT)
	@RequestMapping(value = "delete")
	public String delete(TestDataShowHow testDataShowHow, RedirectAttributes redirectAttributes) {
		testDataShowHowService.delete(testDataShowHow);
		String physicalDelete = testDataShowHow.getPhysicalDelete().booleanValue()?" <span class='text-warning'>[注：物理删除]</span>":"";
		addMessage(redirectAttributes, MutiLangUtils.getLang("common.delete.success.param", "【业务数据表演示upd】") + physicalDelete);
		return URL_ADMIN_REPAGE;
	}
	
	@RequiresPermissions(PERMISSION_EDIT)
	@RequestMapping(value = "deleteChecked")
	public String deleteChecked(TestDataShowHow testDataShowHow, RedirectAttributes redirectAttributes) {
		testDataShowHowService.deleteList(testDataShowHow);
		String physicalDelete = testDataShowHow.getPhysicalDelete().booleanValue()?" <span class='text-warning'>[注：物理删除]</span>":"";
		addMessage(redirectAttributes, MutiLangUtils.getLang("common.delete.success.param", "【业务数据表演示upd】") + " （共批量删除 " + testDataShowHow.getCbRowDataIds().size() + " 条数据）" + physicalDelete);
		return URL_ADMIN_REPAGE;
	}
	
	@RequiresPermissions(PERMISSION_DBA)
	@RequestMapping(value = "truncateTable")
	public String truncateTable(TestDataShowHow testDataShowHow, RedirectAttributes redirectAttributes) {
		testDataShowHowService.truncateTable(testDataShowHow);
		addMessage(redirectAttributes, MutiLangUtils.getLang("common.delete.success.param", "【业务数据表演示upd，<span class='text-warning'>物理清空</span>】"));
		return URL_ADMIN_REPAGE;
	}
	
	@RequiresPermissions(PERMISSION_DBA)
	@RequestMapping(value = "copy")
	public String copy(TestDataShowHow testDataShowHow, RedirectAttributes redirectAttributes) {
		testDataShowHowService.copy(testDataShowHow);
		addMessage(redirectAttributes, MutiLangUtils.getLang("common.copy.success.param", "【业务数据表演示upd】"));
		return URL_ADMIN_REPAGE;
	}
	
	@RequiresPermissions(PERMISSION_DBA)
	@RequestMapping(value = "copyChecked")
	public String copyChecked(TestDataShowHow testDataShowHow, RedirectAttributes redirectAttributes) {
		testDataShowHowService.copyList(testDataShowHow);
		addMessage(redirectAttributes, MutiLangUtils.getLang("common.copy.success.param", "【业务数据表演示upd】") + " （共批量复制 " + testDataShowHow.getCbRowDataIds().size() + " 条数据）");
		return URL_ADMIN_REPAGE;
	}
	
	/**
	 * 导出CSV数据
	 * @param testDataShowHow
	 * @param request
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions(PERMISSION_IO)
	@RequestMapping(value = "export/csv", method = RequestMethod.POST)
	public String exportCsvFile(TestDataShowHow testDataShowHow, HttpServletRequest request,
			HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
			String fileName = "【业务数据表演示upd】" + DateUtils.getDateTimeTight() + ".csv";
			List<TestDataShowHow> lst = testDataShowHowService.findList(testDataShowHow);
			CsvEntityManager cet = new CsvEntityManager(new CsvConfig(
					CsvConfig.DEFAULT_SEPARATOR));
			CsvSaver csvSaver = null;
			response.reset();
			response.setContentType("application/octet-stream; charset=utf-8");
			response.setHeader("Content-Disposition", "attachment; filename="
					+ Encodes.urlEncode(fileName));
			csvSaver = cet.save(lst, TestDataShowHow.class);
			csvSaver.to(response.getOutputStream());
			return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导出业务数据表演示upd失败！失败信息：" + e.getMessage());
		}
		return URL_ADMIN_REPAGE;
	}

	/**
	 * 导入CSV数据
	 * 
	 * @param file
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions(PERMISSION_IO)
	@RequestMapping(value = "import/csv", method = RequestMethod.POST)
	public String importCsvFile(MultipartFile file,
			RedirectAttributes redirectAttributes) throws Exception {
		if (Global.isDemoMode()) {
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			return "redirect:" + Global.getAdminPath()
					+ "/test/testDataShowHow/?repage";
		}
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			if (StringUtils.isBlank(file.getOriginalFilename())) {
				throw new RuntimeException("导入文档为空!");
			} else if (!file.getOriginalFilename().toLowerCase()
					.endsWith("csv")) {
				throw new RuntimeException("文档格式不正确!");
			} else {
				List<TestDataShowHow> list = new CsvEntityManager().load(
						TestDataShowHow.class).from(file.getInputStream());
				long i = 0;
				for (TestDataShowHow testDataShowHow : list) {

					try {
						BeanValidators.validateWithException(validator, testDataShowHow);
						testDataShowHowService.save(testDataShowHow);
						successNum++;
						++i;
					} catch (ConstraintViolationException ex) {
						failureMsg.append("<br/>CSV数据第" + i + "行导入失败：");
						List<String> messageList = BeanValidators
								.extractPropertyAndMessageAsList(ex, ": ");
						for (String message : messageList) {
							failureMsg.append(message + "; ");
							failureNum++;
						}
					} catch (Exception ex) {
						failureMsg.append("<br/>导入CSV数据失败：" + ex.getMessage());
					}
				}
				if (failureNum > 0) {
					failureMsg.insert(0, "，失败 " + failureNum + " 条数据，导入信息如下：");
				}
				addMessage(redirectAttributes, "已成功导入 " + successNum
						+ " 条CSV数据" + failureMsg);
			}
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入CSV数据失败！失败信息：" + e.getMessage());
		}
		return URL_ADMIN_REPAGE;
	}

	/**
	 * 下载导入CSV数据的模板
	 * 
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions(PERMISSION_IO)
	@RequestMapping(value = "import/csv/template")
	public String importCsvFileTemplate(HttpServletResponse response,
			RedirectAttributes redirectAttributes) {
		try {
			String fileName = "【业务数据表演示upd】数据导入模板.csv";

			List<TestDataShowHow> list = new ArrayList();
			TestDataShowHow testDataShowHow = new TestDataShowHow();
			//testDataShowHow = testDataShowHow.getSinglePoJoByDefaultValue();
			list.add(testDataShowHow);

			CsvEntityManager cet = new CsvEntityManager();
			response.reset();
			response.setContentType("application/octet-stream; charset=utf-8");
			response.setHeader("Content-Disposition", "attachment; filename="
					+ Encodes.urlEncode(fileName));
			cet.save(list, TestDataShowHow.class).to(response.getOutputStream());
			return null;

		} catch (Exception e) {
			addMessage(redirectAttributes, "导入模板下载失败！失败信息：" + e.getMessage());
		}
		return URL_ADMIN_REPAGE;
	}
	
}