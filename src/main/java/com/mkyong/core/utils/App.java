package com.mkyong.core.utils;
import java.util.concurrent.*;
import java.util.*;
import org.joda.time.LocalDate;

public class App {


	public static void main(String[] args) {


//ScheduledExecutorService scheduler
//                            = Executors.newSingleThreadScheduledExecutor();
 
//        Runnable task = new Runnable() {
//            public void run() {
//                System.out.println("Hi!");
 //           }
 //       };
 
//        int delay = 5;
//        scheduler.schedule(task, delay, TimeUnit.SECONDS);
        //scheduler.shutdown();

Timer t = new Timer();
t.schedule(new TimerTask() {
    @Override
    public void run() {
       System.out.println("Hello World");
    }
}, 0, 5000);

	}


}
