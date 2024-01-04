USE [EltizamDB_Dev]
GO
SET IDENTITY_INSERT [dbo].[Master_ClientType] ON 
GO
INSERT [dbo].[Master_ClientType] ([Id], [ClientType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'Builderr', 1, CAST(N'2023-09-29T10:20:10.383' AS DateTime), 1, CAST(N'2023-10-12T11:49:52.330' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Master_ClientType] ([Id], [ClientType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'WebDesigner', 1, CAST(N'2023-10-11T16:27:30.213' AS DateTime), 1, CAST(N'2023-10-11T16:27:30.213' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Master_ClientType] ([Id], [ClientType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (3, N'Source', 1, CAST(N'2023-10-11T22:44:19.520' AS DateTime), 0, CAST(N'2023-10-11T22:44:23.763' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Master_ClientType] ([Id], [ClientType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (4, N'TTTT', 1, CAST(N'2023-10-11T22:48:57.603' AS DateTime), 0, CAST(N'2023-10-11T22:49:00.060' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Master_ClientType] ([Id], [ClientType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (5, N'Osour', 1, CAST(N'2023-10-11T22:54:16.217' AS DateTime), 0, CAST(N'2023-10-11T22:54:30.120' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Master_ClientType] ([Id], [ClientType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (6, N'Duner', 1, CAST(N'2023-10-11T23:03:54.673' AS DateTime), 0, CAST(N'2023-10-11T23:03:57.547' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Master_ClientType] ([Id], [ClientType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (7, N'Roveeram', 1, CAST(N'2023-10-11T23:06:35.530' AS DateTime), 0, CAST(N'2023-10-11T23:06:38.487' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Master_ClientType] ([Id], [ClientType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (8, N'Devs', 1, CAST(N'2023-10-11T23:16:21.090' AS DateTime), 0, CAST(N'2023-10-11T23:16:25.200' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Master_ClientType] ([Id], [ClientType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (9, N'BTC', 1, CAST(N'2023-10-12T11:50:34.860' AS DateTime), 0, CAST(N'2023-10-12T11:50:35.137' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Master_ClientType] ([Id], [ClientType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (10, N'BATA', 1, CAST(N'2023-10-12T11:50:59.883' AS DateTime), 0, CAST(N'2023-10-12T11:50:59.960' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Master_ClientType] ([Id], [ClientType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (11, N'DEVELOPER', 0, CAST(N'2023-10-12T11:51:18.173' AS DateTime), 0, CAST(N'2023-10-12T11:51:18.500' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Master_ClientType] ([Id], [ClientType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (12, N'DEV TT', 0, CAST(N'2023-10-16T12:47:07.883' AS DateTime), 0, CAST(N'2023-10-16T12:47:08.187' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Master_ClientType] ([Id], [ClientType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (13, N'DEV NEW', 0, CAST(N'2023-10-16T12:48:42.630' AS DateTime), 0, CAST(N'2023-10-16T12:48:53.440' AS DateTime), 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Master_ClientType] OFF
GO
SET IDENTITY_INSERT [dbo].[Master_Client] ON 
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (1, N'Abhishek', N'K', N'Singh', 1, NULL, N'TRNUAT0989', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'LN76767', 0, NULL, CAST(N'2023-10-16T16:10:25.860' AS DateTime), 1, CAST(N'2023-12-06T11:22:55.037' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (2, N'Pawan', N'Singh', N'Kumar', 1, NULL, N'Pawan', CAST(N'2023-01-17T00:00:00.000' AS DateTime), N'aeer', 1, NULL, CAST(N'2023-10-17T07:42:22.337' AS DateTime), 0, CAST(N'2023-11-29T11:38:53.140' AS DateTime), 1, NULL, 0)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (3, N'Ravi', N'K', N'Singh', 2, NULL, N'TN987987', CAST(N'2023-10-17T00:00:00.000' AS DateTime), N'dsfasf', 0, NULL, CAST(N'2023-10-17T15:05:11.623' AS DateTime), 0, CAST(N'2023-11-06T23:21:54.563' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (6, N'tyyytt', N'jhhjh', N'jghhj', 9, NULL, N'6576657657', CAST(N'2023-10-28T00:00:00.000' AS DateTime), N'96996968678', 0, NULL, CAST(N'2023-10-28T12:18:27.247' AS DateTime), 0, CAST(N'2023-10-28T12:18:27.247' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (7, N'Yalla1', N'CH1', N'Reddy1', 1, NULL, N'TN001', CAST(N'2024-09-09T00:00:00.000' AS DateTime), N'LIC10021', 0, NULL, CAST(N'2023-10-30T11:36:59.870' AS DateTime), 0, CAST(N'2023-10-30T11:36:59.870' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (8, N'Yalla', N'CH', N'Reddy', 1, NULL, N'TN001', CAST(N'2024-09-09T00:00:00.000' AS DateTime), N'LIC10021', 0, NULL, CAST(N'2023-10-30T11:36:59.870' AS DateTime), 0, CAST(N'2023-10-30T11:36:59.870' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (9, N'Lodha', N'Builder', N'Properties', 2, NULL, N'TN876876', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'LN87989', 1, NULL, CAST(N'2023-10-30T18:20:50.150' AS DateTime), 0, CAST(N'2023-12-15T18:30:14.120' AS DateTime), 1, 0, NULL)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (10, N'sdfsdaf', N'sdfas', N'dsfsadfda', 5, NULL, N'TS7657623', CAST(N'2023-11-16T00:00:00.000' AS DateTime), N'Lineer231', 0, NULL, CAST(N'2023-11-02T16:43:00.350' AS DateTime), 0, CAST(N'2023-11-16T19:49:16.013' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (11, N'Abhi new test', N'dd', N'01', 1, NULL, N'65766778', CAST(N'2024-10-10T00:00:00.000' AS DateTime), N'7876687', 1, NULL, CAST(N'2023-11-04T21:51:42.993' AS DateTime), 0, CAST(N'2023-11-04T21:51:42.993' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (13, N'Abhi Test 03', N'TT', N'Kumar', 1, NULL, N'767676776176', CAST(N'2023-01-20T00:00:00.000' AS DateTime), N'3888388338', 1, NULL, CAST(N'2023-11-06T09:33:31.830' AS DateTime), 0, CAST(N'2023-11-24T16:53:05.537' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (15, N'1', N'1', N'1', 1, NULL, N'1', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'1', 0, NULL, CAST(N'2023-11-24T17:02:33.887' AS DateTime), 1, CAST(N'2023-11-24T17:02:33.887' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (16, N'TestName', N'ipsum', N'LOREM', 2, NULL, N'T1', CAST(N'2023-01-24T00:00:00.000' AS DateTime), N'11212', 1, NULL, CAST(N'2023-11-27T09:31:37.677' AS DateTime), 1, CAST(N'2023-11-29T13:21:13.550' AS DateTime), 1, 0, NULL)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (18, N'n', N'n', N'n', 1, NULL, N'n', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'n', 0, NULL, CAST(N'2023-11-27T15:11:10.070' AS DateTime), 1, CAST(N'2023-12-13T20:46:56.733' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (21, N'Test', N'rb', N'Test nAME', 1, NULL, N'Test', CAST(N'2023-01-29T00:00:00.000' AS DateTime), N'Test', 0, NULL, CAST(N'2023-11-28T13:03:33.900' AS DateTime), 1, CAST(N'2023-12-13T20:49:06.553' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (22, N'Ravi', N'Kumar', N'Saw', 1, NULL, N'rrn123', CAST(N'2023-01-29T00:00:00.000' AS DateTime), N'lic123', 1, NULL, CAST(N'2023-11-29T13:25:17.873' AS DateTime), 1, CAST(N'2023-11-29T13:59:47.800' AS DateTime), 1, 0, 0)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (23, N'Ravi', N'kumar', N'Kumar', 1, NULL, N'123', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'123', 1, NULL, CAST(N'2023-11-29T13:33:54.310' AS DateTime), 1, CAST(N'2023-12-14T11:05:24.030' AS DateTime), 1, 0, NULL)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (24, N'MArk', N'kal', N'peter', 1, NULL, N'trn', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'li123', 1, NULL, CAST(N'2023-11-29T13:45:00.267' AS DateTime), 1, CAST(N'2023-12-13T20:15:17.007' AS DateTime), 1, 0, NULL)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (25, N'Ravi', N'', N'Kumar', 1, NULL, N'trn123', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'lin', 0, NULL, CAST(N'2023-11-29T13:56:48.927' AS DateTime), 1, CAST(N'2023-12-13T17:43:06.040' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (26, N'Pawan', N'Kumar', N'Singh', 1, NULL, N'trn123', CAST(N'2023-01-30T00:00:00.000' AS DateTime), N'li1', 1, NULL, CAST(N'2023-11-29T14:14:09.333' AS DateTime), 1, CAST(N'2023-12-14T12:30:37.713' AS DateTime), 1, 0, NULL)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (27, N'ccc', N'ccc', N'ccc', 1, NULL, N'ccc123', CAST(N'2023-01-30T00:00:00.000' AS DateTime), N'ccc321', 0, NULL, CAST(N'2023-11-30T09:39:51.127' AS DateTime), 1, CAST(N'2023-12-13T17:40:40.450' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (28, N'jhon', N'carter', N'carter', 1, NULL, N'1234567890', CAST(N'2023-11-30T00:00:00.000' AS DateTime), N'lic1234567890', 1, NULL, CAST(N'2023-11-30T11:45:13.220' AS DateTime), 1, CAST(N'2023-11-30T11:45:13.220' AS DateTime), 1, 140, NULL)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (29, N'mohan', N'kumar', N'verma', 1, NULL, N'trn1234', CAST(N'2023-01-30T00:00:00.000' AS DateTime), N'lic1234', 0, NULL, CAST(N'2023-11-30T11:48:40.003' AS DateTime), 1, CAST(N'2023-11-30T11:54:32.683' AS DateTime), 1, 144, 1)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (30, N'Jhon', N'jhon', N'jhon', 1, NULL, N'1234567890', CAST(N'2023-01-30T00:00:00.000' AS DateTime), N'lic123', 0, NULL, CAST(N'2023-11-30T12:50:55.327' AS DateTime), 1, CAST(N'2023-11-30T13:10:26.560' AS DateTime), 1, 149, 1)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (31, N'First', N'middle', N'Last dev', 1, NULL, N'TN876876121212', CAST(N'2023-12-01T00:00:00.000' AS DateTime), N'LN8798945454645', 0, NULL, CAST(N'2023-12-01T09:58:49.667' AS DateTime), 1, CAST(N'2023-12-13T15:37:25.283' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (32, N'checkaudittest', N'Fistaudit', N'Fistaudit', 1, NULL, N'TN8768761212786', CAST(N'2023-01-20T00:00:00.000' AS DateTime), N'LN879665623131', 0, NULL, CAST(N'2023-12-04T18:08:41.190' AS DateTime), 1, CAST(N'2023-12-13T17:42:56.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (33, N'DECEMBER', N'DECEMBER', N'DECEMBER', 10, NULL, N'DECEMBER', CAST(N'2023-01-07T00:00:00.000' AS DateTime), N'DECEMBER1', 1, NULL, CAST(N'2023-12-14T10:35:55.597' AS DateTime), 1, CAST(N'2023-12-14T21:29:09.693' AS DateTime), 1, 0, NULL)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (34, N'ravi', N'Kumar', N'saw', 2, NULL, N'trn123', CAST(N'2023-01-15T00:00:00.000' AS DateTime), N'lic12345', 1, NULL, CAST(N'2023-12-15T10:21:16.723' AS DateTime), 1, CAST(N'2023-12-15T13:27:05.177' AS DateTime), 1, 0, NULL)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (35, N'jhon', N'', N'carter', 1, NULL, N'123', CAST(N'2023-01-15T00:00:00.000' AS DateTime), N'1234', 0, NULL, CAST(N'2023-12-15T10:28:59.943' AS DateTime), 1, CAST(N'2023-12-18T20:21:24.337' AS DateTime), 1, 0, 0)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (36, N'Heet', N'M', N'Joshi', 1, NULL, N'11', CAST(N'2023-01-19T00:00:00.000' AS DateTime), N'11', 0, NULL, CAST(N'2023-12-19T12:16:36.730' AS DateTime), 1, CAST(N'2023-12-19T13:26:33.660' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (37, N'Fatima', N'DD', N'Last', 1, NULL, N'TN876876121212', CAST(N'2023-01-21T00:00:00.000' AS DateTime), N'LN8798945454645', 0, NULL, CAST(N'2023-12-21T18:31:15.860' AS DateTime), 1, CAST(N'2023-12-22T15:46:44.723' AS DateTime), 1, 0, 0)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (38, N'Richard', N'K', N'Valla', 1, NULL, N'TN876876121003', CAST(N'2023-01-22T00:00:00.000' AS DateTime), N'LN8798900007', 0, NULL, CAST(N'2023-12-22T15:57:12.290' AS DateTime), 1, CAST(N'2023-12-22T16:23:04.993' AS DateTime), 1, 0, 0)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (39, N'Rajdeepqqq', N'Dev', N'Last', 2, NULL, N'TN876800067', CAST(N'2023-01-22T00:00:00.000' AS DateTime), N'LN8798945001', 0, NULL, CAST(N'2023-12-22T19:50:44.083' AS DateTime), 1, CAST(N'2023-12-26T15:19:34.130' AS DateTime), 1, 0, 0)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (40, N'pawan', N'', N'rwr', 1, NULL, N'rwer', CAST(N'2023-01-26T00:00:00.000' AS DateTime), N'er', 0, NULL, CAST(N'2023-12-26T15:14:14.040' AS DateTime), 1, CAST(N'2023-12-26T15:22:52.873' AS DateTime), 1, 0, 0)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (41, N'v', N'', N'qwe', 1, NULL, N'wqw', CAST(N'2023-01-26T00:00:00.000' AS DateTime), N'li123', 0, NULL, CAST(N'2023-12-26T15:23:34.907' AS DateTime), 1, CAST(N'2023-12-26T18:44:53.510' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (42, N'H', N'', N'J', 1, NULL, N'Q1', CAST(N'2024-01-28T00:00:00.000' AS DateTime), N'A1', 1, NULL, CAST(N'2023-12-28T12:22:09.807' AS DateTime), 1, CAST(N'2024-01-02T14:31:49.587' AS DateTime), 1, 0, 0)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (43, N'V', N'', N'VQ', 1, NULL, N'B', CAST(N'2023-01-28T00:00:00.000' AS DateTime), N'B', 1, NULL, CAST(N'2023-12-28T12:23:39.953' AS DateTime), 1, CAST(N'2023-12-28T12:28:50.953' AS DateTime), 1, 349, 0)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (44, N'c', N'', N'c', 1, NULL, N'c', CAST(N'2023-01-28T00:00:00.000' AS DateTime), N'c', 1, NULL, CAST(N'2023-12-28T12:30:48.890' AS DateTime), 1, CAST(N'2023-12-28T12:30:56.877' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (45, N'property', N'', N'Company', 2, NULL, N'Q21', CAST(N'2024-01-31T00:00:00.000' AS DateTime), N'LC8990001', 1, NULL, CAST(N'2024-01-02T14:36:47.663' AS DateTime), 1, CAST(N'2024-01-02T15:06:28.097' AS DateTime), 1, 0, 0)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (46, N'pawan', N'', N'dsd', 1, NULL, N'ew', CAST(N'2024-01-02T00:00:00.000' AS DateTime), N'dsd', 1, NULL, CAST(N'2024-01-02T17:46:17.883' AS DateTime), 1, CAST(N'2024-01-02T17:49:55.917' AS DateTime), 1, 0, 0)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (47, N'qw', N'Kumar', N'as', 1, NULL, N'df', CAST(N'2024-01-02T00:00:00.000' AS DateTime), N'sds', 1, NULL, CAST(N'2024-01-02T17:51:10.103' AS DateTime), 1, CAST(N'2024-01-02T17:51:10.103' AS DateTime), 1, 0, 0)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (48, N'ravi', N'', N'saw', 1, NULL, N'1', CAST(N'2024-01-02T00:00:00.000' AS DateTime), N'sds', 1, NULL, CAST(N'2024-01-02T17:52:09.500' AS DateTime), 1, CAST(N'2024-01-02T17:52:29.210' AS DateTime), 1, 0, 0)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (49, N'ravi', N'', N'sawy', 1, NULL, N'trn1234', CAST(N'2024-01-02T00:00:00.000' AS DateTime), N'vfc', 1, NULL, CAST(N'2024-01-02T17:53:41.377' AS DateTime), 1, CAST(N'2024-01-02T17:53:41.377' AS DateTime), 1, 0, 0)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (50, N'ghku', N'dev', N'dnkd', 1, NULL, N'c', CAST(N'2024-01-02T00:00:00.000' AS DateTime), N'fd', 1, NULL, CAST(N'2024-01-02T17:58:50.490' AS DateTime), 1, CAST(N'2024-01-02T18:16:08.420' AS DateTime), 1, 0, 0)
GO
INSERT [dbo].[Master_Client] ([Id], [FirstName], [MiddleName], [LastName], [ClientTypeId], [Company], [TRNNumber], [TRNExpiryDate], [LicenseNumber], [IsActive], [Logo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ProfileAttachmentId], [IsDeleted]) VALUES (51, N'Pwn', N'Kumar', N'Singh', 2, NULL, N'TRN0012', CAST(N'2024-01-31T00:00:00.000' AS DateTime), N'LN87966500011', 1, NULL, CAST(N'2024-01-02T18:13:54.667' AS DateTime), 1, CAST(N'2024-01-04T16:13:08.043' AS DateTime), 1, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[Master_Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Master_Property] ON 
GO
INSERT [dbo].[Master_Property] ([Id], [PropertyName], [PropertyTypeId], [PropertySubTypeId], [OwnershipTypeId], [UnitType], [AdditionalUnits], [Furnished], [ValuationPurpose], [BuildUpAreaSqFt], [BuildUpAreaSqMtr], [AgeOfConstruction], [IsActive], [Parking], [ParkingBayNo], [Description], [Amenities], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (4, N'Propr123', 5, 8, 1, N'3BHK', N'Store Room', 1, N'hgjhgjh', CAST(600.000000 AS Decimal(18, 6)), CAST(1800.000000 AS Decimal(18, 6)), 3, 0, N'hgfgjh', N'878', N'Dess', NULL, CAST(N'2023-10-24T01:53:18.570' AS DateTime), NULL, CAST(N'2023-11-21T16:43:02.863' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Master_Property] ([Id], [PropertyName], [PropertyTypeId], [PropertySubTypeId], [OwnershipTypeId], [UnitType], [AdditionalUnits], [Furnished], [ValuationPurpose], [BuildUpAreaSqFt], [BuildUpAreaSqMtr], [AgeOfConstruction], [IsActive], [Parking], [ParkingBayNo], [Description], [Amenities], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (6, N'Propr23245', 27, 69, 1, N'3BHK', N'Store Room', 1, N'home', CAST(5000.000000 AS Decimal(18, 6)), CAST(1800.000000 AS Decimal(18, 6)), 3, 0, N'hgfgjh', N'878', N'jhgjhgj', NULL, CAST(N'2023-10-24T02:13:12.507' AS DateTime), NULL, CAST(N'2023-11-22T16:52:35.573' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_Property] ([Id], [PropertyName], [PropertyTypeId], [PropertySubTypeId], [OwnershipTypeId], [UnitType], [AdditionalUnits], [Furnished], [ValuationPurpose], [BuildUpAreaSqFt], [BuildUpAreaSqMtr], [AgeOfConstruction], [IsActive], [Parking], [ParkingBayNo], [Description], [Amenities], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (7, N'Property12345', 20, 49, 1, N'1BHK', N'Store Room', 1, N'sdfsdf', CAST(600.000000 AS Decimal(18, 6)), CAST(15000.000000 AS Decimal(18, 6)), 3, 1, N'hgfgjh', N'ewrqw', N'asdsada', NULL, CAST(N'2023-10-26T12:39:56.527' AS DateTime), NULL, CAST(N'2023-11-10T18:25:49.590' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Master_Property] ([Id], [PropertyName], [PropertyTypeId], [PropertySubTypeId], [OwnershipTypeId], [UnitType], [AdditionalUnits], [Furnished], [ValuationPurpose], [BuildUpAreaSqFt], [BuildUpAreaSqMtr], [AgeOfConstruction], [IsActive], [Parking], [ParkingBayNo], [Description], [Amenities], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (8, N'PropertyMumbai', 1, 57, 1, N'2BHK', N'rest room', 1, N'asdasd', CAST(909.000000 AS Decimal(18, 6)), CAST(4555.000000 AS Decimal(18, 6)), 4, 1, N'testrrr', N'ergerrr', N'fgdfrrrr', NULL, CAST(N'2023-10-30T16:13:31.200' AS DateTime), 1, CAST(N'2023-11-10T20:10:33.863' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Master_Property] ([Id], [PropertyName], [PropertyTypeId], [PropertySubTypeId], [OwnershipTypeId], [UnitType], [AdditionalUnits], [Furnished], [ValuationPurpose], [BuildUpAreaSqFt], [BuildUpAreaSqMtr], [AgeOfConstruction], [IsActive], [Parking], [ParkingBayNo], [Description], [Amenities], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (9, N'Abhi test', 20, 49, 1, N'1BHK', N'46', 1, N'test', CAST(45.000000 AS Decimal(18, 6)), CAST(80.000000 AS Decimal(18, 6)), 23, 1, N'yest', N'6665666', N'test test', NULL, CAST(N'2023-10-31T16:34:41.733' AS DateTime), 1, CAST(N'2023-12-13T17:08:41.627' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Master_Property] ([Id], [PropertyName], [PropertyTypeId], [PropertySubTypeId], [OwnershipTypeId], [UnitType], [AdditionalUnits], [Furnished], [ValuationPurpose], [BuildUpAreaSqFt], [BuildUpAreaSqMtr], [AgeOfConstruction], [IsActive], [Parking], [ParkingBayNo], [Description], [Amenities], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (10, N'Abhi test tttt uyu 2222', 20, 49, 1, N'1BHK', N'566', 1, N'test', CAST(56.000000 AS Decimal(18, 6)), CAST(78.000000 AS Decimal(18, 6)), 90, 0, N'yest2222222', NULL, N'asadAD', NULL, CAST(N'2023-11-10T10:33:38.947' AS DateTime), 1, CAST(N'2023-11-10T22:01:29.530' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Master_Property] ([Id], [PropertyName], [PropertyTypeId], [PropertySubTypeId], [OwnershipTypeId], [UnitType], [AdditionalUnits], [Furnished], [ValuationPurpose], [BuildUpAreaSqFt], [BuildUpAreaSqMtr], [AgeOfConstruction], [IsActive], [Parking], [ParkingBayNo], [Description], [Amenities], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (11, N'Test321', 20, 49, 1, N'2BHK', N'87686', 1, N'Reenet', CAST(786876.000000 AS Decimal(18, 6)), CAST(787.000000 AS Decimal(18, 6)), 3, 1, N'yt', N'jhghk', N'jhgjhg', NULL, CAST(N'2023-11-10T13:19:01.060' AS DateTime), 1, CAST(N'2023-11-10T13:19:01.060' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Master_Property] ([Id], [PropertyName], [PropertyTypeId], [PropertySubTypeId], [OwnershipTypeId], [UnitType], [AdditionalUnits], [Furnished], [ValuationPurpose], [BuildUpAreaSqFt], [BuildUpAreaSqMtr], [AgeOfConstruction], [IsActive], [Parking], [ParkingBayNo], [Description], [Amenities], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (13, N'ravi test', 20, 49, 1, N'2BHK', N'767', 1, N'tets', CAST(56.000000 AS Decimal(18, 6)), CAST(87.000000 AS Decimal(18, 6)), 76, 1, N'jhb', NULL, NULL, NULL, CAST(N'2023-11-10T13:30:09.217' AS DateTime), 1, CAST(N'2023-11-10T13:30:09.217' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_Property] ([Id], [PropertyName], [PropertyTypeId], [PropertySubTypeId], [OwnershipTypeId], [UnitType], [AdditionalUnits], [Furnished], [ValuationPurpose], [BuildUpAreaSqFt], [BuildUpAreaSqMtr], [AgeOfConstruction], [IsActive], [Parking], [ParkingBayNo], [Description], [Amenities], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (14, N'PropertyMumbai12', 20, 49, 1, N'1BHK', N'87686', 1, N'Reenet', CAST(909.000000 AS Decimal(18, 6)), CAST(4555.000000 AS Decimal(18, 6)), 4, 1, N'testrrr', N'ergerrr', N'fgdf', NULL, CAST(N'2023-11-10T22:03:02.140' AS DateTime), 1, CAST(N'2023-12-13T16:39:17.693' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_Property] ([Id], [PropertyName], [PropertyTypeId], [PropertySubTypeId], [OwnershipTypeId], [UnitType], [AdditionalUnits], [Furnished], [ValuationPurpose], [BuildUpAreaSqFt], [BuildUpAreaSqMtr], [AgeOfConstruction], [IsActive], [Parking], [ParkingBayNo], [Description], [Amenities], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (16, N'Parel', 1, 57, 1, N'2BHK', NULL, 1, NULL, CAST(1.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), NULL, 1, NULL, NULL, NULL, NULL, CAST(N'2023-11-21T15:27:04.500' AS DateTime), 1, CAST(N'2023-12-13T17:07:24.917' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Master_Property] ([Id], [PropertyName], [PropertyTypeId], [PropertySubTypeId], [OwnershipTypeId], [UnitType], [AdditionalUnits], [Furnished], [ValuationPurpose], [BuildUpAreaSqFt], [BuildUpAreaSqMtr], [AgeOfConstruction], [IsActive], [Parking], [ParkingBayNo], [Description], [Amenities], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (17, N'Test', 1, 57, 1, N'1BHK', NULL, 1, N'Just normal', CAST(12.000000 AS Decimal(18, 6)), CAST(12.000000 AS Decimal(18, 6)), 12, 1, NULL, N'122ew', NULL, NULL, CAST(N'2023-11-21T16:29:25.930' AS DateTime), 1, CAST(N'2023-12-13T16:47:54.507' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Master_Property] ([Id], [PropertyName], [PropertyTypeId], [PropertySubTypeId], [OwnershipTypeId], [UnitType], [AdditionalUnits], [Furnished], [ValuationPurpose], [BuildUpAreaSqFt], [BuildUpAreaSqMtr], [AgeOfConstruction], [IsActive], [Parking], [ParkingBayNo], [Description], [Amenities], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (18, N'AmitData', 2, 108, 1, N'2BHK', NULL, 1, NULL, CAST(1000.000000 AS Decimal(18, 6)), CAST(1000.000000 AS Decimal(18, 6)), 4, 1, NULL, NULL, NULL, NULL, CAST(N'2023-11-21T18:58:24.407' AS DateTime), 1, CAST(N'2023-12-13T17:07:17.487' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Master_Property] ([Id], [PropertyName], [PropertyTypeId], [PropertySubTypeId], [OwnershipTypeId], [UnitType], [AdditionalUnits], [Furnished], [ValuationPurpose], [BuildUpAreaSqFt], [BuildUpAreaSqMtr], [AgeOfConstruction], [IsActive], [Parking], [ParkingBayNo], [Description], [Amenities], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (19, N'AmitData', 20, 49, 1, N'2BHK', NULL, 1, N'Reenet', CAST(1000.000000 AS Decimal(18, 6)), CAST(1000.000000 AS Decimal(18, 6)), 4, 1, NULL, NULL, NULL, NULL, CAST(N'2023-11-21T19:02:14.087' AS DateTime), 1, CAST(N'2023-12-13T17:07:08.583' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_Property] ([Id], [PropertyName], [PropertyTypeId], [PropertySubTypeId], [OwnershipTypeId], [UnitType], [AdditionalUnits], [Furnished], [ValuationPurpose], [BuildUpAreaSqFt], [BuildUpAreaSqMtr], [AgeOfConstruction], [IsActive], [Parking], [ParkingBayNo], [Description], [Amenities], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (21, N'Delhi west', 2, 108, 1, N'2BHK', NULL, 1, NULL, CAST(786876.000000 AS Decimal(18, 6)), CAST(4555.000000 AS Decimal(18, 6)), NULL, 1, NULL, NULL, NULL, NULL, CAST(N'2023-11-21T19:06:35.407' AS DateTime), 1, CAST(N'2023-12-13T15:52:41.530' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Master_Property] ([Id], [PropertyName], [PropertyTypeId], [PropertySubTypeId], [OwnershipTypeId], [UnitType], [AdditionalUnits], [Furnished], [ValuationPurpose], [BuildUpAreaSqFt], [BuildUpAreaSqMtr], [AgeOfConstruction], [IsActive], [Parking], [ParkingBayNo], [Description], [Amenities], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (22, N'Abc', 1, 57, 1, N'2BHK', N'1d', 1, N'1s', CAST(12.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), 1, 1, N'1', N'1', N'1', NULL, CAST(N'2023-11-22T10:15:42.467' AS DateTime), 1, CAST(N'2023-12-13T15:59:35.900' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_Property] ([Id], [PropertyName], [PropertyTypeId], [PropertySubTypeId], [OwnershipTypeId], [UnitType], [AdditionalUnits], [Furnished], [ValuationPurpose], [BuildUpAreaSqFt], [BuildUpAreaSqMtr], [AgeOfConstruction], [IsActive], [Parking], [ParkingBayNo], [Description], [Amenities], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (23, N'qwertyuiop', 1, 0, 1, N'2BHK', NULL, 1, NULL, CAST(1.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), 1, 1, NULL, NULL, NULL, NULL, CAST(N'2023-11-22T10:18:05.477' AS DateTime), 1, CAST(N'2023-12-13T17:03:27.633' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_Property] ([Id], [PropertyName], [PropertyTypeId], [PropertySubTypeId], [OwnershipTypeId], [UnitType], [AdditionalUnits], [Furnished], [ValuationPurpose], [BuildUpAreaSqFt], [BuildUpAreaSqMtr], [AgeOfConstruction], [IsActive], [Parking], [ParkingBayNo], [Description], [Amenities], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (24, N'qazwsx', 1, 58, 1, N'1BHK', NULL, 1, NULL, CAST(1.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), NULL, 1, NULL, NULL, NULL, NULL, CAST(N'2023-11-22T12:46:21.997' AS DateTime), 1, CAST(N'2023-12-13T17:14:07.500' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Master_Property] ([Id], [PropertyName], [PropertyTypeId], [PropertySubTypeId], [OwnershipTypeId], [UnitType], [AdditionalUnits], [Furnished], [ValuationPurpose], [BuildUpAreaSqFt], [BuildUpAreaSqMtr], [AgeOfConstruction], [IsActive], [Parking], [ParkingBayNo], [Description], [Amenities], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (25, N'DemoProperty', 2, 107, 1, N'2BHK', N'21', 1, N'Testing Valuationsauv', CAST(12342.000000 AS Decimal(18, 6)), CAST(121323.000000 AS Decimal(18, 6)), 12, 1, N'5', NULL, NULL, NULL, CAST(N'2023-11-23T11:48:59.000' AS DateTime), 1, CAST(N'2023-12-13T11:20:33.887' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Master_Property] ([Id], [PropertyName], [PropertyTypeId], [PropertySubTypeId], [OwnershipTypeId], [UnitType], [AdditionalUnits], [Furnished], [ValuationPurpose], [BuildUpAreaSqFt], [BuildUpAreaSqMtr], [AgeOfConstruction], [IsActive], [Parking], [ParkingBayNo], [Description], [Amenities], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (26, N'PrabhadeviMahalaxmi', 27, 69, 1, N'3BHK', NULL, 1, NULL, CAST(1000.000000 AS Decimal(18, 6)), CAST(1000.000000 AS Decimal(18, 6)), NULL, 1, NULL, NULL, NULL, NULL, CAST(N'2023-12-14T10:55:41.260' AS DateTime), 1, CAST(N'2023-12-14T10:55:41.260' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_Property] ([Id], [PropertyName], [PropertyTypeId], [PropertySubTypeId], [OwnershipTypeId], [UnitType], [AdditionalUnits], [Furnished], [ValuationPurpose], [BuildUpAreaSqFt], [BuildUpAreaSqMtr], [AgeOfConstruction], [IsActive], [Parking], [ParkingBayNo], [Description], [Amenities], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (27, N'Taj Mahal', 2, 107, 1, N'3BHK', N'All Taj mahal Area', 1, N'Reenet', CAST(500000.000000 AS Decimal(18, 6)), CAST(500000.000000 AS Decimal(18, 6)), 350, 1, N'Yes', N'5', NULL, NULL, CAST(N'2023-12-15T18:27:33.657' AS DateTime), 1, CAST(N'2023-12-15T18:27:33.657' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Master_Property] ([Id], [PropertyName], [PropertyTypeId], [PropertySubTypeId], [OwnershipTypeId], [UnitType], [AdditionalUnits], [Furnished], [ValuationPurpose], [BuildUpAreaSqFt], [BuildUpAreaSqMtr], [AgeOfConstruction], [IsActive], [Parking], [ParkingBayNo], [Description], [Amenities], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (28, N'Amit DDSA', 1, 57, 1, N'2BHK', NULL, 1, N'Valuation Data', CAST(542.000000 AS Decimal(18, 6)), CAST(768876.000000 AS Decimal(18, 6)), 3, 1, N'87', N'2', NULL, NULL, CAST(N'2023-12-22T13:53:30.093' AS DateTime), 1, CAST(N'2023-12-22T13:53:30.093' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Master_Property] ([Id], [PropertyName], [PropertyTypeId], [PropertySubTypeId], [OwnershipTypeId], [UnitType], [AdditionalUnits], [Furnished], [ValuationPurpose], [BuildUpAreaSqFt], [BuildUpAreaSqMtr], [AgeOfConstruction], [IsActive], [Parking], [ParkingBayNo], [Description], [Amenities], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (29, N'dhanvantari', 2, 107, 1, N'1BHK', N'1', 0, N'nothing', CAST(1200.000000 AS Decimal(18, 6)), CAST(400.000000 AS Decimal(18, 6)), 1, 1, N'1', N'1', N'1', NULL, CAST(N'2023-12-22T17:09:34.923' AS DateTime), 1, CAST(N'2023-12-22T17:11:47.393' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Master_Property] ([Id], [PropertyName], [PropertyTypeId], [PropertySubTypeId], [OwnershipTypeId], [UnitType], [AdditionalUnits], [Furnished], [ValuationPurpose], [BuildUpAreaSqFt], [BuildUpAreaSqMtr], [AgeOfConstruction], [IsActive], [Parking], [ParkingBayNo], [Description], [Amenities], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (30, N'Bunglow', 2, 107, 1, N'3BHK', NULL, 0, NULL, CAST(2500.000000 AS Decimal(18, 6)), CAST(2500.000000 AS Decimal(18, 6)), NULL, 1, NULL, NULL, NULL, NULL, CAST(N'2024-01-02T13:06:47.217' AS DateTime), 1, CAST(N'2024-01-02T13:06:47.217' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Master_Property] ([Id], [PropertyName], [PropertyTypeId], [PropertySubTypeId], [OwnershipTypeId], [UnitType], [AdditionalUnits], [Furnished], [ValuationPurpose], [BuildUpAreaSqFt], [BuildUpAreaSqMtr], [AgeOfConstruction], [IsActive], [Parking], [ParkingBayNo], [Description], [Amenities], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (31, N'q3245645343q2ewd$%^', 1, 0, 1, N'1BHK', NULL, 0, NULL, CAST(67.000000 AS Decimal(18, 6)), CAST(7668.000000 AS Decimal(18, 6)), NULL, 1, NULL, NULL, NULL, NULL, CAST(N'2024-01-03T11:53:00.723' AS DateTime), 1, CAST(N'2024-01-03T11:53:00.723' AS DateTime), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Master_Property] OFF
GO
SET IDENTITY_INSERT [dbo].[Master_Department] ON 
GO
INSERT [dbo].[Master_Department] ([Id], [Department], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Builder', 0, CAST(N'2023-09-27T12:46:46.340' AS DateTime), 1, CAST(N'2023-10-19T17:25:42.943' AS DateTime), 0)
GO
INSERT [dbo].[Master_Department] ([Id], [Department], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'Dealer', 1, CAST(N'2023-09-27T12:46:46.340' AS DateTime), 1, CAST(N'2023-09-27T12:46:46.340' AS DateTime), 0)
GO
INSERT [dbo].[Master_Department] ([Id], [Department], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'Seller', 1, CAST(N'2023-09-27T12:46:46.340' AS DateTime), 1, CAST(N'2023-09-27T12:46:46.340' AS DateTime), 0)
GO
INSERT [dbo].[Master_Department] ([Id], [Department], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'Buyer', 1, CAST(N'2023-09-27T12:46:46.340' AS DateTime), 1, CAST(N'2023-09-27T12:46:46.340' AS DateTime), 0)
GO
INSERT [dbo].[Master_Department] ([Id], [Department], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, N'Test', 0, CAST(N'2023-10-19T08:59:01.480' AS DateTime), 0, CAST(N'2023-10-19T08:59:01.500' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[Master_Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Master_Designation] ON 
GO
INSERT [dbo].[Master_Designation] ([Id], [Designation], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Developer', 1, CAST(N'2023-09-27T12:46:46.340' AS DateTime), 1, CAST(N'2023-09-27T12:46:46.340' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Master_Designation] OFF
GO
SET IDENTITY_INSERT [dbo].[Master_User] ON 
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (1, N'System', N'system', N'Admin', N'M', CAST(N'2023-12-15T00:00:00.000' AS DateTime), 2, 1, N'LNT00022131211', 0, 1, N'8776F108E247AB1E2B323042C049C266407C81FBAD41BDE1E8DFC1BB66FD267E', 1, CAST(N'2023-09-29T09:47:18.793' AS DateTime), 1, CAST(N'2024-01-03T13:19:20.943' AS DateTime), 1, N'Colliers', N'admin@gmail.com', 4, CAST(N'2024-01-03T13:14:56.950' AS DateTime), N'6B86B273FF34FCE19D6B804EFF5A3F5747ADA4EAA22F1D49C01E52DDB7875B4B', NULL, NULL, 46, NULL, NULL)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (3, N'Mardul', N'Amana', N'Deva', N'M', CAST(N'2023-10-06T00:00:00.000' AS DateTime), 3, 1, N'LN99921221', 0, 2, N'8776F108E247AB1E2B323042C049C266407C81FBAD41BDE1E8DFC1BB66FD267E', 1, CAST(N'2023-10-06T09:19:45.503' AS DateTime), 1, CAST(N'2023-11-15T00:04:44.017' AS DateTime), 1, N'Mardul Co & Sons', N'pawanraj@gmail.com', 2, NULL, N'', NULL, NULL, NULL, NULL, 2)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (15, N'Yalla', N'CH', N'Reddy', N'M', CAST(N'2023-11-04T00:00:00.000' AS DateTime), 3, 1, N'COL0012', 0, 1, N'202F2DDFF5DE017C7236704A6D0284FCD9DA29CA0AF3A3ACDD25F3F043A7E5CE', 1, NULL, NULL, CAST(N'2023-11-07T17:47:23.887' AS DateTime), 1, N'Collier', N'yalla.reddy@neosofttech.com', 2, NULL, NULL, NULL, NULL, NULL, NULL, 3)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (17, N'Approver', NULL, N'Deva', N'M', CAST(N'2023-10-06T09:19:53.130' AS DateTime), 1, 1, N'LN9992', 0, 2, N'8776F108E247AB1E2B323042C049C266407C81FBAD41BDE1E8DFC1BB66FD267E', 1, NULL, NULL, CAST(N'2024-01-03T20:37:59.067' AS DateTime), NULL, NULL, N'Approver@gmail.com', 2, NULL, NULL, NULL, NULL, NULL, NULL, 2)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (25, N'Pawan', NULL, N'Singh', N'M', CAST(N'2000-09-29T04:14:49.063' AS DateTime), 1, 1, N'LNT0002', 1, 1, N'8776F108E247AB1E2B323042C049C266407C81FBAD41BDE1E8DFC1BB66FD267E', 1, NULL, NULL, NULL, NULL, NULL, N'requestoaar@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (27, N'Mardul', NULL, N'Deva', N'M', CAST(N'2024-01-04T00:00:00.000' AS DateTime), 3, 1, N'LN999287798', 0, 2, N'3946259A858B6BA2A76770041490D296EE6C8556A65F89D3F15286CBCCD556B8', 1, NULL, NULL, CAST(N'2024-01-04T14:11:02.377' AS DateTime), 1, N'Mardul Co and Sons', N'abhishekngr028@gmail.com', 2, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (35, N'Pawan', NULL, N'Singh', N'M', CAST(N'2000-09-29T04:14:49.063' AS DateTime), 1, 1, N'LNT0002', 1, 1, N'8776F108E247AB1E2B323042C049C266407C81FBAD41BDE1E8DFC1BB66FD267E', 1, NULL, NULL, NULL, NULL, NULL, N'valuer@gmail.com', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (37, N'Mardul', NULL, N'Deva', N'M', CAST(N'2023-10-06T09:19:53.130' AS DateTime), 1, 1, N'LN9992', 0, 2, N'3946259A858B6BA2A76770041490D296EE6C8556A65F89D3F15286CBCCD556B8', 1, NULL, NULL, NULL, NULL, NULL, N'abhishekngr028@gmail.com', 2, NULL, NULL, NULL, NULL, NULL, NULL, 3)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (45, N'Vishya', N'Karma', N'Developer', N'M', CAST(N'2023-01-02T00:00:00.000' AS DateTime), 2, 1, N'21342343212', 0, 2, N'8776F108E247AB1E2B323042C049C266407C81FBAD41BDE1E8DFC1BB66FD267E', 1, CAST(N'2023-11-02T16:43:00.350' AS DateTime), 1, CAST(N'2023-12-14T18:04:48.247' AS DateTime), 1, N'soft', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (46, N'pp', N'pp', N'pp', N'M', CAST(N'2023-12-18T00:00:00.000' AS DateTime), 3, 1, N'76678768798', 0, 1, N'8776F108E247AB1E2B323042C049C266407C81FBAD41BDE1E8DFC1BB66FD267E', 1, CAST(N'2023-11-13T18:56:52.120' AS DateTime), 1, CAST(N'2023-12-18T10:13:39.920' AS DateTime), 1, N'Dev', N'user12@example.com', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (53, N'Requestor', N'R', N'r', N'm', CAST(N'2023-11-13T00:00:00.000' AS DateTime), 1, 1, N'lnt12', 0, 1, N'8776F108E247AB1E2B323042C049C266407C81FBAD41BDE1E8DFC1BB66FD267E', 1, CAST(N'2023-11-13T00:00:00.000' AS DateTime), 1, CAST(N'2023-11-13T00:00:00.000' AS DateTime), 1, N'dev', N'requestor@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (54, N'Pawan', N'Singh', N'LastNam', N'F', CAST(N'2023-01-22T00:00:00.000' AS DateTime), 2, 1, N'LC21223433423', 0, 1, N'202F2DDFF5DE017C7236704A6D0284FCD9DA29CA0AF3A3ACDD25F3F043A7E5CE', 1, CAST(N'2023-11-19T20:13:25.753' AS DateTime), 1, CAST(N'2023-11-28T18:15:41.940' AS DateTime), 1, N'ABCD', N'rrr28@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (55, N'H', N'M', N'J', N'M', CAST(N'2023-11-01T00:00:00.000' AS DateTime), 2, 1, N'H1212121233', 0, 1, N'BCB791F131ADDDDE10040F4F8EA50ECBC183003C925D122659E4DB81B1DA7FC2', 1, CAST(N'2023-11-20T16:50:46.680' AS DateTime), 1, CAST(N'2023-11-29T10:56:10.513' AS DateTime), 1, N'HJ', N'admin@gmail.com', 4, NULL, NULL, NULL, NULL, 100, NULL, NULL)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (56, N'Fatima', NULL, N'Rizwana', N'M', CAST(N'2023-12-18T00:00:00.000' AS DateTime), 2, 1, NULL, 0, 2, N'202F2DDFF5DE017C7236704A6D0284FCD9DA29CA0AF3A3ACDD25F3F043A7E5CE', 0, CAST(N'2023-12-05T15:53:35.313' AS DateTime), 1, CAST(N'2023-12-18T15:51:03.680' AS DateTime), 1, N'Brothers And Sons Company', NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (57, N'Kuldip', N'D', N'Wagh', N'M', CAST(N'2023-12-16T00:00:00.000' AS DateTime), 3, 1, N'qweedserfds', 0, 1, N'8776F108E247AB1E2B323042C049C266407C81FBAD41BDE1E8DFC1BB66FD267E', 1, CAST(N'2023-12-14T18:18:11.410' AS DateTime), 1, CAST(N'2023-12-16T12:45:19.200' AS DateTime), 1, N'comp', N'admin@gmail.com', 1, NULL, NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (58, N'h', N'm', N'j', N'M', CAST(N'2023-12-18T00:00:00.000' AS DateTime), 2, 1, NULL, 0, 1, N'8776F108E247AB1E2B323042C049C266407C81FBAD41BDE1E8DFC1BB66FD267E', 1, CAST(N'2023-12-17T10:59:17.583' AS DateTime), 1, CAST(N'2023-12-18T20:09:06.050' AS DateTime), 1, N'ab', N'heetneosoftqa@gmail.com', 2, NULL, NULL, NULL, NULL, 0, NULL, 3)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (59, N'Pawan', N'Developer', N'Neosoft', N'M', CAST(N'2023-12-19T00:00:00.000' AS DateTime), 2, 1, N'LIC12323434', 0, 1, N'8776F108E247AB1E2B323042C049C266407C81FBAD41BDE1E8DFC1BB66FD267E', 1, CAST(N'2023-12-19T12:31:02.087' AS DateTime), 1, CAST(N'2023-12-19T15:07:03.553' AS DateTime), 1, N'Compay', N'pawanraj5722@gmail.com', 9, NULL, NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (60, N'Vishal', N'Reddy', N'Raj', N'M', CAST(N'2023-12-21T00:00:00.000' AS DateTime), 2, 1, N'876876797879', 0, 0, N'8776F108E247AB1E2B323042C049C266407C81FBAD41BDE1E8DFC1BB66FD267E', 0, CAST(N'2023-12-21T18:51:15.463' AS DateTime), 1, CAST(N'2023-12-21T18:51:15.463' AS DateTime), 1, N'Sbhh', N'pp521@gmail.com', 1, NULL, NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (61, N'ravi', N'Kumar', N'saw', N'0', CAST(N'2023-12-22T00:00:00.000' AS DateTime), 2, 1, NULL, 0, 1, N'B6BC7B58510319A151D168BA3D5AECB3AC0A9708D06DD930F37FBC89B6CDC697', 0, CAST(N'2023-12-22T16:30:50.707' AS DateTime), 1, CAST(N'2023-12-22T16:30:50.707' AS DateTime), 1, N'Eltizam', N'ab@gmail.com', 11, NULL, NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (62, N'pawan', NULL, N'kumar', N'M', CAST(N'2023-12-22T00:00:00.000' AS DateTime), 2, 1, NULL, 0, 1, N'B6BC7B58510319A151D168BA3D5AECB3AC0A9708D06DD930F37FBC89B6CDC697', 0, CAST(N'2023-12-22T16:34:02.743' AS DateTime), 1, CAST(N'2023-12-22T16:34:02.743' AS DateTime), 1, N'vs', N'chek@gmail.com', 3, NULL, NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (63, N'Pawan', N'Kumar', N'Singh', N'M', CAST(N'2023-12-22T00:00:00.000' AS DateTime), 2, 1, NULL, 0, 1, N'8776F108E247AB1E2B323042C049C266407C81FBAD41BDE1E8DFC1BB66FD267E', 0, CAST(N'2023-12-22T18:34:17.647' AS DateTime), 1, CAST(N'2023-12-22T18:34:17.647' AS DateTime), 1, N'jhk', N'pppp232@gmail.com', 1, NULL, NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (64, N'Rajesh', N'Singh', N'Dev', N'M', CAST(N'2023-12-22T00:00:00.000' AS DateTime), 2, 1, NULL, 0, 1, N'8776F108E247AB1E2B323042C049C266407C81FBAD41BDE1E8DFC1BB66FD267E', 0, CAST(N'2023-12-22T19:03:19.040' AS DateTime), 1, CAST(N'2023-12-22T19:03:19.040' AS DateTime), 1, N'c', N'admin21@gmail.com', 4, NULL, NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (65, N'KK', N'KK', N'DD', N'M', CAST(N'2023-12-22T00:00:00.000' AS DateTime), 2, 1, NULL, 0, 1, N'8776F108E247AB1E2B323042C049C266407C81FBAD41BDE1E8DFC1BB66FD267E', 0, CAST(N'2023-12-22T19:11:27.440' AS DateTime), 1, CAST(N'2023-12-22T19:12:55.047' AS DateTime), 1, N'Com', N'ppp511@gmail.com', 1, NULL, NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (66, N'Heet', N'Joshi', N'Tester', N'M', CAST(N'2023-12-26T00:00:00.000' AS DateTime), 2, 1, NULL, 0, 1, N'8776F108E247AB1E2B323042C049C266407C81FBAD41BDE1E8DFC1BB66FD267E', 1, CAST(N'2023-12-22T19:16:29.647' AS DateTime), 1, CAST(N'2023-12-26T18:42:26.930' AS DateTime), 1, N'hg', N'tt52@gmail.com', 2, NULL, NULL, NULL, NULL, 0, NULL, 1)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (67, N'Heet', N'Test', N'New', N'M', CAST(N'2024-01-02T00:00:00.000' AS DateTime), 2, 1, NULL, 0, 1, N'8776F108E247AB1E2B323042C049C266407C81FBAD41BDE1E8DFC1BB66FD267E', 0, CAST(N'2023-12-22T19:53:26.910' AS DateTime), 1, CAST(N'2024-01-02T13:00:21.457' AS DateTime), 1, N'c', N'admin@gmail.com', 2, NULL, NULL, NULL, NULL, 0, NULL, 2)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (68, N'Deva', N'Test', N'Tester', N'M', CAST(N'2023-12-22T00:00:00.000' AS DateTime), 2, 1, NULL, 0, 1, N'8776F108E247AB1E2B323042C049C266407C81FBAD41BDE1E8DFC1BB66FD267E', 0, CAST(N'2023-12-22T20:36:33.457' AS DateTime), 1, CAST(N'2023-12-22T20:36:33.457' AS DateTime), 1, N'Com', N'pppp87@gmail.com', 2, NULL, NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (69, N'swap', N'D', N'patil', N'M', CAST(N'2023-12-26T00:00:00.000' AS DateTime), 2, 1, N'qweedserfds', 0, 1, N'8776F108E247AB1E2B323042C049C266407C81FBAD41BDE1E8DFC1BB66FD267E', 1, CAST(N'2023-12-26T18:46:26.327' AS DateTime), 1, CAST(N'2023-12-26T18:47:13.413' AS DateTime), 1, N'comp', N'swap@gmail.com', 2, NULL, NULL, NULL, NULL, 0, NULL, 3)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (70, N'Vishal', N'Reddy', N'Manager', N'M', CAST(N'2023-12-29T00:00:00.000' AS DateTime), 2, 1, N'LN90001292023', 0, 1, N'8776F108E247AB1E2B323042C049C266407C81FBAD41BDE1E8DFC1BB66FD267E', 1, CAST(N'2023-12-29T13:29:48.227' AS DateTime), 1, CAST(N'2023-12-29T13:29:48.227' AS DateTime), 1, N'Com', N'pawan543565@ggmail.com', 1, NULL, NULL, NULL, NULL, 0, NULL, 0)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (71, N'Pawan', N'Dev', N'Singh', N'M', CAST(N'2023-12-29T00:00:00.000' AS DateTime), 2, 1, N'Mun98772979', 0, 1, N'8776F108E247AB1E2B323042C049C266407C81FBAD41BDE1E8DFC1BB66FD267E', 1, CAST(N'2023-12-29T13:33:00.573' AS DateTime), 1, CAST(N'2023-12-29T13:33:00.573' AS DateTime), 1, N'Com', N'pawan2322@mgamil.com', 1, NULL, NULL, NULL, NULL, 0, NULL, 0)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (72, N'Mohan', N'Bhagya', N'Dev', N'M', CAST(N'2000-09-01T00:00:00.000' AS DateTime), 3, 1, N'MLN9800212', 0, 1, N'8776F108E247AB1E2B323042C049C266407C81FBAD41BDE1E8DFC1BB66FD267E', 1, CAST(N'2024-01-02T12:50:17.677' AS DateTime), 1, CAST(N'2024-01-02T12:50:17.677' AS DateTime), 1, N'Master Co And Bros', N'requestor5510@gmail.com', 1, NULL, NULL, NULL, NULL, 0, NULL, 0)
GO
INSERT [dbo].[Master_User] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DateOfBirth], [DepartmentId], [DesignationId], [LicenseNo], [CompanyId], [ResourceId], [Password], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyName], [Email], [RoleId], [ForgotPasswordDateTime], [ForgotPasswordToken], [ReportsTo], [UserTypeId], [ProfileAttachmentId], [IsDeleted], [ApproverLevelId]) VALUES (73, N'Neha', N'Kmblep', N'sureshp', N'M', CAST(N'2024-01-03T00:00:00.000' AS DateTime), 3, 1, N'qweedserfds', 0, 1, N'8776F108E247AB1E2B323042C049C266407C81FBAD41BDE1E8DFC1BB66FD267E', 1, CAST(N'2024-01-02T19:30:20.923' AS DateTime), 1, CAST(N'2024-01-03T16:23:42.110' AS DateTime), 1, N'compp', N'swapnil@gmail.com', 3, NULL, NULL, NULL, NULL, 0, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Master_User] OFF
GO
SET IDENTITY_INSERT [dbo].[Master_ValuationStatus] ON 
GO
INSERT [dbo].[Master_ValuationStatus] ([Id], [Status], [StatusCode], [IsActive], [Sort], [Group], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ColorCode], [BackGroundColor], [Type]) VALUES (1, N'New', N'NEW', 1, 1, 1, 1, CAST(N'2023-12-20T12:52:31.217' AS DateTime), NULL, NULL, N'#8190be', N'#E1EFFF', 1)
GO
INSERT [dbo].[Master_ValuationStatus] ([Id], [Status], [StatusCode], [IsActive], [Sort], [Group], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ColorCode], [BackGroundColor], [Type]) VALUES (2, N'Cancelled', N'CAN', 1, 1, 1, 1, CAST(N'2023-12-20T12:52:31.217' AS DateTime), NULL, NULL, N'#3F392B', N'#e8e7e6', 1)
GO
INSERT [dbo].[Master_ValuationStatus] ([Id], [Status], [StatusCode], [IsActive], [Sort], [Group], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ColorCode], [BackGroundColor], [Type]) VALUES (3, N'Quoted', N'QTD', 1, 1, 1, 1, CAST(N'2023-12-20T12:52:31.217' AS DateTime), NULL, NULL, N'#ff9900', N'#FFF6E9', 1)
GO
INSERT [dbo].[Master_ValuationStatus] ([Id], [Status], [StatusCode], [IsActive], [Sort], [Group], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ColorCode], [BackGroundColor], [Type]) VALUES (4, N'Paid', N'PID', 1, 1, 1, 1, CAST(N'2023-12-20T12:52:31.217' AS DateTime), NULL, NULL, N'#009900', N'#e6f5e6', 1)
GO
INSERT [dbo].[Master_ValuationStatus] ([Id], [Status], [StatusCode], [IsActive], [Sort], [Group], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ColorCode], [BackGroundColor], [Type]) VALUES (5, N'Sub. to Approver', N'STA', 1, 1, 1, 1, CAST(N'2023-12-20T12:52:31.217' AS DateTime), NULL, NULL, N'#3f6877', N'#b0d4e1', 1)
GO
INSERT [dbo].[Master_ValuationStatus] ([Id], [Status], [StatusCode], [IsActive], [Sort], [Group], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ColorCode], [BackGroundColor], [Type]) VALUES (6, N'Approved', N'APP', 1, 1, 2, 1, CAST(N'2023-12-20T12:52:31.217' AS DateTime), NULL, NULL, N'#2a6f68', N'#b5e3de', 1)
GO
INSERT [dbo].[Master_ValuationStatus] ([Id], [Status], [StatusCode], [IsActive], [Sort], [Group], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ColorCode], [BackGroundColor], [Type]) VALUES (7, N'Rejected', N'REJ', 1, 1, 2, 1, CAST(N'2023-12-20T12:52:31.217' AS DateTime), NULL, NULL, N'#aa2b2b', N'#f5e6e6', 1)
GO
INSERT [dbo].[Master_ValuationStatus] ([Id], [Status], [StatusCode], [IsActive], [Sort], [Group], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ColorCode], [BackGroundColor], [Type]) VALUES (8, N'Sub. to Valuer', N'STV', 1, 1, 1, 1, CAST(N'2023-12-20T12:52:31.217' AS DateTime), NULL, NULL, N'#787621', N'#e9e8af', 1)
GO
INSERT [dbo].[Master_ValuationStatus] ([Id], [Status], [StatusCode], [IsActive], [Sort], [Group], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ColorCode], [BackGroundColor], [Type]) VALUES (9, N'Under Valuation', N'UNV', 1, 1, 3, 1, CAST(N'2023-12-20T12:52:31.217' AS DateTime), NULL, NULL, N'#216878', N'#afdfe9', 1)
GO
INSERT [dbo].[Master_ValuationStatus] ([Id], [Status], [StatusCode], [IsActive], [Sort], [Group], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ColorCode], [BackGroundColor], [Type]) VALUES (10, N'Valuation Created', N'VCR', 1, 1, 3, 1, CAST(N'2023-12-20T12:52:31.217' AS DateTime), NULL, NULL, N'#362178 ', N'#bdafe9', 1)
GO
INSERT [dbo].[Master_ValuationStatus] ([Id], [Status], [StatusCode], [IsActive], [Sort], [Group], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ColorCode], [BackGroundColor], [Type]) VALUES (11, N'Completed', N'COM', 1, 1, 1, 1, CAST(N'2023-12-20T12:52:31.217' AS DateTime), NULL, NULL, N'#3a7619', N'#c2edab', 1)
GO
INSERT [dbo].[Master_ValuationStatus] ([Id], [Status], [StatusCode], [IsActive], [Sort], [Group], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ColorCode], [BackGroundColor], [Type]) VALUES (12, N'Requested', N'QNW', 0, 1, NULL, 1, CAST(N'2023-12-20T12:57:58.940' AS DateTime), NULL, NULL, NULL, NULL, 2)
GO
INSERT [dbo].[Master_ValuationStatus] ([Id], [Status], [StatusCode], [IsActive], [Sort], [Group], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ColorCode], [BackGroundColor], [Type]) VALUES (13, N'Completed', N'QCP', 1, 1, NULL, 1, CAST(N'2023-12-20T12:57:58.940' AS DateTime), NULL, NULL, N'#3a7619', N'#c2edab', 2)
GO
INSERT [dbo].[Master_ValuationStatus] ([Id], [Status], [StatusCode], [IsActive], [Sort], [Group], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ColorCode], [BackGroundColor], [Type]) VALUES (14, N'Pending', N'IPD', 0, 1, NULL, 1, CAST(N'2023-12-21T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 3)
GO
INSERT [dbo].[Master_ValuationStatus] ([Id], [Status], [StatusCode], [IsActive], [Sort], [Group], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ColorCode], [BackGroundColor], [Type]) VALUES (15, N'Fail', N'IFL', 0, 1, NULL, 1, CAST(N'2023-12-21T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 3)
GO
INSERT [dbo].[Master_ValuationStatus] ([Id], [Status], [StatusCode], [IsActive], [Sort], [Group], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ColorCode], [BackGroundColor], [Type]) VALUES (16, N'Completed', N'ICM', 1, 1, NULL, 1, CAST(N'2023-12-21T00:00:00.000' AS DateTime), NULL, NULL, N'#3a7619', N'#c2edab', 3)
GO
SET IDENTITY_INSERT [dbo].[Master_ValuationStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[ValuationRequest] ON 
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (5, N'refno', N'otherred12', 1, CAST(N'2023-10-30' AS Date), 1, 1, 4, 4, 15, N'commnt', CAST(N'2023-10-30T13:31:52.860' AS DateTime), 1, CAST(N'2023-10-30T13:31:52.860' AS DateTime), 3, CAST(N'2023-12-21T15:30:01.853' AS DateTime), 41, N'valucomment', CAST(N'2023-10-30T13:31:52.860' AS DateTime), N'Assigned to other approver', NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (10, N'123', N'12345678', 179, CAST(N'2023-01-18' AS Date), 2000, 13, 9, 6, 15, N'Review by mehide show1', NULL, 0, CAST(N'2023-11-06T21:31:57.113' AS DateTime), 1, CAST(N'2023-11-21T17:09:24.083' AS DateTime), 35, N'ddsdsdsdup', NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (12, N'12341', N'654', 179, CAST(N'2023-10-20' AS Date), 100, 13, 9, 7, 15, N'abhi', NULL, 1, CAST(N'2023-11-09T15:23:52.450' AS DateTime), NULL, CAST(N'2023-11-17T19:54:37.080' AS DateTime), 15, NULL, NULL, N'Assigned to other approver', NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (13, N'123452', N'999999', 179, CAST(N'2024-02-02' AS Date), 85, 13, 9, 7, 3, N'fgd122', NULL, 1, CAST(N'2023-11-09T15:47:33.883' AS DateTime), NULL, CAST(N'2023-11-10T16:47:06.093' AS DateTime), 15, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (14, N'VR20235809-13', N'66789', 192, CAST(N'2023-01-25' AS Date), 800, 13, 9, 1, 15, NULL, NULL, 1, CAST(N'2023-11-09T22:01:40.513' AS DateTime), 1, CAST(N'2023-11-16T16:00:48.383' AS DateTime), 3, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (15, N'VR20234310-14', N'12', 179, CAST(N'2023-01-01' AS Date), 9000, 6, 7, 6, 15, N'dwdno', NULL, 1, CAST(N'2023-11-10T20:46:09.520' AS DateTime), 1, CAST(N'2023-11-21T17:42:04.250' AS DateTime), 35, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (25, N'VR20232213-15', N'string', 0, CAST(N'2023-11-13' AS Date), 0, 1, 4, 7, 3, N'string', CAST(N'2023-11-13T13:51:07.730' AS DateTime), 0, CAST(N'2023-11-13T19:41:57.630' AS DateTime), 0, CAST(N'2023-11-13T19:41:57.630' AS DateTime), 41, N'string', CAST(N'2023-11-13T13:51:07.730' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (27, N'VR20234915-25', N'VRRef001', 179, CAST(N'2023-01-04' AS Date), NULL, 13, 8, 1, 3, N'dkajkla', NULL, 1, CAST(N'2023-11-15T12:54:27.370' AS DateTime), 1, CAST(N'2023-11-24T13:50:23.550' AS DateTime), 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (28, N'VR20230915-27', N'OTHREF00028', 179, CAST(N'2023-01-31' AS Date), 14, 13, 8, 1, 3, N'comment', NULL, 1, CAST(N'2023-11-15T14:10:44.270' AS DateTime), 1, CAST(N'2023-11-24T13:45:40.893' AS DateTime), 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (30, N'VR20234224-28', N'767', 179, CAST(N'2023-11-24' AS Date), 343, 13, 25, 1, 3, NULL, NULL, 1, CAST(N'2023-11-24T15:17:43.010' AS DateTime), 1, CAST(N'2023-11-24T15:17:43.010' AS DateTime), 35, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (31, N'VR20234224-30', NULL, 192, CAST(N'2023-01-11' AS Date), NULL, 2, 7, 1, 15, NULL, NULL, 1, CAST(N'2023-11-24T15:30:58.290' AS DateTime), 1, CAST(N'2023-11-29T12:36:33.853' AS DateTime), 35, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (32, N'VR20232829-31', N'123123', 179, CAST(N'2023-01-01' AS Date), 1, 15, 16, 3, 15, N'1', NULL, 1, CAST(N'2023-11-29T09:44:57.910' AS DateTime), 1, CAST(N'2023-11-29T09:44:57.910' AS DateTime), 35, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (38, N'VR20234829-32', N'123456789', 179, CAST(N'2023-01-01' AS Date), NULL, 2, 8, 1, 3, N'v', NULL, 1, CAST(N'2023-11-29T12:56:29.837' AS DateTime), 1, CAST(N'2023-11-29T18:35:23.240' AS DateTime), 35, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (39, N'VR20232429-38', N'VR202311292', 179, CAST(N'2023-01-28' AS Date), NULL, 2, 8, 1, NULL, N'new', NULL, 1, CAST(N'2023-11-29T13:40:57.720' AS DateTime), 1, CAST(N'2023-11-29T18:46:31.013' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (40, N'VR2311-39', N'VR00113', 0, CAST(N'2023-11-27' AS Date), NULL, 2, 8, 1, NULL, NULL, NULL, 1, CAST(N'2023-11-29T23:18:11.193' AS DateTime), 1, CAST(N'2023-11-29T23:24:29.533' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (41, N'VR2311-40', N'BR12121988', 192, CAST(N'2023-01-30' AS Date), NULL, 2, 25, 9, 37, N'no', NULL, 1, CAST(N'2023-11-30T16:27:29.243' AS DateTime), 35, CAST(N'2024-01-03T11:11:33.157' AS DateTime), 35, NULL, NULL, N'1', NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (42, N'VR2311-41', N'J12J12', 179, CAST(N'2023-01-30' AS Date), 13, 9, 8, 1, 15, N'M D', NULL, 1, CAST(N'2023-11-30T16:33:27.897' AS DateTime), NULL, CAST(N'2023-12-06T12:48:57.600' AS DateTime), 35, NULL, NULL, N'note', NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (43, N'VR2312-43', N'VR20231205', 179, CAST(N'2023-01-05' AS Date), NULL, 32, 8, 3, 3, N'new for client', NULL, 1, CAST(N'2023-12-05T11:06:03.730' AS DateTime), 1, CAST(N'2023-12-06T15:40:56.477' AS DateTime), NULL, NULL, NULL, N'note', NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (44, N'VR2312-44', NULL, 0, CAST(N'2023-01-06' AS Date), NULL, 2, 8, 4, 3, NULL, NULL, 1, CAST(N'2023-12-06T20:17:41.230' AS DateTime), 1, CAST(N'2023-12-21T18:20:33.690' AS DateTime), 35, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (45, N'VR2312-45', N'Testingsavebutton', 179, CAST(N'2023-01-06' AS Date), NULL, 2, 16, 5, 3, NULL, NULL, 1, CAST(N'2023-12-06T21:57:07.947' AS DateTime), 1, CAST(N'2023-12-21T18:20:52.283' AS DateTime), NULL, NULL, NULL, N'App', NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (46, N'VR20233806-45', N'RED', 179, CAST(N'2023-01-06' AS Date), NULL, 2, 8, 2, 15, NULL, NULL, 1, CAST(N'2023-12-06T23:44:26.643' AS DateTime), 1, CAST(N'2023-12-07T11:29:43.880' AS DateTime), 35, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (47, N'VR2312-47', N'1111111111111111111111111111111111111111111111111107930970999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999991930731973197319731973910739013907', 179, CAST(N'2023-01-07' AS Date), NULL, 9, 8, 8, 3, N'1111111111111111111111111111111111111111111111111107930970999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999991930731973197319731973910739013907', NULL, 1, CAST(N'2023-12-07T09:26:14.993' AS DateTime), 1, CAST(N'2023-12-21T18:21:16.830' AS DateTime), 35, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (48, N'VR2312-48', N'KKKK', 179, CAST(N'2023-12-07' AS Date), NULL, 9, 25, 6, NULL, N'by me1', NULL, 1, CAST(N'2023-12-07T09:27:19.623' AS DateTime), 2, CAST(N'2023-12-27T20:12:08.307' AS DateTime), 46, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (49, N'VR2312-49', N'1111111111111111111111111111111111111111111111111107930970999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999991930731973197319731973910739013907', 179, CAST(N'2023-01-07' AS Date), NULL, 2, 24, 6, 15, N'1111111111111111111111111111111111111111111111111107930970999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999991930731973197319731973910739013907', NULL, 1, CAST(N'2023-12-07T09:29:01.633' AS DateTime), NULL, CAST(N'2023-12-19T12:51:21.703' AS DateTime), 46, NULL, NULL, N'gf', NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (50, N'VR2312-50', N'm111111111111111111111111111111111111111111111111110793097099999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999193073197319731973197391073901390', 179, CAST(N'2023-01-07' AS Date), NULL, 2, 8, 6, 3, NULL, NULL, 1, CAST(N'2023-12-07T12:39:25.103' AS DateTime), 1, CAST(N'2023-12-27T13:56:18.063' AS DateTime), NULL, NULL, NULL, N'12', NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (51, N'VR2312-51', N'1111111111111111111111111111111111111111111111111107930970999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999991930731973197319731973910739013907', 179, CAST(N'2023-01-07' AS Date), NULL, 2, 25, 1, 15, N'1111111111111111111111111111111111111111111111111107930970999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999991930731973197319731973910739013907', NULL, 1, CAST(N'2023-12-07T12:44:03.540' AS DateTime), NULL, CAST(N'2023-12-12T09:59:14.003' AS DateTime), 35, NULL, NULL, N'Assign new', NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (52, N'VR2312-52', N'123test1', 179, CAST(N'2023-01-07' AS Date), NULL, 2, 8, 1, 15, NULL, NULL, 1, CAST(N'2023-12-07T16:42:28.237' AS DateTime), NULL, CAST(N'2023-12-13T18:01:21.300' AS DateTime), 35, NULL, NULL, N'77', NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (53, N'VR2312-53', N'REF001test', 179, CAST(N'2023-01-07' AS Date), 12334, 2, 8, 4, 3, NULL, NULL, 1, CAST(N'2023-12-07T17:33:21.467' AS DateTime), 1, CAST(N'2023-12-15T11:54:53.810' AS DateTime), 35, NULL, NULL, N'398222222222222222222222222877999992701999992222222927107192222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222209217091', NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (54, N'VR2312-54', N'13thdec', 179, CAST(N'2023-12-13' AS Date), 1234, 15, 8, 3, 3, NULL, NULL, 1, CAST(N'2023-12-13T16:58:08.637' AS DateTime), 1, CAST(N'2023-12-13T17:30:20.677' AS DateTime), 35, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (55, N'VR2312-55', N'55', 0, CAST(N'2023-12-13' AS Date), 55, 2, 8, 1, 3, NULL, NULL, 1, CAST(N'2023-12-13T17:38:29.960' AS DateTime), 1, CAST(N'2023-12-14T16:18:23.053' AS DateTime), 35, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (56, N'VR2312-56', N'testtest1231231231', 179, CAST(N'2023-01-14' AS Date), 123123, 9, 8, 6, 15, N'', NULL, 1, CAST(N'2023-12-14T09:52:42.537' AS DateTime), NULL, CAST(N'2023-12-20T14:08:34.957' AS DateTime), 35, NULL, NULL, N'101', NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (57, N'VR2312-57', N'DECEMBER', 0, CAST(N'2023-01-14' AS Date), 1, 33, 8, 3, NULL, NULL, NULL, 1, CAST(N'2023-12-14T10:36:51.767' AS DateTime), 1, CAST(N'2023-12-14T19:09:13.513' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (58, N'VR2312-58', N'ref', 179, CAST(N'2023-12-14' AS Date), 2, 22, 8, 1, 37, NULL, NULL, 1, CAST(N'2023-12-14T19:15:30.740' AS DateTime), NULL, CAST(N'2023-12-18T14:59:34.070' AS DateTime), NULL, NULL, NULL, N'1', NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (59, N'VR2312-59', N'1', 179, CAST(N'2023-12-14' AS Date), NULL, 9, 8, 3, 3, NULL, NULL, 1, CAST(N'2023-12-14T19:38:43.500' AS DateTime), 1, CAST(N'2023-12-18T20:34:11.287' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (60, N'VR2312-60', N'1', 179, CAST(N'2023-01-14' AS Date), 1, 9, 8, 7, 3, N'now reject', NULL, 1, CAST(N'2023-12-14T19:43:04.013' AS DateTime), NULL, CAST(N'2023-12-18T18:20:10.690' AS DateTime), 46, NULL, NULL, N'as', NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (61, N'VR2312-61', N'new', 179, CAST(N'2023-12-15' AS Date), 1, 9, 16, 1, 58, N'New', NULL, 1, CAST(N'2023-12-15T14:56:40.873' AS DateTime), NULL, CAST(N'2023-12-18T11:45:08.457' AS DateTime), 35, NULL, NULL, N'18th Dec', NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (62, N'VR2312-62', N'#TajMahalValuation', 192, CAST(N'2023-01-15' AS Date), 5, 9, 27, 3, 58, N'19th dec', NULL, 1, CAST(N'2023-12-15T18:35:13.603' AS DateTime), 1, CAST(N'2023-12-19T14:08:32.357' AS DateTime), 46, NULL, NULL, N'18th Dec', NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (63, N'VR2312-63', N'1', 0, CAST(N'2023-12-18' AS Date), NULL, 2, 16, 7, 58, N'', NULL, 1, CAST(N'2023-12-18T16:21:45.833' AS DateTime), NULL, CAST(N'2023-12-19T10:04:57.503' AS DateTime), 46, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (64, N'VR2312-64', N'2', 0, CAST(N'2023-01-18' AS Date), NULL, 2, 8, 3, 58, NULL, NULL, 1, CAST(N'2023-12-18T16:23:35.213' AS DateTime), 1, CAST(N'2023-12-27T10:05:31.237' AS DateTime), 35, NULL, NULL, N'1', NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (65, N'VR2312-65', N'1', 179, CAST(N'2023-01-19' AS Date), NULL, 36, 24, 7, NULL, NULL, NULL, 1, CAST(N'2023-12-19T12:18:40.703' AS DateTime), 1, CAST(N'2023-12-20T10:54:23.707' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (66, N'VR2312-66', NULL, 0, CAST(N'2023-01-19' AS Date), NULL, 26, 18, 11, NULL, NULL, NULL, 1, CAST(N'2023-12-19T16:10:33.277' AS DateTime), 1, CAST(N'2023-12-21T18:23:15.467' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (67, N'VR2312-67', NULL, 0, CAST(N'2023-01-19' AS Date), NULL, 28, 8, 3, 58, NULL, NULL, 1, CAST(N'2023-12-19T16:35:54.877' AS DateTime), 1, CAST(N'2023-12-27T11:34:01.337' AS DateTime), 35, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (68, N'VR2312-68', N'Ref001', 0, CAST(N'2023-01-21' AS Date), NULL, 2, 25, 3, 3, NULL, NULL, 1, CAST(N'2023-12-21T15:18:58.283' AS DateTime), 1, CAST(N'2023-12-26T21:09:31.310' AS DateTime), NULL, NULL, NULL, N'chnage', NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (69, N'VR2312-69', NULL, 179, CAST(N'2023-01-21' AS Date), NULL, 9, 8, 11, NULL, N'675657', NULL, 1, CAST(N'2023-12-21T19:49:23.257' AS DateTime), 1, CAST(N'2023-12-29T16:48:01.413' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (70, N'VR2312-70', NULL, 179, CAST(N'2023-01-22' AS Date), NULL, 2, 8, 3, 17, NULL, NULL, 1, CAST(N'2023-12-22T13:04:05.400' AS DateTime), 1, CAST(N'2023-12-27T20:57:26.693' AS DateTime), 35, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (71, N'VR231271', N'12', 0, CAST(N'2023-01-27' AS Date), NULL, 2, 25, 2, 3, NULL, NULL, 1, CAST(N'2023-12-27T17:46:44.193' AS DateTime), 1, CAST(N'2023-12-28T10:29:32.600' AS DateTime), 35, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (72, N'VR231272', N'ApproveDeva', 0, CAST(N'2023-01-27' AS Date), NULL, 9, 8, 3, 3, N'gf-new', NULL, 1, CAST(N'2023-12-27T19:37:08.487' AS DateTime), 1, CAST(N'2023-12-28T12:54:28.703' AS DateTime), 35, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (73, N'VR231273', NULL, 0, CAST(N'2023-12-28' AS Date), NULL, 9, 8, 3, NULL, NULL, NULL, 1, CAST(N'2023-12-28T12:54:07.603' AS DateTime), 1, CAST(N'2023-12-28T13:04:01.013' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (74, N'VR231274', NULL, 0, CAST(N'2023-01-28' AS Date), NULL, 9, 8, 3, NULL, NULL, NULL, 1, CAST(N'2023-12-28T13:10:47.893' AS DateTime), 1, CAST(N'2023-12-28T14:17:26.030' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (75, N'VR231275', N'J12J129', 0, CAST(N'2023-12-28' AS Date), NULL, 9, 8, 3, NULL, NULL, NULL, 1, CAST(N'2023-12-28T13:44:52.853' AS DateTime), 1, CAST(N'2023-12-28T14:01:57.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (76, N'VR231276', N'ORG001', 0, CAST(N'2024-01-02' AS Date), NULL, 9, 8, 3, 3, NULL, NULL, 1, CAST(N'2023-12-28T14:05:06.530' AS DateTime), 1, CAST(N'2024-01-03T16:50:40.800' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (77, N'VR231277', NULL, 0, CAST(N'2023-12-28' AS Date), NULL, 2, 8, 3, 3, NULL, NULL, 1, CAST(N'2023-12-28T14:10:47.687' AS DateTime), 1, CAST(N'2023-12-28T14:23:52.853' AS DateTime), 35, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (78, N'VR231278', NULL, 0, CAST(N'2023-01-28' AS Date), NULL, 9, 8, 2, 3, NULL, NULL, 1, CAST(N'2023-12-28T14:25:27.220' AS DateTime), 1, CAST(N'2023-12-28T14:52:15.737' AS DateTime), 35, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (79, N'VR231279', NULL, 0, CAST(N'2023-12-28' AS Date), NULL, 2, 8, 6, 3, N'final', NULL, 1, CAST(N'2023-12-28T14:31:52.283' AS DateTime), 3, CAST(N'2023-12-28T14:36:56.840' AS DateTime), 35, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (80, N'VR231280', NULL, 0, CAST(N'2023-12-28' AS Date), NULL, 2, 8, 1, 3, NULL, NULL, 1, CAST(N'2023-12-28T15:19:18.747' AS DateTime), NULL, CAST(N'2024-01-02T16:03:20.750' AS DateTime), NULL, NULL, NULL, N'now', NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (81, N'VR231281', NULL, 0, CAST(N'2023-01-28' AS Date), NULL, 16, 8, 1, 3, NULL, NULL, 1, CAST(N'2023-12-28T15:25:32.937' AS DateTime), 1, CAST(N'2023-12-28T15:26:23.253' AS DateTime), 35, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (82, N'VR231282', N'J12J129', 0, CAST(N'2023-01-28' AS Date), NULL, 9, 8, 4, 3, NULL, NULL, 1, CAST(N'2023-12-28T15:35:04.197' AS DateTime), NULL, CAST(N'2024-01-03T11:07:14.340' AS DateTime), NULL, NULL, NULL, N'Changing', NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (83, N'VR231283', NULL, 0, CAST(N'2023-01-28' AS Date), NULL, 2, 8, 2, 3, NULL, NULL, 1, CAST(N'2023-12-28T15:47:01.187' AS DateTime), NULL, CAST(N'2024-01-02T16:04:12.363' AS DateTime), NULL, NULL, NULL, N'now', NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (84, N'VR231284', NULL, 0, CAST(N'2023-01-28' AS Date), NULL, 9, 8, 3, 69, N'lasrt aprove', NULL, 1, CAST(N'2023-12-28T15:49:33.517' AS DateTime), 1, CAST(N'2024-01-02T16:30:04.613' AS DateTime), 35, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (85, N'VR231285', NULL, 179, CAST(N'2023-01-28' AS Date), NULL, 9, 18, 3, 58, NULL, NULL, 1, CAST(N'2023-12-28T16:13:26.853' AS DateTime), 1, CAST(N'2024-01-02T15:19:08.860' AS DateTime), 35, NULL, NULL, N'1', NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (86, N'VR231286', NULL, 0, CAST(N'2023-01-29' AS Date), NULL, 11, 24, 3, 3, NULL, NULL, 1, CAST(N'2023-12-29T14:46:05.533' AS DateTime), 1, CAST(N'2023-12-29T16:03:39.920' AS DateTime), 35, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (87, N'VR231287', NULL, 0, CAST(N'2023-01-29' AS Date), NULL, 2, 24, 6, 17, N'chk12', NULL, 1, CAST(N'2023-12-29T15:33:48.993' AS DateTime), 17, CAST(N'2024-01-03T19:00:19.857' AS DateTime), 46, NULL, NULL, N'77', NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (88, N'VR231288', N'1232', 179, CAST(N'2024-01-29' AS Date), 121, 11, 25, 3, 68, N'saved now1', NULL, 1, CAST(N'2023-12-29T17:08:55.153' AS DateTime), 1, CAST(N'2024-01-02T17:08:22.393' AS DateTime), 35, NULL, NULL, N'now', NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (89, N'VR24010389', N'1232', 179, CAST(N'2024-01-29' AS Date), 121, 11, 25, 3, 68, N'saved now1', NULL, 1, CAST(N'2024-01-03T11:01:40.257' AS DateTime), 35, CAST(N'2024-01-04T11:17:29.040' AS DateTime), 35, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (90, N'VR24010390', N'REF', 0, CAST(N'2024-01-02' AS Date), 12, 11, 27, 3, NULL, NULL, NULL, 1, CAST(N'2024-01-03T15:50:44.923' AS DateTime), 1, CAST(N'2024-01-03T15:51:29.700' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (91, N'VR24010391', NULL, 0, CAST(N'2024-01-03' AS Date), 120, 9, 8, 3, 3, NULL, NULL, 1, CAST(N'2024-01-03T16:40:28.387' AS DateTime), 1, CAST(N'2024-01-04T15:38:57.070' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (92, N'VR24010392', NULL, 0, CAST(N'2024-01-03' AS Date), 120, 9, 8, 3, 3, NULL, NULL, 1, CAST(N'2024-01-03T16:41:35.820' AS DateTime), 1, CAST(N'2024-01-03T16:41:35.820' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (93, N'VR24010393', NULL, 0, CAST(N'2024-01-03' AS Date), 120, 9, 8, 3, 3, NULL, NULL, 1, CAST(N'2024-01-03T16:43:19.660' AS DateTime), 1, CAST(N'2024-01-03T20:47:38.320' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ValuationRequest] ([Id], [ReferenceNO], [OtherReferenceNO], [ValuationModeId], [ValuationDate], [ValuationTimeFrame], [ClientId], [PropertyId], [StatusId], [ApproverId], [ApproverComment], [ApproverUpdateDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ValuerId], [ValuerComment], [ValuerUpdateDate], [AssignRemark], [IsDeleted]) VALUES (94, N'VR24010494', N'RefDemo0104', 179, CAST(N'2024-01-04' AS Date), 90, 51, 25, 1, NULL, NULL, NULL, 1, CAST(N'2024-01-04T16:23:00.607' AS DateTime), 1, CAST(N'2024-01-04T16:23:00.607' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ValuationRequest] OFF
GO
SET IDENTITY_INSERT [dbo].[Master_Dictionary] ON 
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (2, N'Department', 1, 0, 1, CAST(N'2023-10-19T00:03:45.423' AS DateTime), CAST(N'2023-10-20T00:03:45.423' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (3, N'ValuationType', 1, 1, NULL, NULL, CAST(N'2023-11-01T14:33:19.530' AS DateTime), NULL, N'ValuationFeeType', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (5, N'Valuation Method', 1, 1, NULL, NULL, CAST(N'2023-11-04T12:53:35.227' AS DateTime), NULL, N'ValuationMethod', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (6, N'Omega data', NULL, 1, NULL, CAST(N'2023-11-01T14:41:22.557' AS DateTime), CAST(N'2023-11-01T18:18:56.520' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (7, N'Currency', NULL, 1, NULL, NULL, CAST(N'2023-11-02T11:06:13.110' AS DateTime), NULL, N'CURRENCY', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (8, N'Test1', NULL, 1, NULL, CAST(N'2023-11-04T21:20:14.153' AS DateTime), CAST(N'2023-11-04T21:20:14.153' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (9, N'Test2', NULL, 0, 1, CAST(N'2023-11-04T22:15:07.850' AS DateTime), CAST(N'2023-11-04T22:15:07.850' AS DateTime), 1, N'TEST2', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (10, N'Abhi test', NULL, 1, 1, CAST(N'2023-11-10T21:14:51.123' AS DateTime), CAST(N'2023-11-10T21:14:51.123' AS DateTime), 1, N'ABHI_TEST', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (11, N'string', NULL, 1, 0, CAST(N'2023-11-13T18:22:45.537' AS DateTime), CAST(N'2023-11-13T18:22:45.537' AS DateTime), 0, N'STRING', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (12, N'testDictionary', NULL, 1, 1, CAST(N'2023-11-15T16:28:51.160' AS DateTime), CAST(N'2023-11-15T16:28:51.160' AS DateTime), 1, N'TESTDICTIONARY', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (13, N'dictionary test', NULL, 1, 1, CAST(N'2023-11-15T16:42:39.050' AS DateTime), CAST(N'2023-11-15T16:42:39.050' AS DateTime), 1, N'DICTIONARY_TEST', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (14, N'1', NULL, 1, 1, CAST(N'2023-11-16T23:26:57.970' AS DateTime), CAST(N'2023-11-24T12:41:29.720' AS DateTime), 1, N'', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (15, N'', NULL, 1, 1, CAST(N'2023-11-16T23:27:10.967' AS DateTime), CAST(N'2023-11-16T23:27:10.967' AS DateTime), 1, N'', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (16, N'Market Value', 1, 1, 1, CAST(N'2023-11-16T23:27:10.967' AS DateTime), NULL, 1, N'MarketValue', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (17, N'Market Rent', 1, 1, 1, CAST(N'2023-11-15T16:42:39.910' AS DateTime), NULL, NULL, N'MarketRent', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (18, N'Life of Building', 1, 1, 1, CAST(N'2023-11-15T16:42:39.910' AS DateTime), NULL, NULL, N'LifeofBuilding', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (19, N'Annual Maintainance Cost', 1, 1, 1, CAST(N'2023-11-15T16:42:39.910' AS DateTime), NULL, NULL, N'AnnualMaintainanceCost', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (20, N'test', NULL, 1, 1, CAST(N'2023-11-20T11:08:25.803' AS DateTime), CAST(N'2023-11-24T13:29:59.177' AS DateTime), 1, N'', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (21, N'', NULL, 0, 1, CAST(N'2023-11-20T11:35:23.377' AS DateTime), CAST(N'2023-11-20T11:35:23.377' AS DateTime), 1, N'', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (22, N'UnitType', NULL, 1, 1, CAST(N'2023-11-20T12:21:55.490' AS DateTime), CAST(N'2023-12-26T10:58:54.813' AS DateTime), 1, N'TESTTDESC', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (23, N'Test1', NULL, 1, 0, CAST(N'2023-11-20T13:27:20.523' AS DateTime), CAST(N'2023-11-27T15:02:26.470' AS DateTime), 1, N'TEST1', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (24, N'11', NULL, 1, 1, CAST(N'2023-11-24T12:42:27.840' AS DateTime), CAST(N'2023-11-24T12:42:27.840' AS DateTime), 1, N'11', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (28, N'jdjj1', NULL, 1, 1, CAST(N'2023-11-24T13:04:36.743' AS DateTime), CAST(N'2023-11-24T13:04:36.743' AS DateTime), 1, N'JDJJ1', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (29, N'test1', NULL, 0, 1, CAST(N'2023-11-24T13:30:43.827' AS DateTime), CAST(N'2023-11-24T13:31:00.647' AS DateTime), 1, N'TEST1', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (30, N'check auditnewdfweaudit', NULL, 1, 1, CAST(N'2023-11-24T13:31:24.557' AS DateTime), CAST(N'2023-12-14T13:03:28.203' AS DateTime), 1, N'TES1', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (31, N'1111', NULL, 0, 1, CAST(N'2023-11-24T14:31:15.527' AS DateTime), CAST(N'2023-11-24T14:31:15.527' AS DateTime), 1, N'1111', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (32, N'qwerty', NULL, 0, 1, CAST(N'2023-11-24T14:31:37.630' AS DateTime), CAST(N'2023-11-24T14:31:37.630' AS DateTime), 1, N'QWERTY', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (33, N'qwerty1', NULL, 0, 1, CAST(N'2023-11-24T14:32:35.953' AS DateTime), CAST(N'2023-11-24T14:32:35.953' AS DateTime), 1, N'QWERTY1', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (34, N'mnb', NULL, 0, 1, CAST(N'2023-11-24T14:34:29.850' AS DateTime), CAST(N'2023-11-24T14:34:29.850' AS DateTime), 1, N'MNB', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (35, N'zxc', NULL, 0, 1, CAST(N'2023-11-24T14:36:08.517' AS DateTime), CAST(N'2023-11-24T14:36:08.517' AS DateTime), 1, N'ZXC', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (36, N'nbv', NULL, 0, 1, CAST(N'2023-11-24T14:43:16.727' AS DateTime), CAST(N'2023-11-24T14:43:16.727' AS DateTime), 1, N'NBV', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (37, N'hn', NULL, 0, 1, CAST(N'2023-11-24T15:05:00.577' AS DateTime), CAST(N'2023-11-24T15:05:00.577' AS DateTime), 1, N'HN', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (38, N'tttr5e55', NULL, 0, 1, CAST(N'2023-11-24T15:11:28.430' AS DateTime), CAST(N'2023-11-24T15:11:28.430' AS DateTime), 1, N'TTTR5E55', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (39, N'1qaz', NULL, 0, 1, CAST(N'2023-11-24T15:45:55.003' AS DateTime), CAST(N'2023-11-24T15:45:55.003' AS DateTime), 1, N'1QAZ', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (40, N'm', NULL, 1, 1, CAST(N'2023-11-24T15:58:57.113' AS DateTime), CAST(N'2023-11-24T15:58:57.113' AS DateTime), 1, N'M', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (41, N'ree', NULL, 0, 1, CAST(N'2023-11-27T14:42:49.170' AS DateTime), CAST(N'2023-11-27T14:42:49.170' AS DateTime), 1, N'REE', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (45, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', NULL, 0, 1, CAST(N'2023-11-27T17:57:05.027' AS DateTime), CAST(N'2023-11-27T17:57:05.027' AS DateTime), 1, N'LOREM_IPSUM_DOLOR_SIT_AMET,_CONSECTETUR_ADIPISCING_ELIT.', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (46, N'Transaction Mode', NULL, 0, 1, CAST(N'2023-11-30T12:17:22.757' AS DateTime), CAST(N'2023-12-27T16:07:31.780' AS DateTime), 1, N'TRANSACTION_MODE', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (47, N'Transaction Status', NULL, 1, 1, CAST(N'2023-11-30T12:17:55.307' AS DateTime), CAST(N'2023-11-30T12:17:55.307' AS DateTime), 1, N'TRANSACTION_STATUS', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (48, N'vish', NULL, 1, 1, CAST(N'2023-12-13T20:38:41.150' AS DateTime), CAST(N'2023-12-13T20:38:41.150' AS DateTime), 1, N'VISH', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (49, N'we', NULL, 0, 1, CAST(N'2023-12-13T20:39:45.693' AS DateTime), CAST(N'2023-12-13T20:39:45.693' AS DateTime), 1, N'WE', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (50, N'tert', NULL, 0, 1, CAST(N'2023-12-13T20:41:08.387' AS DateTime), CAST(N'2023-12-13T20:41:08.387' AS DateTime), 1, N'TERT', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (51, N'cxc', NULL, 0, 1, CAST(N'2023-12-13T20:45:46.823' AS DateTime), CAST(N'2023-12-13T20:45:46.823' AS DateTime), 1, N'CXC', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (52, N'qwerty12', NULL, 0, 1, CAST(N'2023-12-14T18:12:06.437' AS DateTime), CAST(N'2023-12-14T18:12:06.437' AS DateTime), 1, N'QWERTY12', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (53, N'Approver Level', NULL, 1, 1, CAST(N'2023-12-26T11:05:52.743' AS DateTime), CAST(N'2023-12-27T17:38:46.840' AS DateTime), 1, N'APPROVER_LEVEL', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (54, N'qup', NULL, 1, 1, CAST(N'2023-12-28T12:53:23.997' AS DateTime), CAST(N'2023-12-28T15:47:59.393' AS DateTime), 1, N'Q', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (55, N'testopopopop', NULL, 1, 1, CAST(N'2024-01-02T13:06:05.727' AS DateTime), CAST(N'2024-01-02T13:06:26.420' AS DateTime), 1, N'TESTOPOPOPOP', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (56, N'12*', NULL, 1, 1, CAST(N'2024-01-02T13:48:48.070' AS DateTime), CAST(N'2024-01-02T13:48:48.070' AS DateTime), 1, N'12*', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (57, N'f', NULL, 0, 1, CAST(N'2024-01-02T15:11:23.297' AS DateTime), CAST(N'2024-01-02T15:11:45.833' AS DateTime), 1, N'F', NULL)
GO
INSERT [dbo].[Master_Dictionary] ([Id], [Description], [Sort], [IsActive], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [DictionaryCode], [IsDeleted]) VALUES (58, N'qa', NULL, 0, 1, CAST(N'2024-01-03T09:28:02.760' AS DateTime), CAST(N'2024-01-03T09:36:46.697' AS DateTime), 1, N'QA', NULL)
GO
SET IDENTITY_INSERT [dbo].[Master_Dictionary] OFF
GO
SET IDENTITY_INSERT [dbo].[Master_City] ON 
GO
INSERT [dbo].[Master_City] ([Id], [CountryId], [StateId], [CityName], [STDCode], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 1, 1, N'Agra1', N'string', 1, CAST(N'2023-09-27T12:46:46.340' AS DateTime), 1, CAST(N'2023-11-13T17:57:37.000' AS DateTime), 0)
GO
INSERT [dbo].[Master_City] ([Id], [CountryId], [StateId], [CityName], [STDCode], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 2, 2, N'Riyadh', NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Master_City] ([Id], [CountryId], [StateId], [CityName], [STDCode], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 2, 2, N'Mecca', NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Master_City] ([Id], [CountryId], [StateId], [CityName], [STDCode], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, 3, 3, N'Abu Dhabi', NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Master_City] ([Id], [CountryId], [StateId], [CityName], [STDCode], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, 3, 3, N'Ajman', NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Master_City] ([Id], [CountryId], [StateId], [CityName], [STDCode], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 3, 3, N'Dubai', NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Master_City] ([Id], [CountryId], [StateId], [CityName], [STDCode], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, 3, 3, N'Fujairah', NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Master_City] ([Id], [CountryId], [StateId], [CityName], [STDCode], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, 3, 3, N'Ras Al Khaimah', NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Master_City] ([Id], [CountryId], [StateId], [CityName], [STDCode], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, 3, 3, N'Sharjah', NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Master_City] ([Id], [CountryId], [StateId], [CityName], [STDCode], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (10, 3, 3, N'Umm Al Quwain', NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Master_City] ([Id], [CountryId], [StateId], [CityName], [STDCode], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (12, 1, 1, N'UI Entry', NULL, 1, CAST(N'2023-11-11T17:25:24.307' AS DateTime), 0, CAST(N'2023-11-11T17:25:24.307' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[Master_City] OFF
GO
SET IDENTITY_INSERT [dbo].[Master_Country] ON 
GO
INSERT [dbo].[Master_Country] ([Id], [CountryName], [CountryCode], [ISDCountryCode], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'India', N'IND', N'+91', 1, CAST(N'2023-09-27T12:46:46.340' AS DateTime), 1, CAST(N'2023-09-27T12:46:46.340' AS DateTime), 1)
GO
INSERT [dbo].[Master_Country] ([Id], [CountryName], [CountryCode], [ISDCountryCode], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'Saudi Arabia', N'KSA', N'+966', 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Master_Country] ([Id], [CountryName], [CountryCode], [ISDCountryCode], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'United Arab Emirates', N'UAE', N'+971', 1, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Master_Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Master_State] ON 
GO
INSERT [dbo].[Master_State] ([Id], [CountryId], [StateName], [StateCode], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 1, N'Uttar Pradesh', N'UP', 1, CAST(N'2023-09-27T12:46:46.340' AS DateTime), 1, CAST(N'2023-09-27T12:46:46.340' AS DateTime), 1)
GO
INSERT [dbo].[Master_State] ([Id], [CountryId], [StateName], [StateCode], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 2, N'Saudi Arabia', N'KSA', 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Master_State] ([Id], [CountryId], [StateName], [StateCode], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 3, N'United Arab Emirates', N'UAE', 1, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Master_State] OFF
GO
SET IDENTITY_INSERT [dbo].[Master_Location] ON 
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (13, NULL, 3, 3, 4, N'IT sector001', 0, N'100001', N'33.4422', CAST(N'2023-10-17T12:03:48.570' AS DateTime), NULL, CAST(N'2023-11-24T10:39:26.873' AS DateTime), 1, 188, 189, 1, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (14, NULL, 2, 2, 2, N'Manufacturing223', 0, N'59.44', N'78.33', CAST(N'2023-10-17T16:26:10.110' AS DateTime), NULL, CAST(N'2023-11-22T19:18:58.640' AS DateTime), 1, 190, 188, 1, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (20, NULL, 1, 1, 1, N'IT sector1', 0, N'11.2222', N'33.4422', CAST(N'2023-10-23T22:35:47.960' AS DateTime), NULL, CAST(N'2023-11-24T10:40:44.087' AS DateTime), 1, 187, 187, 0, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (21, NULL, 1, 1, 1, N'IT sector1', 0, N'11.2222', N'33.4422', CAST(N'2023-10-23T22:36:10.297' AS DateTime), NULL, CAST(N'2023-11-24T10:40:59.523' AS DateTime), 1, 191, 191, 0, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (22, NULL, 1, 1, 1, N'IT sector222', 0, N'11.000', N'33.000', CAST(N'2023-10-23T22:41:36.977' AS DateTime), NULL, CAST(N'2023-11-24T10:41:35.383' AS DateTime), 1, 189, 189, 0, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (24, NULL, 1, 1, 1, N'IT sector112', 0, N'11.22222', N'33.44222', CAST(N'2023-10-26T09:27:22.963' AS DateTime), NULL, CAST(N'2023-11-24T10:41:51.843' AS DateTime), 1, 190, 190, 0, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (25, N'America', 1, 1, 1, N'IT sector1', 1, N'11.2222', N'33.4422', CAST(N'2023-10-26T09:27:22.963' AS DateTime), NULL, CAST(N'2023-10-26T14:15:44.927' AS DateTime), NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (26, N'New Delhi', 1, 1, 1, N'Real Estate77', 1, N'456.11', N'232.11', CAST(N'2023-10-26T10:45:55.027' AS DateTime), NULL, CAST(N'2023-10-26T18:27:26.870' AS DateTime), NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (27, N'New Delhi', 1, 1, 1, N'Real Estate0000', 1, N'456.00', N'232.00', CAST(N'2023-10-26T10:45:55.027' AS DateTime), NULL, CAST(N'2023-10-26T10:45:55.027' AS DateTime), NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (28, N'Agra11', 1, 1, 1, N'Real Estate', 1, N'45', N'23', CAST(N'2023-10-26T10:45:55.027' AS DateTime), NULL, CAST(N'2023-10-26T10:45:55.027' AS DateTime), NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (29, N'New Delhi', 1, 1, 1, N'Real Estate6699', 1, N'456.66', N'232.66', CAST(N'2023-10-26T10:45:55.027' AS DateTime), NULL, CAST(N'2023-10-26T10:45:55.027' AS DateTime), NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (30, N'America', 1, 1, 1, N'IT sector18', 1, N'11.88', N'33.88', CAST(N'2023-10-26T10:45:55.027' AS DateTime), NULL, CAST(N'2023-10-26T10:45:55.027' AS DateTime), NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (31, N'America22', 1, 1, 1, N'IT sector99', 1, N'11.99', N'33.99', CAST(N'2023-10-26T11:28:09.483' AS DateTime), NULL, CAST(N'2023-10-26T11:28:09.483' AS DateTime), NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (32, N'America', 1, 1, 1, N'IT sector18', 1, N'11.00', N'33.00', CAST(N'2023-10-26T11:28:09.483' AS DateTime), NULL, CAST(N'2023-10-26T14:53:49.510' AS DateTime), NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (33, N'America22', 1, 1, 1, N'IT sector111', 1, N'11.111', N'33.111', CAST(N'2023-10-26T11:38:05.957' AS DateTime), NULL, CAST(N'2023-10-26T11:38:05.957' AS DateTime), NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (34, N'America22', 2, 2, 3, N'IT sector112', 1, N'11.22222', N'33.44222', CAST(N'2023-10-26T11:41:30.570' AS DateTime), NULL, CAST(N'2023-12-28T15:57:54.193' AS DateTime), 1, 1, 1, 0, 1)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (35, N'Chennai TN', 1, 1, 1, N'Softwaree', 0, N'44.4444', N'55.5555', CAST(N'2023-10-26T19:41:56.580' AS DateTime), NULL, CAST(N'2023-10-26T19:41:56.580' AS DateTime), NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (40, NULL, 1, 1, 1, N'tesr', 0, N'3434', N'34343', CAST(N'2023-11-21T21:53:51.837' AS DateTime), 1, CAST(N'2023-11-21T21:53:51.837' AS DateTime), 1, 187, 188, 1, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (41, NULL, 1, 1, 1, N'test', 0, NULL, NULL, CAST(N'2023-11-22T11:50:24.700' AS DateTime), 1, CAST(N'2023-11-22T11:50:24.700' AS DateTime), 1, 187, 189, 1, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (43, NULL, 1, 1, 1, N'1', 0, N'h', NULL, CAST(N'2023-11-22T17:56:59.897' AS DateTime), 1, CAST(N'2023-11-22T17:56:59.897' AS DateTime), 1, 187, 187, 1, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (45, NULL, 3, 3, 7, N'n', 0, N'n', N'n', CAST(N'2023-11-24T10:02:13.290' AS DateTime), 1, CAST(N'2023-12-13T17:19:58.540' AS DateTime), 1, 190, 187, 1, 1)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (46, NULL, 3, 3, 10, N'1', 0, N'1', N'1', CAST(N'2023-11-24T10:14:13.930' AS DateTime), 1, CAST(N'2023-11-24T10:14:13.930' AS DateTime), 1, 190, 190, 1, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (47, NULL, 1, 1, 1, N'd', 0, N'd', N'd', CAST(N'2023-11-24T10:55:21.820' AS DateTime), 1, CAST(N'2023-11-24T10:55:21.820' AS DateTime), 1, 187, 187, 1, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (49, NULL, 1, 1, 1, N'1', 0, N'102.5', N'102.3', CAST(N'2023-11-24T11:12:24.760' AS DateTime), 1, CAST(N'2023-11-24T11:12:24.760' AS DateTime), 1, 187, 187, 1, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (51, NULL, 1, 1, 1, N'nn', 0, N'nn', N'n', CAST(N'2023-11-24T12:39:41.820' AS DateTime), 1, CAST(N'2023-11-24T12:39:41.820' AS DateTime), 1, 187, 188, 0, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (52, NULL, 1, 1, 1, N'23', 0, N'22222', N'2222222', CAST(N'2023-11-27T00:27:27.940' AS DateTime), 1, CAST(N'2023-11-27T00:27:27.940' AS DateTime), 1, 188, 188, 0, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (54, NULL, 1, 1, 1, N'kkkk', 0, NULL, NULL, CAST(N'2023-11-27T17:14:24.767' AS DateTime), 1, CAST(N'2023-12-13T17:18:08.263' AS DateTime), 1, 187, 188, 0, 1)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (60, NULL, 1, 1, 1, N'Frobnicate blizzle trundle sprocket quux baznoid wobble flibbertigibbet zonko ziggura t crumbly gadgetry perplexity gobbledygook pseudopseudohypoparathyroidism wunderkind flibbertigibbet quark snorkel dinglehopper troglodyte befuddle rambunctious', 0, N'Frobnicate blizzle trundle sprocket quux baznoid wobble flibbertigibbet zonko ziggura t crumbly gadgetry perplexity gobbledygook pseudopseudohypoparathyroidism wunderkind flibbertigibbet quark snorkel dinglehopper troglodyte befuddle rambunctious', N'Frobnicate blizzle trundle sprocket quux baznoid wobble flibbertigibbet zonko ziggura t crumbly gadgetry perplexity gobbledygook pseudopseudohypoparathyroidism wunderkind flibbertigibbet quark snorkel dinglehopper troglodyte befuddle rambunctious', CAST(N'2023-11-27T17:58:34.293' AS DateTime), 1, CAST(N'2023-11-27T17:58:34.293' AS DateTime), 1, 187, 187, 0, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (61, NULL, 1, 1, 12, N'Frobnicate blizzle trundle sprocket quux baznoid wobble flibbertigibbet zonko ziggurat crumbly gadgetry perplexity gobbledygook pseudopseudohypoparathyroidism wunderkind flibbertigibbet quark snorkel dinglehopper troglodyte befuddle rambunctious widd', 0, N'Frobnicate blizzle trundle sprocket quux baznoid wobble flibbertigibbet zonko ziggurat crumbly gadgetry perplexity gobbledygook pseudopseudohypoparathyroidism wunderkind flibbertigibbet quark snorkel dinglehopper troglodyte befuddle rambunctious widd', N'Frobnicate blizzle trundle sprocket quux baznoid wobble flibbertigibbet zonko ziggurat crumbly gadgetry perplexity gobbledygook pseudopseudohypoparathyroidism wunderkind flibbertigibbet quark snorkel dinglehopper troglodyte befuddle rambunctious widd', CAST(N'2023-11-27T18:03:04.123' AS DateTime), 1, CAST(N'2023-12-20T11:54:13.150' AS DateTime), 1, 187, 187, 1, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (62, NULL, 1, 1, 1, N'sahsgaudit', 0, NULL, NULL, CAST(N'2023-11-27T18:04:48.663' AS DateTime), 1, CAST(N'2023-12-13T14:49:10.757' AS DateTime), 1, 187, 188, 1, 1)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (63, NULL, 1, 1, 1, N'Sector 21', 0, N'22.327861', N'38.787211', CAST(N'2023-12-20T11:55:15.730' AS DateTime), 1, CAST(N'2023-12-20T12:16:15.500' AS DateTime), 1, 188, 187, 1, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (64, NULL, 3, 3, 6, N'Sector 18', 0, N'823.768792', N'77.7668787', CAST(N'2023-12-20T12:20:04.997' AS DateTime), 1, CAST(N'2023-12-20T12:20:04.997' AS DateTime), 1, 187, 188, 1, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (65, NULL, 1, 1, 12, N'secot1', 0, NULL, NULL, CAST(N'2023-12-21T17:51:11.060' AS DateTime), 1, CAST(N'2023-12-28T16:07:18.997' AS DateTime), 1, 187, 188, 0, 1)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (66, NULL, 1, 1, 1, N'SSecor 10', 0, NULL, NULL, CAST(N'2023-12-21T20:06:23.347' AS DateTime), 1, CAST(N'2023-12-21T20:06:23.347' AS DateTime), 1, 187, 187, 0, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (67, NULL, 1, 1, 1, N'1', 0, NULL, N'long123', CAST(N'2023-12-22T12:26:51.753' AS DateTime), 1, CAST(N'2023-12-22T13:47:55.767' AS DateTime), 1, 187, 187, 0, 1)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (68, NULL, 1, 1, 1, N'1', 0, N'124', N'12343', CAST(N'2023-12-22T12:34:15.317' AS DateTime), 1, CAST(N'2023-12-22T14:00:08.970' AS DateTime), 1, 187, 187, 1, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (69, NULL, 3, 3, 7, N'Ac', 0, NULL, NULL, CAST(N'2023-12-22T13:37:06.283' AS DateTime), 1, CAST(N'2023-12-22T13:37:33.307' AS DateTime), 1, 187, 190, 1, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (70, NULL, 1, 1, 12, N'S', 0, N'S', N'S', CAST(N'2023-12-22T13:42:19.160' AS DateTime), 1, CAST(N'2023-12-22T13:59:59.500' AS DateTime), 1, 187, 187, 1, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (71, NULL, 1, 1, 1, N'A', 0, NULL, N'BBBBBBBBBBBBBBBBBBB', CAST(N'2023-12-22T14:08:15.577' AS DateTime), 1, CAST(N'2023-12-22T15:21:49.893' AS DateTime), 1, 187, 187, 0, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (72, NULL, 1, 1, 1, N'd', 0, NULL, NULL, CAST(N'2023-12-22T17:43:36.720' AS DateTime), 1, CAST(N'2023-12-22T17:43:36.720' AS DateTime), 1, 187, 189, 0, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (73, NULL, 1, 1, 1, N'f', 0, NULL, NULL, CAST(N'2023-12-27T17:23:10.957' AS DateTime), 1, CAST(N'2023-12-27T17:23:22.173' AS DateTime), 1, 187, 187, 0, 1)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (74, NULL, 1, 1, 1, N'fe', 0, N'12121', N're', CAST(N'2023-12-27T17:23:38.603' AS DateTime), 1, CAST(N'2023-12-27T17:25:02.190' AS DateTime), 1, 187, 187, 1, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (75, NULL, 1, 1, 1, N'1', 0, NULL, NULL, CAST(N'2023-12-28T12:53:58.797' AS DateTime), 1, CAST(N'2023-12-28T16:04:48.537' AS DateTime), 1, 187, 187, 0, 1)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (76, NULL, 1, 1, 1, N'1@1d', 0, N'12@12', N'12@32', CAST(N'2024-01-02T17:05:17.157' AS DateTime), 1, CAST(N'2024-01-02T17:38:55.740' AS DateTime), 1, 187, 187, 0, 1)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (77, NULL, 3, 3, 6, N'Sector 11', 0, N'78.66567', N'23.7686787', CAST(N'2024-01-02T17:44:28.820' AS DateTime), 1, CAST(N'2024-01-02T17:44:28.820' AS DateTime), 1, 187, 188, 1, NULL)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (78, NULL, 2, 2, 2, N'1w', 0, N'1a1qq', N'1z', CAST(N'2024-01-03T09:37:12.660' AS DateTime), 1, CAST(N'2024-01-03T09:43:49.223' AS DateTime), 1, 187, 187, 0, 1)
GO
INSERT [dbo].[Master_Location] ([Id], [LocationName], [CountryId], [StateId], [CityId], [Sector], [Status], [Latitude], [Longitude], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [HomeCurrencyId], [ForeignCurrencyId], [IsActive], [IsDeleted]) VALUES (79, NULL, 1, 1, 1, N'1', 0, NULL, NULL, CAST(N'2024-01-03T10:39:31.127' AS DateTime), 1, CAST(N'2024-01-03T10:39:31.127' AS DateTime), 1, 187, 187, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Master_Location] OFF
GO
SET IDENTITY_INSERT [dbo].[Master_Amenity] ON 
GO
INSERT [dbo].[Master_Amenity] ([Id], [AmenityName], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Icon], [IsDeleted]) VALUES (1, N'Swimming pool', 1, NULL, NULL, NULL, NULL, N'swimming-pool.svg', NULL)
GO
INSERT [dbo].[Master_Amenity] ([Id], [AmenityName], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Icon], [IsDeleted]) VALUES (2, N'Laundry', 1, NULL, NULL, NULL, NULL, N'laundry.svg', NULL)
GO
INSERT [dbo].[Master_Amenity] ([Id], [AmenityName], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Icon], [IsDeleted]) VALUES (3, N'Conference room', 1, NULL, NULL, NULL, NULL, N'conference.svg', NULL)
GO
INSERT [dbo].[Master_Amenity] ([Id], [AmenityName], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Icon], [IsDeleted]) VALUES (4, N'24*7 Security', 1, NULL, NULL, NULL, NULL, N'security.svg', NULL)
GO
INSERT [dbo].[Master_Amenity] ([Id], [AmenityName], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Icon], [IsDeleted]) VALUES (5, N'Fitness/Gym', 1, NULL, NULL, NULL, NULL, N'fitness.svg', NULL)
GO
INSERT [dbo].[Master_Amenity] ([Id], [AmenityName], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Icon], [IsDeleted]) VALUES (6, N'Business centre', 1, NULL, NULL, NULL, NULL, N'bussiness.svg', NULL)
GO
INSERT [dbo].[Master_Amenity] ([Id], [AmenityName], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Icon], [IsDeleted]) VALUES (7, N'Parking/Garage', 1, NULL, NULL, NULL, NULL, N'parking.svg', NULL)
GO
INSERT [dbo].[Master_Amenity] ([Id], [AmenityName], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Icon], [IsDeleted]) VALUES (8, N'Maintainance', 1, NULL, NULL, NULL, NULL, N'maintainace.svg', NULL)
GO
INSERT [dbo].[Master_Amenity] ([Id], [AmenityName], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Icon], [IsDeleted]) VALUES (9, N'Play Ground', 1, NULL, NULL, NULL, NULL, N'playground.svg', NULL)
GO
INSERT [dbo].[Master_Amenity] ([Id], [AmenityName], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Icon], [IsDeleted]) VALUES (10, N'Pet-friendly accommodations', 1, NULL, NULL, NULL, NULL, N'pet-friendly.svg', NULL)
GO
INSERT [dbo].[Master_Amenity] ([Id], [AmenityName], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Icon], [IsDeleted]) VALUES (11, N'WiFi/Internet', 1, NULL, NULL, NULL, NULL, N'wifi.svg', NULL)
GO
INSERT [dbo].[Master_Amenity] ([Id], [AmenityName], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Icon], [IsDeleted]) VALUES (12, N'Gated Access', 0, NULL, NULL, NULL, NULL, N'swimming-pool.svg', NULL)
GO
INSERT [dbo].[Master_Amenity] ([Id], [AmenityName], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Icon], [IsDeleted]) VALUES (13, N'Wireless internet access', 0, NULL, NULL, NULL, NULL, N'swimming-pool.svg', NULL)
GO
INSERT [dbo].[Master_Amenity] ([Id], [AmenityName], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Icon], [IsDeleted]) VALUES (14, N'Access to public transportation', 0, NULL, NULL, NULL, NULL, N'swimming-pool.svg', NULL)
GO
SET IDENTITY_INSERT [dbo].[Master_Amenity] OFF
GO
SET IDENTITY_INSERT [dbo].[Master_PropertyType] ON 
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'Normal', 1, CAST(N'2023-09-29T10:20:10.383' AS DateTime), 1, CAST(N'2023-11-01T13:17:04.300' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'Yalla Property', 1, NULL, NULL, CAST(N'2023-11-03T23:42:49.197' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (3, N'Private', 1, CAST(N'2023-10-17T14:29:44.247' AS DateTime), 0, CAST(N'2023-11-03T21:42:27.977' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (4, N'land', 1, CAST(N'2023-10-17T14:41:37.563' AS DateTime), 0, CAST(N'2023-11-03T23:42:49.197' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (5, N'Bulglow', 1, CAST(N'2023-10-17T14:47:33.727' AS DateTime), 1, CAST(N'2023-11-03T13:05:35.310' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (7, N'string', 0, CAST(N'2023-10-17T14:52:08.527' AS DateTime), 0, CAST(N'2024-01-02T19:30:51.503' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (8, N'string', 1, CAST(N'2023-10-17T20:42:57.253' AS DateTime), 0, CAST(N'2023-10-17T20:43:02.843' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (9, N'dfdf', 0, CAST(N'2023-10-17T20:50:53.347' AS DateTime), 0, CAST(N'2024-01-02T19:30:43.830' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (10, N'building', 0, CAST(N'2023-10-17T20:56:28.517' AS DateTime), 0, CAST(N'2023-12-15T18:46:30.160' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (11, N'now', 0, CAST(N'2023-10-18T11:50:43.230' AS DateTime), 0, CAST(N'2023-10-18T11:50:45.710' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (12, N'string', 0, CAST(N'2023-10-18T18:53:34.913' AS DateTime), 0, CAST(N'2023-10-18T18:53:36.980' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (14, N'New P3', 0, CAST(N'2023-10-25T20:22:42.880' AS DateTime), NULL, CAST(N'2023-12-15T18:45:13.963' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (15, N'P5', 0, CAST(N'2023-10-25T20:24:20.130' AS DateTime), NULL, CAST(N'2024-01-02T12:55:20.440' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (16, N'Rakesh', NULL, CAST(N'2023-10-25T20:29:12.710' AS DateTime), NULL, CAST(N'2023-10-25T20:41:20.397' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (17, N'AA1', 0, CAST(N'2023-10-25T20:42:42.577' AS DateTime), NULL, CAST(N'2023-12-28T16:32:02.530' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (18, N'TT1', 0, CAST(N'2023-10-25T20:45:29.133' AS DateTime), NULL, CAST(N'2023-12-15T18:45:24.270' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (20, N'PP1', 0, CAST(N'2023-10-25T21:00:13.433' AS DateTime), NULL, CAST(N'2023-12-15T18:43:24.317' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (21, N'ttt Abhi1', 1, CAST(N'2023-10-26T09:53:16.310' AS DateTime), NULL, CAST(N'2023-11-22T19:25:06.310' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (23, N'new Test A5', 1, CAST(N'2023-10-28T23:14:56.550' AS DateTime), NULL, CAST(N'2023-10-28T23:14:56.550' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (24, N'PropertyT', 0, CAST(N'2023-10-31T09:46:53.693' AS DateTime), NULL, CAST(N'2023-12-28T15:46:38.257' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (27, N'Testt23', 0, CAST(N'2023-10-31T19:12:54.303' AS DateTime), NULL, CAST(N'2023-12-14T22:28:45.443' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (28, N'Flat', 0, CAST(N'2023-11-09T19:29:33.957' AS DateTime), 1, CAST(N'2023-12-28T15:47:41.720' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (35, N'D', 0, CAST(N'2023-11-22T14:58:26.263' AS DateTime), NULL, CAST(N'2023-12-14T21:52:24.773' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (38, N'', 0, CAST(N'2023-11-23T11:05:37.220' AS DateTime), NULL, CAST(N'2023-12-14T19:24:58.253' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (39, N'testauditea', 0, CAST(N'2023-11-23T12:34:54.340' AS DateTime), NULL, CAST(N'2023-12-14T22:27:47.490' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (40, N'test', 0, CAST(N'2023-11-24T11:46:50.750' AS DateTime), NULL, CAST(N'2023-12-14T22:25:23.600' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (41, N'uiuyy', 0, CAST(N'2023-11-24T15:30:08.353' AS DateTime), NULL, CAST(N'2023-12-28T16:30:36.557' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (42, N'uiuyy', 0, CAST(N'2023-11-24T15:33:13.203' AS DateTime), NULL, CAST(N'2023-11-24T15:33:13.203' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (43, N'uiuyy', 0, CAST(N'2023-11-24T16:01:42.337' AS DateTime), NULL, CAST(N'2023-12-27T15:28:03.543' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (44, N'test', 0, CAST(N'2023-11-24T16:03:38.437' AS DateTime), NULL, CAST(N'2023-12-15T12:41:58.833' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (45, N'test', 0, CAST(N'2023-11-24T16:04:20.223' AS DateTime), NULL, CAST(N'2023-12-15T12:42:09.007' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (46, N'test', 0, CAST(N'2023-11-24T16:10:12.473' AS DateTime), NULL, CAST(N'2023-12-27T15:27:13.067' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (47, N'Typ1412', 0, CAST(N'2023-12-14T18:20:43.960' AS DateTime), NULL, CAST(N'2023-12-18T11:18:01.650' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (48, N'propType23', 0, CAST(N'2023-12-14T18:36:16.087' AS DateTime), NULL, CAST(N'2024-01-02T13:06:56.743' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (49, N'27thDec2023', 0, CAST(N'2023-12-27T12:00:33.940' AS DateTime), NULL, CAST(N'2023-12-28T16:05:08.600' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (50, N'check3', 0, CAST(N'2024-01-02T13:37:44.560' AS DateTime), NULL, CAST(N'2024-01-02T13:37:50.623' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (51, N'Typ14121222', 1, CAST(N'2024-01-02T19:32:17.747' AS DateTime), NULL, CAST(N'2024-01-02T19:32:17.747' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (52, N'12343566534322', 1, CAST(N'2024-01-02T19:32:26.630' AS DateTime), NULL, CAST(N'2024-01-02T19:32:26.630' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (53, N'Hi022024', 0, CAST(N'2024-01-02T19:33:15.260' AS DateTime), NULL, CAST(N'2024-01-03T17:17:40.087' AS DateTime), 1, 1)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (54, N'4d3r33rf3ffffffffffffffffffffffffffffffffff', 1, CAST(N'2024-01-03T15:33:22.057' AS DateTime), NULL, CAST(N'2024-01-04T09:43:53.550' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_PropertyType] ([Id], [PropertyType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (55, N'Test', 0, CAST(N'2024-01-03T17:17:22.537' AS DateTime), NULL, CAST(N'2024-01-03T17:17:36.120' AS DateTime), 1, 1)
GO   
SET IDENTITY_INSERT [dbo].[Master_Config] ON 
GO
INSERT [dbo].[Master_Config] ([Id], [PageNumer], [PageSize], [OrderBy], [ReverseOrder], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 1, 10000, 1, 0, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Master_Config] OFF
GO
SET IDENTITY_INSERT [dbo].[Master_Module] ON 
GO
INSERT [dbo].[Master_Module] ([ModuleId], [ModuleName], [IsActive], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ControlName], [SortOrder], [Icon], [ViewName], [HoverIcon]) VALUES (1, N'Dashboard', 1, 1, CAST(N'2023-10-13T00:00:00.000' AS DateTime), 1, CAST(N'2023-10-13T00:00:00.000' AS DateTime), N'Dashboard', 1, N'user-cog.svg', N'Dashboard', N'user-cog-blue.svg')
GO
INSERT [dbo].[Master_Module] ([ModuleId], [ModuleName], [IsActive], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ControlName], [SortOrder], [Icon], [ViewName], [HoverIcon]) VALUES (2, N'Role Master', 1, 1, CAST(N'2023-10-13T00:00:00.000' AS DateTime), 1, CAST(N'2023-10-13T00:00:00.000' AS DateTime), N'MasterRole', 19, N'user-shield.svg', N'Roles', N'user-shield-blue.svg')
GO
INSERT [dbo].[Master_Module] ([ModuleId], [ModuleName], [IsActive], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ControlName], [SortOrder], [Icon], [ViewName], [HoverIcon]) VALUES (3, N'Resource Master', 1, 1, CAST(N'2023-10-13T00:00:00.000' AS DateTime), 1, CAST(N'2023-10-13T00:00:00.000' AS DateTime), N'MasterUser', 18, N'user-star.svg', N'Users', N'user-star-blue.svg')
GO
INSERT [dbo].[Master_Module] ([ModuleId], [ModuleName], [IsActive], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ControlName], [SortOrder], [Icon], [ViewName], [HoverIcon]) VALUES (4, N'Location Master', 1, 1, CAST(N'2023-10-13T00:00:00.000' AS DateTime), 1, CAST(N'2023-10-13T00:00:00.000' AS DateTime), N'MasterLocation', 15, N'current-location.svg', N'Locations', N'current-location-blue.svg')
GO
INSERT [dbo].[Master_Module] ([ModuleId], [ModuleName], [IsActive], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ControlName], [SortOrder], [Icon], [ViewName], [HoverIcon]) VALUES (5, N'Designation Master', 0, 1, CAST(N'2023-10-13T00:00:00.000' AS DateTime), 1, CAST(N'2023-10-13T00:00:00.000' AS DateTime), N'MasterDesignation', 13, N'file-invoice.svg', N'Designations', N'file-invoice-blue.svg')
GO
INSERT [dbo].[Master_Module] ([ModuleId], [ModuleName], [IsActive], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ControlName], [SortOrder], [Icon], [ViewName], [HoverIcon]) VALUES (6, N'Department Master', 0, 1, CAST(N'2023-10-13T00:00:00.000' AS DateTime), 1, CAST(N'2023-10-13T00:00:00.000' AS DateTime), N'MasterDepartment', 12, N'file-invoice.svg', N'Departments', N'file-invoice-blue.svg')
GO
INSERT [dbo].[Master_Module] ([ModuleId], [ModuleName], [IsActive], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ControlName], [SortOrder], [Icon], [ViewName], [HoverIcon]) VALUES (7, N'Property Type Master', 1, 1, CAST(N'2023-10-13T00:00:00.000' AS DateTime), 1, CAST(N'2023-10-13T00:00:00.000' AS DateTime), N'MasterPropertyType', 17, N'building-community.svg', N'PropertyTypes', N'building-community-blue.svg')
GO
INSERT [dbo].[Master_Module] ([ModuleId], [ModuleName], [IsActive], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ControlName], [SortOrder], [Icon], [ViewName], [HoverIcon]) VALUES (8, N'Property Master', 1, 1, CAST(N'2023-10-13T00:00:00.000' AS DateTime), 1, CAST(N'2023-10-13T00:00:00.000' AS DateTime), N'MasterProperty', 16, N'building-fortress.svg', N'Properties', N'building-fortress-blue.svg')
GO
INSERT [dbo].[Master_Module] ([ModuleId], [ModuleName], [IsActive], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ControlName], [SortOrder], [Icon], [ViewName], [HoverIcon]) VALUES (9, N'Client Master', 1, 1, CAST(N'2023-10-13T00:00:00.000' AS DateTime), 1, CAST(N'2023-10-13T00:00:00.000' AS DateTime), N'MasterClient', 11, N'user-bolt.svg', N'Clients', N'user-bolt-blue.svg')
GO
INSERT [dbo].[Master_Module] ([ModuleId], [ModuleName], [IsActive], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ControlName], [SortOrder], [Icon], [ViewName], [HoverIcon]) VALUES (10, N'Valuation Fee Master', 1, 1, CAST(N'2023-10-13T00:00:00.000' AS DateTime), 1, CAST(N'2023-10-13T00:00:00.000' AS DateTime), N'MasterValuationFee', 20, N'home-dollar.svg', N'ValuationFees', N'home-dollar-blue.svg')
GO
INSERT [dbo].[Master_Module] ([ModuleId], [ModuleName], [IsActive], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ControlName], [SortOrder], [Icon], [ViewName], [HoverIcon]) VALUES (11, N'Vendor Master', 1, 1, CAST(N'2023-10-13T00:00:00.000' AS DateTime), 1, CAST(N'2023-10-13T00:00:00.000' AS DateTime), N'MasterVendor', 21, N'users-group.svg', N'Vendors', N'users-group-blue.svg')
GO
INSERT [dbo].[Master_Module] ([ModuleId], [ModuleName], [IsActive], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ControlName], [SortOrder], [Icon], [ViewName], [HoverIcon]) VALUES (12, N'Dictionary Master', 1, 1, CAST(N'2023-10-13T00:00:00.000' AS DateTime), 1, CAST(N'2023-10-13T00:00:00.000' AS DateTime), N'MasterDictionary', 14, N'file-invoice.svg', N'Dictionary', N'file-invoice-blue.svg')
GO
INSERT [dbo].[Master_Module] ([ModuleId], [ModuleName], [IsActive], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ControlName], [SortOrder], [Icon], [ViewName], [HoverIcon]) VALUES (13, N'Valuation Request', 1, 1, CAST(N'2023-10-13T00:00:00.000' AS DateTime), 1, CAST(N'2023-10-13T00:00:00.000' AS DateTime), N'ValuationRequest', 1, N'file-invoice.svg', N'ValuationRequests', N'file-invoice-blue.svg')
GO
INSERT [dbo].[Master_Module] ([ModuleId], [ModuleName], [IsActive], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ControlName], [SortOrder], [Icon], [ViewName], [HoverIcon]) VALUES (14, N'Audit Log', 1, NULL, NULL, NULL, NULL, N'AuditLog', 9, N'audit-icon.svg', N'Logs', N'audit-icon-blue.svg')
GO
INSERT [dbo].[Master_Module] ([ModuleId], [ModuleName], [IsActive], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ControlName], [SortOrder], [Icon], [ViewName], [HoverIcon]) VALUES (16, N'Approver Master', 1, 1, CAST(N'2023-12-27T12:16:18.347' AS DateTime), NULL, NULL, N'MasterApproverLevel', 19, N'file-invoice.svg', N'ApproverLevels', N'file-invoice-blue.svg')
GO
SET IDENTITY_INSERT [dbo].[Master_Module] OFF
GO
SET IDENTITY_INSERT [dbo].[Master_OwnershipType] ON 
GO
INSERT [dbo].[Master_OwnershipType] ([Id], [OwnershipType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Private', 1, CAST(N'2023-09-27T09:25:26.533' AS DateTime), 1, CAST(N'2023-09-27T09:25:29.867' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Master_OwnershipType] OFF
GO
SET IDENTITY_INSERT [dbo].[Master_ResourceType] ON 
GO
INSERT [dbo].[Master_ResourceType] ([Id], [ResourceType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'Internal', 1, CAST(N'2023-10-05T19:25:46.513' AS DateTime), 1, CAST(N'2023-10-05T19:25:46.513' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Master_ResourceType] ([Id], [ResourceType], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'External', 1, CAST(N'2023-10-05T19:25:46.513' AS DateTime), 1, CAST(N'2023-10-05T19:25:46.513' AS DateTime), 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[Master_ResourceType] OFF
GO
SET IDENTITY_INSERT [dbo].[Master_Role] ON 
GO
INSERT [dbo].[Master_Role] ([Id], [RoleName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted], [DeletedDate]) VALUES (1, N'Requestor', 1, 1, CAST(N'2023-10-19T13:27:17.617' AS DateTime), 1, CAST(N'2023-12-27T12:18:40.077' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Master_Role] ([Id], [RoleName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted], [DeletedDate]) VALUES (2, N'Approver', 1, 1, CAST(N'2023-10-19T13:27:17.617' AS DateTime), 1, CAST(N'2024-01-03T16:30:43.940' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Master_Role] ([Id], [RoleName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted], [DeletedDate]) VALUES (3, N'Valuer', 1, 1, CAST(N'2023-10-19T13:27:17.617' AS DateTime), 1, CAST(N'2024-01-04T11:15:45.760' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Master_Role] ([Id], [RoleName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted], [DeletedDate]) VALUES (4, N'Admin', 1, 1, CAST(N'2023-10-19T13:27:17.617' AS DateTime), 1, CAST(N'2024-01-02T13:09:02.653' AS DateTime), 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Master_Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Master_RoleModulePermission] ON 
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2653, 9, 1, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2023-12-20T12:13:55.463' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2654, 9, 13, 0, 1, 1, 1, 0, 1, NULL, CAST(N'2023-12-20T12:13:55.463' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2655, 9, 14, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2023-12-20T12:13:55.463' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2656, 9, 9, 0, 1, 1, 0, 1, 1, NULL, CAST(N'2023-12-20T12:13:55.463' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2657, 9, 6, 0, 1, 0, 1, 1, 1, NULL, CAST(N'2023-12-20T12:13:55.463' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2658, 9, 5, 0, 1, 1, 0, 0, 1, NULL, CAST(N'2023-12-20T12:13:55.463' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2659, 9, 12, 0, 1, 0, 1, 1, 1, NULL, CAST(N'2023-12-20T12:13:55.463' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2660, 9, 4, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T12:13:55.463' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2661, 9, 8, 0, 1, 1, 0, 0, 1, NULL, CAST(N'2023-12-20T12:13:55.463' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2662, 9, 7, 0, 1, 0, 1, 1, 1, NULL, CAST(N'2023-12-20T12:13:55.463' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2663, 9, 3, 0, 1, 1, 0, 0, 1, NULL, CAST(N'2023-12-20T12:13:55.463' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2664, 9, 2, 0, 1, 0, 1, 1, 1, NULL, CAST(N'2023-12-20T12:13:55.463' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2665, 9, 10, 0, 1, 0, 1, 0, 1, NULL, CAST(N'2023-12-20T12:13:55.463' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2666, 9, 11, 0, 1, 1, 0, 1, 1, NULL, CAST(N'2023-12-20T12:13:55.463' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2667, 9, 13, 1, 1, 0, 0, 0, 0, NULL, CAST(N'2023-12-20T12:13:55.463' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2668, 9, 13, 2, 1, 1, 1, 0, 0, NULL, CAST(N'2023-12-20T12:13:55.463' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2669, 9, 13, 3, 1, 1, 1, 0, 0, NULL, CAST(N'2023-12-20T12:13:55.463' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2670, 9, 13, 4, 1, 0, 0, 0, 0, NULL, CAST(N'2023-12-20T12:13:55.463' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2671, 9, 13, 5, 1, 0, 0, 0, 0, NULL, CAST(N'2023-12-20T12:13:55.463' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2672, 9, 13, 6, 1, 0, 0, 0, 0, NULL, CAST(N'2023-12-20T12:13:55.463' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2853, 10, 1, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:37:56.107' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2854, 10, 13, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:37:56.107' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2855, 10, 14, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:37:56.107' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2856, 10, 9, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:37:56.107' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2857, 10, 6, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:37:56.107' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2858, 10, 5, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:37:56.107' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2859, 10, 12, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:37:56.107' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2860, 10, 4, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:37:56.107' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2861, 10, 8, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:37:56.107' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2862, 10, 7, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:37:56.107' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2863, 10, 3, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:37:56.107' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2864, 10, 2, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:37:56.107' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2865, 10, 10, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:37:56.107' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2866, 10, 11, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:37:56.107' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2867, 10, 13, 1, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:37:56.107' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2868, 10, 13, 2, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:37:56.107' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2869, 10, 13, 3, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:37:56.107' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2870, 10, 13, 4, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:37:56.107' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2871, 10, 13, 5, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:37:56.107' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2872, 10, 13, 6, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:37:56.107' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2873, 11, 1, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:38:41.147' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2874, 11, 13, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:38:41.147' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2875, 11, 14, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:38:41.147' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2876, 11, 9, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:38:41.147' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2877, 11, 6, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:38:41.147' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2878, 11, 5, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:38:41.147' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2879, 11, 12, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:38:41.147' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2880, 11, 4, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:38:41.147' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2881, 11, 8, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:38:41.147' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2882, 11, 7, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:38:41.147' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2883, 11, 3, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:38:41.147' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2884, 11, 2, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:38:41.147' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2885, 11, 10, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:38:41.147' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2886, 11, 11, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:38:41.147' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2887, 11, 13, 1, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:38:41.147' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2888, 11, 13, 2, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:38:41.147' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2889, 11, 13, 3, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:38:41.147' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2890, 11, 13, 4, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:38:41.147' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2891, 11, 13, 5, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:38:41.147' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (2892, 11, 13, 6, 1, 0, 0, 0, 1, NULL, CAST(N'2023-12-20T13:38:41.147' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3153, 12, 1, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2023-12-20T16:42:55.080' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3154, 12, 13, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2023-12-20T16:42:55.080' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3155, 12, 14, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2023-12-20T16:42:55.080' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3156, 12, 9, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2023-12-20T16:42:55.080' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3157, 12, 6, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2023-12-20T16:42:55.080' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3158, 12, 5, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2023-12-20T16:42:55.080' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3159, 12, 12, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2023-12-20T16:42:55.080' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3160, 12, 4, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2023-12-20T16:42:55.080' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3161, 12, 8, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2023-12-20T16:42:55.080' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3162, 12, 7, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2023-12-20T16:42:55.080' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3163, 12, 3, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2023-12-20T16:42:55.080' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3164, 12, 2, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2023-12-20T16:42:55.080' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3165, 12, 10, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2023-12-20T16:42:55.080' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3166, 12, 11, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2023-12-20T16:42:55.080' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3167, 12, 13, 1, 0, 0, 0, 0, 0, NULL, CAST(N'2023-12-20T16:42:55.080' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3168, 12, 13, 2, 0, 0, 0, 0, 0, NULL, CAST(N'2023-12-20T16:42:55.080' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3169, 12, 13, 3, 0, 0, 0, 0, 0, NULL, CAST(N'2023-12-20T16:42:55.080' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3170, 12, 13, 4, 0, 0, 0, 0, 0, NULL, CAST(N'2023-12-20T16:42:55.080' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3171, 12, 13, 5, 0, 0, 0, 0, 0, NULL, CAST(N'2023-12-20T16:42:55.080' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3172, 12, 13, 6, 0, 0, 0, 0, 0, NULL, CAST(N'2023-12-20T16:42:55.080' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3253, 8, 1, 0, 1, 1, 0, 0, 0, NULL, CAST(N'2023-12-21T11:18:58.697' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3254, 8, 13, 0, 1, 1, 0, 0, 0, NULL, CAST(N'2023-12-21T11:18:58.697' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3255, 8, 14, 0, 1, 1, 0, 0, 0, NULL, CAST(N'2023-12-21T11:18:58.697' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3256, 8, 9, 0, 1, 1, 0, 0, 0, NULL, CAST(N'2023-12-21T11:18:58.697' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3257, 8, 6, 0, 1, 1, 0, 0, 0, NULL, CAST(N'2023-12-21T11:18:58.697' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3258, 8, 5, 0, 1, 1, 0, 0, 0, NULL, CAST(N'2023-12-21T11:18:58.697' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3259, 8, 12, 0, 1, 1, 0, 0, 0, NULL, CAST(N'2023-12-21T11:18:58.697' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3260, 8, 4, 0, 1, 1, 0, 0, 0, NULL, CAST(N'2023-12-21T11:18:58.697' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3261, 8, 8, 0, 1, 1, 0, 0, 0, NULL, CAST(N'2023-12-21T11:18:58.697' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3262, 8, 7, 0, 1, 1, 0, 0, 0, NULL, CAST(N'2023-12-21T11:18:58.697' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3263, 8, 3, 0, 1, 1, 0, 0, 0, NULL, CAST(N'2023-12-21T11:18:58.697' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3264, 8, 2, 0, 1, 1, 0, 0, 0, NULL, CAST(N'2023-12-21T11:18:58.697' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3265, 8, 10, 0, 1, 1, 0, 0, 0, NULL, CAST(N'2023-12-21T11:18:58.697' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3266, 8, 11, 0, 1, 1, 0, 0, 0, NULL, CAST(N'2023-12-21T11:18:58.697' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3267, 8, 13, 1, 1, 1, 0, 0, 0, NULL, CAST(N'2023-12-21T11:18:58.697' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3268, 8, 13, 2, 1, 1, 0, 0, 0, NULL, CAST(N'2023-12-21T11:18:58.697' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3269, 8, 13, 3, 1, 1, 0, 0, 0, NULL, CAST(N'2023-12-21T11:18:58.697' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3270, 8, 13, 4, 1, 1, 0, 0, 0, NULL, CAST(N'2023-12-21T11:18:58.697' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3271, 8, 13, 5, 1, 1, 0, 0, 0, NULL, CAST(N'2023-12-21T11:18:58.697' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3272, 8, 13, 6, 1, 1, 0, 0, 0, NULL, CAST(N'2023-12-21T11:18:58.697' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3535, 1, 1, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2023-12-27T12:18:40.077' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3536, 1, 13, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2023-12-27T12:18:40.077' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3537, 1, 14, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2023-12-27T12:18:40.077' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3538, 1, 9, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2023-12-27T12:18:40.077' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3539, 1, 6, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2023-12-27T12:18:40.077' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3540, 1, 5, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2023-12-27T12:18:40.077' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3541, 1, 12, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2023-12-27T12:18:40.077' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3542, 1, 4, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2023-12-27T12:18:40.077' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3543, 1, 8, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2023-12-27T12:18:40.077' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3544, 1, 7, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2023-12-27T12:18:40.077' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3545, 1, 3, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2023-12-27T12:18:40.077' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3546, 1, 2, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2023-12-27T12:18:40.077' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3547, 1, 16, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2023-12-27T12:18:40.077' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3548, 1, 10, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2023-12-27T12:18:40.077' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3549, 1, 11, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2023-12-27T12:18:40.077' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3550, 1, 13, 1, 1, 1, 1, 1, 1, NULL, CAST(N'2023-12-27T12:18:40.077' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3551, 1, 13, 2, 1, 1, 1, 1, 1, NULL, CAST(N'2023-12-27T12:18:40.077' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3552, 1, 13, 3, 1, 1, 1, 1, 1, NULL, CAST(N'2023-12-27T12:18:40.077' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3553, 1, 13, 4, 1, 1, 1, 1, 1, NULL, CAST(N'2023-12-27T12:18:40.077' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3554, 1, 13, 5, 1, 1, 1, 1, 1, NULL, CAST(N'2023-12-27T12:18:40.077' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (3555, 1, 13, 6, 1, 1, 1, 1, 1, NULL, CAST(N'2023-12-27T12:18:40.077' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4417, 4, 1, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2024-01-02T13:09:02.653' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4418, 4, 13, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2024-01-02T13:09:02.653' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4419, 4, 14, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2024-01-02T13:09:02.653' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4420, 4, 9, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2024-01-02T13:09:02.653' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4421, 4, 6, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2024-01-02T13:09:02.653' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4422, 4, 5, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2024-01-02T13:09:02.653' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4423, 4, 12, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2024-01-02T13:09:02.653' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4424, 4, 4, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2024-01-02T13:09:02.653' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4425, 4, 8, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2024-01-02T13:09:02.653' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4426, 4, 7, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2024-01-02T13:09:02.653' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4427, 4, 3, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2024-01-02T13:09:02.653' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4428, 4, 2, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2024-01-02T13:09:02.653' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4429, 4, 16, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2024-01-02T13:09:02.653' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4430, 4, 10, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2024-01-02T13:09:02.653' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4431, 4, 11, 0, 1, 1, 1, 1, 1, NULL, CAST(N'2024-01-02T13:09:02.653' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4432, 4, 13, 1, 1, 1, 1, 1, 1, NULL, CAST(N'2024-01-02T13:09:02.653' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4433, 4, 13, 2, 1, 1, 1, 1, 1, NULL, CAST(N'2024-01-02T13:09:02.653' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4434, 4, 13, 3, 1, 1, 1, 1, 1, NULL, CAST(N'2024-01-02T13:09:02.653' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4435, 4, 13, 4, 1, 1, 1, 1, 1, NULL, CAST(N'2024-01-02T13:09:02.653' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4436, 4, 13, 5, 1, 1, 1, 1, 1, NULL, CAST(N'2024-01-02T13:09:02.653' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4437, 4, 13, 6, 1, 1, 1, 1, 1, NULL, CAST(N'2024-01-02T13:09:02.653' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4438, 13, 1, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-02T14:20:17.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4439, 13, 13, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-02T14:20:17.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4440, 13, 14, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-02T14:20:17.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4441, 13, 9, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-02T14:20:17.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4442, 13, 6, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-02T14:20:17.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4443, 13, 5, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-02T14:20:17.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4444, 13, 12, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-02T14:20:17.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4445, 13, 4, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-02T14:20:17.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4446, 13, 8, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-02T14:20:17.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4447, 13, 7, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-02T14:20:17.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4448, 13, 3, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-02T14:20:17.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4449, 13, 2, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-02T14:20:17.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4450, 13, 16, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-02T14:20:17.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4451, 13, 10, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-02T14:20:17.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4452, 13, 11, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-02T14:20:17.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4453, 13, 13, 1, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-02T14:20:17.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4454, 13, 13, 2, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-02T14:20:17.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4455, 13, 13, 3, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-02T14:20:17.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4456, 13, 13, 4, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-02T14:20:17.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4457, 13, 13, 5, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-02T14:20:17.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4458, 13, 13, 6, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-02T14:20:17.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4459, 14, 1, 0, 1, 1, 1, 0, 0, NULL, CAST(N'2024-01-02T14:22:14.827' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4460, 14, 13, 0, 1, 1, 1, 0, 0, NULL, CAST(N'2024-01-02T14:22:14.827' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4461, 14, 14, 0, 1, 1, 1, 0, 0, NULL, CAST(N'2024-01-02T14:22:14.827' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4462, 14, 9, 0, 1, 1, 1, 0, 0, NULL, CAST(N'2024-01-02T14:22:14.827' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4463, 14, 6, 0, 1, 1, 1, 0, 0, NULL, CAST(N'2024-01-02T14:22:14.827' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4464, 14, 5, 0, 1, 1, 1, 0, 0, NULL, CAST(N'2024-01-02T14:22:14.827' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4465, 14, 12, 0, 1, 1, 1, 0, 0, NULL, CAST(N'2024-01-02T14:22:14.827' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4466, 14, 4, 0, 1, 1, 1, 0, 0, NULL, CAST(N'2024-01-02T14:22:14.827' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4467, 14, 8, 0, 1, 1, 1, 0, 0, NULL, CAST(N'2024-01-02T14:22:14.827' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4468, 14, 7, 0, 1, 1, 1, 0, 0, NULL, CAST(N'2024-01-02T14:22:14.827' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4469, 14, 3, 0, 1, 1, 1, 0, 0, NULL, CAST(N'2024-01-02T14:22:14.827' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4470, 14, 2, 0, 1, 1, 1, 0, 0, NULL, CAST(N'2024-01-02T14:22:14.827' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4471, 14, 16, 0, 1, 1, 1, 0, 0, NULL, CAST(N'2024-01-02T14:22:14.827' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4472, 14, 10, 0, 1, 1, 1, 0, 0, NULL, CAST(N'2024-01-02T14:22:14.827' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4473, 14, 11, 0, 1, 1, 1, 0, 0, NULL, CAST(N'2024-01-02T14:22:14.827' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4474, 14, 13, 1, 1, 1, 1, 0, 0, NULL, CAST(N'2024-01-02T14:22:14.827' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4475, 14, 13, 2, 1, 1, 1, 0, 0, NULL, CAST(N'2024-01-02T14:22:14.827' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4476, 14, 13, 3, 1, 1, 1, 0, 0, NULL, CAST(N'2024-01-02T14:22:14.827' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4477, 14, 13, 4, 1, 1, 1, 0, 0, NULL, CAST(N'2024-01-02T14:22:14.827' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4478, 14, 13, 5, 1, 1, 1, 0, 0, NULL, CAST(N'2024-01-02T14:22:14.827' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4479, 14, 13, 6, 1, 1, 1, 0, 0, NULL, CAST(N'2024-01-02T14:22:14.827' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4879, 2, 1, 0, 1, 0, 0, 0, 1, NULL, CAST(N'2024-01-03T16:30:43.940' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4880, 2, 13, 0, 1, 0, 1, 0, 1, NULL, CAST(N'2024-01-03T16:30:43.940' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4881, 2, 14, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-03T16:30:43.940' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4882, 2, 9, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-03T16:30:43.940' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4883, 2, 6, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-03T16:30:43.940' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4884, 2, 5, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-03T16:30:43.940' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4885, 2, 12, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-03T16:30:43.940' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4886, 2, 4, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-03T16:30:43.940' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4887, 2, 8, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-03T16:30:43.940' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4888, 2, 7, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-03T16:30:43.940' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4889, 2, 3, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-03T16:30:43.940' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4890, 2, 2, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-03T16:30:43.940' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4891, 2, 16, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-03T16:30:43.940' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4892, 2, 10, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-03T16:30:43.940' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4893, 2, 11, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-03T16:30:43.940' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4894, 2, 13, 1, 1, 0, 1, 0, 1, NULL, CAST(N'2024-01-03T16:30:43.940' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4895, 2, 13, 2, 1, 0, 0, 0, 0, NULL, CAST(N'2024-01-03T16:30:43.940' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4896, 2, 13, 3, 1, 0, 0, 0, 0, NULL, CAST(N'2024-01-03T16:30:43.940' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4897, 2, 13, 4, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-03T16:30:43.940' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4898, 2, 13, 5, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-03T16:30:43.940' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4899, 2, 13, 6, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-03T16:30:43.940' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4921, 3, 1, 0, 1, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T11:15:45.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4922, 3, 13, 0, 1, 0, 1, 0, 0, NULL, CAST(N'2024-01-04T11:15:45.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4923, 3, 14, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T11:15:45.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4924, 3, 9, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T11:15:45.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4925, 3, 6, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T11:15:45.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4926, 3, 5, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T11:15:45.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4927, 3, 12, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T11:15:45.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4928, 3, 4, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T11:15:45.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4929, 3, 8, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T11:15:45.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4930, 3, 7, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T11:15:45.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4931, 3, 3, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T11:15:45.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4932, 3, 2, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T11:15:45.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4933, 3, 16, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T11:15:45.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4934, 3, 10, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T11:15:45.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4935, 3, 11, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T11:15:45.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4936, 3, 13, 1, 1, 0, 1, 0, 0, NULL, CAST(N'2024-01-04T11:15:45.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4937, 3, 13, 2, 1, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T11:15:45.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4938, 3, 13, 3, 1, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T11:15:45.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4939, 3, 13, 4, 1, 1, 1, 1, 1, NULL, CAST(N'2024-01-04T11:15:45.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4940, 3, 13, 5, 1, 1, 1, 1, 1, NULL, CAST(N'2024-01-04T11:15:45.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4941, 3, 13, 6, 1, 1, 1, 1, 1, NULL, CAST(N'2024-01-04T11:15:45.760' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4942, 5, 1, 0, 1, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T12:06:45.240' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4943, 5, 13, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T12:06:45.240' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4944, 5, 14, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T12:06:45.240' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4945, 5, 9, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T12:06:45.240' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4946, 5, 6, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T12:06:45.240' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4947, 5, 5, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T12:06:45.240' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4948, 5, 12, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T12:06:45.240' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4949, 5, 4, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T12:06:45.240' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4950, 5, 8, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T12:06:45.240' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4951, 5, 7, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T12:06:45.240' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4952, 5, 3, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T12:06:45.240' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4953, 5, 2, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T12:06:45.240' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4954, 5, 16, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T12:06:45.240' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4955, 5, 10, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T12:06:45.240' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4956, 5, 11, 0, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T12:06:45.240' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4957, 5, 13, 1, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T12:06:45.240' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4958, 5, 13, 2, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T12:06:45.240' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4959, 5, 13, 3, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T12:06:45.240' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4960, 5, 13, 4, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T12:06:45.240' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4961, 5, 13, 5, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T12:06:45.240' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master_RoleModulePermission] ([RoleModuleId], [RoleId], [ModuleId], [SubModuleId], [View], [Add], [Edit], [Delete], [Approve], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate]) VALUES (4962, 5, 13, 6, 0, 0, 0, 0, 0, NULL, CAST(N'2024-01-04T12:06:45.240' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Master_RoleModulePermission] OFF
GO
SET IDENTITY_INSERT [dbo].[Master_SubModule] ON 
GO
INSERT [dbo].[Master_SubModule] ([SubModuleId], [ModuleId], [SubModuleName], [IsActive], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ControlName]) VALUES (1, 13, N'ValuationRequest', 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Master_SubModule] ([SubModuleId], [ModuleId], [SubModuleName], [IsActive], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ControlName]) VALUES (2, 13, N'ValuationQuotation', 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Master_SubModule] ([SubModuleId], [ModuleId], [SubModuleName], [IsActive], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ControlName]) VALUES (3, 13, N'ValuationInvoice', 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Master_SubModule] ([SubModuleId], [ModuleId], [SubModuleName], [IsActive], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ControlName]) VALUES (4, 13, N'SiteDescription', 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Master_SubModule] ([SubModuleId], [ModuleId], [SubModuleName], [IsActive], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ControlName]) VALUES (5, 13, N'ComparableEvidences', 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Master_SubModule] ([SubModuleId], [ModuleId], [SubModuleName], [IsActive], [CreatedBy], [CreatedDate], [ModifyBy], [ModifyDate], [ControlName]) VALUES (6, 13, N'ValuationAssessement', 1, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Master_SubModule] OFF
GO
SET IDENTITY_INSERT [dbo].[Master_ValuationRequestApproverLevel] ON 
GO
INSERT [dbo].[Master_ValuationRequestApproverLevel] ([Id], [Description], [FromAmount], [ToAmount], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted], [IsActive]) VALUES (1, N'1 Level Approval', CAST(0.00 AS Decimal(18, 2)), CAST(999.00 AS Decimal(18, 2)), 1, CAST(N'2023-12-26T11:43:32.980' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Master_ValuationRequestApproverLevel] ([Id], [Description], [FromAmount], [ToAmount], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted], [IsActive]) VALUES (2, N'2 Level Approval', CAST(1000.00 AS Decimal(18, 2)), CAST(4999.00 AS Decimal(18, 2)), 1, CAST(N'2023-12-26T11:43:32.980' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Master_ValuationRequestApproverLevel] ([Id], [Description], [FromAmount], [ToAmount], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted], [IsActive]) VALUES (3, N'3 Level Approval', CAST(5000.00 AS Decimal(18, 2)), CAST(10000000000.00 AS Decimal(18, 2)), 1, CAST(N'2023-12-26T11:43:32.980' AS DateTime), 1, CAST(N'2023-12-29T18:14:45.807' AS DateTime), 0, 1)
GO
SET IDENTITY_INSERT [dbo].[Master_ValuationRequestApproverLevel] OFF
GO
