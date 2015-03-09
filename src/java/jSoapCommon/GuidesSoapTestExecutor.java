/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jSoapCommon;


/**
 *
 * @author sinepolsky
 */
public class GuidesSoapTestExecutor extends GuidesSoapExecutor {
  
  public GuidesSoapTestExecutor(){
    this.edbo_guides = new jEdboGuidesTest.EDBOGuides();
    this.soap = ((jEdboGuidesTest.EDBOGuides)this.edbo_guides).getEDBOGuidesSoap();
  }
  
}
