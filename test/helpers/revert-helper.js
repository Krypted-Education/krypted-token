module.exports = async promise => {
  try {
    await promise;
    assert.fail('Failed.');
  } catch (error) {
    const invalidOpcode = error.message.search('invalid opcode') >= 0;
    const outOfGas = error.message.search('out of gas') >= 0;
    const revert = error.message.search('revert') >= 0;
    assert.equal(invalidOpcode || outOfGas || revert, true);
  }
};
