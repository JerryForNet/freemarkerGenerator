package com.mycode.mytest;

import com.sun.jdi.Bootstrap;

import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.locks.ReentrantLock;

public class MyTest {


    /**
     *创建一个定长线程池，可控制线程最大并发数，超出的线程会在队列中等待。
     */
    private ExecutorService fixedThreadPool = Executors.newFixedThreadPool(2);//包含2个线程对象

    /**
     *创建一个定长线程池，支持定时及周期性任务执行。
     */
    private ExecutorService scheduledThreadPool = Executors.newScheduledThreadPool(2);

    /**
     *创建一个可缓存线程池，如果线程池长度超过处理需要，可灵活回收空闲线程，若无可回收，则新建线程。
     */
    private ExecutorService cachedThreadPool = Executors.newCachedThreadPool();

    private ExecutorService workStealingPool = Executors.newWorkStealingPool();

    /**
     * 创建一个单线程化的线程池，它只会用唯一的工作线程来执行任务，保证所有任务按照指定顺序(FIFO, LIFO, 优先级)执行。
     */
    private ExecutorService singleThreadExecutor = Executors.newSingleThreadExecutor();


    /**
     * 线程池的默认实现
     */
    private ExecutorService threadPoolExecutor = new ThreadPoolExecutor(3,4,1000L,TimeUnit.MILLISECONDS,new LinkedBlockingDeque<Runnable>());

    /**
     * 重入锁
     */
    private ReentrantLock reentrantLock;


    private AtomicInteger  atomicInteger =new AtomicInteger(10);

    public void test(AtomicInteger atomicInteger){
//        多个线程处理一个任务，在任务中对要处理的对象枷锁
        Thread task1=new Thread(new MyTask(atomicInteger),"线程1");
        Thread task2=new Thread(new MyTask(atomicInteger),"线程2");
        task1.start();
        task2.start();

//        threadPoolExecutor.execute(new MyTask(atomicInteger));

    }

    public void test2(Integer num){
//        多个线程处理一个任务，在任务中对要处理的对象枷锁
        Thread task1=new Thread(new MyTask(num),"线程1");
        Thread task2=new Thread(new MyTask(num),"线程2");
        task1.start();
        task2.start();

//        threadPoolExecutor.execute(new MyTask(atomicInteger));

    }

    public void test3(Integer num){
//        多个线程处理一个任务，在任务中对要处理的对象枷锁
        Thread task1=new Thread(new MyTask(num),"线程1");
        System.out.print(Thread.currentThread().getThreadGroup());
        task1.start();

//        threadPoolExecutor.execute(new MyTask(atomicInteger));

    }

    public static void main(String[] args) {

        System.out.print(Thread.currentThread().getThreadGroup());
        MyTest demo = new MyTest();
//        demo.test(new AtomicInteger(1000));
        demo.test3(10);
    }



}
