package com.edix.psp;
import java.util.HashMap;
import java.util.Map;

public class AppThread extends Thread {

    private Integer number;
    private Boolean isOddNumber;
    private Long startAt;

    public static Map<Integer, Boolean> record = new HashMap<Integer, Boolean>();

    public AppThread(Integer number) {
        this.number = number;
        this.startAt =  System.currentTimeMillis();
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Boolean getIsOddNumber() {
        return isOddNumber;
    }

    public void setIsOddNumber(Boolean isOddNumber) {
        this.isOddNumber = isOddNumber;
    }

    @Override
    public void run() {

        if (number % 2 == 0) {
            System.out.print(" ("+this.number+") is even number! \n ");
            this.isOddNumber = false;

            record.put(getNumber(), getIsOddNumber());


        } else {
            System.out.print(" ("+this.number+") is odd number! \n ");
            this.isOddNumber = true;
            
            record.put(getNumber(), getIsOddNumber());

        }
        


        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            System.out.println(this.toString());
        }

        
        
       
    }

    @Override
    public String toString() {
        return " +------------------------------------\n" + 
        " | Thread: "+ this.getName() + "\n"+
        " | Number: "+ this.number + "\n"+
        " | Milliseconds: "+ (System.currentTimeMillis()-this.startAt) + "\n"+
        " | Odd number: " + this.isOddNumber + "\n"+
        " +------------------------------------"; 
    }

}