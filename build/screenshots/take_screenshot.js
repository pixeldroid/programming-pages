/*
takes a screenshot of the locally running jekyll site
 expects the following environment variables:
 - BROWSER_PATH : path to Chromium or Chrome executable
 - HEIGHT : vertical dimension of screenshot, in pixels
 - WIDTH : horizontal dimension of screenshot, in pixels
*/
const puppeteer = require('puppeteer-core');
const success = 0;
const failure = 1;

(async () => {
  const exe = process.env.BROWSER_PATH;
  const w = parseInt(process.env.WIDTH);
  const h = parseInt(process.env.HEIGHT);
  const url = 'http://localhost:4000/';

  console.info('opening ' +url +'..');
  const browser = await puppeteer.launch({executablePath: exe});
  const page = await browser.newPage();
  await page.setViewport({width:w, height:h})
  await page.goto(url);
  await page.waitFor(500);

  console.info('taking screenshot..');
  await page.screenshot({path: 'screenshot.png'});

  console.info('done! closing browser..');
  await browser.close();

})()
.catch(err => { process.exit(failure); });
