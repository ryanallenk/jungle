describe('jungle app', () => {

  it ('visits the homepage', () => {
    cy.visit('http://localhost:3000')
  })

  it("Navigates to the product detail page", () => {
    cy.get(".products article").should("be.visible");
  })

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

});