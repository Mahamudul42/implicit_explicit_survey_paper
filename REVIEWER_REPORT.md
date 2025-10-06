# COMPREHENSIVE REVIEWER REPORT
## Implicit vs. Explicit Feedback in Recommender Systems Survey

**Review Date:** October 6, 2025  
**Reviewer Role:** Senior Area Chair - Information Retrieval & Recommender Systems  
**Recommendation:** MAJOR REVISION REQUIRED

---

## OVERALL ASSESSMENT

**Summary:** This survey addresses an important topic in recommender systems and provides comprehensive coverage of implicit vs. explicit feedback mechanisms. However, several critical issues prevent acceptance in the current form. The paper shows strong technical depth but suffers from visualization problems, organization issues, and missing critical comparisons.

**Scores:**
- Technical Quality: 7/10
- Clarity & Presentation: 6/10
- Novelty & Significance: 8/10
- Overall: 7/10

**Decision:** MAJOR REVISION - Paper has strong potential but needs substantial improvements

---

## CRITICAL ISSUES THAT MUST BE FIXED

### 1. VISUAL PRESENTATION PROBLEMS ⚠️ CRITICAL

**Issue 1.1: Figure Text Collisions in Research Landscape (Figure 2)**
- **Location:** sections/related_work.tex, Research Landscape figure
- **Problem:** Multiple algorithm nodes overlap in the "Complex Hybrid" region
  - "Wide&Deep" (6,8.5), "xDeepFM" (8,8.8), "BERT4Rec" (7.5,9.5), "SASRec" (8.5,9.2)
  - These nodes are too close (< 1.5 units apart) causing visual clutter
  - "LLM-Rec" (5,9.5) overlaps with "BERT4Rec" 
- **Impact:** Readers cannot distinguish individual algorithms; figure is unreadable
- **Fix Required:** 
  - Reduce scale from 1.0 to 0.85
  - Increase vertical spacing in Complex region (y > 8.5)
  - Adjust node positions: move BERT4Rec to (7.2,9.8), LLM-Rec to (4.5,9.7)
  - Reduce bubble sizes for crowded nodes (1.3cm → 1.1cm)

**Issue 1.2: Decision Flowchart Text Cramming**
- **Location:** sections/methodology.tex, Decision Flowchart (Figure ~8)
- **Problem:** 
  - Result boxes at bottom have 3-4 lines of text in small boxes
  - Text width 2.8cm with font \textbf causes overflow
  - Diamond decision nodes (2cm width) cut off longer text
- **Impact:** Text is illegible in printed version; looks unprofessional
- **Fix Required:**
  - Increase result box width to 3.2cm
  - Increase minimum height to 1.2cm
  - Use font size \small instead of default
  - Abbreviate long labels: "Explainability?" → "Explain?"

**Issue 1.3: Timeline Figure Milestone Overlap**
- **Location:** sections/related_work.tex, Evolution Timeline
- **Problem:**
  - Milestones at similar y-coordinates overlap: (4.5,2.8) and (5.5,1.8) too close
  - "Hu et al. Implicit CF" and "Netflix Prize" boxes almost touching
- **Fix Required:**
  - Increase vertical separation between adjacent milestones
  - Stagger y-coordinates: use 3.0, 2.2, 1.4, 0.8 pattern

### 2. CONTENT & STRUCTURE ISSUES 📝 MAJOR

**Issue 2.1: Missing Quantitative Comparison of Survey Coverage**
- **Problem:** Paper claims comprehensive survey but provides no comparison with other surveys
- **Missing:** Table comparing: # papers covered, time span, domains addressed, methods analyzed
- **Fix Required:** Add comparison table in Related Work section showing:
  ```
  | Survey | Year | Papers | Time Span | Implicit Focus | Explicit Focus | Hybrid Focus |
  | This work | 2025 | 150+ | 2010-2025 | ✓✓✓ | ✓✓✓ | ✓✓✓ |
  | Zhang et al. | 2019 | 80 | 1994-2018 | ✓✓ | ✓ | ✓ |
  | ...
  ```

**Issue 2.2: Inadequate Discussion of Limitations**
- **Problem:** Paper lacks critical self-reflection on survey methodology limitations
- **Missing:**
  - Selection bias in paper inclusion/exclusion
  - Temporal bias (more recent papers have more space)
  - Domain coverage gaps (missing: IoT, healthcare recommenders)
- **Fix Required:** Add dedicated subsection "Survey Limitations" in Section 7 (Challenges)

**Issue 2.3: Weak Empirical Validation**
- **Problem:** Meta-analysis table shows aggregated results but lacks statistical rigor
- **Issues:**
  - No confidence intervals reported
  - No significance testing mentioned
  - Publication bias not addressed
  - Heterogeneity across studies not quantified
