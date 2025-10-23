package model.dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.DoctorLicense;

public class DoctorLicenseDao {
	private static DoctorLicenseDao instance = new DoctorLicenseDao();

	private DoctorLicenseDao() {

	}

	public static DoctorLicenseDao getInstance() {
		return instance;
	}

	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println("DoctorLicenseDao session error");
			System.out.println(e.getMessage());
		}
	}
	
	public DoctorLicense select(String code) {
		return session.selectOne("doctorlicensens.select", code);
	}
}
