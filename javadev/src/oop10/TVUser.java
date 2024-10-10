package oop10;

import java.io.FileInputStream;
import java.util.Properties;

public class TVUser {
	public static void main(String[] args) throws Exception {
//		SamsungTV tv = new SamsungTV();
//		TV tv = new LgTV();
//		TV tv = new SamsungTV();
		
		// new 를 제거 함으로서 동적으로 의존성 없앰
		Properties prop = new Properties();
		prop.load(new FileInputStream("src/oop10/product.properties"));
		String tvName = prop.getProperty("tv"); // 둘이 만나 서는게 아니라 홀로선 둘이 만나는 것이다.
		Class tvClass = Class.forName(tvName);
		TV tv = (TV) tvClass.getConstructor().newInstance(); // Object로 return 되기때문에 다운 캐스팅
		
		String speakerName = prop.getProperty("speaker");
		Class speakerClass = Class.forName(speakerName);
		tv.setSpeaker((Speaker)speakerClass.getConstructor().newInstance());
//		tv.setSpeaker(new HarmanSpeaker());
//		tv.setSpeaker(new MarshallSpeaker());
		tv.powerOn();
		tv.ChannelUp();
		tv.ChannelUp();
		tv.soundUp();
		tv.powerOff();
		
	}
}
