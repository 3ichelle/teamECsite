package com.internousdev.leo.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.leo.dao.UserInfoDAO;
import com.internousdev.leo.util.CommonUtility;
import com.internousdev.leo.util.InputChecker;
import com.opensymphony.xwork2.ActionSupport;

public class ResetPasswordConfirmAction extends ActionSupport implements SessionAware{

	//変数定義
	private String userId;
	private String password;
	private String newPassword;
	private String reConfirmationNewPassword;
	private List<String> userIdErrorMessageList;
	private List<String> passwordErrorMessageList;
	private List<String> newPasswordErrorMessageList;
	private List<String> reConfirmationNewPasswordErrorMessageList;
	private String noExistsUserErrorMessage;
	private String checkDoPassword;
	private String concealPassword;
	private Map<String,Object> session;

	public String execute(){
		String result = ERROR;

		InputChecker inC = new InputChecker();

		//sessionでuserIdを保持（DBにupdateするまで必要のため)
		session.put("userIdForResetPassword", userId);

		//入力チェックの結果
		//結果(エラーメッセージList)を変数に格納
		//引数内容（項目名、値、最小文字数、最大文字数、半角英字許容、漢字許容、ひらがな許容、半角数字許容、半角記号許容、カタカナ許容、スペース許容）
		userIdErrorMessageList = inC.doCheck("ユーザーID",userId,1,8,true,false,false,true,false,false,false);
		passwordErrorMessageList = inC.doCheck("現在のパスワード",password,1,16,true,false,false,true,false,false,false);
		newPasswordErrorMessageList = inC.doCheck("新しいパスワード",newPassword,1,16,true,false,false,true,false,false,false);
		reConfirmationNewPasswordErrorMessageList = inC.doCheck("新しいパスワード（再確認）",reConfirmationNewPassword,1,16,true,false,false,true,false,false,false);

		//エラーが一つでもあった場合はERRORを返す
		if(userIdErrorMessageList.size()>0
		|| passwordErrorMessageList.size()>0
		|| newPasswordErrorMessageList.size()>0
		|| reConfirmationNewPasswordErrorMessageList.size()>0){
			return result;
		}

		//ユーザー存在チェックの結果
		//falseの場合はERRORを返す
		UserInfoDAO userInfoDAO = new UserInfoDAO();
		if(! userInfoDAO.isExistsUserInfo(userId,password)){
			////エラーメッセージを変数に格納
			noExistsUserErrorMessage = "ユーザーIDまたは現在のパスワードが異なります。";
			return result;
		}

		//新しいパスワードと新しいパスワード（再確認）の一致確認の結果
		//エラーメッセージを変数に格納
		CommonUtility commonUtility = new CommonUtility();
		checkDoPassword = inC.doPasswordCheck(newPassword,reConfirmationNewPassword);

		//一致する場合SUCCESSを返す
		if(checkDoPassword == null){
			//次の画面で表示するパスワードの表示を一文字目以降を*で表す（表示文字数　16文字)
			concealPassword = commonUtility.concealPassword(newPassword);
			//sessionでnewPasswordを保持（DBにupdateするまで必要のため)
			session.put("newPassword",newPassword);

			result = SUCCESS;

		}

		return result;

		}

	public String getUserId(){
		return userId;
	}
	public void setUserId(String userId){
		this.userId = userId;
	}

	public String getPassword(){
		return password;
	}
	public void setPassword(String password){
		this.password = password;
	}

	public String getNewPassword(){
		return newPassword;
	}
	public void setNewPassword(String newPassword){
		this.newPassword = newPassword;
	}

	public String getReConfirmationNewPassword(){
		return reConfirmationNewPassword;
	}
	public void setReConfirmationNewPassword(String reConfirmationNewPassword){
		this.reConfirmationNewPassword = reConfirmationNewPassword;
	}

	public List<String> getUserIdErrorMessageList(){
		return userIdErrorMessageList;
	}
	public void setUserIdErrorMessageList(List<String> userIdErrorMessageList){
		this.userIdErrorMessageList = userIdErrorMessageList;
	}

	public List<String> getPasswordErrorMessageList(){
		return passwordErrorMessageList;
	}
	public void setPasswordErrorMessageList(List<String> passwordErrorMessageList){
		this.passwordErrorMessageList = passwordErrorMessageList;
	}

	public List<String> getNewPasswordErrorMessageList(){
		return newPasswordErrorMessageList;
	}
	public void setNewPasswordErrorMessageList(List<String> newPasswordErrorMessageList){
		this.newPasswordErrorMessageList = newPasswordErrorMessageList;
	}

	public List<String> getReConfirmationNewPasswordErrorMessageList(){
		return reConfirmationNewPasswordErrorMessageList;
	}
	public void setReConfirmationNewPasswordErrorMessageList(List<String> reConfirmationNewPasswordErrorMessageList){
		this.reConfirmationNewPasswordErrorMessageList = reConfirmationNewPasswordErrorMessageList;
	}

	public String getNoExistsUserErrorMessage(){
		return noExistsUserErrorMessage;
	}
	public void setNoExistsUserErrorMessage(String noExistsUserErrorMessage){
		this.noExistsUserErrorMessage = noExistsUserErrorMessage;
	}

	public String getCheckDoPassword(){
		return checkDoPassword;
	}
	public void setCheckDoPassword(String checkDoPassword){
		this.checkDoPassword = checkDoPassword;
	}

	public String getConcealPassword(){
		return concealPassword;
	}
	public void setConcealPassword(String concealPassword){
		this.concealPassword = concealPassword;
	}

	public Map<String,Object> getSession(){
		return session;
	}
	public void setSession(Map<String,Object> session){
		this.session = session;
	}

}
