url=''
const puppeteer = require('puppeteer');
(async () => {
  const browser = await puppeteer.launch()
  const page = await browser.newPage()

  await page.setViewport({ width: 1433, height: 736 })

  await page.goto(url)

  await browser.close()
})();
