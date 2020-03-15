package jfreechart;

import java.util.ArrayList;

import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.xy.XYSeries;
import org.jfree.data.xy.XYSeriesCollection;

public class JFreeChartFunctions {
	
	//(1) Create Dataset for "createPieChart3D"
	public DefaultPieDataset createDS_PieChart(ArrayList<ArrayList<String>> ar1) {
		
		//### ⑤データセットの作成処理 ###
		DefaultPieDataset defpie = new DefaultPieDataset();
		for(int i=0; i<ar1.size(); i++) {
			defpie.setValue(ar1.get(i).get(0),Integer.parseInt(ar1.get(i).get(1)));
		}
		return defpie;	
	}
	//(2) Create DataSet for "createLineChart"
	public DefaultCategoryDataset createDS_LineChart(ArrayList<Integer> key1, ArrayList<String> key2, ArrayList<String> key3) {
		
		//### ⑤データセットの作成処理 ###
		DefaultCategoryDataset defcat = new DefaultCategoryDataset();
		for(int i=0; i<key1.size(); i++) {
			defcat.addValue(key1.get(i), key2.get(i), key3.get(i));
		}		
		return defcat;
	}
}
