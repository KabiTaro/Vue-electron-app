const toFizzBuzz = num => {
  if (isFizz(num) && isBuzz(num)) return 'FizzBuzz';
  if (isFizz(num)) return 'Fizz';
  if (isBuzz(num)) return 'Buzz';
  return num;
};

const isFizz = num => {
  return num % 3 == 0;
};

const isBuzz = num => {
  return num % 5 == 0;
};

describe('FizzBuzz', () => {
  test('3', () => {
    expect(toFizzBuzz(3)).toBe('Fizz');
  });
  test('15', () => {
    expect(toFizzBuzz(15)).toBe('FizzBuzz');
  });
  test('5', () => {
    expect(toFizzBuzz(5)).toBe('Buzz');
  })
})