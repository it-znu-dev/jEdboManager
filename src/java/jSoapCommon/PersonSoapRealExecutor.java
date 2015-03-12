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
public class PersonSoapRealExecutor extends PersonSoapExecutor {
  
  public PersonSoapRealExecutor(){
    GuidesSoapRealExecutor._debug("Створення об’єкта класу jEdboPerson.EDBOPerson ...");
    jEdboPerson.EDBOPerson eg = new jEdboPerson.EDBOPerson();
    SoapExecutor._debug("Створено!");
    SoapExecutor._debug("Створення об’єкта класу jEdboPerson.getEDBOPersonSoap ...");
    jEdboPerson.EDBOPersonSoap egs = eg.getEDBOPersonSoap();
    SoapExecutor._debug("Створено!");
    this.edbo_guides = eg;
    this.soap = egs;
  }
}