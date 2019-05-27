package web.filter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class URIFilter implements Filter{
    PrintWriter writer = null;
    Date day = new Date();
	@Override
	public void destroy() {
	
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		writer.println(req.getRequestURI());
		writer.println(day);
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		try {
			writer = new PrintWriter(new FileWriter("d://log//market.log"),true);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
