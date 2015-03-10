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
    this._debug("Створення об’єкта класу jEdboGuidesTest.EDBOGuides ...");
    jEdboGuidesTest.EDBOGuides eg = new jEdboGuidesTest.EDBOGuides();
    this._debug("Створено!");
    this._debug("Створення об’єкта класу jEdboGuidesTest.EDBOGuidesSoap ...");
    jEdboGuidesTest.EDBOGuidesSoap egs = eg.getEDBOGuidesSoap();
    this._debug("Створено!");
    this.edbo_guides = eg;
    this.soap = egs;
  }
  
}
