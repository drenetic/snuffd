import { Controller } from "@hotwired/stimulus"

const facts = ["More than 1 million sexually transmitted infections (STIs) are acquired every day worldwide, the majority of which are asymptomatic (WHO)",
              "In 2021 there were 86,916 diagnoses of chlamydia, 26,577 of gonorrhoea and 5,570 of infectious syphilis in Australia (Kirby Institute, UNSW)",
              "In Australia, there continue to be high rates of chlamydia, gonorrhoea and syphilis diagnosed among gay and bisexual men living in major cities (Kirby Institute, UNSW)",
              "In Australia, more than one in 25 young people aged between 15-29 in Australia had chlamydia during 2021 but less than a third of those young people received a chlamydia diagnosis",
              "Each year there are an estimated 374 million new infections with 1 of 4 curable STIs: chlamydia, gonorrhoea, syphilis and trichomoniasis (WHO)",
              "More than 500 million people 15–49 years are estimated to have a genital infection with herpes simplex virus (HSV or herpes)(WHO)",
              "Human papillomavirus (HPV) infection is associated with over 311 000 cervical cancer deaths each year(WHO)",
              "Almost 1 million pregnant women were estimated to be infected with syphilis in 2016, resulting in over 350 000 adverse birth outcomes(WHO)",
              "STIs have a direct impact on sexual and reproductive health through stigmatization, infertility, cancers and pregnancy complications and can increase the risk of HIV(WHO)",
              "Drug resistance is a major threat to reducing the burden of STIs worldwide(WHO)",
              "More than 30 different bacteria, viruses and parasites are known to be transmitted through sexual contact, including vaginal, anal and oral sex (WHO)",
              "In 2020, WHO estimated 374 million new infections with 1 of 4 STIs: chlamydia (129 million), gonorrhoea (82 million), syphilis (7.1 million) and trichomoniasis (156 million) (WHO)",
              "More than 490 million people were estimated to be living with genital herpes in 2016, and an estimated 300 million women have an HPV infection, the primary cause of cervical cancer and anal cancer among men who have sex with men(WHO)"];
const factIndex = 0;

export default class extends Controller {
  static targets = ["facts-display", "fact-string"]

  onConnect() {
    console.log("Home Controller Connected");
  }

  randomizeFacts () {
    let fact = document.getElementById("fact-string").innerHTML = facts[factIndex];
    let factIndex = (factIndex + 1) % facts.length;
  }

  // setInterval(randomizeFacts(), 1000);
}
