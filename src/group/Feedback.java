package group;

import java.io.*;
import java.sql.*;
import oracle.jdbc.*;

public class Feedback implements Serializable {
  private double userId;
  private double itemId;
  private double overallSatisfaction;
  private double itemQuality;
  private double delivery;
  private String comments;
  
  public double getUserId() {
    return userId;
  }
  
  public void setUserId(double userId) {
    this.userId = userId;
  }
  
  public double getItemId() {
    return itemId;
  }
  
  public void setItemId(double itemId) {
    this.itemId = itemId;
  }
  
  public double getOverallSatisfaction() {
    return overallSatisfaction;
  }
  
  public void setOverallSatisfaction(double overallSatisfaction) {
    this.overallSatisfaction = overallSatisfaction;
  }
  
  public double getItemQuality() {
    return itemQuality;
  }
  
  public void setItemQuality(double itemQuality) {
    this.itemQuality = itemQuality;
  }
  
  public double getDelivery() {
    return delivery;
  }
  
  public void setDelivery(double delivery) {
    this.delivery = delivery;
  }
  
  public String getComments() {
    return comments;
  }
  
  public void setComments(String comments) {
    this.comments = comments;
  }
  
  public Feedback() {
  }
}