- **Fix Required:**
  - Add confidence intervals to meta-analysis results
  - Report I² statistic for heterogeneity
  - Discuss funnel plot analysis for publication bias
  - Add footnote explaining aggregation methodology

### 3. TECHNICAL ACCURACY CONCERNS ⚠️ MAJOR

**Issue 3.1: Oversimplified Trade-off Claims**
- **Location:** Introduction, Abstract, Conclusion
- **Problem:** Claims like "implicit=abundant but noisy, explicit=precise but sparse" are too simplistic
- **Reality:** 
  - Explicit feedback can be noisy (rating inflation, strategic behavior)
  - Implicit feedback can be precise (purchase = strong signal)
  - Context matters more than feedback type
- **Fix Required:**
  - Add nuance: "typically", "in many contexts", "depending on domain"
  - Cite counter-examples: explicit bias in ratings, high-quality implicit signals
  - Revise abstract to reflect complexity

**Issue 3.2: Missing Critical References**
- **Problem:** Several seminal works missing from bibliography
- **Missing Papers:**
  - Koren et al. (2009) - Matrix Factorization Techniques for RS
  - Rendle et al. (2012) - Factorization Machines
  - He & McAuley (2016) - VBPR (Visual Bayesian Personalized Ranking)
  - Sun et al. (2019) - BERT4Rec original paper
  - Recent LLM-based recommenders (2023-2024)
- **Fix Required:** Add these foundational and recent papers with proper discussion

**Issue 3.3: Inconsistent Terminology**
- **Problem:** Paper uses multiple terms for same concepts
- **Examples:**
  - "implicit feedback" vs "implicit signals" vs "observational data"
  - "explicit feedback" vs "explicit ratings" vs "stated preferences"
  - "hybrid approach" vs "combined method" vs "integrated model"
- **Fix Required:** Define terminology clearly in Section 1, use consistently throughout

### 4. METHODOLOGY & REPRODUCIBILITY 🔬 MODERATE

**Issue 4.1: Vague Survey Methodology**
- **Problem:** Section describing paper selection process lacks rigor
- **Missing:**
  - Exact search queries used
  - Databases searched (ACM DL, IEEE, arXiv, etc.)
  - Inclusion/exclusion criteria with examples
  - PRISMA-style flow diagram showing paper selection process
- **Fix Required:**
  - Add detailed methodology subsection
  - Include PRISMA flow diagram (papers identified → screened → included)
  - List exact search strings used

**Issue 4.2: Dataset Table Incomplete**
- **Location:** Appendix, Reproducibility section
- **Problem:** Dataset table missing critical information
- **Missing Columns:**
  - License type (MIT, CC-BY, proprietary)
  - Last verified date
  - Data format (CSV, JSON, etc.)
  - Size (# users, # items, # interactions)
- **Fix Required:** Expand table with these columns

**Issue 4.3: No Code/Artifact Availability Statement**
- **Problem:** Paper does not mention if any code or artifacts will be released
- **Expected:** Modern surveys often provide:
  - Curated bibliography (BibTeX)
  - Taxonomy visualization tools
  - Reproducibility scripts
- **Fix Required:** Add statement on artifact availability (even if "no artifacts")

### 5. WRITING & PRESENTATION 📖 MODERATE

**Issue 5.1: Abstract Too Dense**
- **Problem:** Abstract tries to cover too much (350+ words)
- **Issues:**
  - Lists 5 contributions in dense format
  - Uses too much jargon ("bias-aware evaluation methodologies")
  - Doesn't clearly state main finding
- **Fix Required:**
  - Reduce to 250 words
  - Lead with main finding: "hybrid approaches outperform pure methods by 15-32%"
  - Simplify contribution list to 3 main points

**Issue 5.2:** Section balance and other moderate issues...

---

## MUST FIX PRIORITY LIST (For First Review Round Acceptance)

### VISUAL FIXES (HIGH PRIORITY - 4 hours):
1. ✅ Fix Research Landscape node collisions
2. ✅ Fix Decision Flowchart cramming
3. ✅ Fix Timeline milestone overlaps
4. ✅ Make all figures color-blind friendly

### CONTENT ADDITIONS (HIGH PRIORITY - 6 hours):
5. ✅ Add Ethical Considerations subsection
6. ✅ Add Survey Limitations subsection
7. ✅ Add statistical rigor to meta-analysis (confidence intervals)

### TECHNICAL IMPROVEMENTS (MEDIUM PRIORITY - 3 hours):
8. ✅ Add nuance to trade-off claims throughout paper
9. ✅ Fix terminology consistency
10. ✅ Improve abstract (reduce to 250 words, clearer main finding)

---

*Review completed by: Senior Reviewer specializing in Information Retrieval, Recommender Systems, and Survey Methodology*
