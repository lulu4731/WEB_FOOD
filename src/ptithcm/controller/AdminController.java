package ptithcm.controller;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.bean.FoodBean;
import ptithcm.bean.FoodItem;
import ptithcm.bean.Mailer;
import ptithcm.bean.MailerContent;
import ptithcm.bean.UploadFile;
import ptithcm.entity.ACCOUNT;
import ptithcm.entity.FEEDBACK;
import ptithcm.entity.FOOD;
import ptithcm.entity.ORDER;
import ptithcm.entity.ORDER_ITEM;
import ptithcm.entity.ROLE;

@Transactional
@Controller
@RequestMapping("/admin/")
public class AdminController {
	@Autowired
	SessionFactory factory;
	@Autowired
	UploadFile baseUploadFile;

	@RequestMapping(value = "manage", method = RequestMethod.GET)
	public String manage(ModelMap model) throws Exception {
		Calendar cal = Calendar.getInstance();
		model.addAttribute("month", cal.get(Calendar.MONTH) + 1);
//		System.out.println(cal.get(Calendar.MONTH) + 1);

		double sumNT = searchNT(cal.getTime(), cal.getTime());
		model.addAttribute("sumNT", sumNT);
		long countNSLDH = searchNSDH(cal.getTime(), cal.getTime());
		model.addAttribute("countNSLDH", countNSLDH);
		long countNSLTDH = searchNSTDH(cal.getTime(), cal.getTime());
		model.addAttribute("countNSLTDH", countNSLTDH);

		long countFBTN = searchFBTN(cal.getTime(), cal.getTime());
		model.addAttribute("countFBTN", countFBTN);
		long countSLMNTN = searchSLMATN(cal.getTime(), cal.getTime());
		model.addAttribute("countSLMNTN", countSLMNTN);
		
		long countFoodTrue = searchFoodTrue();
		model.addAttribute("countFoodTrue", countFoodTrue);

		// user
		List<ACCOUNT> list = searchUser2();
		model.addAttribute("nv", list.subList(0, 2));
		model.addAttribute("countNV", list.size());
//		System.out.println(
//				cal.getActualMinimum(Calendar.DATE) + "/" + cal.get(Calendar.MONTH) + "/" + cal.get(Calendar.YEAR));
//		System.out.println(
//				cal.getActualMaximum(Calendar.DATE) + "/" + cal.get(Calendar.MONTH) + "/" + cal.get(Calendar.YEAR));

		cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.getActualMaximum(Calendar.DATE));
		Date dateF = cal.getTime();
		cal.add(Calendar.DAY_OF_MONTH, -30);
		Date dateT = cal.getTime();

//		System.out.println(dateF);
//		System.out.println(dateT);
		Double sum1 = searchT(dateT, dateF);
		long sum1SLDH = searchTSDH(dateT, dateF);
		long countSLMNTT1 = searchSumFoodT(dateT, dateF);
		model.addAttribute("sum1", sum1);
		model.addAttribute("sum1SLDH", sum1SLDH);
		model.addAttribute("countSLMNTT1", countSLMNTT1);
		long countFBTT1 = searchFBTN(dateT, dateF);
		model.addAttribute("countFBTT1", countFBTT1);
		long sumFoodT = searchSumFoodT(dateT, dateF);
		model.addAttribute("sumFoodT", sumFoodT);
		List<Object[]> food = searchSumFoodIDT(dateT, dateF);
		
		
		List<FoodItem> listFood = new ArrayList<FoodItem>();
		Long countF = (long) 0;
		for (Object[] foodItem : food) {
			 String name=((String)foodItem[0]);
	         Long count=((Long)foodItem[1]);
	         Long countFood=((Long)foodItem[2]);
	         FoodItem item = new FoodItem(name, count,countFood);
	         countF += countFood;
	         listFood.add(item);
		}
		model.addAttribute("food", listFood);
		long sumFoodFoodT = searchSumFoodFoodT(dateT, dateF);
		model.addAttribute("sumFoodFoodT", sumFoodFoodT);
		model.addAttribute("countF", countF);
		
		
		cal.add(Calendar.DAY_OF_MONTH, -1);
		dateF = cal.getTime();
		cal.add(Calendar.DAY_OF_MONTH, -30);
		dateT = cal.getTime();

		Double sum2 = searchT(dateT, dateF);
		long sum2SLDH = searchTSDH(dateT, dateF);
		long countSLMNTT2 = searchSumFoodT(dateT, dateF);
		model.addAttribute("sum2", sum2);
		model.addAttribute("sum2SLDH", sum2SLDH);
		model.addAttribute("countSLMNTT2", countSLMNTT2);
		long countFBTT2 = searchFBTN(dateT, dateF);
		model.addAttribute("countFBTT2", countFBTT2);

		
		cal.add(Calendar.DAY_OF_MONTH, -1);
		dateF = cal.getTime();
		cal.add(Calendar.DAY_OF_MONTH, -30);
		dateT = cal.getTime();
		Double sum3 = searchT(dateT, dateF);
		model.addAttribute("sum3", sum3);


		cal.add(Calendar.DAY_OF_MONTH, -1);
		dateF = cal.getTime();
		cal.add(Calendar.DAY_OF_MONTH, -30);
		dateT = cal.getTime();
		Double sum4 = searchT(dateT, dateF);
		model.addAttribute("sum4", sum4);


		cal.add(Calendar.DAY_OF_MONTH, -1);
		dateF = cal.getTime();
		cal.add(Calendar.DAY_OF_MONTH, -30);
		dateT = cal.getTime();
		Double sum5 = searchT(dateT, dateF);
		model.addAttribute("sum5", sum5);
		
//		System.out.println(sum1);
//		System.out.println(sum2);
		
		if(sum2 != 0.0) {
			model.addAttribute("avg", Math.round((sum1 * 100) / (sum2)));
		}else if(sum2 + sum1 == 0.0) {
			model.addAttribute("avg", 100);
		}else {
			model.addAttribute("avg", Math.round((sum1 * 100) / (sum2 + sum1)));
		}
		
