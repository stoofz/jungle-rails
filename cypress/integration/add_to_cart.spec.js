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
  
  it('Add product to cart, which increase cart to 1', () => {
    cy.contains('My Cart (0)');
    cy.contains('Add').first().click({ force: true });
    cy.contains('My Cart (1)');
  });

});