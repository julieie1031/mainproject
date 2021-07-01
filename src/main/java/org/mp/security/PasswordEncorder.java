package org.mp.security;

public interface PasswordEncorder {
	public String encode(CharSequence rawPassword);
	public boolean matches(CharSequence rawPassword, String encodedPassword);
}