		if(sum2SLDH != 0) {
			model.addAttribute("avgSLDH", Math.round((sum1SLDH * 100) / (sum2SLDH)));
		}else if(sum1SLDH + sum2SLDH == 0) {
			model.addAttribute("avgSLDH", 0);
		}else {
			model.addAttribute("avgSLDH", Math.round((sum1SLDH * 100) / (sum2SLDH + sum1SLDH)));
		}
		
		if(countSLMNTT2 != 0) {
			model.addAttribute("avgSLMA", Math.round((countSLMNTT1 * 100) / (countSLMNTT2)));
		}else if(countSLMNTT2 + countSLMNTT1 == 0) {
			model.addAttribute("avgSLMA", 0);
		}else {
			model.addAttribute("avgSLMA", Math.round((countSLMNTT1 * 100) / (countSLMNTT2 + countSLMNTT1)));
		}
		
		if(countFBTT2 != 0) {
			model.addAttribute("avgSLFB", Math.round((countFBTT1 * 100) / (countFBTT2)));
		}else if(countFBTT1 + countFBTT2 == 0) {
			model.addAttribute("avgSLFB", 0);
		}else {
			model.addAttribute("avgSLFB", Math.round((countFBTT1 * 100) / (countFBTT2 + countFBTT1)));
		}
		
//		model.addAttribute("avgSLMA", (countSLMNTT1 * 100) / (countSLMNTT2 + countSLMNTT1));
//		model.addAttribute("avgSLFB", (countFBTT1 * 100) / (countFBTT2 + countFBTT1));
		if(sum1 + sum2 + sum3 + sum4 + sum5 == 0) {
			model.addAttribute("avg5t", 1);
		}else {
			model.addAttribute("avg5t", sum1 + sum2 + sum3 + sum4 + sum5);
		}
		

		return "admin/home";
	}

	@RequestMapping(value = "user", method = RequestMethod.GET)
	public String user(HttpServletRequest request, ModelMap model, @ModelAttribute("accounts") ACCOUNT accounts) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ACCOUNT";
		Query query = session.createQuery(hql);
		List<ACCOUNT> list = query.list();

		PagedListHolder pagedListHolder = new PagedListHolder(list);
		int page = ServletRequestUtils.getIntParameter(request, "page", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);

		pagedListHolder.setPageSize(9);
		model.addAttribute("pagedListHolder", pagedListHolder);

//		model.addAttribute("users", list);

		return "admin/user";
	}

	@Autowired
	Mailer mailer;
	MailerContent mailerContent;

	@RequestMapping(value = "{id}.htm", params = "linkIsActive0")
	public String ChangeIsActive0(HttpServletRequest request, ModelMap model,
			@ModelAttribute("accounts") ACCOUNT accounts, @PathVariable("id") String id) {
		ACCOUNT user = this.getUser(id);
		Integer temp = ChangeIsActive(this.getUser(id), false);

		try {
			mailer.send("dangnguyen0401@gmail.com", user.getEMAIL(), "Ban quản lý website ORDER FOOD ÂU_MỸ thông báo",
					"Tài khoản của bạn đã bị khóa do: spam quá nhiều đơn hàng."
							+ "Vui lòng liên hệ với ban quản lý để mở khóa tài khoản");
			model.addAttribute("message", "Gửi email thành công !");

		} catch (Exception e) {
			System.out.println("Gửi email thất bại !");
		}

		List<ACCOUNT> list = getAllUsers();
		model.addAttribute("pagedListHolder", pagedListHolder(list, request));
//		model.addAttribute("users", list);
		return "admin/user";
	}

	@RequestMapping(value = "{id}.htm", params = "linkIsActive1")
	public String ChangeIsActive1(HttpServletRequest request, ModelMap model,
			@ModelAttribute("accounts") ACCOUNT accounts, @PathVariable("id") String id) {
		ACCOUNT user = this.getUser(id);
		Integer temp = ChangeIsActive(this.getUser(id), true);

		try {
			mailer.send("dangnguyen0401@gmail.com", user.getEMAIL(), "Ban quản lý website ORDER FOOD ÂU_MỸ thông báo",
					"Tài khoản của bạn đã mở khóa thành công");
		} catch (Exception e) {
			System.out.println("Gửi email thất bại !");
		}

		List<ACCOUNT> list = getAllUsers();

		model.addAttribute("pagedListHolder", pagedListHolder(list, request));
//		model.addAttribute("users", list);
		return "admin/user";
	}

	
	@RequestMapping(value = "{id}.htm", params = "linkChangeRole3")
	public String ChangeRole3(HttpServletRequest request, ModelMap model,
			@ModelAttribute("accounts") ACCOUNT accounts, @PathVariable("id") String id) {
		
		
		Integer temp = ChangeIsRole(this.getUser(id), 2);
		if (temp != 0) {
			model.addAttribute("message", "Change thất bại");
		} else {
			model.addAttribute("message", "Change thành công");
		}
		List<ACCOUNT> list = getAllUsers();

		model.addAttribute("pagedListHolder", pagedListHolder(list, request));
//		model.addAttribute("users", list);
		return "admin/user";
	}
	
	@RequestMapping(value = "{id}.htm", params = "linkChangeRole2")
	public String ChangeRole2(HttpServletRequest request, ModelMap model,
			@ModelAttribute("accounts") ACCOUNT accounts, @PathVariable("id") String id) {
		
		
		Integer temp = ChangeIsRole(this.getUser(id), 3);
		if (temp != 0) {
			model.addAttribute("message", "Change thất bại");
		} else {
			model.addAttribute("message", "Change thành công");
		}
		List<ACCOUNT> list = getAllUsers();

		model.addAttribute("pagedListHolder", pagedListHolder(list, request));
//		model.addAttribute("users", list);
		return "admin/user";
	}
	
	@RequestMapping(value = "user", params = "btnsearch")
	public String searchUser(HttpServletRequest request, ModelMap model, @ModelAttribute("accounts") ACCOUNT accounts) {

//		PagedListHolder pagedListHolder = new PagedListHolder(searchUser(request.getParameter("searchName"), request.getParameter("searchSDT"),
//				request.getParameter("searchQ")));
//		int page = ServletRequestUtils.getIntParameter(request, "page", 0);
//		pagedListHolder.setPage(page);
//		pagedListHolder.setMaxLinkedPages(5);
//		
//		pagedListHolder.setPageSize(9);

		List<ACCOUNT> list = searchUser(request.getParameter("searchName"), request.getParameter("searchSDT"),
				request.getParameter("searchQ"));

		model.addAttribute("pagedListHolder", pagedListHolder(list, request));
//		model.addAttribute("users", list);

		return "admin/user";
	}

