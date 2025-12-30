---
layout: default
---
<style>
/* Color variables for easy customization */
:root {
  --accent-color: #ea580c; /* Orange accent */
  --accent-light: #fed7aa; /* Light orange */
  --accent-gradient: linear-gradient(135deg, #ea580c, #dc2626);
}

img[alt] {
  filter: grayscale(100%);
  transition: filter 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
  cursor: pointer;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  position: relative;
}

img[alt]:hover {
  filter: grayscale(0%);
  transform: translateY(-2px);
  box-shadow: 0 8px 25px rgba(234, 88, 12, 0.3);
}

/* Elegant clickable indicator - double arrow */
.person-card {
  position: relative;
}

.person-card img[alt] {
  position: relative;
}

.person-card::after {
  content: "⟫";
  position: absolute;
  top: 2px;
  left: 50%;
  transform: translateX(calc(90px - 14px));
  background: linear-gradient(135deg, rgba(234, 88, 12, 0.9), rgba(220, 38, 38, 0.9));
  color: white;
  width: 28px;
  height: 28px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 12px;
  font-weight: normal;
  letter-spacing: -1px;
  opacity: 0.8;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  pointer-events: none;
  z-index: 10;
  box-shadow: 0 2px 8px rgba(234, 88, 12, 0.3);
  backdrop-filter: blur(4px);
}

.person-card:hover::after {
  opacity: 1;
  transform: translateX(calc(90px - 14px)) scale(1.15) rotate(5deg);
  box-shadow: 0 4px 16px rgba(234, 88, 12, 0.4);
}

/* Section headings with color accent */
#main_content h1 {
  color: #1f2937;
  text-align: center;
  margin-bottom: 2rem;
}

h3 {
  color: var(--accent-color);
  border-bottom: 3px solid var(--accent-color);
  padding-bottom: 0.5rem;
  margin: 2rem 0 1.5rem 0;
  position: relative;
}

h3::after {
  content: '';
  position: absolute;
  bottom: -3px;
  left: 0;
  width: 50px;
  height: 3px;
  background: var(--accent-gradient);
}

/* Person cards without background */
.person-card {
  transition: all 0.3s ease;
  padding: 0;
  border-radius: 0;
  background: none;
  box-shadow: none;
  border: none;
}

.person-card:hover {
  background: none;
  transform: none;
  box-shadow: none;
  border: none;
}

.person-text {
  text-align: center;
  margin-top: 10px;
}

.person-name {
  font-weight: 600;
  color: #1f2937;
  margin-bottom: 0.25rem;
}

.person-title {
  font-size: 0.9em;
  color: var(--accent-color);
  font-weight: 500;
}

/* Principal investigator special styling */
.pi-card {
  background: var(--accent-gradient);
  color: white;
  padding: 2rem;
  border-radius: 16px;
  box-shadow: 0 8px 30px rgba(234, 88, 12, 0.3);
  margin: 2rem auto;
  max-width: 500px;
}

.pi-card .person-name {
  color: white;
  font-size: 1.2em;
}

.pi-card .person-title {
  color: rgba(255, 255, 255, 0.9);
}

/* Modal styles */
.modal {
  display: none;
  position: fixed;
  z-index: 1000;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0,0,0,0.8);
  backdrop-filter: blur(5px);
}

