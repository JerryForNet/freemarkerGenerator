package com.mycode.mytest2;

import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;

public class MyTask extends Thread {

    private AtomicInteger num;

    private ConcurrentHashMap<String, Object> concurrentHashMap;

    private Vector<Object> vector;

    private List<Integer> list;
    //阻塞队列
    private BlockingQueue<Object> blockingQueue;
    //双向队列
    private BlockingDeque<Object> blockingDeque;

    //特殊的阻塞队列
    private java.util.concurrent.LinkedBlockingQueue<Object> linkedBlockingQueue;

    //特殊的双向队列
    private java.util.concurrent.LinkedBlockingDeque<Object> LinkedBlockingDeque;

    public MyTask(AtomicInteger num) {
        this.num = num;
    }

    public MyTask(Vector<Object> vector) {
        this.vector = vector;
    }

    public MyTask(ConcurrentHashMap<String, Object> concurrentHashMap) {
        this.concurrentHashMap = concurrentHashMap;
    }

    public MyTask(List<Integer> list) {
        this.list = list;
    }


    @Override
    public void run() {

        /*while(num.intValue()>0){
                System.out.print("\n -------"+Thread.currentThread().getName()+"减一操作后结果"+num.getAndDecrement());
                try {
                    Thread.sleep(1000L);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                Thread.yield();
        }*/

        /*while(vector.size()>0){
            System.out.print("\n -------"+Thread.currentThread().getName()+"开始的大小-"+vector.size()+"处理一个"+vector.get(0)+"将处理掉的删除-"+vector.remove(0)+"删除后的倒大小-"+vector.size());
            try {
                Thread.sleep(1000L);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            Thread.yield();
        }*/

       /* while(concurrentHashMap.size()>0){


            for(Map.Entry<String,Object> entry:concurrentHashMap.entrySet()){
                System.out.print("\n -------"+Thread.currentThread().getName()+"处理掉的key-"+entry.getKey()+"删除处理完的key-"+concurrentHashMap.remove(entry.getKey()));
            }
            try {
                Thread.sleep(1000L);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            Thread.yield();
        }*/


        while (list.size() > 0) {
            System.out.print("\n -------" + Thread.currentThread().getName() + "处理一个元素-" + list.get(0) + "删除处理完的元素-" + list.remove(0));
            try {
                Thread.sleep(1000L);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            Thread.yield();
        }


    }


    public static void main(String[] args) {
       /*
       注意：
       必须是线程同步的容器
       */
        AtomicInteger num = new AtomicInteger(100);

       /* final MyTask task1 = new MyTask(num);
        final MyTask task2 = new MyTask(num);
        task1.start();
        task2.start();*/


        Vector<Object> vector = new Vector<>();
        vector.add(1);
        vector.add(2);
        vector.add(3);
        vector.add(4);
        /*
        final MyTask task1 = new MyTask(vector);
        final MyTask task2 = new MyTask(vector);
        task1.start();
        task2.start();*/

        ConcurrentHashMap<String, Object> concurrentHashMap = new ConcurrentHashMap<>();
        concurrentHashMap.put("one", 1);
        concurrentHashMap.put("two", 2);
        concurrentHashMap.put("three", 3);
        concurrentHashMap.put("four", 4);


       /* final MyTask task1 = new MyTask(concurrentHashMap);
        final MyTask task2 = new MyTask(concurrentHashMap);
        task1.start();
        task2.start();*/

        List<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(2);
        list.add(3);
        list.add(4);
        list.add(5);
        //线程不安全的容器不可以多线程操作，数据容易错误
        /*final MyTask task1 = new MyTask(list);
        final MyTask task2 = new MyTask(list);
        task1.start();
        task2.start();*/

        List<Integer> synlist = Collections.synchronizedList(list);

        /*final MyTask task1 = new MyTask(synlist);
        final MyTask task2 = new MyTask(synlist);
        task1.start();
        task2.start();*/


       /*阻塞队列与普通队列的而区别在于，当队列是空时，从队列中获取元素的操作会被阻塞，
        或则当队列是满的时，往队列中增加元素会被阻塞，试图从空的队列中取元素的线程或从满的队列中添加元素的线程同样会被阻塞。*/



       /* add：添加元素到队列里，添加成功返回true，由于容量满了添加失败会抛出IllegalStateException异常
        offer：添加元素到队列里，添加成功返回true，添加失败返回false
        put：添加元素到队列里，如果容量满了会阻塞直到容量不满
        3个删除方法:
        poll：删除队列头部元素，如果队列为空，返回null。否则返回元素。
        remove：基于对象找到对应的元素，并删除。删除成功返回true，否则返回false
        take：删除队列头部元素，如果队列为空，一直阻塞到队列有元素并删除*/



        /*阻塞队列==BlockingQueue
        ArrayBlockingQueue      一个基于数组实现（有界）阻塞队列
        LinkedBlockingQueue,    一个基于链表实现的（有界）阻塞队列
        LinkedBlockingDeque,    一个基于链表实现的（双向）阻塞队列
        PriorityBlockingQueue,  一个基于数组实现的支持优先级排序的（无界）阻塞队列
        DelayQueue,             一个基于数组使用优先级队列实现的（无界）阻塞队列
        SynchronousQueue，      一个基于不实际存储元素的阻塞队列
        LinkedTransferQueue,    一个基于链表实现的（无界）阻塞队列*/



       /* 1) ConcurrentHashMap
        2) ConcurrentSkipListMap
        3) ConcurrentSkipListSet
        4) ConcurrentLinkedQueue
        5) ConcurrentLinkedDeque
        6) CopyOnWriteArrayList
        7) CopyOnWriteArraySet*/


    }
}
