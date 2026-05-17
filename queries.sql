-- Show all active members
SELECT SubscriptionID, MemberID, SubscriptionStatus
FROM Subscription
WHERE SubscriptionStatus = 'Active';

-- Show available trainers ordered by certification level
SELECT TrainerID, FirstName, Lastname, CertificationLevel
FROM Trainers
ORDER BY CertificationLevel;

-- Revenue gained from each active member
SELECT m.[Member ID], m.FirstName & " " & m.LastName AS MemberName,
       m.EmailAddress, s.SubscriptionBeginningDate,
       s.SubscriptionEndDate, s.SubscriptionPrice AS MonthlyRevenue
FROM Member AS m INNER JOIN Subscription AS s
ON m.[Member ID] = s.MemberID
WHERE s.SubscriptionStatus = 'Active'
ORDER BY m.LastName;

-- Member list for promotional emails
SELECT * FROM Member;

-- Lockers in Room 101
SELECT * FROM Locker WHERE RoomNumber = 101;

-- Member fitness progress ranked by weight loss
SELECT m.[Member ID], m.Firstname &" " & m.Lastname AS MemberName,
       p.BeginningWeight, p.CurrentWeight,
       p.BeginningWeight - p.CurrentWeight AS WeightLost,
       p.BeginningBodyFatPercentage, p.CurrentBodyFatPercentage,
       p.BeginningBodyFatPercentage - p.CurrentBodyFatPercentage AS BodyFatReduction,
       p.DateRecorded
FROM Member AS m INNER JOIN Progress AS p
ON m.[Member ID] = p.MemberID
ORDER BY (p.BeginningWeight - p.CurrentWeight) DESC;