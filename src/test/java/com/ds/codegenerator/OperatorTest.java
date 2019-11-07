package com.ds.codegenerator;

import org.junit.Test;

import java.util.Optional;
import java.util.Random;

/**
 * @author jerryli
 * @description
 * @date 2019-11-06 14:01
 */
public class OperatorTest {

    @Test
    public void orElse(){
        String[] names = new String[]{"zhang", "wang", "li", "zhao", "wu"};
        Optional.of("wang").orElse(getRandomName(names)); // 执行该句时会打印"Generating a name..."
        Optional.of("wang").orElseGet(() -> getRandomName(names));
    }


    public static String getRandomName(String[] names) {
        System.out.println("Generating a name...");
        Random random = new Random();
        return names[random.nextInt(5)];
    }
}
