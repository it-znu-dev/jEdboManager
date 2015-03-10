/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jSoapCommon;


/**
 *
 * @author sinepolksy
 */
public class GuidesSoapRealExecutor extends GuidesSoapExecutor {
  
  public GuidesSoapRealExecutor(){
    this._debug("Створення об’єкта класу jEdboGuides.EDBOGuides ...");
    jEdboGuides.EDBOGuides eg = new jEdboGuides.EDBOGuides();
    this._debug("Створено!");
    this._debug("Створення об’єкта класу jEdboGuides.EDBOGuidesSoap ...");
    jEdboGuides.EDBOGuidesSoap egs = eg.getEDBOGuidesSoap();
    this._debug("Створено!");
    this.edbo_guides = eg;
    this.soap = egs;
  }
  
}
