const OwnedByContract = artifacts.require('OwnedByContract');
const isRevertError = require('./helpers/revert-helper');

contract('OwnedByContract', ([owner, someAddress]) => {
  let token;
  beforeEach(async () => {
    token = await OwnedByContract.new({ from: owner });
  });
  describe('when transfering ownership to an externally owned contract', () => {
    it('throws an error', async () => {
      isRevertError(token.setMinterContract(someAddress, { from: owner }));
    });
  });
});
