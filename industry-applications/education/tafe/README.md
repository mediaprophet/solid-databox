# Education: TAFE & Vocational Training

Technical and Further Education (TAFE) providers and vocational training institutions serve a unique student demographic—often working adults seeking specific, immediately applicable job skills. In this sector, the Solid Databox functions as a "portable skills wallet," enabling learners to aggregate credentials from diverse sources (including formal courses, apprenticeships, and short courses) into a single, verifiable portfolio.

## Core TAFE Data Payloads

The Databox in a vocational context emphasizes practical competencies and flexible credentialing rather than solely relying on academic degrees.

### 1. Skills & Competency Portfolio
Vocational training is highly granular. The Databox allows for the precise capture of these granular achievements:
- **Course Achievements:** Digital certificates and badges for specific courses completed (e.g., "Forklift Operation," "Advanced Welding Techniques," "Responsible Service of Alcohol"). These are issued as Verifiable Credentials (VCs) signed by the TAFE.
- **Recognition of Prior Learning (RPL):** For mature-age students or apprentices, the Databox securely stores evidence of competencies gained outside the institution (e.g., through on-the-job training). The TAFE can then issue an official RPL credential based on this verified evidence, which the student can use to gain credit for similar courses in the future.

### 2. Licensing & Compliance Records
Many trades require mandatory licenses or recurring compliance training to operate legally. These are critical assets for the TAFE graduate:
- **Professional Licenses:** Cryptographically signed proof of trade licenses (e.g., Plumbing, Electrical, Hairdressing) issued by state or territory regulatory bodies.
- **Compliance & Safety Refreshers:** Records of mandatory safety training (e.g., White Card, First Aid) that require periodic renewal. The Databox alerts the user as expiry dates approach and allows them to instantly link to a TAFE provider offering the refresher course.

### 3. Employment Records & Portfolios
For TAFE students entering the workforce, a verified employment record serves as powerful proof of capability:
- **Work Experience Veracity:** Employers can issue VCs attesting to the specific skills and responsibilities a student held during an internship or traineeship. This creates a tamper-proof resume that cannot be fabricated by the student.
- **Portfolio of Work:** Digital proof of completed projects, service logs, or apprenticeships, enabling the student to showcase their practical capabilities to potential employers.

## The Solid Databox Workflow

The workflow is designed to support the entire lifecycle of a vocational learner, from training to employment:

1. **Modular Learning Integration:** A student completes a short course or an apprenticeship module. The TAFE issues a Verifiable Credential (VC) directly to the student's Solid Pod. This credential cryptographically proves the skills acquired.
2. **Credential Aggregation:** The student uses their Databox compatibility bridge to link credentials from multiple sources—TAFE courses, employer endorsements, and industry certifications—into a unified professional portfolio.
3. **Employment Verification:** Upon graduation or completion of an apprenticeship, the student shares their portfolio with their employer. The employer can verify the authenticity of each credential instantly via the TAFE's or industry body's DID.
4. **Compliance Renewal:** As licenses or safety certificates expire, the TAFE uses the Databox to send a targeted renewal notification to the student, linking them directly to the necessary training module to maintain their professional standing.

This architecture ensures that vocational students maintain absolute control over their highly specific, practical skill sets, creating a trusted, portable foundation for their careers.
