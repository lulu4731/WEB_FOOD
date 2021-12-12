package ptithcm.controller;

//import java.io.Console;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
//import java.util.Base64;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

//import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sun.tracing.dtrace.Attributes;

import ptithcm.bean.Feedback;
import ptithcm.bean.Mailer;
import ptithcm.bean.MailerContent;
import ptithcm.bean.UserForgot;
import ptithcm.bean.UserLogin;
import ptithcm.bean.UserPassword;
import ptithcm.bean.UserSignup;
import ptithcm.entity.ACCOUNT;
import ptithcm.entity.CART;
import ptithcm.entity.FEEDBACK;
import ptithcm.entity.FOOD;
import ptithcm.entity.ORDER;
import ptithcm.entity.ORDER_ITEM;
import ptithcm.entity.ROLE;

@Transactional
@Controller
public class UserController {
	@Autowired
	SessionFactory factory;

	/* phần xử lý tài khoản */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(ModelMap model, @ModelAttribute("user") UserLogin user, HttpSession ss)
			throws NoSuchAlgorithmException {

		ACCOUNT account = getAccountByEmail(user.getEmail());
		if (account == null) {
			ss.setAttribute("hasMess", true);
			ss.setAttribute("message", "email hoặc mật khẩu của bạn không đúng!");
			return "redirect:/";
		} else {
			if (hash(user.getPassword()).equals(account.getPASSWORD().trim())) {
				ss.setAttribute("email", account.getEMAIL());
				ss.setAttribute("role", account.getRole().getID_ROLE());
				ss.setAttribute("name", account.getNAME());
				ss.setAttribute("isActive", account.getIS_ACTIVE());
				ss.setAttribute("idAccount", account.getID_ACCOUNT());
				if (account.getRole().getID_ROLE() < 3) {
					return "redirect:/admin/manage.htm";
				} else {
					return "redirect:/";
				}
			} else {
				ss.setAttribute("hasMess", true);
				ss.setAttribute("message", "email hoặc mật khẩu của bạn không đúng!");
				return "redirect:/";
			}
		}
	}

