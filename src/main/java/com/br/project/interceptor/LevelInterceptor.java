package com.br.project.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.br.project.dto.member.MemberDto;

public class LevelInterceptor implements HandlerInterceptor {
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		response.setCharacterEncoding("UTF-8");
		String position = (String)((MemberDto)request.getSession().getAttribute("loginMember")).getPositionCode();
		if(position != null && (position.equals("E") || position.equals("F") || position.equals("C") || position.equals("D")|| position.equals("B"))) {
			return true;
		}else {
			PrintWriter out = response.getWriter();
			out.print("<html><head><meta charset='UTF-8'>");
			out.print("<script src='http://code.jquery.com/jquery-3.7.1.min.js'></script>");
			out.print("<script src='"+request.getContextPath()+"/resources/js/iziModal.min.js'></script>");
			out.print("<link  href='"+request.getContextPath()+"/resources/css/iziModal.min.css' rel='stylesheet'>");
			out.print("</head><body>");
			
			 
			out.print("<div id=\"redModal\"></div>");
			
			out.print("<script>$('#redModal').iziModal({"
					+ "headerColor: '#dc3545',"
					+ "timeout: 3000,"
					+ "timeoutProgressbar: true,"
					+ "onClosing: function(){history.back();}"
					+ "});");
			
			out.print("function redAlert(title, content){"
					+ "$('#redModal').iziModal('setTitle', title);"
					+ "$('#redModal').iziModal('setSubtitle', content);"
					+ "$('#redModal').iziModal('open');"
					+ "}");
			
			out.print("redAlert('권한 체크', '해당 계정으로 사용할 수 없습니다.');</script>");			
			out.print("</body></html>");
			return false;
		}
		
		
	}
}
