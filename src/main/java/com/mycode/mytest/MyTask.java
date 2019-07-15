package com.mycode.mytest;

import lombok.Data;

import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.locks.ReentrantLock;

@Data
public class MyTask implements Runnable {

    private AtomicInteger atomicInteger;

    private volatile int num;


    /**
     * 重入锁
     */
    private ReentrantLock reentrantLock;

    public final static Object lock = new Object();

    public MyTask(Integer num) {
        this.num = num;
    }

    public MyTask(AtomicInteger atomicInteger) {
        this.atomicInteger = atomicInteger;
    }

    public void run() {
        /*while (num>0){
            synchronized(lock){
              System.out.print(Thread.currentThread().getName()+"=="+num+"=="+ (num=num-1)+"\n");

            }
        }*/

        while (atomicInteger.intValue() > 0) {
            synchronized (lock) {
                System.out.print(Thread.currentThread().getName() + "==" + atomicInteger.intValue() + "\n");
                atomicInteger.getAndDecrement();
            }

        }
    }
}