	@RequestMapping("/logout")
	public String logout(HttpSession ss) {
		ss.removeAttribute("email");
		ss.removeAttribute("role");
		ss.removeAttribute("name");
		ss.removeAttribute("isActive");
		ss.removeAttribute("idAccount");
		return "redirect:/";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String register(@Validated @ModelAttribute("user") UserSignup user, BindingResult err, ModelMap model,
			HttpSession ss) throws NoSuchAlgorithmException {
		if (err.hasErrors()) {
			model.addAttribute("message", "Vui lòng kiểm tra lại");
		} else {
			ACCOUNT account = getAccountByEmail(user.getEmail());

			if (account == null) {
				ACCOUNT acc = new ACCOUNT();
				acc.setADDRESS(user.getAddress());
				acc.setCARD_NUMBER(user.getCard());
				acc.setEMAIL(user.getEmail());
				acc.setPASSWORD(hash(user.getPassword()));
				acc.setNAME(user.getName());
				acc.setIS_ACTIVE(true);
				acc.setPHONE_NUMBER(user.getPhone());
				ROLE role = new ROLE();
				role.setID_ROLE(3);
				acc.setRole(role);
				insertAccount(acc);

				// tao session
				ss.setAttribute("email", acc.getEMAIL());
				ss.setAttribute("role", acc.getRole().getID_ROLE());
				ss.setAttribute("name", acc.getNAME());
				ss.setAttribute("isActive", acc.getIS_ACTIVE());
				ss.setAttribute("idAccount", acc.getID_ACCOUNT());
				return "redirect:/";
			} else {
				System.out.println(account.getNAME());
				model.addAttribute("message", "Email đã có tài khoản!");
			}

		}
		return "user/signup";
	}

	@RequestMapping("/signup")
	public String signup(@ModelAttribute("user") UserSignup user) {

		return "user/signup";
	}

	@RequestMapping("/forgot-password")
	public String forgotPassword(ModelMap model, @ModelAttribute("user") UserForgot user) {
		model.addAttribute("hasCode", false);
		return "user/forgotPassword";
	}

	@Autowired
	Mailer mailer;
	MailerContent mailerContent;

	@RequestMapping(value = "/forgot-password", method = RequestMethod.POST)
	public String sendCode(@ModelAttribute("user") UserForgot user, ModelMap model, HttpSession ss)
			throws NoSuchAlgorithmException {
		ACCOUNT account = getAccountByEmail(user.getEmail());
		if (account == null) {
			model.addAttribute("message", "Sai email. Vui lòng kiểm tra lại");
		} else {
			Random random = new Random();
			String code = "";
			for (int i = 0; i < 6; i++) {
				code += random.nextInt(10);
			}

			// gửi mail
			try {
				System.out.println(user.getEmail());
				mailer.send("dangnguyen0401@gmail.com", user.getEmail(), "Lấy lại mật khẩu của của hàng Resto",
						"Mã xác nhận của bạn là: " + code + " .Vui lòng nhập code để đổi lại mật khẩu");
				model.addAttribute("message", "Đã gửi email!");
				model.addAttribute("hasCode", true);
				model.addAttribute("email", user.getEmail());
				ss.setAttribute("email", user.getEmail());

			} catch (Exception e) {
				System.out.println("Gá»­i email tháº¥t báº¡i !");
			}

			// lưu code đã được mã hóa vào database
			account.setCODE(hash(code));
			updateAccount(account);
		}

		return "user/forgotPassword";
	}

	@RequestMapping(value = "/confirm", method = RequestMethod.POST)
	public String confirm(@ModelAttribute("user") UserForgot user, HttpSession ss, ModelMap model, 
			@ModelAttribute("password") UserPassword password)
			throws NoSuchAlgorithmException {
		System.out.println(ss.getAttribute("email"));
		System.out.println(user.getCode());
		ACCOUNT account = getAccountByEmail((String) ss.getAttribute("email"));
		String encode = hash(user.getCode());
		if (account.getCODE().trim().equals(encode)) {
			// tao session
			ss.setAttribute("email", account.getEMAIL());
			ss.setAttribute("role", account.getRole().getID_ROLE());
			ss.setAttribute("name", account.getNAME());
			ss.setAttribute("isActive", account.getIS_ACTIVE());
			ss.setAttribute("idAccount", account.getID_ACCOUNT());
			return "user/changePassword";
		} else {
			model.addAttribute("hasCode", true);
			model.addAttribute("message", "Bạn đã nhập sai code");
			return "user/forgotPassword";
		}
	}

	@RequestMapping("/change-password")
	public String changePassword(@ModelAttribute("password") UserPassword password) {
		return "user/changePassword";
	}

	@RequestMapping(value = "/update-password", method = RequestMethod.POST)
	public String updatePassword(@Validated @ModelAttribute("password") UserPassword password, BindingResult err,
			ModelMap model, HttpSession ss) {
		if (ss.getAttribute("idAccount") == null) {
			return "redirect:/";
		}
		if (err.hasErrors()) {
			model.addAttribute("message", "Vui lòng kiểm tra lại");
			return "user/changePassword";
		} else if (password.getPassword().equals(password.getRePassword())) {
			return "redirect:/";
		} else {
			model.addAttribute("message", "Mật khẩu nhập lại không trùng nhau");
			return "user/changePassword";
		}
	}

	/* phần xử lý giỏ hàng */
	@RequestMapping("/remove_cart")
	public String removeCart(HttpSession ss, @RequestParam("id_food") int idFood) {
		if (ss.getAttribute("idAccount") == null) {
			return "redirect:/";
		}
		int idAccount = (int) ss.getAttribute("idAccount");
		CART cart = getCart(idFood, idAccount);
		deleteCART(cart);
		return "redirect:/";
	}

	@RequestMapping("/add_cart")
	public String cartInsert(HttpSession ss, @RequestParam("id_food") int idFood) {
		if (ss.getAttribute("idAccount") != null) {
			int idAccount = (int) ss.getAttribute("idAccount");
			CART cart = this.getCart(idFood, idAccount);
			if (cart == null) {
				CART cart1 = new CART();
				cart1.setAccountCart(getUser(idAccount));
				cart1.setFoodCart(getFood(idFood));
				cart1.setQUANTITY((byte) 1);
				insertCART(cart1);
			} else {
				cart.setQUANTITY((byte) (cart.getQUANTITY() + 1));
				updateCART(cart);
			}
		} else {
			ss.setAttribute("hasMess", true);
			ss.setAttribute("message", "Vui lòng đăng nhập!");
		}

		return "redirect:/";
	}

	@RequestMapping("/order")
	public String order(HttpSession ss, ModelMap model) {
		if (ss.getAttribute("idAccount") == null) {
			return "redirect:/";
		}
		if (ss.getAttribute("isActive") == null || (boolean) ss.getAttribute("isActive") == false
				|| ss.getAttribute("idAccount") == null) {
			return "redirect:/";
		}
		int idAccount = (int) ss.getAttribute("idAccount");
		model.addAttribute("account", getAccount(idAccount));

		// account information
		model.addAttribute("isLogin", true);
		ACCOUNT account = new ACCOUNT();
		String name = (String) ss.getAttribute("name");
		account.setNAME(name);
		String email = (String) ss.getAttribute("email");
		account.setEMAIL(email);
		boolean isActive = (boolean) ss.getAttribute("isActive");
		account.setIS_ACTIVE(isActive);
		model.addAttribute("account", account);

		// list cart
		Session session = factory.getCurrentSession();
		String hql = "FROM CART where accountCart.ID_ACCOUNT = :ID_ACCOUNT";
		Query query = session.createQuery(hql);
		query.setParameter("ID_ACCOUNT", idAccount);
		List<CART> listCart = query.list();
		if (listCart.size() > 0) {
			int totalPrice = 0;
			model.addAttribute("hasCart", true);
			model.addAttribute("listCart", listCart);
			for (int i = 0; i < listCart.size(); i++) {
				totalPrice += listCart.get(i).getFoodCart().getPRICE() * listCart.get(i).getQUANTITY();
			}
			model.addAttribute("totalPrice", totalPrice);
		} else {
			model.addAttribute("hasCart", false);
		}

		return "user/order";
	}

	@RequestMapping(value = "/pay")
	public String pay(HttpSession ss, ModelMap model) {
		if (ss.getAttribute("idAccount") == null) {
			return "redirect:/";
		}
		Session session = factory.getCurrentSession();
		int idAccount = (int) ss.getAttribute("idAccount");
		session = factory.getCurrentSession();
		String hql = "FROM CART where accountCart.ID_ACCOUNT = :ID_ACCOUNT";
		Query query = session.createQuery(hql);
		query.setParameter("ID_ACCOUNT", idAccount);
		List<CART> listCart = query.list();
		double totalPrice = 0;
		for (int i = 0; i < listCart.size(); i++) {
			totalPrice += (listCart.get(i).getFoodCart().getPRICE() * listCart.get(i).getQUANTITY()) ;
		}

		// insert order
		Calendar cal = Calendar.getInstance();
		ORDER order = new ORDER();
		ACCOUNT account = getAccount(idAccount);
		order.setAccountOrder(account);
		order.setADDRESS(account.getADDRESS());
		order.setDATE_TIME(cal.getTime());
		order.setTOTAL_PRICE(totalPrice);
		order.setSTATUS((byte) 1);
		insertORDER(order);

		// insert order_item
		for (int i = 0; i < listCart.size(); i++) {
			ORDER_ITEM item = new ORDER_ITEM();
			FOOD food = listCart.get(i).getFoodCart();
			item.setOrder(order);
			item.setITEM_PRICE(food.getPRICE());
			item.setFoodOrderItem(food);
			item.setQUANTITY(listCart.get(i).getQUANTITY());
			item.setSCORE(0);
			insertORDER_ITEM(item);
		}
		for (int i = 0; i < listCart.size(); i++) {
			deleteCART(listCart.get(i));
		}
		return "redirect:/";
	}

	/* phần xử lý lịch sử đơn hàng */
	@RequestMapping("/history")
	public String history(HttpSession ss, ModelMap model) {
		if (ss.getAttribute("idAccount") == null) {
			return "redirect:/";
		}
		if (ss.getAttribute("idAccount") != null) {
			int idAccount = (int) ss.getAttribute("idAccount");
			List<ORDER> list = getOrderAll(idAccount);
//			System.out.println(list.get(1).getItem());
			model.addAttribute("listHistories", list);
		}

		return "user/history";
	}

	@RequestMapping("/cancel")
	public String cancel(HttpSession ss, @RequestParam("id_order") int idOrder) {
		if (ss.getAttribute("idAccount") == null) {
			return "redirect:/";
		}
		int idAccount = (int) ss.getAttribute("idAccount");
		ORDER order = getOrder(idAccount, idOrder);
		if (order != null) {
			order.setSTATUS((byte) 0);
			updateOrder(order);
		}
		return "redirect:/history.htm";
	}

	@RequestMapping(value = "/rate")
	public String rate(HttpSession ss, @RequestParam("id_order") int idOrder, @RequestParam("id_food") int idFood,
			@RequestParam("score") int score) {
		if (ss.getAttribute("idAccount") == null) {
			return "redirect:/";
		}
		ORDER_ITEM item = getOrderItem(idOrder, idFood);
		if (item != null) {
			item.setSCORE(score);
			updateOrderItem(item);
			FOOD food = getFood(idFood);
			int turnsRate = food.getNUMBER();
			float foodScore = food.getSCORE();
			foodScore = (foodScore * turnsRate + score) / (turnsRate + 1);
			food.setNUMBER(turnsRate + 1);
			food.setSCORE(foodScore);
			updateFood(food);
		}
		return "redirect:/history.htm";
	}

	/* phần xử lý phản hồi */
	@RequestMapping("/feedback")
	public String feedback(HttpSession ss, @ModelAttribute("feedback") Feedback feedback) {
		if (ss.getAttribute("idAccount") == null) {
			return "redirect:/";
		}
		return "user/feedback";
	}

	@RequestMapping(value = "/send_feedback", method = RequestMethod.POST)
	public String sendFeedback(HttpSession ss, @ModelAttribute("feedback") Feedback feedback) {
		if (ss.getAttribute("idAccount") == null) {
			return "redirect:/";
		}
		if ((boolean) ss.getAttribute("isActive") == false) {
			return "redirect:/feedback.htm";
		}
		Calendar cal = Calendar.getInstance();
		ACCOUNT account = getAccount((int) ss.getAttribute("idAccount"));
		FEEDBACK fb = new FEEDBACK();
		fb.setSCORE(feedback.getScore());
		fb.setCOMMENT(feedback.getComment());
		fb.setAccountFeed(account);
		fb.setDATE_TIME(cal.getTime());
		insertFeedback(fb);
		return "redirect:/feedback.htm";
	}

	/* phần trang chủ */

	@RequestMapping()
	public String home(ModelMap model, HttpSession ss) {
		List<FOOD> list = getFoodAll();
		// list food
		model.addAttribute("dailyFoods", list.subList(0, 6));
		model.addAttribute("menuFoods", list.subList(6, list.size()));
		model.addAttribute("specialFoods", list.subList(6, 9));
		if (ss.getAttribute("hasMess") == null) {
			model.addAttribute("hasMess", false);
		} else if ((boolean) ss.getAttribute("hasMess")) {
			model.addAttribute("hasMess", true);
			model.addAttribute("message", (String) ss.getAttribute("message"));
			ss.removeAttribute("hasMess");
			ss.removeAttribute("message");
		} else {
			model.addAttribute("hasMess", false);
		}

		if (ss.getAttribute("idAccount") == null) {
			model.addAttribute("isLogin", false);
		} else {
			// account information
			model.addAttribute("isLogin", true);
			ACCOUNT account = new ACCOUNT();
			String name = (String) ss.getAttribute("name");
			account.setNAME(name);
			String email = (String) ss.getAttribute("email");
			account.setEMAIL(email);
			boolean isActive = (boolean) ss.getAttribute("isActive");
			account.setIS_ACTIVE(isActive);
			model.addAttribute("account", account);

			// list cart
			int idAccount = (int) ss.getAttribute("idAccount");
			List<CART> listCart = getCartALL(idAccount);
			if (listCart.size() > 0) {
				int totalPrice = 0;
				model.addAttribute("hasCart", true);
				model.addAttribute("listCart", listCart);
				for (int i = 0; i < listCart.size(); i++) {
					totalPrice += listCart.get(i).getFoodCart().getPRICE() * listCart.get(i).getQUANTITY();
				}
				model.addAttribute("totalPrice", totalPrice);
			} else {
				model.addAttribute("hasCart", false);
			}

		}
		// list feedback
		List<FEEDBACK> listFeedback = getFeedbackAll();
		model.addAttribute("listFeedback", listFeedback);
		return "index";
	}

	/* mã hóa dữ liệu */
	public String hash(String plain) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		// Change this to UTF-16 if needed
		md.update(plain.getBytes(StandardCharsets.UTF_8));
		byte[] digest = md.digest();
		String hex = String.format("%064x", new BigInteger(1, digest));

		return hex;
	}

