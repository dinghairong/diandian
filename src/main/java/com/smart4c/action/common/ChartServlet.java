package com.smart4c.action.common;

import java.awt.Color;  
import java.awt.Font;  
import java.io.IOException;  
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;  
import org.jfree.chart.JFreeChart;  
import org.jfree.chart.axis.DateAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.plot.XYPlot;
import org.jfree.chart.renderer.xy.XYItemRenderer;
import org.jfree.chart.renderer.xy.XYLineAndShapeRenderer;
import org.jfree.chart.title.TextTitle;  
import org.jfree.data.general.DefaultPieDataset;  
import org.jfree.data.time.Day;
import org.jfree.data.time.TimeSeries;
import org.jfree.data.time.TimeSeriesCollection;
import org.jfree.data.xy.XYDataset;
/** 
 * 生成饼状统计图 
 * @说明  
 * @author cuisuqiang 
 * @version 1.0 
 * @since 
 */  
@SuppressWarnings("serial")  
public class ChartServlet extends HttpServlet {  
	
	private int ispaid;
	
	private int issend;
	
	private int notsend;
	
	private int year;
	
	private int[] consumption;
	
	public ChartServlet(int paid,int send,int not){
		this.ispaid = paid;
		this.issend = send;
		this.notsend = not;
	}
	
	public ChartServlet(int year,int[] consum){
		this.year = year;
		this.consumption = consum;
	}
	