//
	@RequestMapping(value = "{id}.htm", params = "btnsearch")
	public String searchUserStatus(HttpServletRequest request, ModelMap model,
			@ModelAttribute("accounts") ACCOUNT accounts) {

//		PagedListHolder pagedListHolder = new PagedListHolder(searchUser(request.getParameter("searchName"), request.getParameter("searchSDT"),
//				request.getParameter("searchQ")));
//		int page = ServletRequestUtils.getIntParameter(request, "page", 0);
//		pagedListHolder.setPage(page);
//		pagedListHolder.setMaxLinkedPages(5);
//		
//		pagedListHolder.setPageSize(9);

		List<ACCOUNT> list = searchUser(request.getParameter("searchName"), request.getParameter("searchSDT"),
				request.getParameter("searchQ"));

		model.addAttribute("pagedListHolder", pagedListHolder(list, request));
//		model.addAttribute("accounts", list);

		return "admin/user";
	}

	@RequestMapping(value = "order", method = RequestMethod.GET)
	public String order(HttpServletRequest request, ModelMap model, @ModelAttribute("orders") ORDER orders) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ORDER";
		Query query = session.createQuery(hql);
		List<ORDER> list = query.list();

		PagedListHolder pagedListHolder = new PagedListHolder(list);
		int page = ServletRequestUtils.getIntParameter(request, "page", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);

		pagedListHolder.setPageSize(9);
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "admin/expenses";
	}

	@RequestMapping(value = "{id_order}.htm", params = "linkStatus0")
	public String ChangeStatus0(HttpServletRequest request, ModelMap model, @ModelAttribute("orders") ORDER orders,
			@PathVariable("id_order") Integer id_order) {

		Integer temp = ChangeStatus(this.getOrder(id_order), (byte) 0);
		if (temp != 0) {
			model.addAttribute("message", "Xóa thành công");
		} else {
			model.addAttribute("message", "Xóa không thành công");
		}

		List<ORDER> list = getAllOrder();
		model.addAttribute("pagedListHolder", pagedListHolder(list, request));
//		model.addAttribute("users", list);
		return "admin/expenses";
	}

	@RequestMapping(value = "{id_order}.htm", params = "linkStatus1")
	public String ChangeStatus1(HttpServletRequest request, ModelMap model, @ModelAttribute("orders") ORDER orders,
			@PathVariable("id_order") Integer id_order) {

		Integer temp = ChangeStatus(this.getOrder(id_order), (byte) 1);
		if (temp != 0) {
			model.addAttribute("message", "Xóa thành công");
		} else {
			model.addAttribute("message", "Xóa không thành công");
		}

		List<ORDER> list = getAllOrder();
		model.addAttribute("pagedListHolder", pagedListHolder(list, request));
//		model.addAttribute("users", list);
		return "admin/expenses";
	}

	
	@RequestMapping(value = "{id_order}.htm", params = "linkStatus2")
	public String ChangeStatus2(HttpServletRequest request, ModelMap model, @ModelAttribute("orders") ORDER orders,
			@PathVariable("id_order") Integer id_order) {

		ORDER order = this.getOrder(id_order);
		System.out.println(order.getAccountOrder().getEMAIL());
		Integer temp = ChangeStatus(this.getOrder(id_order), (byte) 2);
		try {
			mailer.send("dangnguyen0401@gmail.com", order.getAccountOrder().getEMAIL(), "Quán đặt món ăn âu-mỹ", "");
			System.out.println("Gửi email thành công !");

		} catch (Exception e) {
			System.out.println("Gửi email thất bại !");
		}

		List<ORDER> list = getAllOrder();
		model.addAttribute("pagedListHolder", pagedListHolder(list, request));
//		model.addAttribute("users", list);
		return "admin/expenses";
	}

	@RequestMapping(value = "order", params = "search")

	public String searchOrder(HttpServletRequest request, ModelMap model, @ModelAttribute("orders") ORDER orders,
//			@RequestParam(value = "fromDate") Date fromDate,
//			@RequestParam(value = "toDate") Date toDate,
			@RequestParam(value = "searchName") String fullname, @RequestParam(value = "searchSDT") String sdt)
			throws Exception {
		String from = request.getParameter("fromDate");
		String to = request.getParameter("toDate");
		Date date = Calendar.getInstance().getTime();
		Date date1970 = new Date(11220227200L / 1000);

		DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		Date fromDate;
		Date toDate;

		if (!to.equals("")) {
			toDate = new SimpleDateFormat("dd/MM/yyyy").parse(to);

		} else {
			toDate = date;
		}

		if (!from.equals("")) {
			fromDate = new SimpleDateFormat("dd/MM/yyyy").parse(from);
		} else {
			fromDate = date1970;
		}

		List<ORDER> list = searchOrder(fromDate, toDate, fullname, sdt);
		model.addAttribute("pagedListHolder", pagedListHolder(list, request));
		return "admin/expenses";
	}

	@RequestMapping(value = "{id_order}.htm", params = "search")

	public String searchOrderStatus(HttpServletRequest request, ModelMap model, @ModelAttribute("orders") ORDER orders,
//			@RequestParam(value = "fromDate") Date fromDate,
//			@RequestParam(value = "toDate") Date toDate
			@RequestParam(value = "searchName") String fullname, @RequestParam(value = "searchSDT") String sdt)
			throws Exception {

		String from = request.getParameter("fromDate");
		String to = request.getParameter("toDate");
		Date date = Calendar.getInstance().getTime();
		Date date1970 = new Date(11220227200L / 1000);

		Date fromDate;
		Date toDate;

		if (!to.equals("")) {
			toDate = new SimpleDateFormat("dd/MM/yyyy").parse(to);

		} else {
			toDate = date;
		}

		if (!from.equals("")) {
			fromDate = new SimpleDateFormat("dd/MM/yyyy").parse(from);
		} else {
			fromDate = date1970;
		}

		List<ORDER> list = searchOrder(fromDate, toDate, fullname, sdt);
		model.addAttribute("pagedListHolder", pagedListHolder(list, request));
		return "admin/expenses";
	}

