package com.smart4c.action.common;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.dispatcher.RequestMap;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

/**
* 验证码显示Action
* @author xiaoyaolang
*
*/
public class ImageCodeAction extends ActionSupport implements SessionAware,ServletResponseAware, RequestAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private HttpServletResponse response;
	
	private RequestMap request;
	
	@SuppressWarnings("rawtypes")
	private SessionMap session;
	
	//图片的宽度
	private static int WIDTH = 100;
	//图片的高度
	private static int HEIGHT = 40;
	//验证码上字符数
	private static int NUM = 4;
	
	private static char[] seq = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I',
	   'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V',
	   'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8',
	   '9' };

	private InputStream is;

	public String execute() throws IOException {
		Random r = new Random();
		// 图片的内存映像
		BufferedImage image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);

		// 获得画笔对象
		Graphics2D g = image.createGraphics();
		// Graphics g = image.getGraphics();
		// g.setColor(randomColor(r));
		g.setColor(getRandColor(200, 250, r));
		g.fillRect(0, 0, WIDTH, HEIGHT);
		g.setColor(new Color(0, 0, 0));

		// 用于存储随机生成的验证码
		StringBuffer number = new StringBuffer();

		// 绘制验证码
		g.setColor(getRandColor(100, 160, r));
		for (int i = 0; i < NUM; i++) {
			// g.setColor(randomColor(r));
			int h = (int) ((HEIGHT * 60 / 100) * r.nextDouble() + (HEIGHT * 30 / 100));
			g.setFont(new Font("Algerian", Font.BOLD | Font.ITALIC, h));
			String ch = String.valueOf(seq[r.nextInt(seq.length)]);
			number.append(ch);
			g.drawString(ch, i * WIDTH / NUM * 90 / 100, h);
		}

		// 将验证码打印到控制台方便查看调试，但是当程序真正上线的时候一定要删掉哦
		// System.out.println(number.toString());
		// 将验证码放入到session中
		session.put("imagecode", number.toString());

		// 绘制干扰线，这里绘制12条，如果感觉太乱，可以减少点
		Random line_r = new Random();
		g.setColor(getRandColor(160, 200, line_r));
		for (int i = 0; i <= 6; i++) {
			// g.setColor(randomColor(r));
			g.drawLine(r.nextInt(WIDTH), r.nextInt(HEIGHT), r.nextInt(WIDTH), r.nextInt(HEIGHT));

		}
		
		response.setContentType("image/jpeg");
		ImageIO.write(image, "jpg", response.getOutputStream());

		return null;
	}
	
	private static Color getRandColor(int fc, int bc,Random random) {  
        if (fc > 255)  
            fc = 255;  
        if (bc > 255)  
            bc = 255;  
        int r = fc + random.nextInt(bc - fc);  
        int g = fc + random.nextInt(bc - fc);  
        int b = fc + random.nextInt(bc - fc);  
        return new Color(r, g, b);  
    }

	public InputStream getIs() {
	  return is;
	}
	
	public void setIs(InputStream is) {
	  this.is = is;
	}
	
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}
	
	public HttpServletResponse getResponse() {
		return response;
	}
	
	public RequestMap getRequest() {
		return request;
	}
	
	@SuppressWarnings("rawtypes")
	public void setRequest(Map map) {
		this.request = (RequestMap) map;
	}
	
	@SuppressWarnings("rawtypes")
	public SessionMap getSession() {
		return session;
	}
	
	@SuppressWarnings("rawtypes")
	public void setSession(Map map) {
		this.session = (SessionMap)map;
	}
}
