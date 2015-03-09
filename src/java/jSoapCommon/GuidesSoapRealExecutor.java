/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jSoapCommon;

import jEdboGuides.EDBOGuides;


/**
 *
 * @author sinepolksy
 */
public class GuidesSoapRealExecutor extends GuidesSoapExecutor {
  
  public GuidesSoapRealExecutor(){
    this.edbo_guides = new EDBOGuides();
    this.soap = (((EDBOGuides)this.edbo_guides).getEDBOGuidesSoap());
  }
  
}
