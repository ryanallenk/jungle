describe('jungle app', () => {

  it ('visits the homepage', () => {
    cy.visit('http://localhost:3000')
  })

  it("adds the item to the user cart", () => {
    cy.get(".products")
    cy.get('.btn').click();
    cy.get(':nth-child(4) > .nav-link').should('contain', 'My Cart (1)')
  })

});