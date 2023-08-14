/* eslint-disable no-undef */
describe('Home', () => {
  it('Visit home', () => {
    cy.visit('/');
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  
  it('Visit a product detail page', () => {
    cy.get(".products article").first().click();
    cy.url().should("include", "/products/2");
  });


});