//
	@RequestMapping(value = "{id_order}.htm", params = "linkDelete")
	public String deleteOrder(HttpServletRequest request, ModelMap model, @ModelAttribute("orders") ORDER orders,
			@PathVariable("id_order") Integer id_order) {

		Integer temp = DeleteOrder(this.getOrder(id_order));
		if (temp != 0) {
			model.addAttribute("message", "Xóa thành công");
		} else {
			model.addAttribute("message", "Xóa không thành công");
		}

		List<ORDER> list = getAllOrder();
		model.addAttribute("pagedListHolder", pagedListHolder(list, request));
//		model.addAttribute("users", list);
		return "admin/expenses";
	}

	@RequestMapping(value = "payments", method = RequestMethod.GET)
	public String payment(HttpServletRequest request, ModelMap model) {
		List<ORDER> list = getAllOrderStatus2();

		model.addAttribute("pagedListHolder", pagedListHolder(list, request));
		return "admin/payments";
	}

	@RequestMapping(value = "payments", params = "searchHD")
	public String searchOrderHDHD(HttpServletRequest request, ModelMap model, @ModelAttribute("orders") ORDER orders,
//			@RequestParam(value = "fromDate") Date fromDate,
//			@RequestParam(value = "toDate") Date toDate,
			@RequestParam(value = "searchName") String fullname, @RequestParam(value = "searchM") String ma)
			throws Exception {
		String from = request.getParameter("fromDate");
		String to = request.getParameter("toDate");
		Date date = Calendar.getInstance().getTime();
		Date date1970 = new Date(11220227200L / 1000);

		DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		Date fromDate;
		Date toDate;

		if (!to.equals("")) {
			toDate = new SimpleDateFormat("dd/MM/yyyy").parse(to);

		} else {
			toDate = date;
		}

		if (!from.equals("")) {
			fromDate = new SimpleDateFormat("dd/MM/yyyy").parse(from);
		} else {
			fromDate = date1970;
		}

		List<ORDER> list = searchOrderHD(fromDate, toDate, fullname, ma);
		model.addAttribute("pagedListHolder", pagedListHolder(list, request));
		return "admin/payments";
	}

	@RequestMapping(value = "invoices", method = RequestMethod.GET)
	public String invoices(HttpServletRequest request, ModelMap model) {

		ORDER order = getOrder(Integer.parseInt(request.getParameter("linkReceipt")));
		List<ORDER_ITEM> order_item = getAllOrder_Item_ID(Integer.parseInt(request.getParameter("linkReceipt")));
		model.addAttribute("order", order);
		model.addAttribute("order_item", order_item);
		return "admin/invoices_view";
	}

	@RequestMapping(value = "food", method = RequestMethod.GET)
	public String food(HttpServletRequest request, ModelMap model, @ModelAttribute("foods") FOOD foods) {
		Session session = factory.getCurrentSession();
		String hql = "FROM FOOD";
		Query query = session.createQuery(hql);
		List<FOOD> list = query.list();
		Integer temp;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getAMOUNT_DEFAULT() == 0) {
				list.get(i).setSTATUS(false);
				temp = ChangeStatusFood(list.get(i), false);
			}
		}
		PagedListHolder pagedListHolder = new PagedListHolder(list);
		int page = ServletRequestUtils.getIntParameter(request, "page", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);

		pagedListHolder.setPageSize(9);
		model.addAttribute("btnStatus", "btnAdd");
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "admin/invoices";
	}

	@RequestMapping(value = "food", method = RequestMethod.POST, params = "btnAdd")
	public String addFood(HttpServletRequest request, ModelMap model, @Validated @ModelAttribute("foods") FoodBean foods,
			BindingResult errors) {

		
		
		if (errors.hasErrors()) {
			model.addAttribute("btnStatus", "btnAdd");
		} else {
			FOOD f = new FOOD();
			f.setAMOUNT(foods.getAMOUNT());
			f.setAMOUNT_DEFAULT(foods.getAMOUNT_DEFAULT());
			f.setDESCRIBE(foods.getDESCRIBE());
			f.setNAME(foods.getNAME());
			f.setPRICE(foods.getPRICE());
			f.setSTATUS(foods.getSTATUS());
			if(foods.getIMAGE().isEmpty()) {
				f.setIMAGE("resources/images/icon.png");
			}else {
				try {
					String date = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyMMddHHss-"));
					String fileNamePhoto = date + foods.getIMAGE().getOriginalFilename();
					
					String photoPath = baseUploadFile.getBasePatch() + File.separator + fileNamePhoto;
					foods.getIMAGE().transferTo(new File(photoPath));
					
					Thread.sleep(1500);
					f.setIMAGE("resources/images/" + fileNamePhoto);
					
				} catch (Exception e) {
					model.addAttribute("message", "Lỗi lưu file !");
				}
			}
			
			Integer temp = this.insertFOOD(f);
			if (temp != 0) {
				model.addAttribute("message", "Thêm thành công");
			} else {
				model.addAttribute("message", "Thêm thất bại!");
			}
			model.addAttribute("foods", new FOOD());
		}
		List<FOOD> list = getAllFood();
		model.addAttribute("pagedListHolder", pagedListHolder(list, request));
		model.addAttribute("btnStatus", "btnAdd");
		return "admin/invoices";
	}

	int id_foodTemp = 0;

	@RequestMapping(value = "{id_food}.htm", params = "linkEditFood")
	public String editFood(HttpServletRequest request, ModelMap model, @ModelAttribute("foods") FOOD foods,
			 @PathVariable("id_food") Integer id_food) {

		id_foodTemp = id_food;
		List<FOOD> list = getAllFood();
		model.addAttribute("btnStatus", "btnEdit");
		model.addAttribute("foods", this.getFood(id_food));
		model.addAttribute("pagedListHolder", pagedListHolder(list, request));
		return "admin/invoices";
	}

	@RequestMapping(value = "food", method = RequestMethod.POST, params = "btnEdit")
	public String edit_Food(HttpServletRequest request, ModelMap model,@Validated @ModelAttribute("foods") FoodBean foods, BindingResult errors) {

		if (errors.hasErrors()) {
			model.addAttribute("btnStatus", "btnEdit");
		}else {
			FOOD f = new FOOD();
			f.setID_FOOD(id_foodTemp);
			f.setAMOUNT(foods.getAMOUNT());
			f.setAMOUNT_DEFAULT(foods.getAMOUNT_DEFAULT());
			f.setDESCRIBE(foods.getDESCRIBE());
			f.setNAME(foods.getNAME());
			f.setPRICE(foods.getPRICE());
			f.setSTATUS(foods.getSTATUS());
			if(foods.getIMAGE().isEmpty()) {
				f.setIMAGE("resources/images/icon.png");
			}else {
				try {
					String date = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyMMddHHss-"));
					String fileNamePhoto = date + foods.getIMAGE().getOriginalFilename();
					
					String photoPath = baseUploadFile.getBasePatch() + File.separator + fileNamePhoto;
					foods.getIMAGE().transferTo(new File(photoPath));
					
					Thread.sleep(500);
					f.setIMAGE("resources/images/" + fileNamePhoto);
					
				} catch (Exception e) {
					model.addAttribute("message", "Lỗi lưu file !");
				}
			}
			
			Integer temp = updateFood(f);
			if (temp != 0) {
				model.addAttribute("message", "Update thành công");
			} else {
				model.addAttribute("message", "Update thất bại!");
			}
			model.addAttribute("foods", new FOOD());
			model.addAttribute("btnStatus", "btnAdd");
		}
		
		List<FOOD> list = getAllFood();
		model.addAttribute("pagedListHolder", pagedListHolder(list, request));
		id_foodTemp = 0;

		return "admin/invoices";
	}

	@RequestMapping(value = "{id_food}.htm", params = "linkDeleteFood")
	public String deleteFood(HttpServletRequest request, ModelMap model, @ModelAttribute("foods") FOOD foods,
			@PathVariable("id_food") Integer id_food) {

		Integer temp = this.deleteFoodFood(this.getFood(id_food));

		if (temp != 0) {
			model.addAttribute("message", "Delete thành công");
		} else {
			model.addAttribute("message", "Delete thất bại!");
		}

		List<FOOD> list = getAllFood();
		model.addAttribute("pagedListHolder", pagedListHolder(list, request));

		return "admin/invoices";
	}

	@RequestMapping(value = "{id_food}.htm", params = "linkStatusFood0")
	public String ChangeStatusFood0(HttpServletRequest request, ModelMap model, @ModelAttribute("foods") FOOD foods,
			@PathVariable("id_food") Integer id_food) {

		Integer temp = ChangeStatusFood(getFood(id_food), false);
		if (temp != 0) {
			model.addAttribute("message", "Xóa thành công");
		} else {
			model.addAttribute("message", "Xóa không thành công");
		}

		List<FOOD> list = getAllFood();
		model.addAttribute("pagedListHolder", pagedListHolder(list, request));

		return "admin/invoices";
	}

	@RequestMapping(value = "{id_food}.htm", params = "linkStatusFood1")
	public String ChangeStatusFood1(HttpServletRequest request, ModelMap model, @ModelAttribute("foods") FOOD foods,
			@PathVariable("id_food") Integer id_food) {

		Integer temp = ChangeStatusFood(getFood(id_food), true);
		if (temp != 0) {
			model.addAttribute("message", "Xóa thành công");
		} else {
			model.addAttribute("message", "Xóa không thành công");
		}

		List<FOOD> list = getAllFood();
		model.addAttribute("pagedListHolder", pagedListHolder(list, request));

		return "admin/invoices";
	}

	@RequestMapping(value = "food.htm", params = "btnsearchFood")
	public String searchFoodFood(HttpServletRequest request, ModelMap model, @ModelAttribute("foods") FOOD foods) {

		List<FOOD> list = searchFood(request.getParameter("searchName"), request.getParameter("searchSDT"),
				request.getParameter("searchTT"));

		model.addAttribute("pagedListHolder", pagedListHolder(list, request));
//		model.addAttribute("accounts", list);

		return "admin/invoices";
	}

	@RequestMapping(value = "{id_food}.htm", params = "btnsearchFood")
	public String searchFoodFoodId(HttpServletRequest request, ModelMap model, @ModelAttribute("foods") FOOD foods) {

		List<FOOD> list = searchFood(request.getParameter("searchName"), request.getParameter("searchSDT"),
				request.getParameter("searchTT"));

		model.addAttribute("pagedListHolder", pagedListHolder(list, request));
//		model.addAttribute("accounts", list);

		return "admin/invoices";
	}

	// FeedBack
	@RequestMapping(value = "feedback", method = RequestMethod.GET)
	public String feedback(HttpServletRequest request, ModelMap model,
			@ModelAttribute("feedbacks") FEEDBACK feedbacks) {
		Session session = factory.getCurrentSession();
		String hql = "FROM FEEDBACK";
		Query query = session.createQuery(hql);
		List<FEEDBACK> list = query.list();

		PagedListHolder pagedListHolder = new PagedListHolder(list);
		int page = ServletRequestUtils.getIntParameter(request, "page", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);

		model.addAttribute("pagedListHolder", pagedListHolder);
		return "admin/feedback";
	}

	@RequestMapping(value = "{id_feedback}.htm", params = "linkDeleteFeedBack")
	public String deleteFeedback(HttpServletRequest request, ModelMap model,
			@ModelAttribute("feedbacks") FEEDBACK feedbacks, @PathVariable("id_feedback") Integer id_feedback) {

		Integer temp = this.DeleteFeedBack(getFeedBack(id_feedback));

		if (temp != 0) {
			model.addAttribute("message", "Delete thành công");
		} else {
			model.addAttribute("message", "Delete thất bại!");
		}

		List<FEEDBACK> list = getAllFeedBack();
		model.addAttribute("pagedListHolder", pagedListHolder(list, request));

		return "admin/feedback";
	}

	@RequestMapping(value = "feedback", params = "searchFB")
	public String searchFBFB(HttpServletRequest request, ModelMap model, @ModelAttribute("orders") ORDER orders,
//			@RequestParam(value = "fromDate") Date fromDate,
//			@RequestParam(value = "toDate") Date toDate,
			@RequestParam(value = "searchName") String fullname) throws Exception {
		String from = request.getParameter("fromDate");
		String to = request.getParameter("toDate");
		Date date = Calendar.getInstance().getTime();
		Date date1970 = new Date(11220227200L / 1000);

		DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		Date fromDate;
		Date toDate;

		if (!to.equals("")) {
			toDate = new SimpleDateFormat("dd/MM/yyyy").parse(to);

		} else {
			toDate = date;
		}

		if (!from.equals("")) {
			fromDate = new SimpleDateFormat("dd/MM/yyyy").parse(from);
		} else {
			fromDate = date1970;
		}

		List<FEEDBACK> list = searchFB(fromDate, toDate, fullname);
		model.addAttribute("pagedListHolder", pagedListHolder(list, request));
		return "admin/feedback";
	}

	@RequestMapping(value = "{id_feedback}.htm", params = "searchFB")
	public String searchFBFBB(HttpServletRequest request, ModelMap model, @ModelAttribute("orders") ORDER orders,
//			@RequestParam(value = "fromDate") Date fromDate,
//			@RequestParam(value = "toDate") Date toDate,
			@RequestParam(value = "searchName") String fullname) throws Exception {
		String from = request.getParameter("fromDate");
		String to = request.getParameter("toDate");
		Date date = Calendar.getInstance().getTime();
		Date date1970 = new Date(11220227200L / 1000);

		DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		Date fromDate;
		Date toDate;

		if (!to.equals("")) {
			toDate = new SimpleDateFormat("dd/MM/yyyy").parse(to);

		} else {
			toDate = date;
		}

		if (!from.equals("")) {
			fromDate = new SimpleDateFormat("dd/MM/yyyy").parse(from);
		} else {
			fromDate = date1970;
		}

		List<FEEDBACK> list = searchFB(fromDate, toDate, fullname);
		model.addAttribute("pagedListHolder", pagedListHolder(list, request));
		return "admin/feedback";
	}
