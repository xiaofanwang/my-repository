package com.chunbo.tqa.web.skutempconf;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 项目名称：chunbo-tqa-web<br>
 * *********************************<br>
 * <P>类名称：SkuTempConf</P>
 * *********************************<br>
 * <P>类描述：</P>
 * 创建人：wangbaocai<br>
 * 创建时间：2016年4月27日 下午3:36:24<br>
 * @version 1.0<br>
 */
@Controller
@RequestMapping("/skutempconf")
public class SkuTempConfController {
	
	private Logger logger = LoggerFactory.getLogger(SkuTempConfController.class);
	
	/*@LoginAuth*/
	@RequestMapping(value="/index.do",method=RequestMethod.GET)
	public String toPage() {
		return "skutempconf/skuTempConf";
	}
	
}
