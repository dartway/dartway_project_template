---
description: General naming conventions for classes, variables, and fields
globs:
alwaysApply: true
---

## General

- Avoid using overly complicated or rarely used English words in names
- Choose clear, common terms that everyone on the team will understand
- When in doubt, be more descriptive rather than less

## Class Naming

Name Classes with at least 2 words - in order to avoid mess and simplify searching for the right ones.

Examples of good class names:
- `UserProfile`
- `AppPromotion`
- `PostComment`
- `ContentPiece`
- `UserNotificationSettings`
- `AccountVerificationRequest`

## Variable and Field Naming

Variable and field names should be fully descriptive – they must clearly indicate exactly what data they contain. Avoid generic or ambiguous names.

Basically, variable name should match the className: userProfile for UserProfile, postComments for List<PostComment>

Examples of good variable and field names:
- `userProfileId`
- `authorProfileId`
- `updatedByProfileId`
- `createdAtTimestamp`
- `isUserVerified`
- `userNameBeforeUpdate`
- `deletedItems`
- `requiredBalance`
- `newComment`
- `updatedModel`

Bad examples (too short or ambiguous):
- `id`
- `data`
- `info`
- `obj`
- `temp`
- `val`
- `user`
- `item`
- `res`
- `foo`
- `bar`
- `x`
- `y`