////User
	public Integer ChangeIsActive(ACCOUNT user, boolean status) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			user.setIS_ACTIVE(status);
			session.update(user);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	public ROLE  getRole(int id_role) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ROLE where ID_ROLE = :ID_ROLE";
		Query query = session.createQuery(hql);
		query.setParameter("ID_ROLE", id_role);
		ROLE role = (ROLE) query.list().get(0);

		return role;
	}
	
	public Integer ChangeIsRole(ACCOUNT user, int role) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		ROLE newRole = getRole(role);
		
		try {
			user.setRole(newRole);
			session.update(user);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	
	public List<ACCOUNT> getAllUsers() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ACCOUNT";
		Query query = session.createQuery(hql);
		List<ACCOUNT> list = query.list();

		return list;
	}

	public ACCOUNT getUser(String id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ACCOUNT where ID_ACCOUNT = :ID_ACCOUNT";
		Query query = session.createQuery(hql);
		query.setParameter("ID_ACCOUNT", Integer.parseInt(id));
		ACCOUNT user = (ACCOUNT) query.list().get(0);

		return user;
	}

	public List<ACCOUNT> searchUser(String fullname, String SDT, String id_role) {
		Session session = factory.getCurrentSession();
		if (!id_role.equals("")) {
			String hql = "FROM ACCOUNT where NAME LIKE :NAME and PHONE_NUMBER LIKE :PHONE_NUMBER and ID_ROLE LIKE :ID_ROLE";
			Query query = session.createQuery(hql);
			query.setParameter("NAME", "%" + fullname + "%");
			query.setParameter("PHONE_NUMBER", "%" + SDT + "%");
			query.setParameter("ID_ROLE", Integer.parseInt(id_role));
			List<ACCOUNT> list = query.list();
			return list;
		} else {
			String hql = "FROM ACCOUNT where NAME LIKE :NAME and PHONE_NUMBER LIKE :PHONE_NUMBER";
			Query query = session.createQuery(hql);
			query.setParameter("NAME", "%" + fullname + "%");
			query.setParameter("PHONE_NUMBER", "%" + SDT + "%");
			List<ACCOUNT> list = query.list();
			return list;
		}
	}

	public PagedListHolder pagedListHolder(List list, HttpServletRequest request) {
		PagedListHolder pagedListHolder = new PagedListHolder(list);
		int page = ServletRequestUtils.getIntParameter(request, "page", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);

		pagedListHolder.setPageSize(9);

		return pagedListHolder;
	}

