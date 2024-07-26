package com.khac.swp.fuj.controller;

import java.util.Random;

public class CodeGenerator {
    public static String generateRandomCode(int length) {
        Random random = new Random();
        StringBuilder code = new StringBuilder();

        for (int i = 0; i < length; i++) {
            int digit = random.nextInt(10); // generates a number between 0 and 9
            code.append(digit);
        }

        return code.toString();
    }
}
