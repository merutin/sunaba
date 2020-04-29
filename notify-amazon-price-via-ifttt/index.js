const puppeteer = require("puppeteer");
const axios = require("axios");
require('dotenv').config();

const uri = `https://maker.ifttt.com/trigger/pricedown/with/key/${process.env.IFTTT_KEY}`;

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  await page.goto(
    `https://www.amazon.co.jp/gp/offer-listing/${process.env.AMAZON_ITEM_KEY}`
  );
  const val = await page.$$eval(
    ".olpOfferPrice",
    (nodes) => nodes[0].innerText
  );
  const price = val.replace("￥", "").replace(",", "").trim();

  if (price < process.env.TARGET_PRICE) {
    const response = await axios.post(uri, {
      value1: price,
    });

    console.log(`res: ${response}`);
  }

  await browser.close();
})();
