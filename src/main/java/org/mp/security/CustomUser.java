package org.mp.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.mp.domain.MemberVO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
 
@Getter
public class CustomUser extends User{
 
    private static final long serialVersionUID = 1L;
    
    private MemberVO member;
    //loadUserByUsername 라는 오버라이딩 메소드에서 Request에서 받은 로그인 데이터를 활용하여 로그인 작업
    //로그인의 Jdbc를 커스텀
    public CustomUser(String username,String password, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
    }
    
    public CustomUser(MemberVO vo) {
        
        super(vo.getUserId(), vo.getUserPwd(), vo.getAuthList().stream()
                .map(auth -> new SimpleGrantedAuthority(auth.getAuthority())).collect(Collectors.toList()));
 
        this.member = vo;
    }
}