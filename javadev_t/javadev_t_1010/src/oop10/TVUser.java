package oop10;

import java.io.FileInputStream;
import java.util.Properties;

public class TVUser {
	public static void main(String[] args) throws Exception {
		Properties prop = new Properties();
		prop.load(new FileInputStream("src/oop10/product.properties"));
		String tvName = prop.getProperty("tv");
		Class tvClass = Class.forName(tvName);
		TV tv = (TV) tvClass.getConstructor().newInstance(); //TV tv = new LgTV();
		String speakerName = prop.getProperty("speaker");
		Class speakerClass = Class.forName(speakerName);
		tv.setSpeaker((Speaker) speakerClass.getConstructor().newInstance());
		tv.powerOn();
		tv.channelUp();
		tv.channelUp();
		tv.soundUp();
		tv.powerOff();
	}
}
