# CV Improvement Workflow

## Overview

This workflow defines a systematic process for creating, reviewing, and improving CVs based on professional feedback. It ensures consistent quality, continuous improvement, and documentation of all changes.

## Workflow Steps

### Phase 1: Initial CV Creation

**Trigger**: New job application or CV need identified

**Steps**:
1. **Analyze Requirements**
   - Review job advertisement and requirements
   - Identify key technical and cultural fit criteria
   - Note specific technologies, methodologies, and experience levels needed

2. **Create Initial CV**
   - Use `cv-writer` agent to create tailored CV
   - Incorporate relevant projects from `resources/experience/projects.yaml`
   - Customize language and format for target role/company
   - Save to appropriate location (e.g., `anpassade-cvn/`)

3. **Self-Review**
   - Check for technical accuracy
   - Verify metrics and achievements are realistic
   - Ensure consistency with existing experience data

### Phase 2: Professional Review

**Trigger**: Initial CV draft completed

**Steps**:
1. **HR Review**
   - Use `cv-reviewer-hr` agent for professional evaluation
   - Review against specific job requirements
   - Assess cultural fit and technical alignment
   - Identify strengths and improvement areas

2. **Document Feedback**
   - Capture all review points systematically
   - Categorize feedback: Critical gaps, Minor improvements, Cultural fit, Technical alignment
   - Prioritize improvements based on impact and feasibility

### Phase 3: Feedback Integration

**Trigger**: Professional review completed with specific feedback

**Steps**:
1. **Analyze Feedback Feasibility**
   - Review each feedback point for accuracy and authenticity
   - Remove suggestions that don't align with actual experience
   - Identify alternative ways to address valid concerns

2. **Implement Valid Improvements**
   - Use `cv-writer` agent with specific improvement instructions
   - Update structured data files if adding new projects/experience
   - Ensure all changes maintain honesty and authenticity
   - Preserve CV structure and professional formatting

3. **Quality Check**
   - Verify all improvements are implemented correctly
   - Check for consistency across all CV sections
   - Ensure metrics and achievements are believable

### Phase 4: Final Validation

**Trigger**: All improvements implemented

**Steps**:
1. **Final Review**
   - Use `cv-reviewer-hr` agent for validation
   - Compare against initial review to confirm gap closure
   - Assess overall improvement and readiness

2. **Documentation**
   - Log all changes in `resources/adapted-profiles-log.yaml`
   - Update evidence documentation for new projects
   - Note lessons learned for future improvements

3. **Final Proofreading**
   - Use `cv-proofreader` agent for final quality check
   - Check for grammar, formatting, and consistency issues
   - Ensure professional presentation

### Phase 5: Archive and Learn

**Trigger**: CV finalized and ready for submission

**Steps**:
1. **Archive Process**
   - Document all workflow steps taken
   - Save review feedback and implementation notes
   - Log final outcome and quality metrics

2. **Extract Learning**
   - Identify patterns in feedback for future reference
   - Note successful improvement strategies
   - Update workflow process if needed

## Quality Assurance Checkpoints

### Before Each Phase
- [ ] Clear understanding of requirements
- [ ] Appropriate tools selected
- [ ] Previous phase completed successfully

### After Each Phase
- [ ] Deliverables meet quality standards
- [ ] Documentation updated
- [ ] Stakeholder (user) approval obtained

## Success Criteria

### Process Success
- All phases completed in sequence
- Documentation maintained throughout
- Feedback systematically addressed
- Final CV ready for submission

### Quality Success
- CV accurately represents candidate's experience
- All claims are truthful and verifiable
- Technical skills match job requirements
- Cultural alignment demonstrated
- Professional presentation maintained

## Common Pitfalls and Mitigation

### Pitfall 1: Adding Inaccurate Experience
**Mitigation**: Always verify improvements against actual experience
**Check**: "Can I confidently discuss this in an interview?"

### Pitfall 2: Over-optimizing Metrics
**Mitigation**: Use realistic, believable achievements
**Check**: "Do these numbers make sense for the role and timeline?"

### Pitfall 3: Ignoring Cultural Fit
**Mitigation**: Address both technical and cultural requirements
**Check**: "Does this CV show I'd be a good team member?"

### Pitfall 4: Inconsistent Documentation
**Mitigation**: Update all related files when making changes
**Check**: "Are all structured data files synchronized?"

## Tool Integration

This workflow integrates with the following agents:
- `cv-writer`: Creation and improvement of CV content
- `cv-reviewer-hr`: Professional evaluation and feedback
- `cv-proofreader`: Final quality assurance
- `cv-feedback-integration`: Systematic feedback implementation

## File Dependencies

### Input Files
- `resources/experience/projects.yaml`: Project definitions
- `resources/experience/roles.yaml`: Role descriptions
- `resources/experience/education.yaml`: Education history
- Job advertisement/requirements

### Output Files
- Tailored CV file (e.g., `anpassade-cvn/sv-company-role.typ`)
- Updated structured data files (if new experience added)
- Evidence documentation (if new projects added)
- `resources/adapted-profiles-log.yaml`: Process tracking

## Continuous Improvement

This workflow should be reviewed and updated based on:
- User feedback on process effectiveness
- Success rate of CV submissions
- New agent capabilities or tools
- Changes in job market requirements

---

**Version**: 1.0
**Last Updated**: 2024-11-16
**Maintainer**: CV improvement process owner