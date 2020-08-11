package org.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;



//DB에서 유저정보 가져오는 메서드 구현
public class MemberUserDetailService implements UserDetailsService{

	
	@Autowired
	private AuthDAO authDAO;
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberAuthenticationProvider.class);

	//Db에서 유저정보 가져오는 메서드
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		
		//사용자 정보를 MemberUserDetail(UserDetails)형으로 가져옴
		 MemberUserDetail member = authDAO.getUserById(id);
		
		 logger.info("insert member : " + member);
		 
		 	//정보가 없다면 예외를 떤짐
	        if(member==null) { 
	            throw new UsernameNotFoundException("회원정보가 틀립니다");
	        }
	        
	        return member;
	}
	
	
	
}