//	// order
	public Integer ChangeStatus(ORDER order, byte status) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			order.setSTATUS(status);
			session.update(order);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public Integer DeleteOrder(ORDER order) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		if (order.getSTATUS() == 2) {
			return 0;
		} else {
			try {
				session.delete(order);
				t.commit();
			} catch (Exception e) {
				t.rollback();
				return 0;
			} finally {
				session.close();
			}
			return 1;
		}
	}

	public List<ORDER> getAllOrder() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ORDER";
		Query query = session.createQuery(hql);
		List<ORDER> list = query.list();

		return list;
	}

	public ORDER getOrder(Integer id_order) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ORDER where ID_ORDER = :id_order";
		Query query = session.createQuery(hql);
		query.setParameter("id_order", id_order);
		ORDER order = (ORDER) query.list().get(0);

		return order;
	}

	public List<ORDER> searchOrder(@DateTimeFormat(pattern = "yyyy-MM-dd") Date from,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date to, String fullname, String sdt) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ORDER od where (od.accountOrder.NAME LIKE :fullname) and (od.accountOrder.PHONE_NUMBER LIKE :PHONE_NUMBER) and (od.DATE_TIME BETWEEN :from AND :to)";
		Query query = session.createQuery(hql);
		query.setParameter("fullname", "%" + fullname + "%");
		query.setParameter("PHONE_NUMBER", "%" + sdt + "%");
		query.setParameter("from", from);
		query.setParameter("to", to);
		List<ORDER> list = query.list();
		return list;
	}

