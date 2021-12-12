//package ptithcm.controller;
//
//import java.text.SimpleDateFormat;
//import java.util.Calendar;
//import java.util.Date;
//import java.util.List;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.hibernate.Query;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.Transaction;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.support.PagedListHolder;
//import org.springframework.format.annotation.DateTimeFormat;
//import org.springframework.stereotype.Controller;
//import org.springframework.transaction.annotation.Transactional;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.ServletRequestUtils;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import ptithcm.entity.Order;
//
//@Transactional
//@Controller
//@RequestMapping("/history/")
//public class HistoryOrderController {
//	@Autowired
//	SessionFactory factory;
//
//	@RequestMapping(value = "order", method = RequestMethod.GET)
//	public String history(HttpServletRequest request, ModelMap model) {
//		List<Order> list = getAllOrder("PS03690");
//
//		model.addAttribute("pagedListHolder", pagedListHolder(list, request));
//		return "user/history";
//	}
//
//	@RequestMapping(value = "order", params = "search")
//	public String searchOrderUser(HttpServletRequest request, ModelMap model,
//			@RequestParam(value = "searchStatus") String status) throws Exception {
//		String from = request.getParameter("fromDate");
//		String to = request.getParameter("toDate");
//		Date date = Calendar.getInstance().getTime();
//		Date date1970 = new Date(11220227200L / 1000);
//
//		Date fromDate;
//		Date toDate;
//
//		if (!to.equals("")) {
//			toDate = new SimpleDateFormat("dd/MM/yyyy").parse(to);
//
//		} else {
//			toDate = date;
//		}
//
//		if (!from.equals("")) {
//			fromDate = new SimpleDateFormat("dd/MM/yyyy").parse(from);
//		} else {
//			fromDate = date1970;
//		}
//
//		List<Order> list = searchOrderStatus(fromDate, toDate, status, "PS03690");
//		model.addAttribute("pagedListHolder", pagedListHolder(list, request));
//		return "user/history";
//	}
//
//	@RequestMapping(value = "{id_order}.htm", params = "linkStatus0")
//	public String ChangeStatus0(HttpServletRequest request, ModelMap model, @ModelAttribute("orders") Order orders,
//			@PathVariable("id_order") Integer id_order) {
//
//		Integer temp = ChangeStatus(this.getOrder(id_order), 0);
//		if (temp != 0) {
//			model.addAttribute("message", "Xóa thành công");
//		} else {
//			model.addAttribute("message", "Xóa không thành công");
//		}
//
//		List<Order> list = getAllOrder("PS03690");
//		model.addAttribute("pagedListHolder", pagedListHolder(list, request));
////		model.addAttribute("users", list);
//		return "user/history";
//	}
//
//	@RequestMapping(value = "{id_order}.htm", params = "linkStatus1")
//	public String ChangeStatus1(HttpServletRequest request, ModelMap model, @ModelAttribute("orders") Order orders,
//			@PathVariable("id_order") Integer id_order) {
//
//		Integer temp = ChangeStatus(this.getOrder(id_order), 1);
//		if (temp != 0) {
//			model.addAttribute("message", "Xóa thành công");
//		} else {
//			model.addAttribute("message", "Xóa không thành công");
//		}
//
//		List<Order> list = getAllOrder("PS03690");
//		model.addAttribute("pagedListHolder", pagedListHolder(list, request));
////		model.addAttribute("users", list);
//		return "user/history";
//	}
//
//	@RequestMapping(value = "{id_order}.htm", params = "linkStatus2")
//	public String ChangeStatus2(HttpServletRequest request, ModelMap model, @ModelAttribute("orders") Order orders,
//			@PathVariable("id_order") Integer id_order) {
//
//		Integer temp = ChangeStatus(this.getOrder(id_order), 2);
//		if (temp != 0) {
//			model.addAttribute("message", "Xóa thành công");
//		} else {
//			model.addAttribute("message", "Xóa không thành công");
//		}
//
//		List<Order> list = getAllOrder("PS03690");
//		model.addAttribute("pagedListHolder", pagedListHolder(list, request));
////		model.addAttribute("users", list);
//		return "user/history";
//	}
//
//	public PagedListHolder pagedListHolder(List list, HttpServletRequest request) {
//		PagedListHolder pagedListHolder = new PagedListHolder(list);
//		int page = ServletRequestUtils.getIntParameter(request, "page", 0);
//		pagedListHolder.setPage(page);
//		pagedListHolder.setMaxLinkedPages(5);
//
//		pagedListHolder.setPageSize(5);
//
//		return pagedListHolder;
//	}
//
//	public List<Order> getAllOrder(String id) {
//		Session session = factory.getCurrentSession();
//		String hql = "FROM Order od where od.users.id = :id";
//		Query query = session.createQuery(hql);
//		query.setParameter("id", id);
//		List<Order> list = query.list();
//
//		return list;
//	}
//
//	public List<Order> searchOrderStatus(@DateTimeFormat(pattern = "yyyy-MM-dd") Date from,
//			@DateTimeFormat(pattern = "yyyy-MM-dd") Date to, String status, String id) {
//		if (!status.equals("")) {
//			Session session = factory.getCurrentSession();
//			String hql = "from Order od where (od.status =:status) and (od.date_time BETWEEN :from AND :to) and od.users.id = :id";
//			Query query = session.createQuery(hql);
//			query.setParameter("status", Integer.parseInt(status));
//			query.setParameter("from", from);
//			query.setParameter("to", to);
//			query.setParameter("id", id);
//			List<Order> list = query.list();
//			return list;
//		} else {
//			Session session = factory.getCurrentSession();
//			String hql = "from Order od where od.date_time BETWEEN :from AND :to and od.users.id = :id";
//			Query query = session.createQuery(hql);
//			query.setParameter("from", from);
//			query.setParameter("to", to);
//			query.setParameter("id", id);
//			List<Order> list = query.list();
//			return list;
//		}
//
//	}
//
//	public Integer ChangeStatus(Order order, int status) {
//		Session session = factory.openSession();
//		Transaction t = session.beginTransaction();
//		if (status == 2) {
//			return 0;
//		} else {
//			try {
//				order.setStatus(status);
//				session.update(order);
//				t.commit();
//			} catch (Exception e) {
//				t.rollback();
//				return 0;
//			} finally {
//				session.close();
//			}
//			return 1;
//		}
//	}
//
//	public Order getOrder(Integer id_order) {
//		Session session = factory.getCurrentSession();
//		String hql = "FROM Order where id_order = :id_order";
//		Query query = session.createQuery(hql);
//		query.setParameter("id_order", id_order);
//		Order order = (Order) query.list().get(0);
//
//		return order;
//	}
//}
