package cn.BlackHumour.TaxSys.core.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.filter.OncePerRequestFilter;

import cn.BlackHumour.TaxSys.privilege.entity.Privilege;

/**
 * 
 * 
 * 
 */
public class HomeFilter extends OncePerRequestFilter {

	@Override
	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		HttpSession session = request.getSession();
		List<Privilege> privileges = (List<Privilege>) session.getAttribute("privileges");
		
		
		System.out.println("++++++++++++++++++++++++++"+uri);
		if(!uri.contains("login")&&!uri.contains("Home")) {
			if(request.getSession().getAttribute("loginUser")==null) {
				//System.out.println("========================="+request.getSession().getAttribute("loginUser"));
				response.sendRedirect(request.getContextPath()+"/user/loginIndex.action");
			} else {
				filterChain.doFilter(request, response);
			}
		} else if(uri.contains("Home")) {
			/*System.out.println("dddddddddddddd-----"+uri);
			System.out.println("-----------"+privilegesString);
			System.out.println("------------"+uri.substring(8, 12));*/
			if(request.getSession().getAttribute("loginUser")==null) {
				//System.out.println("========================="+request.getSession().getAttribute("loginUser"));
				response.sendRedirect(request.getContextPath()+"/user/loginIndex.action");
			} else {
				String privilegesString = privileges.toString();
				if(privilegesString.contains(uri.substring(8, 12))) {
					filterChain.doFilter(request, response);
				} else {
					response.sendRedirect(request.getContextPath()+"/home/index.action");
				}
			}
			
		} else {
			filterChain.doFilter(request, response);
		}
	}
}
