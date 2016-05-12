package com.raistudies.actions;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.json.JSONObject;

import com.raistudies.forms.AjaxForm;

public class AjaxAction extends Action {

	public ActionForward doAction1(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		AjaxForm ajaxForm = (AjaxForm) form;
		response.setContentType("text/text;charset=utf-8");
		response.setHeader("cache-control", "no-cache");
		PrintWriter out = response.getWriter();
		out.println("Hello " + ajaxForm.getName());
		out.flush();
		return null;
	}

	public ActionForward sayHello(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		AjaxForm ajaxForm = (AjaxForm) form;
		response.setContentType("text/text;charset=utf-8");
		response.setHeader("cache-control", "no-cache");
		PrintWriter out = response.getWriter();
		out.println("Hello " + ajaxForm.getName());
		out.flush();
		return null;
	}

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		
		String myName= request.getParameter("myName");
		
		AjaxForm ajaxForm = (AjaxForm) form;
		JSONObject obj = new JSONObject();
		if ("India".equals(ajaxForm.getCountry())) {
			obj.put("1", "Kerala");
			obj.put("2", "Tamil Nadu");
			obj.put("3", "Jammu Kashmir");
			obj.put("4", "Assam");
		} else {
			obj.put("1", "California");
			obj.put("2", "Washington");
		}

		response.setContentType("application/json");
		PrintWriter writer = response.getWriter();
		writer = response.getWriter();
		writer.write(obj.toString());
		writer.flush();

		return null;
	}

}
