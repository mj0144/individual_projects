<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@page import="java.util.Iterator"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="org.springframework.security.core.authority.SimpleGrantedAuthority"%>
<%@page import="java.util.Collection"%>
<%@page import="org.springframework.security.core.GrantedAuthority"%>
<%
     Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    Object principal = auth.getPrincipal(); //사용자 정보를 가져옴.
    										//인증하지 않은 상태이면 anonymousUser 반환
    										//인증이 된 상태이면 로그인한 사용자의 정보가 담긴 Object 객체 return
    String name = "";
    String authority ="";
    boolean authorized=false;
    if(principal != null) {
        name = auth.getName();
       
        
        
        Collection<? extends GrantedAuthority> authorities = auth.getAuthorities();
	Iterator<? extends GrantedAuthority> iter = authorities.iterator();
	while(iter.hasNext()){
		GrantedAuthority ga= iter.next();
		authority = ga.getAuthority();
	}
	authority = authority.substring(5);
	
        authorized = authorities.contains(new SimpleGrantedAuthority("brozen"));
    } 
%>