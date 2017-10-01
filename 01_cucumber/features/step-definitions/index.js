//Complete siguiendo las instrucciones del taller

var { defineSupportCode } = require('cucumber');
var { expect } = require('chai');

defineSupportCode(({Given, When, Then}) => {
    Given('I go to losestudiantes home screen', () => {
        browser.url('/');
        if(browser.isVisible('button=Cerrar')) {
            browser.click('button=Cerrar');
        }
    });

    When('I open the login screen', () => {
        browser.waitForVisible('button=Ingresar', 5000);
        browser.click('button=Ingresar');
    });

    When(/^I fill with my (.*), (.*), (.*), selected a (.*), fill my (.*) and accept the (.*) and conditions$/, 
        (name, lastname, email, department, password, terms) => {
            var cajaSignUp = browser.element('.cajaSignUp');
            cajaSignUp.element('input[name="nombre"]').click().keys(name);
            cajaSignUp.element('input[name="apellido"]').click().keys(lastname);
            cajaSignUp.element('input[name="correo"]').click().keys(email);
            cajaSignUp.element('input[name="password"]').click().keys(password);
            if(department !== "")
                cajaSignUp.element('select[name="idDepartamento"]').selectByValue('3');
            if(terms !== "")
                cajaSignUp.element('input[name="acepta"]').click();
    });

    When('I try to register', () => {
        var cajaSignUp = browser.element('.cajaSignUp');
        cajaSignUp.element('button=Registrarse').click();
    });

    Then(/^I expect do not see the errors : (.*), (.*) and (.*)$/, 
        (error_email, error_password, error_terms) => {
            if(error_email !== "" && error_password !== "" && error_terms !== "") {
                browser.waitForVisible('.aviso.alert.alert-danger', 5000);
                var alertText = browser.element('.aviso.alert.alert-danger').getText();
                var msgErrors = [
                    error_email, 
                    error_password, 
                    error_terms
                ];
                //Saber si alguno de los siguientes errores es mostrando...
                var showError = false;
                var numBerError = 0;
                for(var i = 0; i < msgErrors.length; i++) {
                    if(msgErrors[i] === alertText) {
                        showError = true;
                        numBerError = i;
                        break;
                    }
                }
                if(showError) {
                    expect(alertText).to.include(msgErrors[numBerError]);
                }
            }
    });
});