.modal-content {
  background: linear-gradient(145deg, #ffffff, #f8fafc);
  margin: 5% auto;
  padding: 2rem;
  border: none;
  border-radius: 16px;
  width: 80%;
  max-width: 600px;
  position: relative;
  animation: modalFadeIn 0.3s;
  box-shadow: 0 20px 60px rgba(0,0,0,0.3);
  border: 2px solid var(--accent-color);
}

@keyframes modalFadeIn {
  from {opacity: 0; transform: translateY(-50px);}
  to {opacity: 1; transform: translateY(0);}
}

.close {
  color: var(--accent-color);
  float: right;
  font-size: 28px;
  font-weight: bold;
  cursor: pointer;
  line-height: 1;
  transition: color 0.3s ease;
}

.close:hover,
.close:focus {
  color: #dc2626;
}

.modal-image {
  width: 200px;
  height: 200px;
  border-radius: 50%;
  object-fit: cover;
  display: block;
  margin: 0 auto 20px auto;
  filter: none !important;
  border: 4px solid var(--accent-color);
  box-shadow: 0 8px 25px rgba(234, 88, 12, 0.3);
}

.modal-name {
  text-align: center;
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 10px;
  color: #1f2937;
}

.modal-title {
  text-align: center;
  font-size: 16px;
  color: var(--accent-color);
  margin-bottom: 20px;
  font-weight: 600;
}

.modal-bio {
  text-align: justify;
  line-height: 1.6;
  font-size: 16px;
  color: #4b5563;
}

/* Social media icons */
.social-icons {
  display: flex;
  justify-content: center;
  gap: 15px;
  margin: 15px 0 20px 0;
}

.social-icon {
  display: inline-block;
  width: 32px;
  height: 32px;
  text-decoration: none;
  transition: transform 0.3s ease, opacity 0.3s ease;
}

.social-icon:hover {
  transform: translateY(-2px);
  opacity: 0.8;
}

.social-icon svg {
  width: 100%;
  height: 100%;
  fill: #4b5563;
  transition: fill 0.3s ease;
}

.social-icon:hover svg {
  fill: var(--accent-color);
}
</style>

<!-- Modal -->
<div id="personModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <img id="modalImage" class="modal-image" src="" alt="">
    <div id="modalName" class="modal-name"></div>
    <div id="modalTitle" class="modal-title"></div>
    <div id="modalSocial" class="social-icons"></div>
    <div id="modalBio" class="modal-bio"></div>
  </div>
</div>

<script>
console.log("JavaScript loading...");

// Bio data for each person
const bioData = {
  "Jason Hattrick-Simpers": {
    title: "Principal Investigator",
    bio: "Jason Hattrick-Simpers leads the Autonomous Discovery of Alloys (AutoDIAL) research group at the University of Toronto. His research focuses on autonomous materials discovery, high-throughput experimentation, and machine learning applications in materials science.",
    social:{
      linkedin:"https://www.linkedin.com/in/jason-hattrick-simpers-8462ab20/",
      scholar:"https://scholar.google.com/citations?user=P3ce5ZwAAAAJ&hl=en&oi=ao"
    }
  },
  "Yutong Liu": {
    title: "Post Doc",
    bio: "<p>Yutong Liu joined the group in December 2023 as a postdoctoral fellow. She is currently working on autonomous materials discovery for oxygen evolution reaction (OER) catalysts using high-throughput experimentation. Yutong completed her Ph.D. in Chemistry at University of Waterloo (2018–2023), where her research focused on defect investigation in hematite photoanodes for solar water splitting. She holds a Bachelor of Science in Materials and Nanosciences from the University of Waterloo and a Bachelor of Engineering from Beijing Jiaotong University, both earned through the BJTU-UW 2+2 Joint Program (2014–2018).</p><p>Outside of work, Yutong enjoys movies, yelling at soccer games, and relaxing with her two cats.</p>",
    social:{
      linkedin:"https://www.linkedin.com/in/yutong-liu-63082022a/",

    }
  },
  "Changjun Cheng": {
    title: "Post Doc",
    bio: "<p>Changjun Cheng is currently a Postdoctoral Fellow in AUTOnomous DIscovery of ALloys (AUTODIAL) within the Department of Materials Science and Engineering at the University of Toronto. He received his doctorate, master’s, and bachelor’s degrees from University of Toronto, Zhejiang University, and Zhejiang University, respectively. His research focuses on the accelerated discovery of thermal stability and phase transition of nanocrystalline multiple-component materials, specifically in the investigation of high-throughput methods and high-entropy alloys. He also conducts collaborations with Toronto Nanofabrication Centre and Canadian Light Source for the high-throughput fabrication and characterization of nanostructured thin films.</p><p>Cheng’s scholarly contributions extend to over 10 peer-reviewed journal papers, including a notable research paper (Cheng et al. Advanced Materials 2024) and a recently published review paper (Cheng et al. Progress in Materials Science 2025) about high-throughput research on nanostructured HEAs.</p>",
    social:{
      linkedin: "https://www.linkedin.com/in/changjun-cheng-5b282a192/",
      researchgate: "https://www.researchgate.net/profile/Changjun-Cheng",
      scholar: "https://scholar.google.com/citations?user=hqUO03kAAAAJ&hl=en&oi=ao"
    }
  },
  "Ashley Dale": {
    title: "Post Doc",
    bio: "<p>Ashley Dale joined AutoDIAL as a Schmidt AI in Science Postdoctoral Fellow in October 2024. Her research focuses on Trustworthy AI Tools for Science, explainable uncertainty quantification for foundation models, and developing trustworthy autonomous laboratory platforms. In 2024, Ashley earned a Ph.D. in physics from Indiana University and a Ph.D. from Purdue University in electrical engineering with a topic in AI for computer vision.</p><p>Her personal website is found <a href='https://daleas0120.github.io/' target='_blank'>here</a>.",
    social:{
      linkedin:"https://www.linkedin.com/in/ashley-s-dale/",
      scholar:"https://scholar.google.com/citations?user=odI62RkAAAAJ&hl=en&oi=ao",
      website:"https://daleas0120.github.io/",
    }
  },
  "Hao Wan": {
    title: "Post Doc",
    bio: "<p>Hao Wan joined the group at the University of Toronto in June 2025. My research focuses on the synthesizability of novel HEOs. Before joining the University of Toronto, I was an Alexander von Humboldt Fellow at the Fritz-Haber-Institut of the Max Planck Society, where I developed DFT-based machine learning interatomic potentials to study catalyst degradation. I hold a PhD in Chemistry from the University of Copenhagen, where my work centered on understanding catalytic activity trends of catalysts on various electrochemical reactions via a descriptor-based approach.</p>",
    social:{
      linkedin:"www.linkedin.com/in/hao-wan-9b5833313",
      scholar:"https://scholar.google.com/citations?user=loE8V6oAAAAJ&hl=en&oi=ao"
    }
  },
  "Dan McHaffie": {
    title: "Post Doc",
    bio: "Dan McHaffie is a postdoctoral researcher working on materials science and artificial intelligence for autonomous science."
  },
  "Luke Menezes": {
    title: "Post Doc",
    bio: "Luke Menezes is a postdoctoral researcher working on materials science and artificial intelligence for autonomous science."
  },
  "YIN ZHU": {
    title: "Post Doc",
    bio: "Yin Zhu is a postdoctoral researcher working on materials science and artificial intelligence for autonomous science."
  },
  "Yonatan Kurniawan": {
    title: "Post Doc",
    bio: "Yonatan Kurniawan is a postdoctoral researcher working on materials science and artificial intelligence for autonomous science."
  },
  "Daniel Persaud": {
    title: "Ph.D. Student",
    bio: "Daniel Persaud is a Ph.D. student researching autonomous materials discovery and machine learning applications in materials science."
  },
  "Hongchen Wang": {
    title: "Ph.D. Student",
    bio: "Hongchen Wang is a Ph.D. student focusing on materials characterization and computational materials science."
  },
  "Qiuyu (Sara) Shi": {
    title: "Ph.D. Student",
    bio: "<p>Qiuyu (Sara) Shi is a 4th year Ph.D. candidate focusing on detecting and recovering noisy features in self-driving laboratories and studying degradation behaviors in electrochemical systems through Electrochemical Impedance Spectroscopy (EIS) analysis. Sara earned her Bachelor of Science in Materials and Nanoscience in 2019 and her Master of Applied Science (MASc) in Chemical Engineering (Nanotechnology) in 2021, both from the University of Waterloo.</p><p>An experienced experimentalist in Zn-ion batteries and solar cells, Sara is currently leveraging machine learning techniques for applications in materials science. She has led and contributed to multiple projects in collaboration with industrial and governmental partners, including Sekisui Co., Ltd. (Japan) and the National Research Council (NRC) Mississauga.</p><p>Sara actively participates in conferences and workshops, engaging with researchers across diverse disciplines. Her recent engagements include IMSI Workshop 2024, Accelerate Conference 2024, MRS Spring 2025, and UT2-MAC Workshop 2025. In her spare time, Sara enjoys playing badminton and practicing IPSC shooting.</p>",
    social:{
      linkedin: "https://www.linkedin.com/in/qiuyu-sara-shi/",
      scholar: "https://scholar.google.ca/citations?user=WmOtdtUAAAAJ&hl=en&oi=ao",
      cv: "https://drive.google.com/file/d/1kfdDXHULlfR2aVhbiOSZf4O2gldkyBk1/view?usp=sharing"
    }
  },
  "Runze Zhang": {
    title: "Ph.D. Student",
    bio: "<p>Runze Zhang joined the group in January 2022 and has been on a mission to teach machines how to do materials analysis. His research focuses on building open-source tools that facilitate materials analysis by reducing human bias and minimizing the need for a PhD-level brain to interpret experimental data. By blending statistical reasoning with machine learning, he hopes to make materials data not only more trustworthy and reproducible, but also less mysterious.</p><p>Before joining the group, Runze earned his BASc degree in Polymer Engineering and Science from the Harbin Institute of Technology. As an undergraduate, he worked on projects involving the synthesis, scale-up, modification, and application of polyhedral oligomeric silsesquioxanes.</p><p>Outside of research, Runze enjoys playing piano and chilling with his cats.</p>",
    social:{
      linkedin: "https://www.linkedin.com/in/runze-zhang-874442243/",
      scholar: "https://scholar.google.com/citations?hl=en&user=C8HyixEAAAAJ",
      github: "https://github.com/RunzeZhang123"
    }
  },
  "Rafael Espinosa Castañeda": {
    title: "Ph.D. Student",
    bio: "<p>Rafael Espinosa Castañeda is a Ph.D. candidate in Materials Science and Engineering at the University of Toronto, working under the supervision of Professor Jason Hattrick-Simpers. Before beginning his doctoral studies, he was the director of the Data Science and Mathematics Engineering program at Tecnológico de Monterrey, Campus Querétaro. Also, he was Lecturer of Physics, Mathematics and Data Science. He received a master’s in data science from the University of Texas at Austin, a Master’s in Theoretical Physics from the University of Cambridge and a bachelor’s in physics from Universidad de las Américas Puebla. Rafael’s research mainly focuses on Multi-Objective Active Learning to accelerate the discovery of next-generation battery materials. He also actively collaborates in Large Language Models and Open-Source AI Software for Materials Science.</p>",
    social:{
      linkedin: "www.linkedin.com/in/rafael-espinosa-276758148",
      scholar: "https://scholar.google.com/citations?user=bUpSQoAAAAAJ&hl=en&oi=ao"
    }
  },
  "Kevin Zhang": {
    title: "Graduate Student",
    bio: "Kevin Zhang is a graduate student working on materials discovery and experimental design."
  },
  "Mohammad Taha": {
    title: "Graduate Student",
    bio: "Mohammad Taha is a graduate student focusing on materials science and autonomous laboratory systems."
  },
  "Katherine Lei": {
    title: "AutoDIAL Alumnus",
    bio: "Katherine Lei is an AutoDIAL alumnus who contributed to the group's research in materials discovery and characterization."
  },
  "Ali Jaberi": {
    title: "AutoDIAL Alumnus - Now at NRC",
    bio: "Ali Jaberi is an AutoDIAL alumnus who now works at the National Research Council (NRC), applying his expertise in materials science."
  },
  "Hooman Chamani": {
    title: "AutoDIAL Alumnus - Now at WSP in Canada",
    bio: "Hooman Chamani is an AutoDIAL alumnus who now works at WSP in Canada, continuing his career in engineering and materials."
  },
  "Kangming Li": {
    title: "AutoDIAL Alumnus - Now at KAUST",
    bio: "Kangming Li is an AutoDIAL alumnus who now works at King Abdullah University of Science and Technology (KAUST)."
  },
  "Amin Sadeghi": {
    title: "AutoDIAL Alumnus - Now at Carbon Engineering",
    bio: "Amin Sadeghi is an AutoDIAL alumnus who now works at Carbon Engineering, focusing on sustainable technology solutions."
  },
  "Zhaoyang Zhao": {
    title: "AutoDIAL Alumnus",
    bio: "<p>Zhaoyang Zhao served as a Postdoctoral Fellow in the Department of Materials Science & Engineering at the University of Toronto beginning June 2024. His research focused on sensitivity analysis of X-ray diffraction (XRD) data and on using artificial intelligence (AI) to help experimentalist discover high-performance oxygen evolution reaction (OER) catalysts. Zhaoyang earned both his B.Sc. and Ph.D. in Materials Science and Engineering from the University of Science and Technology Beijing (2013–2024). During his doctoral studies, he developed automated pipelines that combine AI and optimization algorithms to analyze materials-characterization data—electrochemical impedance spectroscopy (EIS) and XRD—and advocates for the seamless integration of domain knowledge with AI to creatively address challenges in materials science.</p>",
    social:{
      linkedin: "https://www.linkedin.com/in/zhaoyang-zhao-573243328/",
      scholar: "https://scholar.google.com/citations?hl=en&user=0xMEjzEAAAAJ",
      researchgate: "https://www.researchgate.net/profile/Zhaoyang-Zhao-2",
      github: "https://github.com/DreamBoatOve"
    }
  },
  "Benhour Amirian": {
    title: "AutoDIAL Alumnus - Now at Apple",
    bio: "Benhour received a Ph.D. in Mechanical Engineering from the University of Alberta, where his research focused on physics-based modeling of failure in novel brittle materials. He has experience applying advanced computational methods to multiphysics modeling of additive manufacturing processes for high-entropy alloys, as well as integrating machine learning with conventional solvers for phase-field and crystal plasticity models. To speed up and automate the process, he is now integrating a machine learning framework into a physics-based model that captures the essential physical properties of electrochemical impedance spectroscopy."
  },
  "Suhas Mahesh": {
    title: "AutoDIAL Alumnus - Now at Schmidt Sciences",
    bio: "Suhas Mahesh is an AutoDIAL alumnus who now works at Schmidt Sciences, continuing his research in scientific innovation."
  },
  "Shayan Mousavi": {
    title: "AutoDIAL Alumnus - Now at Sanofi",
    bio: "Shayan Mousavi is an AutoDIAL alumnus who now works at Sanofi, applying his expertise in pharmaceutical research and development."
  }
};

// Modal functionality
const modal = document.getElementById("personModal");
const modalImage = document.getElementById("modalImage");
const modalName = document.getElementById("modalName");
const modalTitle = document.getElementById("modalTitle");
const modalSocial = document.getElementById("modalSocial");
const modalBio = document.getElementById("modalBio");
const closeBtn = document.querySelector(".close");

// Social media icon SVGs
const socialIcons = {
  github: '<svg viewBox="0 0 24 24"><path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/></svg>',
  linkedin: '<svg viewBox="0 0 24 24"><path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/></svg>',
  researchgate: '<svg viewBox="0 0 24 24"><path d="M19.586 0c-.818 0-1.508.19-2.073.565-.563.377-.87.936-.87 1.719 0 .785.307 1.346.92 1.719.613.377 1.463.565 2.563.565.818 0 1.508-.188 2.073-.565.563-.377.87-.934.87-1.719 0-.785-.307-1.342-.92-1.719C21.537.188 20.686 0 19.586 0zm-7.635 8.914c0-.564-.188-1.031-.564-1.406-.377-.377-.844-.564-1.406-.564s-1.031.188-1.406.564c-.377.375-.564.844-.564 1.406s.188 1.031.564 1.406c.375.377.844.564 1.406.564s1.031-.188 1.406-.564c.377-.375.564-.844.564-1.406zm11.635 6.199c0 1.688-.469 3.016-1.406 3.984-.938.969-2.25 1.453-3.938 1.453s-3-.484-3.938-1.453c-.938-.969-1.406-2.297-1.406-3.984 0-1.688.469-3.016 1.406-3.984.938-.969 2.25-1.453 3.938-1.453s3 .484 3.938 1.453c.938.969 1.406 2.297 1.406 3.984zM7.424 17.77c0-.66-.234-1.219-.703-1.687-.469-.469-1.031-.703-1.687-.703-.66 0-1.219.234-1.687.703-.469.469-.703 1.031-.703 1.687 0 .66.234 1.219.703 1.687.469.469 1.031.703 1.687.703.656 0 1.219-.234 1.687-.703.469-.469.703-1.031.703-1.687z"/></svg>',
  scholar: '<svg viewBox="0 0 24 24"><path d="M5.242 13.769L0 9.5 12 0l12 9.5-5.242 4.269C17.548 11.249 14.978 9.5 12 9.5c-2.977 0-5.548 1.748-6.758 4.269zM12 10a7 7 0 1 0 0 14 7 7 0 0 0 0-14z"/></svg>',
  website: '<svg viewBox="0 0 24 24"><path d="M12 0C5.372 0 0 5.372 0 12s5.372 12 12 12 12-5.372 12-12S18.628 0 12 0zm5.568 7.34c-.244 1.833-.781 3.518-1.548 4.957-.239-.008-.474-.012-.706-.012-2.109 0-4.077.365-5.747 1.024-2.415-2.426-4.216-5.817-4.216-9.309 0-1.142.156-2.25.441-3.317C6.973 1.718 9.388 2.8 12 2.8c3.017 0 5.704-1.344 7.568-3.46zM12 21.2c-5.083 0-9.2-4.117-9.2-9.2 0-.294.017-.584.048-.871 1.12.742 2.405 1.132 3.752 1.132 1.901 0 3.717-.646 5.129-1.82 1.895-.042 3.569-.435 4.898-1.082.239.008.474.012.706.012 2.109 0 4.077-.365 5.747-1.024C19.665 15.773 16.317 21.2 12 21.2z"/></svg>',
  cv: '<svg viewBox="0 0 24 24"><path d="M14 2H6c-1.1 0-1.99.9-1.99 2L4 20c0 1.1.89 2 2 2h12c1.1 0 2-.9 2-2V8l-6-6zm4 18H6V4h7v5h5v11zM8 15.5h8v-1H8v1zm0-3h8v-1H8v1zm0-3h5v-1H8v1z"/></svg>'
};

function createSocialIcon(platform, url) {
  return `<a href="${url}" target="_blank" class="social-icon" title="${platform}">${socialIcons[platform]}</a>`;
}

function openModal(imgElement) {
  console.log("Opening modal for:", imgElement.alt);
  const name = imgElement.alt;
  const data = bioData[name];
  
  console.log("Bio data found:", data);
  
  if (data) {
    modalImage.src = imgElement.src;
    modalImage.alt = name;
    modalName.textContent = name;
    modalTitle.textContent = data.title;

    // Handle social media icons
    let socialHTML = '';
    if (data.social) {
      if (data.social.website) socialHTML += createSocialIcon('website', data.social.website);
      if (data.social.cv) socialHTML += createSocialIcon('cv', data.social.cv);
      if (data.social.github) socialHTML += createSocialIcon('github', data.social.github);
      if (data.social.linkedin) socialHTML += createSocialIcon('linkedin', data.social.linkedin);
      if (data.social.researchgate) socialHTML += createSocialIcon('researchgate', data.social.researchgate);
      if (data.social.scholar) socialHTML += createSocialIcon('scholar', data.social.scholar);
    }
    modalSocial.innerHTML = socialHTML;

    modalBio.innerHTML = data.bio;
    modal.style.display = "block";
  } else {
    console.log("No bio data found for:", name);
  }
}

// Add click listeners to all images
document.addEventListener('DOMContentLoaded', function() {
  console.log("DOM loaded, adding click listeners");
  const images = document.querySelectorAll('img[alt]');
  console.log("Found", images.length, "images with alt attributes");
  
  images.forEach((img, index) => {
    if (img.alt && img.alt !== "") {
      console.log(`Adding click listener to image ${index}: ${img.alt}`);
      img.addEventListener('click', function() {
        console.log("Image clicked:", this.alt);
        openModal(this);
      });
    }
  });
});

// Close modal events
closeBtn.onclick = function() {
  modal.style.display = "none";
}

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

// Close modal with Escape key
document.addEventListener('keydown', function(event) {
  if (event.key === 'Escape') {
    modal.style.display = "none";
  }
});
</script>

# Group Members and Alumni

### Principle Investigator

  <div class="person-card" style="text-align: center; margin: 2rem auto; max-width: 500px;">
    <img src="/assets/images/people/Jae.jpg" alt="Jason Hattrick-Simpers" style="width:100%;max-width:180px;display:block;margin:auto;border-radius:12px;">
    <div class="person-text">
      <div class="person-name">Jason Hattrick-Simpers</div>
    </div>
  </div>

### Post Docs

<div style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 30px; justify-items: center; align-items: start; max-width: 1000px; margin: 40px auto;">
  <div class="person-card">
    <img src="/assets/images/people/Yutong_Liu.jpg" alt="Yutong Liu" style="width:100%;max-width:180px;display:block;margin:auto;">
    <div class="person-text">
      <div class="person-name">Yutong Liu</div>

    </div>
  </div>
  <div class="person-card">
    <img src="/assets/images/people/Changjun_Cheng.jpg" alt="Changjun Cheng" style="width:100%;max-width:180px;display:block;margin:auto;">
    <div class="person-text">
      <div class="person-name">Changjun Cheng</div>

    </div>
  </div>
  <div class="person-card">
    <img src="/assets/images/people/Ashley_Dale.jpg" alt="Ashley Dale" style="width:100%;max-width:180px;display:block;margin:auto;">
    <div class="person-text">
      <div class="person-name">Ashley Dale</div>

    </div>
  </div>
  <div class="person-card">
    <img src="/assets/images/people/Hao_Wan.png" alt="Hao Wan" style="width:100%;max-width:180px;display:block;margin:auto;">
    <div class="person-text">
      <div class="person-name">Hao Wan</div>

    </div>
  </div>
  <div class="person-card">
    <img src="/assets/images/people/Dan.png" alt="Dan McHaffie" style="width:100%;max-width:180px;display:block;margin:auto;">
    <div class="person-text">
      <div class="person-name">Dan McHaffie</div>

    </div>
  </div>
  <div class="person-card">
    <img src="/assets/images/people/Luke.jpg" alt="Luke Menezes" style="width:100%;max-width:180px;display:block;margin:auto;">
    <div class="person-text">
      <div class="person-name">Luke Menezes</div>

    </div>
  </div>
  <div class="person-card">
    <img src="/assets/images/people/YIN.png" alt="YIN ZHU" style="width:100%;max-width:180px;display:block;margin:auto;">
    <div class="person-text">
      <div class="person-name">YIN ZHU</div>

    </div>
  </div>
  <div class="person-card">
    <img src="/assets/images/people/Yonatan.jpg" alt="Yonatan Kurniawan" style="width:100%;max-width:180px;display:block;margin:auto;">
    <div class="person-text">
      <div class="person-name">Yonatan Kurniawan</div>

    </div>
  </div>
</div>

### Graduate Students

<div style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 30px; justify-items: center; align-items: start; max-width: 1000px; margin: 40px auto;">

  <div class="person-card">
    <img src="/assets/images/people/Daniel.jpg" alt="Daniel Persaud" style="width:100%;max-width:180px;display:block;margin:auto;">
    <div class="person-text">
      <div class="person-name">Daniel Persaud</div>

    </div>
  </div>
  <div class="person-card">
    <img src="/assets/images/people/Hongchen_Wang.jpg" alt="Hongchen Wang" style="width:100%;max-width:180px;display:block;margin:auto;">
    <div class="person-text">
      <div class="person-name">Hongchen Wang</div>

    </div>
  </div>
  <div class="person-card">
    <img src="/assets/images/people/Qiuyu_(Sara)_Shi.jpg" alt="Qiuyu (Sara) Shi" style="width:100%;max-width:180px;display:block;margin:auto;">
    <div class="person-text">
      <div class="person-name">Qiuyu (Sara) Shi</div>

    </div>
  </div>
  <div class="person-card">
    <img src="/assets/images/people/Runze_Zhang.jpg" alt="Runze Zhang" style="width:100%;max-width:180px;display:block;margin:auto;">
    <div class="person-text">
      <div class="person-name">Runze Zhang</div>

    </div>
  </div>
  <div class="person-card">
    <img src="/assets/images/people/RafaelEspinosaCastanedaPhoto.jpg" alt="Rafael Espinosa Castañeda" style="width:100%;max-width:180px;display:block;margin:auto;">
    <div class="person-text">
      <div class="person-name">Rafael Espinosa Castañeda</div>

    </div>
  </div>
  <div class="person-card">
    <img src="/assets/images/people/Kevin.jpg" alt="Kevin Zhang" style="width:100%;max-width:180px;display:block;margin:auto;">
    <div class="person-text">
      <div class="person-name">Kevin Zhang</div>

    </div>
  </div>
  <div class="person-card">
    <img src="/assets/images/people/Taha.jpg" alt="Mohammad Taha" style="width:100%;max-width:180px;display:block;margin:auto;">
    <div class="person-text">
      <div class="person-name">Mohammad Taha</div>

    </div>
  </div>

    <!-- <div> 
        <img src="/assets/images/people/Yang.jpg" alt="Yang Bai" style="width:100%;max-width:180px;display:block;margin:auto;">
        <p style="text-align:center;margin-top:10px;">Yang Bai<br><span style="font-size:0.9em;">Collaborator</span></p>
    </div> -->

</div>

### Alumni

<div style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 30px; justify-items: center; align-items: start; max-width: 1000px; margin: 40px auto;">
  <div class="person-card">
    <img src="/assets/images/people/Katherine_Lei.jpg" alt="Katherine Lei" style="width:100%;max-width:180px;display:block;margin:auto;">
    <div class="person-text">
      <div class="person-name">Katherine Lei</div>

    </div>
  </div>
  <div class="person-card">
    <img src="/assets/images/people/Ali_Jaberi.jpg" alt="Ali Jaberi" style="width:100%;max-width:180px;display:block;margin:auto;">
    <div class="person-text">
      <div class="person-name">Ali Jaberi</div>
      <div class="person-title">National Resource Council Canada</div>
    </div>
  </div>
  <div class="person-card">
    <img src="/assets/images/people/Hooman_Chamani.jpg" alt="Hooman Chamani" style="width:100%;max-width:180px;display:block;margin:auto;">
    <div class="person-text">
      <div class="person-name">Hooman Chamani</div>
      <div class="person-title">WSP in Canada</div>
    </div>
  </div>
  <div class="person-card">
    <img src="/assets/images/people/Kangming_Li.JPG" alt="Kangming Li" style="width:100%;max-width:180px;display:block;margin:auto;">
    <div class="person-text">
      <div class="person-name">Kangming Li</div>
      <div class="person-title">King Abullah University of Science and Technology</div>
    </div>
  </div>
  <div class="person-card">
    <img src="/assets/images/people/Amin.jpg" alt="Amin Sadeghi" style="width:100%;max-width:180px;display:block;margin:auto;">
    <div class="person-text">
      <div class="person-name">Amin Sadeghi</div>
      <div class="person-title">Carbon Engineering</div>
    </div>
  </div>
  <div class="person-card">
    <img src="/assets/images/people/Zhaoyang_Zhao.jpg" alt="Zhaoyang Zhao" style="width:100%;max-width:180px;display:block;margin:auto;">
    <div class="person-text">
      <div class="person-name">Zhaoyang Zhao</div>

    </div>
  </div>
  <div class="person-card">
    <img src="/assets/images/people/Ben.jpg" alt="Benhour Amirian" style="width:100%;max-width:180px;display:block;margin:auto;">
    <div class="person-text">
      <div class="person-name">Benhour Amirian</div>
      <div class="person-title">Apple</div>
    </div>
  </div>
  <div class="person-card">
    <img src="/assets/images/people/Suhas.jpg" alt="Suhas Mahesh" style="width:100%;max-width:180px;display:block;margin:auto;">
    <div class="person-text">
      <div class="person-name">Suhas Mahesh</div>
      <div class="person-title">Schmidt Sciences</div>
    </div>
  </div>
  <div class="person-card">
      <img src="/assets/images/people/shayan.jpg" alt="Shayan Mousavi" style="width:100%;max-width:180px;display:block;margin:auto;">
      <div class="person-text">
        <div class="person-name">Shayan Mousavi</div>
        <div class="person-title">Sanofi</div>
      </div>
  </div>
 </div>
