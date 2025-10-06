#!/bin/bash
echo "=== AUTOMATED QUALITY CHECKS ==="
echo ""

echo "1. COMPILATION STATUS:"
pdflatex -interaction=nonstopmode survey_paper.tex > /tmp/compile.log 2>&1
if [ $? -eq 0 ]; then
    echo "   ✅ Compiles successfully"
else
    echo "   ❌ Compilation errors found"
    grep "!" /tmp/compile.log | head -5
fi
echo ""

echo "2. CRITICAL ERRORS:"
ERROR_COUNT=$(grep -c "^!" /tmp/compile.log || echo "0")
echo "   Errors: $ERROR_COUNT"
echo ""

echo "3. REFERENCE ISSUES:"
UNDEF_REF=$(grep -c "undefined references" /tmp/compile.log || echo "0")
UNDEF_CIT=$(grep -c "undefined citations" /tmp/compile.log || echo "0")
echo "   Undefined references: $UNDEF_REF"
echo "   Undefined citations: $UNDEF_CIT"
echo ""

echo "4. ACCESSIBILITY:"
IMG_DESC=$(grep -c "image without description" /tmp/compile.log || echo "0")
echo "   Missing image descriptions: $IMG_DESC"
echo ""

echo "5. BOX WARNINGS:"
OVERFULL=$(grep -c "Overfull" /tmp/compile.log || echo "0")
echo "   Overfull boxes: $OVERFULL"
OVERFULL_MAX=$(grep "Overfull" /tmp/compile.log | grep -oP '\d+\.\d+pt' | sort -rn | head -1)
echo "   Maximum overfull: $OVERFULL_MAX"
echo ""

echo "6. CONTENT QUALITY:"
echo "   Total pages: $(pdfinfo survey_paper.pdf 2>/dev/null | grep Pages | awk '{print $2}')"
echo "   PDF size: $(ls -lh survey_paper.pdf 2>/dev/null | awk '{print $5}')"
echo "   Citations in bbl: $(grep -c "@" survey_paper.bbl 2>/dev/null || echo "0")"
echo ""

echo "7. SECTION STRUCTURE:"
for section in introduction related_work survey_methodology methodology evaluation applications challenges_future conclusion; do
    lines=$(wc -l < sections/${section}.tex 2>/dev/null || echo "0")
    echo "   ${section}: $lines lines"
done
echo ""

echo "=== QUALITY SCORE ==="
SCORE=100
[ $ERROR_COUNT -gt 0 ] && SCORE=$((SCORE - 50))
[ $UNDEF_REF -gt 0 ] && SCORE=$((SCORE - 20))
[ $UNDEF_CIT -gt 0 ] && SCORE=$((SCORE - 10))
[ $IMG_DESC -gt 0 ] && SCORE=$((SCORE - 15))
[ $OVERFULL -gt 10 ] && SCORE=$((SCORE - 5))

echo "   Overall Quality Score: $SCORE/100"
echo ""

if [ $SCORE -ge 95 ]; then
    echo "   Status: ✅ EXCELLENT - Publication Ready"
elif [ $SCORE -ge 85 ]; then
    echo "   Status: ✅ GOOD - Minor improvements needed"
elif [ $SCORE -ge 70 ]; then
    echo "   Status: ⚠️  ACCEPTABLE - Some issues to address"
else
    echo "   Status: ❌ NEEDS WORK - Significant issues found"
fi

rm -f /tmp/compile.log
