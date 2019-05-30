package com.internousdev.leo.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.leo.dao.UserInfoDAO;
import com.opensymphony.xwork2.ActionSupport;

public class ResetPasswordCompleteAction extends ActionSupport implements SessionAware{

	private Map<String,Object> session;

	public String execute(){

		String result = ERROR;
		UserInfoDAO userInfoDAO = new UserInfoDAO();

		//DB更新の結果
		//NULLが入ってはいけないため、String.valueOf()ではなくtoString()を使用している
		int count = userInfoDAO.resetPassword(session.get("userIdForResetPassword").toString(), session.get("newPassword").toString());

		if(count > 0){
			result = SUCCESS;
		}

		//この画面でsessionは不要になるため削除する
		session.remove("userIdForResetPassword");
		session.remove("newPassword");

		return result;
	}

	public Map<String,Object> getSession(){
		return session;
	}
	public void setSession(Map<String,Object> session){
		this.session = session;
	}

}
