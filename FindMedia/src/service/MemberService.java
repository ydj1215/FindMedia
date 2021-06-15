package service;

import member.MemberDTO;
import member.MemberDAO;

public class MemberService {
	private static MemberService MService = new MemberService(); //본인의 클래스 변수를 하나 보유
	public MemberService() {}
	private MemberDAO MDao = MemberDAO.getInstance();
	
	public static MemberService getInstance()
	{
		return MService;
	}
	
	public int join(MemberDTO MemberDTO) {
		// TODO Auto-generated method stub
		return MDao.join(MemberDTO);
	}
	
	public boolean login(String id, String password) {
		// TODO Auto-generated method stub
		return MDao.login(id, password);
	}
	
	public String findID(String email) {
		// TODO Auto-generated method stub
		return MDao.findID(email);
	}
	
	public String findPW(MemberDTO MDTO) {
		// TODO Auto-generated method stub
		return MDao.findPW(MDTO);
	}
	
	public String checkPassword(String id) {
		// TODO Auto-generated method stub
		return MDao.checkPassword(id);
	}
	
	public String checkNickname(String id) {
		// TODO Auto-generated method stub
		return MDao.checkNickname(id);
	}
	
	public String checkEmail(String id) {
		// TODO Auto-generated method stub
		return MDao.checkEmail(id);
	}
	
	public String checkName(String id) {
		// TODO Auto-generated method stub
		return MDao.checkName(id);
	}
	
	public void deleteMember(MemberDTO MDTO) {
		// TODO Auto-generated method stub
		MDao.deleteMember(MDTO);
	}
}

