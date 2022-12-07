package com.edix.psp;

import java.util.InputMismatchException;
import java.util.Scanner;

/**
 * Hello world!
 *  @author Ricard Penin Honrubia
 */
public class App {

    private static final Scanner scanner = new Scanner(System.in);
    private static final Integer ammount = 4;

    public static void main(String[] args) {
        System.out.println("Hello Thread! please enter " + ammount + " numbers. ");  
        while (AppThread.record.size() < ammount-1) {
            AppThread thread = new AppThread(input());
            thread.start();
            
        }
        System.out.print(" [ 4 numbers have already been detected ] ");
        // scanner.nextLine();
        scanner.close();
        // System.out.println("is Odd Number: " + AppThread.record.toString());

    }

    public static Integer input() {
        System.out.print(" +-> Please enter a number: ");
        try {
            
            if (scanner.hasNextLine()) {
                return Integer.parseInt(scanner.nextLine());
            } else {
                return input();
            }
            
        }  catch (NumberFormatException e) {
            return input();
        }  catch (InputMismatchException e) {
            return input();
        }
    }
    
}