	/* xử lý entity database */

	/* tài khoản */
	public ACCOUNT getAccountByEmail(String email) {
		try {
			Session session = factory.getCurrentSession();
			String hql = "FROM ACCOUNT where EMAIL = :EMAIL ";
			Query query = session.createQuery(hql);
			query.setParameter("EMAIL", email);
			ACCOUNT account = (ACCOUNT) query.uniqueResult();
			return account;
		} catch (Exception e) {
			return null;
		}
	}

	public ACCOUNT getUser(int idAccount) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ACCOUNT where ID_ACCOUNT = :ID_ACCOUNT";
		Query query = session.createQuery(hql);
		query.setParameter("ID_ACCOUNT", idAccount);
		ACCOUNT user = (ACCOUNT) query.list().get(0);

		return user;
	}

	public ACCOUNT getAccount(int idAccount) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ACCOUNT where ID_ACCOUNT = :idAccount";
		Query query = session.createQuery(hql);
		query.setParameter("idAccount", idAccount);
		ACCOUNT account = (ACCOUNT) query.list().get(0);
		return account;
	}

	public int insertAccount(ACCOUNT account) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(account);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public Integer updateAccount(ACCOUNT account) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.update(account);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	/* giỏ hàng */
	public CART getCart(int idFood, int idAccount) {
		try {
			Session session = factory.getCurrentSession();
			String hql = "FROM CART where foodCart.ID_FOOD = :ID_FOOD and accountCart.ID_ACCOUNT = :ID_ACCOUNT";
			Query query = session.createQuery(hql);
			query.setParameter("ID_FOOD", idFood);
			query.setParameter("ID_ACCOUNT", idAccount);
			CART cart = (CART) query.uniqueResult();
			return cart;
		} catch (Exception e) {
			return null;
		}
	}

	public List<CART> getCartALL(int idAccount) {
		try {
			Session session = factory.getCurrentSession();
			String hql = "FROM CART where accountCart.ID_ACCOUNT = :ID_ACCOUNT";
			Query query = session.createQuery(hql);
			query.setParameter("ID_ACCOUNT", idAccount);
			List<CART> cart = query.list();
			return cart;
		} catch (Exception e) {
			return null;
		}
	}

	public int insertCART(CART cart) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(cart);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public Integer updateCART(CART cart) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.update(cart);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public int deleteCART(CART cart) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.delete(cart);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	/* đặt hàng */
	public ORDER getOrder(int idAccount, int idOrder) {
		try {
			Session session = factory.getCurrentSession();
			String hql = "FROM ORDER where accountOrder.ID_ACCOUNT = :ID_ACCOUNT and ID_ORDER = :ID_ORDER";
			Query query = session.createQuery(hql);
			query.setParameter("ID_ORDER", idOrder);
			query.setParameter("ID_ACCOUNT", idAccount);
			ORDER order = (ORDER) query.uniqueResult();
			return order;
		} catch (Exception e) {
			return null;
		}
	}

	public List<ORDER> getOrderAll(int idAccount) {
		try {
			Session session = factory.getCurrentSession();
			String hql = "FROM ORDER where accountOrder.ID_ACCOUNT = :ID_ACCOUNT order by ID_ORDER desc";
			Query query = session.createQuery(hql);
			query.setParameter("ID_ACCOUNT", idAccount);
			List<ORDER> list = query.list();
			return list;
		} catch (Exception e) {
			return null;
		}
	}

	public int insertORDER(ORDER order) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(order);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public int updateOrder(ORDER order) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
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

	/* sản phẩm trong đặt hàng */
	public ORDER_ITEM getOrderItem(int idOrder, int idFood) {
		try {
			Session session = factory.getCurrentSession();
			String hql = "FROM ORDER_ITEM where order.ID_ORDER = :ID_ORDER and foodOrderItem.ID_FOOD = :ID_FOOD";
			Query query = session.createQuery(hql);
			query.setParameter("ID_ORDER", idOrder);
			query.setParameter("ID_FOOD", idFood);
			ORDER_ITEM item = (ORDER_ITEM) query.uniqueResult();
			return item;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}

	public int insertORDER_ITEM(ORDER_ITEM item) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(item);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public int updateOrderItem(ORDER_ITEM item) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.update(item);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	/* món ăn */
	public List<FOOD> getFoodAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM FOOD";
		Query query = session.createQuery(hql);
		List<FOOD> list = query.list();
		return list;
	}

	public int updateFood(FOOD food) {
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

	public FOOD getFood(Integer id_food) {
		Session session = factory.getCurrentSession();
		String hql = "FROM FOOD where ID_FOOD = :id_food";
		Query query = session.createQuery(hql);
		query.setParameter("id_food", id_food);
		FOOD food = (FOOD) query.list().get(0);

		return food;
	}

	/* phản hồi */
	public int insertFeedback(FEEDBACK feedback) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(feedback);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public List<FEEDBACK> getFeedbackAll() {
		try {
			Session session = factory.getCurrentSession();
			String hql = "FROM FEEDBACK";
			Query query = session.createQuery(hql);
			List<FEEDBACK> list = query.list();
			return list;
		} catch (Exception e) {
			return null;
		}
	}
}
