const MintableToken = artifacts.require('MintableToken');


contract('MintableToken', accounts => {
  const owner = accounts[0];
  beforeEach(async function() {
    this.token = await MintableToken.new({ from: owner });
  });

  describe('minting finished', function() {
    describe('when the token is not finished', function() {
      it('returns false', async function() {
        const mintingFinished = await this.token.mintingFinished();
        assert.equal(mintingFinished, false);
      });
    });

    describe('when the token is finished', function() {
      // beforeEach(async function() {
      //   await this.token.finishMinting({ from: owner });
      // });
      // it('returns true', async function() {
      //   const mintingFinished = await this.token.mintingFinished.call();
      //   assert.equal(mintingFinished, true);
      // });
    });
  });
});
