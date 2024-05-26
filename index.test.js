const request = require('supertest');
const app = require('./index');
let server;

// Start server before all tests on a dynamic port
beforeAll((done) => {
  // Listen on a dynamic port
  server = app.listen(0, () => {
    done();
  });
});

// Close server after all tests
afterAll((done) => {
  server.close(done);
});

describe('GET /', () => {
  it('responds with Hello World!', async () => {
    const response = await request(server).get('/');
    expect(response.statusCode).toBe(200);
    expect(response.text).toContain('Hello World!');
  });
});