//
////thong ke
	public Double searchNT(@DateTimeFormat(pattern = "yyyy-MM-dd") Date from,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date to) {
		Session session = factory.getCurrentSession();
		String hql = "select sum(od.TOTAL_PRICE) FROM ORDER od where od.DATE_TIME BETWEEN :from AND :to AND od.STATUS = 2";
		Query query = session.createQuery(hql);
		query.setParameter("from", from);
		query.setParameter("to", to);
		List listResult = query.list();

		Double sum = 0.0;
		if (listResult.get(0) == null) {
			sum = 0.0;
		} else {
			sum = (Double) listResult.get(0);

		}
		return sum;
	}

	public Long searchNSDH(@DateTimeFormat(pattern = "yyyy-MM-dd") Date from,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date to) {
		Session session = factory.getCurrentSession();
		String hql = "select count(ID_ORDER) FROM ORDER od where od.DATE_TIME BETWEEN :from AND :to AND od.STATUS = 2";
		Query query = session.createQuery(hql);
		query.setParameter("from", from);
		query.setParameter("to", to);
		List listResult = query.list();

		Long count = (long) 0;
		if (listResult.get(0) == null) {
			count = (long) 0;
		} else {
			count = (Long) listResult.get(0);

		}

		return count;
	}
	
	public Long searchNSTDH(@DateTimeFormat(pattern = "yyyy-MM-dd") Date from,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date to) {
		Session session = factory.getCurrentSession();
		String hql = "select count(ID_ORDER) FROM ORDER od where od.DATE_TIME BETWEEN :from AND :to";
		Query query = session.createQuery(hql);
		query.setParameter("from", from);
		query.setParameter("to", to);
		List listResult = query.list();

		Long count = (long) 0;
		if (listResult.get(0) == null) {
			count = (long) 0;
		} else {
			count = (Long) listResult.get(0);

		}

		return count;
	}

	public Long searchFBTN(@DateTimeFormat(pattern = "yyyy-MM-dd") Date from,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date to) {
		Session session = factory.getCurrentSession();
		String hql = "select count(ID_FEEDBACK) FROM FEEDBACK fb where fb.DATE_TIME BETWEEN :from AND :to";
		Query query = session.createQuery(hql);
		query.setParameter("from", from);
		query.setParameter("to", to);
		List listResult = query.list();

		Long count = (long) 0;
		if (listResult.get(0) == null) {
			count = (long) 0;
		} else {
			count = (Long) listResult.get(0);

		}

		return count;
	}

	public Double searchT(@DateTimeFormat(pattern = "yyyy-MM-dd") Date from,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date to) {
		Session session = factory.getCurrentSession();
		String hql = "select sum(od.TOTAL_PRICE) FROM ORDER od where od.DATE_TIME BETWEEN :from AND :to AND od.STATUS = 2";
		Query query = session.createQuery(hql);
		query.setParameter("from", from);
		query.setParameter("to", to);
		List listResult = query.list();

		Double sum = 0.0;
		if (listResult.get(0) == null) {
			sum = 0.0;
		} else {
			sum = (Double) listResult.get(0);

		}

		return sum;
	}

	public Long searchTSDH(@DateTimeFormat(pattern = "yyyy-MM-dd") Date from,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date to) {
		Session session = factory.getCurrentSession();
		String hql = "select count(ID_ORDER) FROM ORDER od where od.DATE_TIME BETWEEN :from AND :to AND od.STATUS = 2";
		Query query = session.createQuery(hql);
		query.setParameter("from", from);
		query.setParameter("to", to);
		List listResult = query.list();

		Long sum = (long) 0;
		if (listResult.get(0) == null) {
			sum = (long) 0;
		} else {
			sum = (Long) listResult.get(0);

		}
		return sum;
	}

	public List<ACCOUNT> searchUser2() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ACCOUNT where ID_ROLE = :ID_ROLE AND IS_ACTIVE= :IS_ACTIVE";
		Query query = session.createQuery(hql);
		query.setParameter("ID_ROLE", 2);
		query.setParameter("IS_ACTIVE", true);
		List<ACCOUNT> list = query.list();

		return list;
	}
	
	public Long searchFoodTrue() {
		Session session = factory.getCurrentSession();
		String hql = "select count(ID_FOOD) FROM FOOD f where f.STATUS = true";
		Query query = session.createQuery(hql);
		List listResult = query.list();

		Long count = (long) 0;
		if (listResult.get(0) == null) {
			count = (long) 0;
		} else {
			count = (Long) listResult.get(0);

		}

		return count;
	}

//	public List<Order> searchOrder1(String fullname) {
//		Session session = factory.getCurrentSession();
//		String hql = "from Order od where od.users.fullname LIKE :fullname";
//		Query query = session.createQuery(hql);
//		query.setParameter("fullname", "%" + fullname + "%");
//		List<Order> list = query.list();
//		return list;
//	}
//
//	// Payment
	public List<ORDER> getAllOrderStatus2() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ORDER where STATUS = 2";
		Query query = session.createQuery(hql);
		List<ORDER> list = query.list();

		return list;
	}

	public List<ORDER_ITEM> getAllOrder_Item_ID(Integer id_order) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ORDER_ITEM od where od.order.ID_ORDER=:ID_ORDER ";
		Query query = session.createQuery(hql);
		query.setParameter("ID_ORDER", id_order);
		List<ORDER_ITEM> list = query.list();

		return list;
	}

	public List<ORDER> searchOrderHD(@DateTimeFormat(pattern = "yyyy-MM-dd") Date from,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date to, String fullname, String ma) {
		Session session = factory.getCurrentSession();
		if (!ma.equals("")) {
			String hql = "FROM ORDER od where od.accountOrder.NAME LIKE :fullname and od.ID_ORDER= :ID_ORDER and od.DATE_TIME BETWEEN :from AND :to and od.STATUS=2";
			Query query = session.createQuery(hql);
			query.setParameter("from", from);
			query.setParameter("to", to);
			query.setParameter("fullname", "%" + fullname + "%");
			query.setParameter("ID_ORDER", Integer.parseInt(ma));
			List<ORDER> list = query.list();
			return list;
		} else {
			String hql = "FROM ORDER od where od.accountOrder.NAME LIKE :fullname and od.DATE_TIME BETWEEN :from AND :to and od.STATUS=2";
			Query query = session.createQuery(hql);
			query.setParameter("from", from);
			query.setParameter("to", to);
			query.setParameter("fullname", "%" + fullname + "%");
			List<ORDER> list = query.list();
			return list;
		}

	}

	// Food
	public Integer insertFOOD(FOOD food) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(food);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public Integer deleteFoodFood(FOOD food) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.delete(food);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public Integer updateFood(FOOD food) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.update(food);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public List<FOOD> getAllFood() {
		Session session = factory.getCurrentSession();
		String hql = "FROM FOOD";
		Query query = session.createQuery(hql);
		List<FOOD> list = query.list();

		return list;
	}

	public FOOD getFood(Integer id_food) {
		Session session = factory.getCurrentSession();
		String hql = "FROM FOOD where ID_FOOD = :id_food";
		Query query = session.createQuery(hql);
		query.setParameter("id_food", id_food);
		FOOD food = (FOOD) query.list().get(0);

		return food;
	}

	public Integer ChangeStatusFood(FOOD food, boolean status) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			food.setSTATUS(status);
			session.update(food);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public List<FOOD> searchFood(String name, String SDT, String status) {
		Session session = factory.getCurrentSession();
		if (!status.equals("")) {
			String hql = "FROM FOOD where NAME LIKE :NAME and STATUS LIKE :STATUS";
			Query query = session.createQuery(hql);
			query.setParameter("NAME", "%" + name + "%");
			query.setParameter("STATUS", Boolean.parseBoolean(status));
			List<FOOD> list = query.list();
			return list;
		} else {
			String hql = "FROM FOOD where NAME LIKE :NAME";
			Query query = session.createQuery(hql);
			query.setParameter("NAME", "%" + name + "%");
			List<FOOD> list = query.list();
			return list;
		}
	}

	@ModelAttribute("status")
	public Map<Boolean, String> getStatus() {
		Map<Boolean, String> status = new HashMap<>();
		status.put(true, "MỞ BÁN");
		status.put(false, "KHÔNG MỞ BÁN");
		return status;
	}

