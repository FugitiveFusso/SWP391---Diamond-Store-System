package com.khac.swp.fuj.controller;

import java.util.Random;

public class CodeGenerator {

    public static String generateCodeST(int length) {
        Random random = new Random();
        StringBuilder code = new StringBuilder("ST"); // prepend "ST"

        for (int i = 0; i < length; i++) {
            int digit = random.nextInt(10); // generates a number between 0 and 9
            code.append(digit);
        }

        return code.toString();
    }

    public static String generateCodeDO(int length) {
        Random random = new Random();
        StringBuilder code = new StringBuilder("DO"); // prepend "ST"

        for (int i = 0; i < length; i++) {
            int digit = random.nextInt(10); // generates a number between 0 and 9
            code.append(digit);
        }

        return code.toString();
    }
}
