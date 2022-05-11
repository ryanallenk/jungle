describe('jungle app', () => {

  it ('visits the homepage', () => {
    cy.visit('http://localhost:3000')
  })

  it("Navigates to the product detail page", () => {
    cy.get(".products article:first").click();
  })

});