//	@ModelAttribute("images")
//	public List<IMAGE> getImage() {
//		Session session = factory.getCurrentSession();
//		String hql = "FROM IMAGE";
//		Query query = session.createQuery(hql);
//		List<IMAGE> list = query.list();
//		return list;
//	}

	// Feedback
	public Integer DeleteFeedBack(FEEDBACK feedback) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(feedback);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public List<FEEDBACK> getAllFeedBack() {
		Session session = factory.getCurrentSession();
		String hql = "FROM FEEDBACK";
		Query query = session.createQuery(hql);
		List<FEEDBACK> list = query.list();

		return list;
	}

	public FEEDBACK getFeedBack(Integer id_feedback) {
		Session session = factory.getCurrentSession();
		String hql = "FROM FEEDBACK where ID_FEEDBACK = :id_feedback";
		Query query = session.createQuery(hql);
		query.setParameter("id_feedback", id_feedback);
		FEEDBACK feedback = (FEEDBACK) query.list().get(0);

		return feedback;
	}

	public List<FEEDBACK> searchFB(@DateTimeFormat(pattern = "yyyy-MM-dd") Date from,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date to, String fullname) {
		Session session = factory.getCurrentSession();
		String hql = "FROM FEEDBACK fb where fb.accountFeed.NAME LIKE :fullname and fb.DATE_TIME BETWEEN :from AND :to";
		Query query = session.createQuery(hql);
		query.setParameter("fullname", "%" + fullname + "%");
		query.setParameter("from", from);
		query.setParameter("to", to);
		List<FEEDBACK> list = query.list();
		return list;
	}

	// order by
	public Long searchSLMATN(@DateTimeFormat(pattern = "yyyy-MM-dd") Date from,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date to) {
		Session session = factory.getCurrentSession();
		String hql = "select count(QUANTITY) FROM ORDER_ITEM od where od.order.DATE_TIME BETWEEN :from AND :to";
		Query query = session.createQuery(hql);
		query.setParameter("from", from);
		query.setParameter("to", to);
		List listResult = query.list();

		Long count = (long) 0;
		if (listResult.get(0) == null) {
			count = (long) 0;
		} else {
			count = (Long) listResult.get(0);

		}

		return count;
	}
	
	public Long searchSumFoodT(@DateTimeFormat(pattern = "yyyy-MM-dd") Date from,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date to) {
		System.out.println(from);
		System.out.println(to);
		Session session = factory.getCurrentSession();
		String hql = "select sum(od.QUANTITY) FROM ORDER_ITEM od where od.order.DATE_TIME BETWEEN :from AND :to and od.order.STATUS = 2";
		Query query = session.createQuery(hql);
		query.setParameter("from", from);
		query.setParameter("to", to);
		List listResult = query.list();

		Long count = (long) 0;
		if (listResult.get(0) == null) {
			count = (long) 0;
		} else {
			count = (Long) listResult.get(0);
		}
		return count;
	}
	
	public Long searchSumFoodFoodT(@DateTimeFormat(pattern = "yyyy-MM-dd") Date from,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date to) {

		Session session = factory.getCurrentSession();
		String hql = "select COUNT(od.foodOrderItem.NAME) FROM ORDER_ITEM od where od.order.DATE_TIME BETWEEN :from AND :to and od.order.STATUS = 2 group by od.foodOrderItem.NAME order by SUM(QUANTITY) DESC";
		Query query = session.createQuery(hql);
		query.setParameter("from", from);
		query.setParameter("to", to);
		List listResult = query.list();

		Long count = (long) 0;
		if (listResult.get(0) == null) {
			count = (long) 0;
		} else {
			count = (Long) listResult.get(0);
		}
		return count;
	}
	
	public List<Object[]> searchSumFoodIDT(@DateTimeFormat(pattern = "yyyy-MM-dd") Date from,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date to) {
		Session session = factory.getCurrentSession();
		String hql = "select od.foodOrderItem.NAME, COUNT(od.foodOrderItem.NAME), SUM(QUANTITY) FROM ORDER_ITEM od where od.order.DATE_TIME BETWEEN :from AND :to and od.order.STATUS = 2 group by od.foodOrderItem.NAME order by SUM(QUANTITY) DESC";
		Query query = session.createQuery(hql);
		query.setParameter("from", from);
		query.setParameter("to", to);
		query.setFirstResult(0);
		query.setMaxResults(5);
		List<Object[]> listResult = query.list();
		
		return listResult;
	}
}
