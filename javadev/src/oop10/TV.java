package oop10;

public interface TV {
	
	// 디폴트 메소드
	public default void setSpeaker(Speaker speaker) {};
	
	//abstract 써도 되고 안써도 댐
	public abstract void powerOn() ;
	public abstract void powerOff() ;
	public abstract void ChannelUp() ;
	public abstract void ChannelDown() ;
	public abstract void soundUp() ;
	public abstract void soundDown() ;
}
