package jfreechart;
import jfreechart.JFreeChartFunctions;

import java.awt.BasicStroke;
import java.awt.Color;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.ArrayList;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartColor;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartFrame;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.DateAxis;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.labels.CategoryItemLabelGenerator;
import org.jfree.chart.labels.ItemLabelAnchor;
import org.jfree.chart.labels.ItemLabelPosition;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.plot.XYPlot;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.chart.title.LegendTitle;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.xy.XYSeriesCollection;
import org.jfree.ui.RectangleEdge;
import org.jfree.ui.TextAnchor;

//***[Important] How to use this function (2020/5/1 Yazaki Tatsuya)***//
//If you are going to pass a ArrayList for either PieChart/LineChart/XYLineChart, please give the parameter as "chartN"
//(*N is a Integer number such as 1,2,3... so the param will be like "chart1","chart2","chart3","chart4"...)
//The number of args will change depending on which chart your are trying to draw. The following is the number of args and data type required.
//[1] PieChart : chart1 = ArrayList<ArrayList<String>> x 1 (Ex. {{"aaa","10},{"bbb","20"},{"ccc","30"},{"ddd","40"}})
//[2] LineChart : chart1 = ArrayList<Integer> x 1, chart2-3 = ArrayList<String> x 2 (Ex. {10} {"Docomo"} {"10"} / {20} {"SoftBank"} {"10"})
//[3] XYLineChart : chart1 = String (label name), chart2 = ArrayList<ArrayList<String>> (Ex. {{10,934},{20,1087},{30,2009}}
@WebServlet("/JFreeChartDraw")
public class JFreeChartDrawServlet extends HttpServlet {
	
	JFreeChartFunctions jfc = new JFreeChartFunctions();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String mode = request.getParameter("mode");		
		if(mode.equals("1")) {
			drawPieChart(request,response);
		}else if(mode.equals("2")) {
			drawLineGraph(request,response);
		}
	}	
	//##[1] Pie Chart/円グラフ //
	protected void drawPieChart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		response.setContentType("image/png");	
		ArrayList<ArrayList<String>> ar1 = (ArrayList<ArrayList<String>>) request.getSession().getAttribute("chart1");
		DefaultPieDataset ds_pie = jfc.createDS_PieChart(ar1);
		
		//##2.Create a pie chart using the "Chart Factory"
		JFreeChart chart=ChartFactory.createPieChart3D("好きなフルーツは？", ds_pie,true,false,false);
		chart.setBackgroundPaint(ChartColor.WHITE);
		
		//##3.Generate the image using the output stream
		ServletOutputStream objSos=response.getOutputStream();
		//ChartUtilities.writeChartAsJPEG(objSos, chart, 600, 400);
		ImageIO.write(chart.createBufferedImage(600, 400), "png", objSos);
		
		//##4.Eclipse内にグラフを描画
		//ChartFrame frame1 = new ChartFrame("XYLine Chart", chart);
		//frame1.setVisible(true);
		//frame1.setSize(300,300);
	}
	//##[2] Line Chart/折れ線グラフ //
	protected void drawLineGraph(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("image/png");
		String ar1name="chart1_1";
		String ar2name="chart1_2";
		String ar3name="chart1_3";
		ArrayList<Integer> ar1 = (ArrayList<Integer>) request.getSession().getAttribute(ar1name);
		ArrayList<String> ar2 = (ArrayList<String>) request.getSession().getAttribute(ar2name);
		ArrayList<String> ar3 = (ArrayList<String>) request.getSession().getAttribute(ar3name);
		DefaultCategoryDataset ds_cat = jfc.createDS_LineChart(ar1,ar2,ar3);
		
		//Define values depending on the query results.
		int width = 0;
		if(ar1.size()>20 ) {width = ar1.size()*25;}
		else {width = 600;}

		//##2.Create a line chart using the "Chart Factory"
		JFreeChart chart=ChartFactory.createLineChart("Ranking movement/ランキング推移", "Date/日付", "Ranking/ランキング", ds_cat, PlotOrientation.VERTICAL, true, false, false);
		//Create "CategoryPlot" class to create grid line for X axis and Y axis
		chart.getPlot().setBackgroundPaint(Color.WHITE);
		
		//Set Legend position
		LegendTitle legend = chart.getLegend();
		legend.setPosition(RectangleEdge.LEFT);
		//legend.setLegendItemGraphicLocation(RectangleAnchor.BOTTOM_LEFT); //Set position of the graphic item (like RED box and Green box in the legend)
		
		//Set CategoryPlot (Grid Lines of X axis and Y axis)
		CategoryPlot plot = chart.getCategoryPlot();		
		plot.setRangeGridlinesVisible(true);
		plot.setRangeGridlinePaint(Color.BLACK);
		plot.setDomainGridlinesVisible(true);
		plot.setDomainGridlinePaint(Color.BLACK);
		plot.getRangeAxis().setInverted(true);
		
		//Set NumberAxis (Start point and End point of Y axis)
		NumberAxis yNumAxis = (NumberAxis)plot.getRangeAxis();
		yNumAxis.setLowerBound(-50);	
		
		//Set CategoryAxis (Label orientation of the X axis)
		CategoryAxis axis = (CategoryAxis)plot.getDomainAxis();
		//axis.setMaximumCategoryLabelLines(10);	//Allow the X axis label to wrap up to 10 lines
		axis.setCategoryLabelPositions(CategoryLabelPositions.DOWN_90);	//Rotate the label words 
		axis.setUpperMargin(0);
		axis.setLowerMargin(0);
		
		//Set Rednderer (Shape of the dots and so on)
		LineAndShapeRenderer renderer = (LineAndShapeRenderer)plot.getRenderer();
		renderer.setSeriesPaint(0, ChartColor.RED);
		renderer.setSeriesPaint(1, ChartColor.GREEN);
		renderer.setSeriesPositiveItemLabelPosition(0, new ItemLabelPosition(ItemLabelAnchor.OUTSIDE8,TextAnchor.TOP_CENTER));
		renderer.setSeriesPositiveItemLabelPosition(1, new ItemLabelPosition(ItemLabelAnchor.OUTSIDE8,TextAnchor.BOTTOM_CENTER));
		renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator("{2}",NumberFormat.getInstance()));	//Get only the rank number	
		renderer.setBaseItemLabelsVisible(true);
		for (int i=0; i<ar1.size(); i++) 	{
			renderer.setSeriesStroke(i, new BasicStroke(2));	//Width of the line
			renderer.setSeriesShapesVisible(i, true);					
		}
		
		//##3.Generate the image using the output stream
		ServletOutputStream objSos=response.getOutputStream();
		ChartUtilities.writeChartAsPNG(objSos, chart, width, 500);
		//ChartUtilities.writeChartAsJPEG(objSos, chart, width, 450);
		//ImageIO.write(chart.createBufferedImage(600, 400), "png", objSos);
		
		//##4.Eclipse内にグラフを描画
		//ChartFrame frame1 = new ChartFrame("XYLine Chart", chart);
		//frame1.setVisible(true);
		//frame1.setSize(1500,1000);
	}
}