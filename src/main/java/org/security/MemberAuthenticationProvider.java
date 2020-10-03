package org.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;


public class MemberAuthenticationProvider implements AuthenticationProvider{


	private MemberUserDetailService memberUserDetailService;
	private static final Logger logger = LoggerFactory.getLogger(MemberAuthenticationProvider.class);
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		//입력한 회원의 username과 password를 가져옴
		String id= (String) authentication.getPrincipal(); //접근주체 : 리소스에 접근하는 대상
		String passwd = (String) authentication.getCredentials(); //리소스에 접근하는 대상의 비밀번호
		MemberUserDetail userDetail=null;
		
		
		//입력한 회원의 id를 db쿼리에 값으로 넘겨줌

		userDetail = (MemberUserDetail) memberUserDetailService.loadUserByUsername(id);
		logger.info(userDetail.toString());			
		
		if(!matchPassword(passwd, userDetail.getPassword())) {
			throw new BadCredentialsException("비밀번호가 알맞지 않습니다");
		}
		
		if(!userDetail.isEnable()) {
			throw new BadCredentialsException("회원정보가 없습니다");
		}
		
		
		
		//화면에서 입력한 정보, db에서 가져온 권한을 리턴
		return new UsernamePasswordAuthenticationToken(id, passwd, userDetail.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return false;
	}
	
	
	
	//값 비교하는 메서드
	//passwd : 내가 입력한 비밀번호
	//password : db에서 가져온 비밀번호
	private boolean matchPassword(String passwd, String password) {
		return bcryptPasswordEncoder.matches(passwd, password);
        //return passwd.equals(password);
    }



}