    public void cakeService(HttpServletRequest request,  
            HttpServletResponse response) throws ServletException, IOException {  
        response.setContentType("text/html");  
        // 默认数据类型  
        DefaultPieDataset dataType = new DefaultPieDataset();  
        // 数据参数 内容，数量  
        dataType.setValue("已购买", ispaid);  
        dataType.setValue("已发送", issend);  
        dataType.setValue("未发送", notsend);  
//        dataType.setValue("火狐", 640);  
//        dataType.setValue("谷歌", 245);  
        try {  
            DefaultPieDataset data = dataType;  
            // 生成普通饼状图除掉 3D 即可  
            // 生产3D饼状图  
//            PiePlot3D plot = new PiePlot3D(data);  
            PiePlot plot = new PiePlot(data);
            plot.setBackgroundPaint(Color.white);
            plot.setLabelGenerator(new StandardPieSectionLabelGenerator(("{0}:({2})"),NumberFormat.getNumberInstance(),new DecimalFormat("0.00%")));
            
//            plot.setBaseSectionOutlinePaint(new Color(0xF7, 0x79, 0xED));
//            plot.setSectionPaint(0, new Color(0xF7, 0x79, 0xED));
            
//            JFreeChart chart = new JFreeChart(  
//                    "用户使用的浏览器类型",            // 图形标题  
//                    JFreeChart.DEFAULT_TITLE_FONT, // 标题字体  
//                    plot,                          // 图标标题对象  
//                    true                           // 是否显示图例  
//            );  
            JFreeChart chart = new JFreeChart(plot);
            // 设置整个图片的背景色  
            chart.setBackgroundPaint(Color.white);  
            // 设置图片有边框  
            chart.setBorderVisible(false);  
            // 配置字体  
//            Font kfont = new Font("宋体", Font.PLAIN, 12);    // 底部  
//            Font titleFont = new Font("宋体", Font.BOLD, 25); // 图片标题  
            // 图片标题  
//            chart.setTitle(new TextTitle(chart.getTitle().getText(), titleFont));  
            // 底部  
//            chart.getLegend().setItemFont(kfont); 
            
            ChartUtilities.writeScaledChartAsPNG(response.getOutputStream(), chart, 500, 300, 1, 1);
//            ChartUtilities.writeChartAsJPEG(response.getOutputStream(), 1.0f,  
//                    chart, 500, 300, null);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
    
    @SuppressWarnings("deprecation")  
    public void lineService(HttpServletRequest request,  
            HttpServletResponse response) throws ServletException, IOException {  
        response.setContentType("text/html");  
        // 在Mysql中使用 select  
        // year(accessdate),month(accessdate),day(accessdate),count(*)  
        // 其中accessdate 是一个date类型的时间  
        // 时间序列对象集合  
        TimeSeriesCollection chartTime = new TimeSeriesCollection();  
        // 时间序列对象，第1个参数表示时间序列的名字，第2个参数是时间类型，这里为天  
        // 该对象用于保存前count天每天的访问次数  
        TimeSeries timeSeries = new TimeSeries("月消费", Day.class);  
        // 为了演示，直接拼装数据  
        // Day的组装格式是day-month-year 访问次数 
        for(int i = 0;i < consumption.length;i ++){
        	timeSeries.add(new Day(1, i + 1, year), consumption[i]);
        }
//        timeSeries.add(new Day(1, 1, 2015), 50); 
//        timeSeries.add(new Day(1, 2, 2015), 47);  
//        timeSeries.add(new Day(1, 3, 2015), 82);  
//        timeSeries.add(new Day(1, 4, 2015), 95);  
//        timeSeries.add(new Day(1, 5, 2015), 104);  
//        timeSeries.add(new Day(1, 6, 2015), 425);  
        chartTime.addSeries(timeSeries);  
        XYDataset date = chartTime;  
        try {  
            // 使用ChartFactory来创建时间序列的图表对象  
            JFreeChart chart = ChartFactory.createTimeSeriesChart(  
                    "", // 图形标题  
                    "日期", // X轴说明  
                    "消费量", // Y轴说明  
                    date, // 数据  
                    true, // 是否创建图例  
                    true, // 是否生成Tooltips  
                    false // 是否生产URL链接  
            );  
            // 设置整个图片的背景色  
            chart.setBackgroundPaint(Color.white);  
            // 设置图片有边框  
            chart.setBorderVisible(false);  
            // 获得图表区域对象  
            XYPlot xyPlot = (XYPlot) chart.getPlot();  
            // 设置报表区域的背景色  
            xyPlot.setBackgroundPaint(new Color(255,254,248));  
            // 设置横 纵坐标网格颜色  
            xyPlot.setDomainGridlinePaint(new Color(206,206,206));  
            xyPlot.setRangeGridlinePaint(new Color(206,206,206));  
            // 设置横、纵坐标交叉线是否显示  
            xyPlot.setDomainCrosshairVisible(true);  
            xyPlot.setRangeCrosshairVisible(true);  
            xyPlot.getRenderer().setSeriesPaint(1, Color.red);
            // 获得数据点（X,Y）的render，负责描绘数据点  
            XYItemRenderer xyItemRenderer = xyPlot.getRenderer();  
            if (xyItemRenderer instanceof XYLineAndShapeRenderer) {  
                XYLineAndShapeRenderer xyLineAndShapeRenderer = (XYLineAndShapeRenderer) xyItemRenderer;  
                xyLineAndShapeRenderer.setShapesVisible(true); // 数据点可见  
                xyLineAndShapeRenderer.setShapesFilled(true); // 数据点是实心点  
                xyLineAndShapeRenderer.setSeriesFillPaint(1, Color.RED); // 数据点填充为蓝色  
                xyLineAndShapeRenderer.setUseFillPaint(true);// 将设置好的属性应用到render上  
            }  
            // 配置以下内容方可解决乱码问题  
            // 配置字体  
            Font xfont = new Font("宋体", Font.PLAIN, 12);    // X轴  
            Font yfont = new Font("宋体", Font.PLAIN, 12);    // Y轴  
            Font kfont = new Font("宋体", Font.PLAIN, 12);    // 底部  
            Font titleFont = new Font("宋体", Font.BOLD, 25); // 图片标题  
            // 图片标题  
            chart.setTitle(new TextTitle(chart.getTitle().getText(), titleFont));  
            // 底部  
            chart.getLegend().setItemFont(kfont);             
            // X 轴  
            ValueAxis domainAxis = xyPlot.getDomainAxis();  
            domainAxis.setLabelFont(xfont);// 轴标题  
            domainAxis.setTickLabelFont(xfont);// 轴数值  
            domainAxis.setTickLabelPaint(Color.BLUE); // 字体颜色  
            // Y 轴  
            ValueAxis rangeAxis = xyPlot.getRangeAxis();  
            rangeAxis.setLabelFont(yfont);  
            rangeAxis.setLabelPaint(Color.BLUE); // 字体颜色  
            rangeAxis.setTickLabelFont(yfont);  
            // 定义坐标轴上日期显示的格式  
            DateAxis dateAxis = (DateAxis) xyPlot.getDomainAxis();  
            // 设置日期格式  
            dateAxis.setDateFormatOverride(new SimpleDateFormat("yyyy-MM"));  
            // 向客户端输出生成的图片 
            ChartUtilities.writeScaledChartAsPNG(response.getOutputStream(), chart, 965, 300, 1, 1);
            
//            ChartUtilities.writeChartAsJPEG(response.getOutputStream(), 1.0f,  
//                    chart, 500, 300, null);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
    
//    public String getPieImage(){
//    	HttpServletRequest request = ServletActionContext.getRequest();
//    	try {
//			service(request,ServletActionContext.getResponse());
//		} catch (ServletException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//    	return null;
//    }
//    
//    public String getLineImage(){
//    	try {
//			lineService(ServletActionContext.getRequest(),ServletActionContext.getResponse());
//		} catch (ServletException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//    	return null;
//    }
}