package service.sw;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.DoctorLicense;
import model.Users;
import model.dao.DoctorLicenseDao;
import model.dao.UsersDao;

public class Dr_lic_code_Confirm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String drLicCode = request.getParameter("drLicCode");
		
		UsersDao ud = UsersDao.getInstance();
		Users users = ud.selectByDrCode(drLicCode);
		
		DoctorLicenseDao licensedao = DoctorLicenseDao.getInstance();
		DoctorLicense doctorlicense = licensedao.select(drLicCode);
		
		String msg = "";
		
		if (users != null) {
			msg = "이미 사용하고 있는 코드입니다";
		} 
		else if (doctorlicense == null) {
			msg = "허용되지 않은 코드입니다";
		} 
		else {
			msg = "인증되었습니다";
		}

		
		request.setAttribute("msg", msg);
		return "view/join/dr_lic_code_confirm.jsp";
	}

}
