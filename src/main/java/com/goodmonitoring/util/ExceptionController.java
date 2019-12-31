package com.goodmonitoring.util;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.MyBatisSystemException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.goodmonitoring.util.exception.ResourceNotFoundException;
import com.goodmonitoring.util.exception.RuntimeLogicException;


public class ExceptionController {

	protected Logger logger = LoggerFactory.getLogger(this.getClass());
	
	protected String JSON_VIEW = "jacksonView";
	
	@ResponseStatus(HttpStatus.OK)
	@ResponseBody
	@ExceptionHandler(Exception.class)
	public ModelAndView exceptionHandler(HttpServletRequest request, HttpServletResponse response, Exception ex) {
		logger.debug("start URI : " + request.getRequestURI());
		
		String errName 	= ex.getClass().getName();
		String err 	= "000";
		String errMsg = null;
		String errLogMsg = "";
		
		if(ex instanceof LogicException) {
			err = ((LogicException)ex).getCode();
			errMsg = ((LogicException)ex).getMessage();
		} else if(ex instanceof RuntimeLogicException) {
			err = ((RuntimeLogicException)ex).getCode();
			errMsg = ((RuntimeLogicException)ex).getMessage();
		} else if(ex instanceof ResourceNotFoundException) {
			err = ((ResourceNotFoundException)ex).getCode();
			errMsg = ((ResourceNotFoundException)ex).getMessage();
		} else if (ex instanceof MyBatisSystemException) {
			err = "900";
			errMsg = "DB_CONNECTION_FAIL";
		} else {
			err = "999";
			errMsg = "UNKNOWN_ERROR";
			errLogMsg = ex.getMessage();
		}
		
		ResultMap resultMap = new ResultMap();
		resultMap.setStatus(err);
		resultMap.setMsg(errMsg);
		
		String viewName;
		if("XMLHttpRequest".equals(Util.nvl(request.getHeader("X-Requested-With")))) {
			viewName = JSON_VIEW;
		} else {
			viewName = "redirect:/error/" + err;
		}
		
		ModelAndView  model = new ModelAndView(viewName);
		model.addAllObjects(resultMap);
		logger.error("["+errName+"] ["+err+"] ["+errMsg+"] [" +errLogMsg+"]");
		logger.debug("end");
		return model;
	}
}
